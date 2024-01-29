% Tomasz Urban
% Numer indeksu: 247 428    

% -------------- INPUT STEP ----------------
    time_step = 0; % step time
    init_value = 0; % initial value
    final_value = 1; % final value

% -------------- OBJECT PARAMETERS ----------------
    % continuous
    c_nom = [ 0, 0, 0, 1 ];
    c_denom = [ 1, 3, 3, 1];
    
    % create transfer fucntion model
    cont_model = tf ( c_nom , c_denom );
    
% Vector with ki values
ki_vector = 0.05:0.05:0.95;
kp_vector = [ 1, 2, 4, 8];

% Matrix for storing simulation results
q_values = zeros(length(Ts_Control_Vector), length(ki_vector));

for j=1:length(kp_vector)

    for i=1:length(ki_vector)

    % -------------- PID MODEL ------------------
        % PID parameters
        kp = kp_vector(j); % PI TIME SAMPLE
        ki = ki_vector(i);

        % continuous model
        pi_cont_nom = [ kp, ki ];
        pi_cont_denom = [ 1, 0];
        pi_cont_model = tf ( pi_cont_nom, pi_cont_denom );

    % ------------ SIMULATION ----------------
        out = sim('sim4_laboratorium.slx');
        q_values(j,i) = max(out.q);
       
    end
end

    
    


