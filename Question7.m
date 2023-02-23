% Name    : Shahriar Nasim Nafi
% ID      : 190205154
% Section : C
% Group   : C1
% Github  : https://github.com/SNNafi/dsp-project-eee-3218
% Question: 7

% Read in the audio signal
[y, Fs] = audioread('Final.wav');

% Define the melodious intervals (in semitones)
intervals = [0 5 9 12];

% Preallocate array to improve performance
mixedSignal = zeros(370466,4);

% Create the melodious audio signals
for i = 1:length(intervals)
    % Shift the original signal by the interval
    shiftedSignal = circshift(y, round(Fs * intervals(i) / 12));
   
    % Mix the shifted signal with the original signal
    mixedSignal(:, i) = (y + shiftedSignal) / 2;
end

% Sum the melodious audio signals to create the final signal
finalSignal = sum(mixedSignal, 2);

% Normalize the final signal
finalSignal = finalSignal / max(abs(finalSignal));

% Write the final signal to a new audio file
audiowrite('Final_Melodious.wav', finalSignal, Fs);