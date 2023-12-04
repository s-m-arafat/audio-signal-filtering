clc;clear all;close all;
[Y, FS] = audioread('hello.mp3');

% checking if the audio is mono or stereo.. just curiosity
if size(Y) == 2;disp('stereo');else; disp('mono');end

t_original = (0:length(Y)-1) / FS;
sample_rate = 2.5*FS;
ts = 0:1/sample_rate:t_original(end);

sampled_audio = interp1(t_original,Y,ts);

length(ts)

[dsample, t_dsample] = downsampling(sampled_audio, 4*ts/sample_rate, 1);
sound(dsample, sample_rate)
xr = zeros(1, length(t_original)); 
% 
% for t = 1:length(t_original)
% 	for n = 0:length(t_dsample)-1
% 		xr(t) = xr(t) + dsample(n+1)*sin(pi*(t_original(t)-n*t_dsample)/t_dsample)/(pi*(t_original(t)-n*t_dsample)/t_dsample);
% 	end
% end

subplot(4,1,1);
plot(t_original, Y);
title('Original Signal');

subplot(4,1,2);
stem(ts, sampled_audio);
title('sampled Signal');

subplot(4,1,3);
stem(t_dsample, dsample);
title('down sampled Signal');

% subplot(4,1,4);
% plot(t_original, xr);
% title('sampled Signal');

% Save the resampled audio if needed
% audiowrite('low_pitch.ogg', Y, pitch_factor * FS);
