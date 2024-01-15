% Tomasz Urban
% Numer indeksu: 247 428-

hold on

% --------- WEJSCIA i WYJSCIA -------
    u0 = 0;
    u_1 = 0;
    y0 = 0;
    y_1 = 0;
    
    % Time of simulation
    n_max = 1000;
    
    y = zeros ( n_max, 1);
    y(1) = y_1;
    y(2) = y0;
    
    % Wartosci rzeczywiste
    v = zeros ( n_max, 1);
    v(1) = 0;
    v(2) = 0;
    
    % Wartosci rzeczywiste
    u = zeros ( n_max, 1);
    u(1) = 0;
    u(2) = 0;
    
    % wektor phi
    phi_n = [ y(2), y(1), u(2), u(1) ].';

%  --------- PARAMETRY ---------
    a1 = 1;
    a2 = 1;
    b1 = 2;
    b2 = 1;
    
% ----------- P ---------------
    p_vector = [ 10^4, 10^4, 10^4, 10^4 ];
    P0 = diag(p_vector);

% ---- WEKTOR PARAMETROW ------
Theta = [ a1, a2, b1, b2 ].';

Pn_1 = P0;
Thetan_1 = Theta;

% ----- WAZENIE WYKLADNICZE
% 1 - brak wazenia wykladniczego
lambda = 1;

% ------ ZAKLOCENIE GAUSSA ------
    % wartosc oczekiwana
    E = 0;
    % wariancja
    var = 0.1;
    
    e_n = zeros ( n_max, 1);
    
% ---------- ESTYMATORY ----------
    v_est = zeros ( n_max, 1);
    v_est(2) = 0;
    v_est(1) = 0;
    
    y_est = zeros ( n_max, 1);
    y_est(2) = 0;
    y_est(1) = 0;
    
    theta_est = zeros ( n_max, 4);
    
for n = 2:1:1000
    
    % Losowanie wejscia
        % Losowanie z rozkladu jednostajnego
        u(n) = rand(1,1);
     
    % Losowanie zaklocenia zgodnie z parametrami
    e_n(n) = sqrt(var) * randn(1,1) + E;
    
    % Wylicz stan i wartosci wyjsc RZECZYWISTYCH
    v(n) = Theta(1) * v(n) + Theta(2) * v(n-1) + Theta(3) * u(n) + Theta(4) * u(n-1);
    y(n) = v(n) + e_n(n);
    
    phi_n(1) = y(n);
    phi_n(2) = y(n-1);
    phi_n(3) = u(n);
    phi_n(4) = u(n-1);
    
    Pn = (1/lambda) * (Pn_1 - ( Pn_1 * phi_n * (phi_n.') * Pn_1 )/( phi_n.' * Pn_1 * phi_n ));
    Thetan_1 = Thetan_1 + Pn * phi_n *( y(n) - phi_n.'*Pn_1*phi_n );
end

n_vect = 1:1:n_max;
plot(n_vect, y.');