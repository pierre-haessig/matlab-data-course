% Script analyse de donn�es temporelles 2019

opts = detectImportOptions('data/meteo_rennes_2015.txt');
meteo = readtable('data/meteo_rennes_2015.txt', opts);

%head(meteo, 3)

Temp = meteo.Var5;
plot(Temp);

% Marquage des valeurs manquantes:
manquant = Temp == -9999;
Temp(manquant) = missing;

% Mise � l'�chelle
Temp = Temp / 10;

plot(Temp)
% zoom sur une valeur manquante
% xlim([2150 2250])

% 14h30

%% Datetime:

% Arithm�tique des dates
d = datetime('2019-09-25')
days(3)
d + days(3)
days * 3

% Datetime pour la m�t�o � Rennes
meteo.date = datetime(meteo.Var1, meteo.Var2, meteo.Var3, meteo.Var4,0, 0);

% Conversion en Timetable :
meteo_TT = table2timetable(meteo, 'RowTimes', 'date');
head(meteo_TT,3)

% recopie des Temp�ratures modifi�es dans la table:
meteo_TT.Var5 = Temp;

% [pause 15h-15h30]
%% S�lection (slicing d'un extrait temporel)

% du 1er au 15 juin inclus:
debut_juin = timerange('2015-06-01', '2015-06-16');
meteo_juin = meteo_TT(debut_juin, :);

nanmean( meteo_juin.Var5)
plot(meteo_juin.date, meteo_juin.Var5)

%% Donn�es Capteur qualit� de l'air

opts = detectImportOptions('data/log-20150309-171821.csv');
log = readtable('data/log-20150309-171821.csv', opts);
head(log, 3)

% Vecteur temps
log_datetime = log.date + log.time;

log_TT = table2timetable(log, 'RowTimes', log_datetime);
% effacer colonnes
log_TT.date = [];
log_TT.time = [];

head(log_TT, 3)

% R�cupe lignes CO2
%co2 = log_TT.type == 'carbon dioxide'; % bug : non categorical

% Categorical
type = log_TT.type;
whos type
type = categorical(type);
whos type

categories(type); % liste des categories
unique(type)

log_TT.type = type;
head(log_TT, 3)

co2 = log_TT.type == 'carbon dioxide';

CO2_TT = log_TT(log_TT.type == 'carbon dioxide', 'value');

plot(CO2_TT.Time, CO2_TT.value)
ylabel('Concentration CO2 (ppm)')

Temp_TT = log_TT(log_TT.type == 'indoor temperature', 'value');

% Retime:
Temp_1m = retime(Temp_TT, 'minutely', 'previous');

% post session 17h00
log_sync = synchronize(Temp_TT, CO2_TT, 'minutely', 'nearest');

% fonction utile : stackedplot (sp�cial timetable), trouv�e par Leone et
% Camille
stackedplot(log_sync)

% nuage de point CO2~Temp�rature
plot(log_sync.value_CO2_TT, log_sync.value_Temp_TT, ',')

%% Notes post session 2019 : 

% jusqu'� 15h00 : s�ance dynamique
% � partir de 15h30 : �a fatigue. Et occup� r�vision exam 
% -  Un groupe bloqu� par pb syntaxe unstack
% - faire remonter categorical avant le unstacking, car on en a besoin
% pour faire le type == 'xxx'

% D�tail : pas de pb de display format pour log_datetime = log.date + log.time;

% TODO : faire une diapo pour illustrer le synchronize (cf photo table)