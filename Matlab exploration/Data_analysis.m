% Exploration préparatoire pour le BE Données ISA
% 10 septembre 2018

tab = importfile('log-20150211-142309.csv');
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
RH = tabt(tab.type == 'indoor relative humidity', 'value');
CO2 = tabt(tab.type == 'carbon dioxide', 'value');

%%

ax(1) = subplot(2,1,1);
plot(Temp.date, Temp.value)
legend('Temp')
ylabel('°C')

ax(2) = subplot(2,1,2);
%plot(RH.date, RH.value)
plot(CO2.date, CO2.value, 'r')
ylabel('ppm')
legend('CO2')
    
linkaxes(ax, 'x')

%% ISD Lite data, Rennes St-Jacques

isd_lite = import_isdlite('data/FR-ST_JACQUES-lite-2015.txt'); % includes manual adjustement for NaNs and date
head(isd_lite)
plot(isd_lite.date, isd_lite.temp)

%%
% si on veut une timeseries
a = timeseries(Temp.value, datestr(Temp.date));

%timetable Data Container: Specify whether each variable in a timetable contains continuous or discrete data using the VariableContinuity property
%To specify whether timetable variables represent continuous data, you can use the VariableContinuity property. If you specify VariableContinuity and call the retime or synchronize functions, then you do not need to specify a method. Instead, retime and synchronize fill in the output timetable variables using different default methods for continuous, step, or event data. For more information, see the VariableContinuity property of timetable or Retime and Synchronize Timetable Variables Using Different Methods.
