
I_j = 20;
C_LC = 8;
T_RJ = 5;
C_HJ = 10;
C_LF = 20;
C_DJ = 3;
C_MJ = 6;
C_SJ = 30;
C_IF = 1;
B_SP = 1;
C_SC = 30;


tspan = [0 90]; 


num_trajectories = 100;
initial_conditions_set = rand(num_trajectories, 3); 


figure;
hold on;

for i = 1:num_trajectories
    g0 = initial_conditions_set(i, :)';
    

    [t, y] = ode45(@(t, g) systemODEs(t, g, I_j, C_LC, T_RJ, C_HJ, C_LF, C_DJ, C_MJ, C_SJ, C_SC, B_SP, C_IF), tspan, g0);
    

    plot3(y(:,1), y(:,2), y(:,3), 'LineWidth', 0.5);
end
xlim([0, 1]);
ylim([0, 1]);
zlim([0, 1]);
xlabel('Japan Government (x)');
ylabel('Other Countries (y)');
zlabel('Japan Fisheries Association (z)');
grid on;
scatter3(1, 0, 1, 'o', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
view(3); 
