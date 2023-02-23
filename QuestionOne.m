% Name    : Shahriar Nasim Nafi
% ID      : 190205154
% Section : C
% Group   : C1
% Github  : https://github.com/SNNafi/dsp-project-eee-3218

clc;
clear all;
close all;
% Read audio files & audio properties
[y,fs] = audioread('NonOverlapping.wav');
info = audioinfo('NonOverlapping.wav');

% Get audio duration
audioDuration = round(info.Duration);
audioEndTimes = [1, 13, 34, 50, audioDuration];
audioNames = ["Guitar", "Piano", "Trumpet", "Violin"];

% Question 1
for i=1:4
    % Retrieve each audio in separate file using start and end time
    audio = [y(audioEndTimes(i)*fs:(audioEndTimes(i + 1))*fs)];
   % sound(audio, fs);
    audiowrite(i + ".wav", audio, fs);
end

% Showing their time & frequency domain
figure(1)
for i=1:4
    [a,b] = timeDomain(i + ".wav");
    subplot(4,1,i)
    plot(a, b)
    title(audioNames(i) + "'s signal in Time Domain")
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
    xlabel('Time')
    ylabel('Amplitude')
    grid
end

figure(2)
for i=1:4
    [a,b] = freqDomain(i + ".wav");
    subplot(4,1,i)
    plot(a, b)
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 9);
    title(audioNames(i) + "'s signal in Frequency Domain")
    xlabel('Frequncy')
    ylabel('Magnitude')
    grid
end

% Delete temp audio files
for i=1:4
    delete(i + ".wav");
end