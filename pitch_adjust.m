clc;clear all;close all;
[Y, FS] = audioread('test.mp3');

% checking if the audio is mono or stereo.. just curiosity
if size(Y, 2) == 2;disp('stereo');else; disp('mono');end

pitch_factor = 1.21;  
sound(Y, pitch_factor * FS)
% for plotting
t_original = (0:length(Y)-1) / FS;
t_pitched = (0:length(Y)-1) / (pitch_factor*FS);


subplot(2,1,1);
plot(t_original, Y);
title('Original Signal');
subplot(2,1,2);
plot(t_pitched, Y);
title('Pitched Signal');


% Saviiiiiiiiiiiiing
audiowrite('low_pitch.ogg', Y, pitch_factor * FS);
