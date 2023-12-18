% Tomasz Urban
% Numer indeksu: 247 428

% Discrete PI regulation
% OBJECT PARAMETERS
% Ciagly
c_nom = [ 0, 0, 0, 1 ];
c_denom = [ 1, 3, 3, 1];

% Create transfer fucntion model
cont_model = tf ( c_nom , c_denom );

% Create discrete model
Ts = 0.1; % TIME SAMPLE
disc_model = c2d( cont_model, Ts );

% PI CONTROLL
% PI parameters
kp = 2;
ki = 0;

% continuous model
pi_cont_nom = [ kp, ki ];
pi_cont_denom = [ 1, 0];

pi_cont_model = tf ( pi_cont_nom, pi_cont_denom );

% Create discrete model
Ts2 = 0.1; % PI TIME SAMPLE
pi_disc_model = c2d ( pi_cont_model, Ts2 );

% Step disturbance parameters
    time_step = 0; % step time
    init_value = 0; % initial value
    final_value = 1; % final value
    
    
% Simulation
sim('sim_lab5_zadanie2.slx');

