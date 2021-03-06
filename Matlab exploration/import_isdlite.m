function isd_lite = import_isdlite(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   ISD_LITE = IMPORTFILE(FILENAME) Reads data from text file FILENAME for
%   the default selection.
%
%   ISD_LITE = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   isd_lite = importfile('FR-ST_JACQUES-lite-2015.txt', 1, 8739);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2018/09/13 16:35:56

%% Initialize variables.
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column9: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%4f%3f%3f%3f%6f%*6*s%*6*s%*6f%6f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
isd_lite = table(dataArray{1:end-1}, 'VariableNames', {'year','month','day','hour','temp','wind'});

%% Manual additions to the function: correct the scales

% Replace NaNs
isd_lite.wind(isd_lite.wind == -9999) = NaN;
isd_lite.temp(isd_lite.temp == -9999) = NaN;

isd_lite.wind = isd_lite.wind/10;
isd_lite.temp = isd_lite.temp/10;

% Set time
t = datetime(isd_lite.year, isd_lite.month, isd_lite.day, isd_lite.hour, 0, 0);
isd_lite.date = t;
isd_lite.year = [];
isd_lite.month = [];
isd_lite.day = [];
isd_lite.hour = [];

isd_lite = table2timetable(isd_lite);
