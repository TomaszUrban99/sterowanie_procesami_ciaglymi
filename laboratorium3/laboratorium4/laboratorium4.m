% Tomasz Urban
% Numer indeksu: 247 428

hold on;
grid on;

% Input parameters

y0 = 0;
deltay = 1;
y_time = 1;

% Object parameters
nominator = ( 1 );
denominator = [ 1, 3, 3, 1 ];

% Regulator parameters
kp = [ 0, 0.1, 0.15, 0.25, 0.5, 1, 2, 4, 7.5, 8, 8.5, 9, 10];
Kr = kp;
fig1 = figure('Name','Gain');
figure(fig1);

hold on;

max_vector = kp;
legend();

for i = 1:length(kp)  
    model = sim('sim3_laboratorium.slx');
    plot(model.tout, model.simout, 'DisplayName', string(kp(i)));
    max_vector(i) = max(model.simout);
end

stable = figure('Name', 'cust');
figure(stable);

title('Wartosci ustalone');
ylabel('Wartosc ustalona');
xlabel('kp');
scatter(kp, max_vector);

