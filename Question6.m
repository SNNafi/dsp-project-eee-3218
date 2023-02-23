% Name    : Shahriar Nasim Nafi
% ID      : 190205154
% Section : C
% Group   : C1
% Github  : https://github.com/SNNafi/dsp-project-eee-3218
% Question: 6

% Please run Question3And4.m before this, to generate seperate audio file

clc;
clear all;
close all;

audioNames = ["Guitar", "Piano", "Trumpet", "Violin"];

figure(5)
% ID: 190205154
carrierSignals = [5154, 20000];
% Randomly select two separated signal
signalIndexes = randperm(4,4);
% Read signals
[audioSignal1, sfs1] = audioread(audioNames(signalIndexes(1)) + ".wav");
[audioSignal2, sfs2] = audioread(audioNames(signalIndexes(2)) + ".wav");
% Time vector
t = (0:length(audioSignal1)-1)/sfs1;
for i=1:2
    modulatedSignal = audioSignal1 .* cos(2*pi*carrierSignals(i)*t).' + audioSignal2 .* sin(2*pi*carrierSignals(i)*t).'; 
    [x4, y4] = freqDomain2(modulatedSignal, sfs1);
    subplot(2,1,i);
    plot(x4, y4);
    title("Audios send through FDM(Carrier:  " + carrierSignals(i) + ")" + " are " + audioNames(signalIndexes(1)) + ", " + audioNames(signalIndexes(2)))
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
    xlabel('Frequncy')
    ylabel('Magnitude')
    % Write modulated signal
    audiowrite(audioNames(signalIndexes(1)) + "+" + audioNames(signalIndexes(2)) + "_" + "ModulatedSignal" + i + ".wav", modulatedSignal, sfs1);  
end