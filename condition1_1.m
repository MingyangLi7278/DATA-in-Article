
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

y0 = [0.5; 0.5; 0.5]; 

tspan = [0 9]; 


[t, y] = ode45(@(t, y) systemODEs(t, y, I_j, C_LC, T_RJ, C_HJ, C_LF, C_DJ, C_MJ, C_SJ, C_SC, B_SP, C_IF), tspan, y0);


figure;
plot(t, y(:,1), 'r', 'LineWidth', 2, 'DisplayName', 'Japan Government (x)'); hold on;
plot(t, y(:,2), 'g', 'LineWidth', 2, 'DisplayName', 'Other Countries (y)');
plot(t, y(:,3), 'b', 'LineWidth', 2, 'DisplayName', 'Japan Fisheries Association (z)');
xlabel('Time (t)');
ylabel('Decision Probability');
legend('FontSize', 12);


ylim([0, 1]);


grid on;
