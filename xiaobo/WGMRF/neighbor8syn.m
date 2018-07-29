function nei=neighbor8syn(Y)
[s,t,P]=size(Y);
%upper-left
Yul=zeros(s,t,P);
Yul(2:s,2:t,:)=Y(1:s-1,1:t-1,:);
%upper
Yu=zeros(s,t,P);
Yu(2:s,:,:)=Y(1:s-1,:,:);
%upper-right
Yur=zeros(s,t,P);
Yur(2:s,1:t-1,:)=Y(1:s-1,2:t,:);
%right
Yr=zeros(s,t,P);
Yr(:,1:t-1,:)=Y(:,2:t,:);
%down-right
Ydr=zeros(s,t,P);
Ydr(1:s-1,1:t-1,:)=Y(2:s,2:t,:);
%down
Yd=zeros(s,t,P);
Yd(1:s-1,:,:)=Y(2:s,:,:);
%down-left
Ydl=zeros(s,t,P);
Ydl(1:s-1,2:t,:)=Y(2:s,1:t-1,:);
%left
Yl=zeros(s,t,P);
Yl(:,2:t,:)=Y(:,1:t-1,:);

Y1=Yul+Ydr;
Y2=Yu+Yd;
Y3=Yur+Ydl;
Y4=Yr+Yl;
nei=cat(3,Y1,Y2,Y3,Y4);
end



