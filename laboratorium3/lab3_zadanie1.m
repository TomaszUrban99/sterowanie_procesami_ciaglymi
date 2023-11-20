% Laboratorium 3, zadanie 1
% Tomasz Urban
% Numer indeksu: 247 428

% Parametry modelu
M = 0.5;    % masa wozka
m = 0.2;    % masa wahadla
L = 0.3;    % dlugosc od mocowania do srodka
            % ciezkosci wahadla
b = 0.1;    % wspolczynnik tarcia wozka
g = 9.81;    % przyspieszenie ziemskie

% Macierze, definicja

A = [   0, 1, 0, 0;
        0, -b/M, -(m*g)/M, 0;
        0, 0, 0, 1;
        0, -b/(M*L), -(m+M)*g/(M*L), 0; ];
    
B = [ 0; 1/M; 0; 1/(M*L)];

C = [   1, 0, 0, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1; ];

D = [   0; 0; 0; 0; ];
        
Q = observe(

% Oczekiwane wartosci
a = 1;

% Definicja wejscia
y_input = [ a, 0, 0, 0];

% Symulacja
model = sim('lab3_zadanie1_model.slx');
