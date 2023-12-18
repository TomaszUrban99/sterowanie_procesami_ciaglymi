% Tomasz Urban
% Numer indeksu: 247 428

% Porownanie odpowiedzi skokowej układu ciągłego i dyskretnego

% Ciagly
c_nom = [ 0, 0, 1 ];
c_denom = [ 1, 3, 2];

% Create transfer fucntion model
cont_model = tf ( c_nom , c_denom );

% Create discrete model
Ts = 0.1; % TIME SAMPLE
disc_model = c2d( cont_model, Ts );

%disc_nom = disc_model{1,1}.Numerator;
%disc_denom = disc_model.Denominator;

% Step disturbance parameters
    time_step = 0; % step time
    init_value = 0; % initial value
    final_value = 1; % final value
    
    
% Simulation
sim('sim_lab5.slx');

