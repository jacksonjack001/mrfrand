function [x]=myZoomOut(x)
[col,raw,B]=size(x);
tm=zeros(2*col,2*raw,B);
tm(1:2:2*col,1:2:2*raw,:)=x;
tm(2:2:2*col,1:2:2*raw,:)=x;
tm(1:2:2*col,2:2:2*raw,:)=x;
tm(2:2:2*col,2:2:2*raw,:)=x;
x=tm;
end