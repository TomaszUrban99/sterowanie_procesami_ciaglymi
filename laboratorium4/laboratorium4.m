% Tomasz Urban
% Numer indeksu: 247 428

hold on;
grid on;

% Input parameters

y0 = 0;
deltay = 1;
y_time = 0;

% Object parameters
nominator = ( 1 );
denominator = [ 1, 3, 3, 1 ];

% Regulator parameters
kp = [ 0, 0.1, 0.15, 0.25, 0.5, 1, 2, 4, 7.5, 8, 8.5, 9, 10];
Kr = kp(1);
fig1 = figure('Name','Gain');
figure(fig1);



max_vector = kp;
legend();

t=0:0.001:40;

for i = 1:length(kp)

    name = 'Kp: ' + string(kp(i));
    
    fig = figure('Name', name);
    figure(fig);

    Kr = kp(i);
    model = sim('sim3_laboratorium.slx');
    
    
    plot(t, model.odp, 'DisplayName', string(kp(i)));
    hold on;

    
    plot(t, model.zadana_wart);
    title('Odpowiedz ukladu');
    
    legend('Odpowiedz', 'Wartosc zadana');

    max_vector(i) = max(model.odp);

    saveas(fig, name, 'png');
end

