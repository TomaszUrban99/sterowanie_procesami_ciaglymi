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
ki_vector = 0.05:0.025:0.95;

kp_vector = [1, 5];

for i=1:length(kp_vector)
    
    kp = kp_vector(i);

   % Create figure
    fig = figure('Name', 'Kp: ' + string(kp));
    figure(fig);

    for j=1:length(ki_vector)

    % -------------- PID MODEL ------------------
        % PID parameters
        ki = ki_vector(j);

        % continuous model
        pi_cont_nom = [ kp, ki ];
        pi_cont_denom = [ 1, 0];
        pi_cont_model = tf ( pi_cont_nom, pi_cont_denom );

    % ------------ SIMULATION ----------------
        out = sim('zadanie3.slx');
        scatter(ki,max(out.q));
        title('Kp: ' + string(kp));
        xlabel('ki');
        ylabel('Q');
        hold on;
       
    end

    saveas(fig, 'Kp: ' + string(kp), 'png');
end

    
    


