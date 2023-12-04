function [xup, nup] = upsampling(x, n, L)

% L is the upsampling factor
% x is the original sampled signal
% n is the original index vector

nup = n(1)*L:n(end)*L;
xup = zeros(1, length(nup));
xup(1:L:length(nup)) = x;

end