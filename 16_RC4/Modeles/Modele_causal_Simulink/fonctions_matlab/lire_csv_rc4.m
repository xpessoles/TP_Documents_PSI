function data = lire_csv_rc4(file_csv)

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
    data = [data;nombres]
end

% Fermer le fichier
fclose(fid);

end
