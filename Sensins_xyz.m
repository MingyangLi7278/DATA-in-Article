I_j = 20;
C_LC = 8;
T_RJ = 5;
C_HJ = 10;
C_LF = 30;
C_DJ = 3;
C_MJ = 6;
C_SJ = 35;
C_IF = 1;
B_SP = 1;
C_SC = 30;

tspan = [0 5];

initial_conditions_set = [
    0.5, 0.5, 0.5; 
    0.8, 0.1, 0.1;
    0.2, 0.7, 0.1; 
    0.7, 0.2, 0.1;
];

results = cell(size(initial_conditions_set, 1), 1);

for i = 1:size(initial_conditions_set, 1)
    y0 = initial_conditions_set(i, :)';
    [t, y] = ode45(@(t, y) systemODEs(t, y, I_j, C_LC, T_RJ, C_HJ, C_LF, C_DJ, C_MJ, C_SJ, C_SC, B_SP, C_IF), tspan, y0);
    results{i} = [t, y];
end

for j = 1:3
    figure;
    for i = 1:size(initial_conditions_set, 1)
        t = results{i}(:, 1);
        prob = results{i}(:, j + 1);
        plot(t, prob, 'LineWidth', 2, 'DisplayName', sprintf('Initial Condition %d', i));
        hold on;
    end
    grid on; 
    xlabel('Time (t)', 'FontSize', 14);
    ylabel('Probability', 'FontSize', 14);
    legend('FontSize', 12, 'FontWeight', 'bold');
end
