function [S,alp]=divi(vector,n,d) 
%n 为要分割的段数
b=size(vector,2);
alp = ones(1, b);%al(i,j)表示前 i 个样品的第 j 次分割点
%     S=zeros(b,b);
for m=n:b 
    for j=n-1:m-1
        if n==2
            s(m,j)=d(1,j)+d(j+1, m);
        else
            [S,alp]=divi(vector,n-1,d);  
            s(m,j)=S(j,alp(j))+d(j+1, m); 
        end
    end

    S_temp(m,1) = min(s(m,n-1:m-1));  
    
    for j=1:m-1       
        if S_temp(m,1)==s(m,j)     
            alp(m)=j;    
        end  
    end

    for t=1:m     
        if alp(t)~=0  
            S(t,alp(t))=S_temp(t,1);   
        end
    end
end
end