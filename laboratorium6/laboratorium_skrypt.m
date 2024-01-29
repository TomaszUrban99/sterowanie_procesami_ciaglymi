% Tomasz Urban
% Numer indeksu: 247 428-

hold on;

% --------- WEJSCIA i WYJSCIA -------
    u0 = 0;
    u_1 = 0;
    y0 = 0;
    y_1 = 0;
    
    % Time of simulation
    n_max = 4000;
    
    y = zeros (n_max,1);
    y(1) = y_1;
    y(2) = y0;
    
    % Wartosci rzeczywiste
    % Stany
        v = zeros (n_max,1);
        v(1) = 0;
        v(2) = 0;
    
    % Wartosci rzeczywiste
    % Wejscia
        u = zeros ( n_max,1);
        u(1) = 0;
        u(2) = 0;
        u(3) = 0;
    
    % wektor phi
    phi_n = [ y(2), y(1), u(3), u(2) ].';

%  --------- PARAMETRY ---------
    a1 = 0.15;
    a2 = 0.15;
    b1 = 0.1;
    b2 = 0.15;
    
% ----------- P ---------------
    p_vector = [ 10^4, 10^4, 10^4, 10^4 ];
    Pn = diag(p_vector);

% ---- WEKTOR PARAMETROW ------
Theta = [ a1; a2; b1; b2 ];

Pn_1 = Pn;
Thetan_1 = Theta;

% ----- WAZENIE WYKLADNICZE
% 1 - brak wazenia wykladniczego
lambda_vect = [0.1, 0.5, 1];
lambda = 1;

% ------ ZAKLOCENIE GAUSSA ------
    % wartosc oczekiwana
    E = 0;
    % wariancja
    var = 0.0001;
    
    e_n = zeros ( n_max,1);

% ----------- ESTYMATY ----------
    % Estymata stanu
    v_estimate = zeros ( n_max, 1);

    % Wyjscie policzone z estymaty

    theta_est = zeros (4, 1);
    theta_est_1 = theta_est;

for m = 1:1:length(lambda_vect)

    fig = figure('Name',string(lambda_vect(m)));
    figure(fig);

for n = 3:1:n_max

        if n == 400
           for d=1:1:length(Theta)
                Theta(d) = Theta(d) + 0.1;
           end
        end


        theta_est_1 = theta_est;
    
    % Losowanie wejscia
        % Losowanie z rozkladu jednostajnego
        u(n) = rand;
     
        % Losowanie zaklocenia zgodnie z parametrami
        e_n(n) = sqrt(var) * randn(1,1) + E;
    
        % Wylicz stan i wartosci wyjsc RZECZYWISTYCH
        v(n) = Theta(1) * v(n-1) + Theta(2) * v(n-2) + Theta(3) * u(n) + Theta(4) * u(n-1);
        y(n) = v(n) + e_n(n) + 0.1 * e_n(n-1);

        phi_n = [ y(n-1); y(n-2); u(n); u(n-1)];

        % Wyliczenie wartosci estymaty
        Pn = 1/lambda * ( Pn_1 - (Pn_1 * phi_n * phi_n.' * Pn_1)/(lambda + phi_n.'*Pn_1 * phi_n));
        theta_est = theta_est_1 + Pn * phi_n *( y(n) - (phi_n.' * theta_est_1));

        % Wylicz stan i wartosci ESTYMAT
        v_estimate(n) = theta_est(1) * v_estimate(n-1) + theta_est(2) * v_estimate(n-2) + theta_est(3) * u(n) + theta_est(4) * u(n-1);
        y_est(n) = v_estimate(n) + e_n(n);
 
        Pn_1 = Pn;
    
end

subplot(3,1,1);

n_vect = 1:1:n_max;

plot(n_vect, y);
title('Przebieg rzeczywisty');

hold on;

subplot(3,1,2);

plot(n_vect,y_est);
title('Przebieg estymaty');

subplot(3,1,3);
plot(n_vect, abs(y-y_est));
title('Blad estymaty');

saveas(fig, 'Skoczek Lambda: ' + string(m), 'png');

end