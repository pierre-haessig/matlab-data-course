% Exploration préparatoire pour le BE Données ISA
% 10 septembre 2018

tab = importfile('data/log-20150309-171821.csv');
head(tab, 4) % Matlab ? R2016b
tail(tab, 4) % Matlab ? R2016b
summary(tab)%  Matlab ? R2013b
%datetime % R2014b

% TODO: faire qqchose sur le type de donnée datetime
% "Represent Dates and Times in MATLAB"

% parse time. NB: 'S' corresponds to Fractional second
% cf. https://fr.mathworks.com/help/matlab/ref/datetime.html?s_tid=doc_ta#buhzxmk-1-Format
t = datetime(tab.time, 'InputFormat', 'HH:mm:ss.SSS');

% Combine Date and Time from Separate Variables
% https://fr.mathworks.com/help/matlab/matlab_prog/combine-date-and-time-from-separate-variables.html
dt = tab.date + timeofday(t);
dt.Format = 'default';

% Paste datetime vector back into the table
% cf. "Add, Delete, and Rearrange Table Variables"
% https://fr.mathworks.com/help/matlab/matlab_prog/add-and-delete-table-variables.html
tab.time = []; % also dat = removevars(dat, {'time'}) with Matlab  ? R2018a
tab.date = dt;

tab.unit = [];

%to time table
tabt = table2timetable(tab);  %R2016b

% Manually split the different channels

unique(tab.type) % all the existing channel names
Temp = tabt(tab.type == 'indoor temperature', 'value'); %si on veut plusieurs colonnes, utiliser un cell-array {'type', 'value'}
Text_DD = tabt(tab.type == 'outdoor temperature', 'value'); %si on veut plusieurs colonnes, utiliser un cell-array {'type', 'value'}
RH = tabt(tab.type == 'indoor relative humidity', 'value');
CO2 = tabt(tab.type == 'carbon dioxide', 'value');
sun = tabt(tab.type == 'solar Irradiance', 'value');

% rename columns
Temp.Properties.VariableNames = {'Temp'};
Text_DD.Properties.VariableNames = {'Text_DD'};
CO2.Properties.VariableNames = {'CO2'};

%% Automatic splitting with "unstack"

a = unstack(tabt, 'value', 'type'); % a est plein de NaNs
log_DD = retime(a, 'minutely', 'previous');

%% Tracé du log DeltaDore

figure
ax(1) = subplot(2,1,1);
plot(Temp.date, Temp.value)
legend('Temp')
ylabel('°C')

ax(2) = subplot(2,1,2);
%plot(RH.date, RH.value)
plot(CO2.date, CO2.CO2, 'r')
ylabel('ppm')
legend('CO2')
    
linkaxes(ax, 'x')

%% ISD Lite data, Rennes St-Jacques

isd_lite = import_isdlite('data/FR-ST_JACQUES-lite-2015.txt'); % includes manual adjustement for NaNs and date
isd_lite.Properties.VariableNames = {'Text' 'Wind'};
head(isd_lite)

% tracé
figure
plot(isd_lite.date, isd_lite.Text)

% régularité: faux
isregular(isd_lite); 

% valeurs manquantes: 105
sum(isnan(isd_lite.Text)) % !! ne pas faire x == NaN, car NaN == NaN renvoie 0!

% trouver les irrégularités
a = diff(isd_lite.date);
unique(a)
sum(a == hours(2)); % 1h -> 8725, 2h -> 9, 3h -> 3, 7h-> 1


Temp_1h = retime(Temp, 'hourly', 'mean');
Text_DD_1h = retime(Text_DD, 'hourly', 'mean');
a = synchronize(isd_lite, Temp_1h, Text_DD_1h, 'intersection');

plot(a.Text, a.Temp, '+')
corr(a.Text, a.Temp) % -> NaN
plot(a.Text, a.Text_DD, '+')



%% Feuille de présence
pres = readtable('data/fiche_presence.csv', 'Delimiter', ';');

pres.date = datetime(pres.date, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss''Z''');

pres = table2timetable(pres);
pres.Properties.VariableNames = {'presence'};

% rééchantillonage
pres_1m = retime(pres, 'minutely', 'previous');

% vérification du rééchantillonage
plot(pres.date, pres.presence, 'o')
hold on
plot(pres_1m.date, pres_1m.presence, '-')

grid on

%% Rééchantillonage

% jeu de données de synthèse avec un trou
t1 = datetime('2015-02-01 00:00:00'):minutes(30):datetime('2015-02-02'); % 1j
t2 = datetime('2015-02-03 00:00:00'):minutes(30):datetime('2015-02-04'); % 1j
t = [t1 t2];

t(end-4) = '2015-02-03 22:00:10';

rng(0)
y = [randn(length(t2), 1);randn(length(t2), 1)+5];
y(12:24) = NaN;
tt = timetable(t', y);

plot(t, tt.y, '-d');

head(retime(tt, 'hourly'))% implicitement méthode 'fillwithmissing'
head(retime(tt, 'hourly', 'linear'))
tail(retime(tt, 'hourly', 'previous'))
tail(retime(tt, 'hourly', 'next'))


%% Produit final

% Effet de la présence sur le CO2
CO2_1m = retime(CO2, 'minutely', 'nearest'); % ou plutôt 'previous'

ax1 = subplot(2,1,1);
plot(CO2_1m.date, CO2_1m.CO2)
ax2 = subplot(2,1,2);
plot(pres_1m.date, pres_1m.presence)
linkaxes([ax1 ax2], 'x')
% -> On vérifie qu'on a une intersection de temps commune

CO2_pres = synchronize(CO2_1m,pres_1m, 'intersection');% default 'union'

figure
plot(CO2_pres.presence, CO2_pres.CO2, '+');

figure
boxplot(CO2_pres.CO2, CO2_pres.presence)


%% Misc
% si on veut une timeseries
pres_1m = timeseries(Temp.value, datestr(Temp.date));

%timetable Data Container: Specify whether each variable in a timetable contains continuous or discrete data using the VariableContinuity property
%To specify whether timetable variables represent continuous data, you can use the VariableContinuity property. If you specify VariableContinuity and call the retime or synchronize functions, then you do not need to specify a method. Instead, retime and synchronize fill in the output timetable variables using different default methods for continuous, step, or event data. For more information, see the VariableContinuity property of timetable or Retime and Synchronize Timetable Variables Using Different Methods.
