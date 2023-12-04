clc; clear all; close all;

freq1 = 50;
freq2 = 200;
freq3 = 500;

fs = 1500;
t = 0:0.0005:0.1;

signal1 = sin(2*pi*freq1*t);
signal2 = 3*sin(2*pi*freq2*t);
signal3 = 10*sin(2*pi*freq3*t);

combined_signal = signal1 + signal2 + signal3;

cutoff_frequency = 50;
filter_order = 32;

lpf = designfilt('lowpassfir', 'FilterOrder', filter_order, 'CutoffFrequency', cutoff_frequency, 'SampleRate', fs);
% freqz(lpf);
% Apply the filter using filtfilt
filtered_signal = filtfilt(lpf, combined_signal);

figure;
subplot(311)
plot(t, combined_signal, 'b', 'LineWidth', 1.5);
title('combined Signal');
subplot(312)
plot(t, filtered_signal, 'r', 'LineWidth', 1.5);
title('Filtered Signal (Zero-Phase)');
subplot(313)
plot(t, signal1, 'g', 'LineWidth', 1.5);
title('Signal 1');
xlabel('Time (s)');
ylabel('Amplitude');
