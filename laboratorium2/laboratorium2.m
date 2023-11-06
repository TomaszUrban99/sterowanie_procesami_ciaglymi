% Tomasz Urban
% Numer indeksu: 247 428


% Create Nyquist charactertic
% Use nyquist() function

hold on;

nominator_array = 2;
denominator_array = [1,1];

Model = tf(nominator_array,denominator_array);
nyquist(Model);

% Parameter

% Time vector
t = (0:0.0000001:1);

% Frequency vector
amplitude = 1;
omega =[ 0, 1, 2, 5, 10, 100, 1000, 10^4, 10^6, 10^9];

for i=1:1:length(omega)
    f = figure('Name',string(omega(i)));
    figure(f);
    x=sim('laboratorium2_simulation.slx');
    plot(x.transformed(1),x.transformed(2));
end