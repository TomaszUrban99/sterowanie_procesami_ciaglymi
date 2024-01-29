% Testowanie PID-a

% Parametry obiektu
%  ___1___
%  (s + 1)^3
%

% ------------ STEP PARAMETERS -----------
    initial_value = 0;
    final_value = 1;
    step_time = 0;

% --------------- OBJECT ----------------

% Transmitation
    a01 = 1;
    a00 = 1;
% Transmitation polynom
    nom_obj = [ 0, 0, 0, 1 ];
    denom_obj = [ a01^3, 3*(a01^2)*a00, 3*a01*a00^2, a00^3];
% Create model
    obj_model = tf(nom_obj,denom_obj);

% ---------------- PID CONTROLLER ----------------

% PID parameters
    Td = 1;
    Ti = 10;
    K = 1;
 % PID polynoms
 % Proportional
        nom_pid_gain = [ 0, K ];
        denom_pid_gain = [ 0, 1];
 % Integral
        nom_pid_integral = [ 0, 1];
        denom_pid_integral = [ Ti, 0];
 % Derivative
        nom_pid_derivative = [ Td, 0];
        denom_pid_derivative = [ 0.0001, 1];

 sim('sim_pid.slx');