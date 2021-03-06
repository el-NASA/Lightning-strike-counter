%Optimización de un sistema de control difuso proporcional mediante GA
close all
clear all
warning('off','all')

%Sistema difuso como variable global
global sistema

% datos de entrenamiento
%% Use labeled images for testing
imgFolder = 'imgBinary';
imds = imageDatastore(imgFolder,...
    'IncludeSubFolders', true, 'LabelSource', 'foldernames');

% divede 60% for training, 20% validation and 20% testing
fracTrainFiles = 0.9;
fracValFiles = 0.05;
fracTestFiles = 0.05;

global imdsTrain imdsValidation imdsTest

[imdsTrain, imdsValidation, imdsTest] = splitEachLabel(imds, ...
    fracTrainFiles, fracValFiles, fracTestFiles, 'randomize')


%% Optimización con algoritmos genéticos
%optionsga = gaoptimset('Display','iter');
optionsga = gaoptimset('PopulationSize',50,'Generations',20,'PopInitRange',...
    [-0.5;2],'EliteCount',2,'CrossoverFraction',0.8,'PopulationType','doubleVector','TimeLimit',2000,'Display','iter');

%Opciones del algoritmo genético
X = ga(@fobj,30,optionsga) % Cambie el numero por el la cantidad de entradas de cada configuracion
%% Sistema difuso optimizado
sistema = generafisConf4(X); % Cambiar esta linea por el nombre alguna de las configuraciones
fuzzy(sistema)
%[t,x,e] = sim('SistemaControlPR16');
%ys = x(:,2);
%plot(t,ys);
