function ts = lire_csv_rc4(file_csv)

% Ouvrir le fichier CSV
fid = fopen(file_csv, 'r');
if fid == -1
    error('Impossible d''ouvrir le fichier.');
end

% Lire la 8ème ligne
for k = 1:7
    fgetl(fid); % Ignorer les 7 premières lignes
end
eighthLine = fgetl(fid);

% Extraire le premier nombre de la 8ème ligne
tokens = strsplit(eighthLine);
NB = str2double(tokens{1});

% Vérifier si NB est un nombre valide
if isnan(NB)
    error('Le premier nombre dans la 8ème ligne n''est pas valide.');
end

% On saute les lignes 9 à à 16
for k = 1:8
    fgetl(fid);
end

% Lire les données à partir de la ligne 17
data = [];
for k = 1:(NB)
    ligne = fgetl(fid);
    if ligne == -1
        break;
    end

    % Séparer les champs par les points-virgules
    champs = strsplit(ligne, ';');

    % Initialiser un tableau pour stocker les nombres
    nombres = zeros(1, length(champs));

    % Convertir chaque champ en nombre en tenant compte de la virgule comme séparateur décimal
    for i = 1:length(champs)
        champ = champs{i};
        if isempty(champ)
            nombres(i) = NaN; % Si le champ est vide, attribuer NaN
        else
            nombres(i) = str2double(strrep(champ, ',', '.'));
        end
    end
    data = [data;nombres];
end

% Fermer le fichier
fclose(fid);

les_temps = data(:,2)/1000;

positionSetpoint = data(:, 3);
positionMeasurement = data(:, 4);
currentSetpoint = data(:, 5);
currentMeasurement = data(:, 6);

% Crée une série temporelle pour chaque mesure
tsPositionSetpoint = timeseries(positionSetpoint, les_temps, 'Name', 'Consigne Position');
tsPositionMeasurement = timeseries(positionMeasurement, les_temps, 'Name', 'Mesure Position');
tsCurrentSetpoint = timeseries(currentSetpoint, les_temps, 'Name', 'Consigne Courant');
tsCurrentMeasurement = timeseries(currentMeasurement, les_temps, 'Name', 'Mesure Courant');


% Combine les séries temporelles dans une structure
% ts.PositionSetpoint = tsPositionSetpoint;
% ts.PositionMeasurement = tsPositionMeasurement;
% ts.CurrentSetpoint = tsCurrentSetpoint;
% ts.CurrentMeasurement = tsCurrentMeasurement;

ts = tscollection({tsPositionSetpoint,tsPositionMeasurement,tsCurrentSetpoint,tsCurrentMeasurement},"name","Mesure Enrouleur")

end
