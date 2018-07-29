function [I]=imstack2vectors(inp)
[w,h,b]=size(inp);
I=reshape(inp,w*h,b);