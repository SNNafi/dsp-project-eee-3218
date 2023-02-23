function [x,y] = timeDomain(fileName)
[w,fs]=audioread(fileName);
x=linspace(0,length(w)/fs,length(w)); 
y = w;
end