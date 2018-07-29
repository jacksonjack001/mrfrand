function  [x,diff_Q]=solve(minx,maxx,ET,Nc,err)
% subplot(1,2,1); x=0.01:0.01:0.99;y=diff1(ET,x,Nc);plot(x,y)
fminx=diff1(ET,minx,Nc);
sign_minx=fminx>0;
fmaxx=diff1(ET,maxx,Nc);
sign_maxx=fmaxx>0;

% subplot(1,2,2); x=0.01:0.01:0.99;y=value_of_Q(ET,x,Nc);plot(x,y)
vMinx=value_of_Q(ET,minx,Nc);
vMaxx=value_of_Q(ET,maxx,Nc);

if sign_minx==sign_maxx
    if vMinx>vMaxx
        x=minx;
    else
        x=maxx;
    end
else
    dist=maxx-minx;
    if(dist<0)
        dist=-dist;
    end
    
    while(dist>err)
        x=(maxx+minx)/2;
        fx=diff1(ET,x,Nc);
        signx=fx>0;
        if(sign_minx&&signx)
            minx=x;
            fminx=fx;
        else
            maxx=x;
            fmaxx=fx;
        end
        dist=maxx-minx;
        if(dist<0)
            dist=-dist;
        end
    end
    if fmaxx~=fminx
        x=minx+(fx-fminx)*(maxx-minx)/(fmaxx-fminx);
    end
end
diff_Q=value_of_Q(ET,x,Nc);
end
