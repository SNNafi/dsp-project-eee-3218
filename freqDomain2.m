function [x,y] = freqDomain2(w,fs)
nfft=2^nextpow2(length(w));
x=fs/2*linspace(0,1,nfft/2+1);
y0=abs(fft(w,nfft));
y = y0(1:nfft/2+1);
end