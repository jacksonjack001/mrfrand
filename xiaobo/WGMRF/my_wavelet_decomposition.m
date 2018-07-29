function [w]=my_wavelet_decomposition(origin,level_number,waveletbase)
w=cell(level_number+1,1);
for level=1:level_number
    w{level}=[];
end
w{1}=origin;

bands=ndims(origin);
if bands==2
    A=origin;
    for level=2:level_number+1
        [A,H,V,D]=dwt2(A,waveletbase);
        w{level}=cat(3,w{level},A,H,V,D);
    end
else
    for b=1:bands
        A=origin(:,:,b);
        for level=2:level_number+1
            [A,H,V,D]=dwt2(A,waveletbase);
            w{level}=cat(3,w{level},A,H,V,D);
        end
    end
end
end