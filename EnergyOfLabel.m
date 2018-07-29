function E=EnergyOfLabel(segmentation,potential,width,height,class_number)
n=size(segmentation,1);
segmentation=reshape(segmentation,[width,height]);

%%  use Matrix to repalce the loop of for
E=zeros(n,class_number);
Nei8_x=NeiX(segmentation);
[a,b,c]=size(Nei8_x);
Nei8=reshape(Nei8_x,a*b,8);
for i=1:class_number
    E(:,i)=sum(Nei8~=i,2);
end
E=E*potential;

%% in fact, the following methods are almost the same
%% for to loop, here I drop the boundary line ,so when the potential is large enough as 100, the segmentation will be tortured
% Esi=zeros(width,height,class_number);
% for i=1:class_number
%     for c=2:(width-1)
%         for r=2:(height-1)
%             for dr=-1:1
%                 for dc=-1:1
%                     if(dr==0)&&(dc==0)
%                         continue;
%                     end
%                     Esi(c,r,i)=Esi(c,r,i)+potential*(segmentation(c+dr,r+dc)~=i);
%                 end
%             end
%         end
%     end
% end
% E=reshape(Esi,[n,class_number]);

%% feed the boundary
% Esi=zeros(width,height,class_number);
% for i=1:class_number
%     for c=1:(width)
%         for r=1:(height)
%             for dr=-1:1
%                 for dc=-1:1
%                     ci=c+dr;
%                     ri=r+dc;
%                     if ((dr==0)&&(dc==0))
%                         continue;
%                     end
%                     if ci<1||ci>width||ri<1||ri>height
%                         Esi(c,r,i)=Esi(c,r,i)+potential;
%                     else
%                         Esi(c,r,i)=Esi(c,r,i)+potential*(segmentation(ci,ri)~=i);
%                     end
%                 end
%             end
%         end
%     end
% end
% E=reshape(Esi,[n,class_number]);
