function CdifusoPD = fuzzySystemStatic()
%{
Fuzzy system definition
Developed by:    
    * Daniel Rodriguez-20172020009
    * Sebastián Salazar-20172020018
year: 2021
course: Cibernetica 3
%}
system=newfis('Lightning_strike_counter');

% Input: # of objects
system=addvar(system,'input','#Objetos',[0 50]);
system=addmf(system,'input',1, 'entre 0 y 4','gbellmf', [3.05 3.16 0.571]);
system=addmf(system,'input',1, 'entre 4 y 12','gbellmf', [4.91 3.84 9.833]);
system=addmf(system,'input',1,'mas de 12','gbellmf', [19.3 2.5 36.9]);

% Input: Area
system=addvar(system,'input','Area', [0 1500]);
system=addmf(system,'input',2,'pequena','gbellmf', [91.5 3.16 38.6]);
system=addmf(system,'input',2,'media','gbellmf', [230 3.84 430]);
system=addmf(system,'input',2,'grande','gbellmf', [362 2.5 1.2e+03]);
%plotmf(sistema,'input',2)

% Input: eccentricity
%system=addvar(system,'input','excentricidad',  [0 1]);


%{ 
First setting
system=addmf(system,'input',3,'no excentrico','gbellmf', [0.55 3.28 0.334]);
system=addmf(system,'input',3,'si excentrico','gbellmf', [0.164 4.1 1.008]);
%plotmf(sistema,'input',3)
%}


% Output: # of lightning rays
system=addvar(system,'output','numero_rayos',[0 2.5]);
system=addmf(system,'output',1,'0 rayos','gbellmf',  [0.193 1 0.2808]);
system=addmf(system,'output',1,'1 rayo','gbellmf', [0.193 1 0.9624]);
system=addmf(system,'output',1,'2 rayos','gbellmf', [0.193 1 2.02]);
%plotmf(sistema,'output',1)

% Inference rules
ruleList=[
    1 1 1 1 2 % 0 rayos
    2 3 2 1 2 % 1 rayos
    3 2 3 1 2]; % 2 rayos

system = addrule(system,ruleList);

%Actualizando la salida de la función 
CdifusoPD=system;

end