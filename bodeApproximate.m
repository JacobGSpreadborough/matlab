% example transfer function
% temporary bandwidth 
bandwidth = logspace(-1,2);
num = [8,24];
den = [1,9,24];
t = tf(num,den);
% write a function to get system type
type = 0;
% get pole frequencies
poles = damp(t);
% get zero frequencies
zeros = abs(roots(num));
corners = cat(1,poles,zeros);
% calculate open loop gain
K = num(length(num))/den(length(den));
figure(1);
bode(t,bandwidth);
figure(2);
% amplitude of current corner point
A = K;
% current frequency
Wpz = min(corners);
%last frequency - start graph at 10^-1
WL = -1;
% last point amplitude
AL = A;
% system type 
m = type * 20;
% plot initial line
semilogx(logspace(WL,log10(Wpz)),linspace(AL,A,50));
% update m
if(ismember(Wpz,poles))
    m = m - 20;
elseif(ismember(Wpz,zeros))
    m = m + 20;
end
hold on
%update A
A = AL + m*(log10(Wpz) - log10(WL));
%find next smallest value in array