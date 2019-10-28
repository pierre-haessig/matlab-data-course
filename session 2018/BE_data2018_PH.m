meteo = readtable('data/meteo_rennes_2015.txt');
meteo.Properties.VariableNames(1) = {'Annee'};
meteo.Properties.VariableNames(2) = {'Mois'};
meteo.Properties.VariableNames(3) = {'Jour'};
meteo.Properties.VariableNames(4) = {'Heure'};
meteo.Properties.VariableNames(5) = {'Temp'};

meteo.Temp = meteo.Temp/10;

%% Valeurs manquantes (1h)

mean(meteo.Temp) % absurde

manquants = meteo.Temp == -999.9;
% compter les manquants
sum(manquants); % aberrant
365*24 - height(meteo); % non enregistrés

% remplacer les manquants par `missing`
% avec du logical indexing
meteo.Temp(manquants) = missing;


plot(meteo.Temp)

mean(meteo.Temp); % NaN
nanmean(meteo.Temp)
% Pause
%% Datetime 30'

meteo_date = datetime(meteo.Annee, meteo.Mois, meteo.Jour,...
                      meteo.Heure, 0,0);
% table -> timetable
meteo_TT = table2timetable(meteo, 'RowTimes', meteo_date);

% sélectionner un mois : avec un timetable et un timerange
TR = timerange('2015-06-01','2015-07-01');
meteo_juin = meteo_TT(TR, :);
nanmean(meteo_juin.Temp)

% sélectionner un mois : avec logical indexing
meteo_juin2 = meteo(meteo_date.Month==6, :);
nanmean(meteo_juin2.Temp)

hist(meteo_juin2.Temp)

boxplot(meteo.Temp,meteo.Mois )

%% Données capteur qualité de l'air
log = readtable('./data/log-20150309-171821.csv');

class(log.date) % datetime
class(log.time) % cell of string: pb!!

log_time = datetime(log.time, 'InputFormat', 'HH:mm:ss.SSS');
% combinaison de la date et de l'heure
log_datetime = log.date + timeofday(log_time);
% ou bien
%log_time.Year = log.date.Year;
%format d'affichage
log_datetime.Format = 'default';
% ou bien
% datetime([date, time])


log_TT = table2timetable(log, 'RowTimes', log_datetime);

	
%a = log.type == 'indoor temperature';
type = categorical(log.type);
a = type == 'indoor temperature';
