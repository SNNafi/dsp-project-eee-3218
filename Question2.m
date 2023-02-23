% Name    : Shahriar Nasim Nafi
% ID      : 190205154
% Section : C
% Group   : C1
% Github  : https://github.com/SNNafi/dsp-project-eee-3218

clc;
clear all;
close all;

[x1,y1] = timeDomain("Final.wav");
[x2,y2] = freqDomain("Final.wav");
figure(3)
subplot(2,1,1)
plot(x1, y1)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
title("Final's signal in Time Domain")
xlabel('Time')
ylabel('Amplitude')
grid
subplot(2,1,2)
plot(x2, y2)
title("Final's signal in Frequency Domain")
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xlabel('Frequncy')
ylabel('Magnitude')
grid