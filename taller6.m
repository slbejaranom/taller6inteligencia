% Se crea el objeto sistema difuso de tipo mamdani
clear,
close all,
clc,
fis = mamfis("Name","ImplementacionLogicaDifusa");
% Se le agregan las entradas
fis = addInput(fis, [0 100], "Name", "LuzExterior");
fis = addInput(fis, [0 100], "Name", "Temperatura");

% Funciones de pertenencia de la entrada LuzExterior
fis = addMF(fis, "LuzExterior", "trapmf", [-30.24 -9.76 9.76 30.24], "Name", "Baja");
fis = addMF(fis, "LuzExterior", "trimf", [10 50 90], "Name", "LuzAmbiente");
fis = addMF(fis, "LuzExterior", "trapmf", [70 85 120 140], "Name", "Alta");

% Funciones de pertenencia de la entrada Temperatura

fis = addMF(fis, "Temperatura", "trapmf", [-20 -10 10 20], "Name", "Baja");
fis = addMF(fis, "Temperatura", "trimf", [15 27 40], "Name", "TemperaturaAmbiente");
fis = addMF(fis, "Temperatura", "trapmf", [35 50 120 140], "Name", "Alta");

% Se agrega la salida

fis = addOutput(fis, [0 260], "Name", "PotenciaFoco");

% Funciones de pertenencia de la salida
fis = addMF(fis, "PotenciaFoco", "trimf", [-75 0 75], "Name", "Apagado");
fis = addMF(fis, "PotenciaFoco", "trimf", [50 125 200], "Name", "MedioPrendido");
fis = addMF(fis, "PotenciaFoco", "trimf", [200 255 310], "Name", "Prendido");

% Se agregan las reglas
ruleList = [1 1 3 1 1
            1 2 2 1 1
            1 3 2 1 1
            2 1 2 1 1
            2 2 2 1 1
            2 3 1 1 1
            3 1 2 1 1
            3 2 1 1 1
            3 3 1 1 1];
fis = addRule(fis, ruleList);
figure,
plotfis(fis);
figure,
plotmf(fis,"input",1);
figure,
plotmf(fis,"input",2);
figure,
gensurf(fis);