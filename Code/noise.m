%{
AUTHOR: Derek Black
TOPIC: Noise Characterization
DESCRIPTION: Show that sensor noise frequency is proportional to rotor
speed
%}

%% Extract data
% Time data
time1 = noise1(:,1);
time2 = noise2(:,1);
time3 = noise3(:,1);
time4 = noise4(:,1);
time5 = noise5(:,1);
time6 = noise6(:,1);

% Speed data - Scaled
speed1 = noise1(:,5)/mean(noise1(:,5));
speed2 = noise2(:,5)/mean(noise2(:,5));
speed3 = noise3(:,5)/mean(noise3(:,5));
speed4 = noise4(:,5)/mean(noise4(:,5));
speed5 = noise5(:,5)/mean(noise5(:,5));
speed6 = noise6(:,5)/mean(noise6(:,5));

% Calculated Frequency
f = [4.386 5.55 8.1967 10.8696 13.51 18.5185];
% Speed
s = [mean(noise1(:,5)) mean(noise2(:,5)) mean(noise3(:,5))...
    mean(noise4(:,5)) mean(noise5(:,5)) mean(noise6(:,5))];

% Fit data
x = [0 70];
b = inv(s*s')*s*f';
y = b*x;

%% Comparison figure
figure(1)
subplot(2,1,1)
plot(time1,speed1,'k--')
hold on;
plot(time3,speed3,'k:','linewidth',1.2);
hold on;
plot(time6,speed6,'k');
xlim([0 0.5]);
ylim([0.9 1.14]);
xlabel('Time (Sec)');
ylabel('Normalized Speed (rad/s)');
title('Sensor Noise Frequency');
legend('12 rad/s','32 rad/s','63 rad/s');
grid on;

subplot(2,1,2)
plot(x,y,'k--',s,f,'x','MarkerSize', 5.3);
xlabel('Frequency (Hz)');
ylabel('Average Speed (rad/s)');
legend('Proportionality','Data','Location','southeast');
grid on;
