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
    
    % discrete model
    Ts = 0.001; % TIME SAMPLE
    disc_model = c2d( cont_model, Ts );

% Vector with ki values
ki_vector_set2 = 0.44:0.005:0.55;
ki_vector_set3 = 0.27:0.005:0.38;

Q_values = zeros(1,length(ki_vector_set2));

% Vector with time steps for discrete PID controller
Ts_Control_Vector = [ 0.001, 0.002, 0.01, 0.02, 0.05, 0.1];

% Matrix for storing simulation results
q_values = zeros(length(Ts_Control_Vector), length(ki_vector_set2));

kp_vector = [1, 5];

for k=1:length(kp_vector) 
    
    % Create figure
    fig = figure('Name', 'Kp: ' + string(kp_vector(k)));
    figure(fig);

    if k == 1
        ki_vector = ki_vector_set2;
    else
        ki_vector = ki_vector_set3;
    end


for j=1:length(Ts_Control_Vector)

    % Set step for discrete PID controller
    Ts2 = Ts_Control_Vector(j); % PI TIME SAMPLE 

    for i=1:length(ki_vector)

    % -------------- PID MODEL ------------------
        % PID parameters
        kp = kp_vector(k);
        ki = ki_vector(i);

        % continuous model
        pi_cont_nom = [ kp, ki ];
        pi_cont_denom = [ 1, 0];
        pi_cont_model = tf ( pi_cont_nom, pi_cont_denom );

        % discrete model
        pi_disc_model = c2d ( pi_cont_model, Ts2 );

    % ------------ SIMULATION ----------------
        out = sim('sim_lab5_zadanie2.slx');

        Q_values(i) = max(out.q);

        
        xlabel('ki');
        ylabel('Q');
        hold on;
       
    end

        plot(ki_vector,Q_values);
        hold on;
        
end
    title('Kp: ' + string(kp));
    legend('0.001', '0.002', '0.01', '0.02', '0.05', '0.1');

    saveas(fig, string(kp), 'png');

end
    
    


