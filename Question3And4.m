% Name    : Shahriar Nasim Nafi
% ID      : 190205154
% Section : C
% Group   : C1
% Github  : https://github.com/SNNafi/dsp-project-eee-3218


clc;
clear all;
close all;
[y, Fs] = audioread('Final.wav'); 
audioNames = ["Guitar", "Piano", "Trumpet", "Violin"];


% Guiter

PBE_Guiter = 1;
TW_Guiter = 2000-PBE_Guiter;
delf_Guiter = TW_Guiter/Fs;
M_Guiter = round(5.5/delf_Guiter); 
corner_Guiter = PBE_Guiter+TW_Guiter/2;
wn_Guiter = 2*pi*corner_Guiter/Fs; 
a_Guiter = fir1(M_Guiter, wn_Guiter/pi, 'low', blackman(M_Guiter+1));
z_Guiter = filter(a_Guiter,1,y);
[x1, y1] = freqDomain2(z_Guiter, Fs);
subplot(4,1,1);
plot(x1, y1);
title(audioNames(1))
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xlabel('Frequncy')
ylabel('Magnitude')
audiowrite(audioNames(1) + ".wav", z_Guiter, Fs);

% Piano

PBE_Piano_1 = 3500; 
PBE_Piano_2 = 5100;
TW_Piano_1 = 4800-PBE_Piano_1;
TW_Piano_2 = 6300-PBE_Piano_2;
delf_Piano = (TW_Piano_1 + TW_Piano_2)/Fs; 
M_Piano = round(5.5/delf_Piano); 
corner_Piano1 = PBE_Piano_1+TW_Piano_1/2; 
corner_Piano2 = PBE_Piano_2+TW_Piano_2/2;
wn_Piano1 = 2*pi*corner_Piano1/Fs;
wn_Piano2 = 2*pi*corner_Piano2/Fs;
wn_Piano=[wn_Piano1,wn_Piano2];
a_Piano = fir1(M_Piano, wn_Piano./pi,  blackman(M_Piano+1));
z_Piano=filter(a_Piano,1,y);
[x2, y2] = freqDomain2(z_Piano, Fs);
subplot(4,1,2);
plot(x2, y2);
title(audioNames(2))
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xlabel('Frequncy')
ylabel('Magnitude')
audiowrite(audioNames(2) + ".wav", z_Piano, Fs);


% Trumpet

PBE_Trumpet_1 = 7300; 
PBE_Trumpet_2 = 10500;
TW_Trumpet_1 = 9500-PBE_Trumpet_1;
TW_Trumpet_2 = 14000-PBE_Trumpet_2;
delf_Trumpet = (TW_Trumpet_1 + TW_Trumpet_2)/Fs; 
M_Trumpet = round(5.5/delf_Trumpet); 
corner_Trumpet1 = PBE_Trumpet_1+TW_Trumpet_1/2; 
corner_Trumpet2 = PBE_Trumpet_2+TW_Trumpet_2/2;
wn_Trumpet1 = 2*pi*corner_Trumpet1/Fs;
wn_Trumpet2 = 2*pi*corner_Trumpet2/Fs;
wn_Trumpet=[wn_Trumpet1,wn_Trumpet2];
a_Trumpet = fir1(M_Trumpet, wn_Trumpet./pi,  blackman(M_Trumpet+1));
z_Trumpet=filter(a_Trumpet,1,y);
[x2, y2] = freqDomain2(z_Trumpet, Fs);
subplot(4,1,3);
plot(x2, y2);
title(audioNames(3))
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xlabel('Frequncy')
ylabel('Magnitude')
audiowrite(audioNames(3) + ".wav", z_Trumpet, Fs);




% Violin

PBE_Violin_1 = 18000; 
PBE_Violin_2 = 20400;
TW_Violin_1 = 19500-PBE_Violin_1;
TW_Violin_2 = 21800-PBE_Violin_2;
delf_Violin = (TW_Violin_1 + TW_Violin_2)/Fs; 
M_Violin = round(5.5/delf_Violin); 
corner_Violin1 = PBE_Violin_1+TW_Violin_1/2; 
corner_Violin2 = PBE_Violin_2+TW_Violin_2/2;
wn_Violin1 = 2*pi*corner_Violin1/Fs;
wn_Violin2 = 2*pi*corner_Violin2/Fs;
wn_Violin=[wn_Violin1,wn_Violin2];
a_Violin = fir1(M_Violin, wn_Violin./pi,  blackman(M_Violin+1));
z_Violin=filter(a_Violin,1,y);
[x2, y2] = freqDomain2(z_Violin, Fs);
subplot(4,1,4);
plot(x2, y2);
title(audioNames(4))
set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
xlabel('Frequncy')
ylabel('Magnitude')
audiowrite(audioNames(4) + ".wav", z_Violin, Fs);
