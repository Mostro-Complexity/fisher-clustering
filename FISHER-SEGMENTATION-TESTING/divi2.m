function [S,alp]=divi2(vector,k)
%最优二分隔,S 为最优二分割各段的分割点，
%a1 记录了二分割的序号 
[d,a,b]=range1(vector);
alp=ones(k-1,b);%al(i,j)表示前 i 个样品的第 j 次分割点
S=zeros(b,b);
s = inf(b, b);

for m=2:b
    for j=1:m-1  
        s(m,j)=d(1,j)+d(j+1,m); 
    end
    [S_temp(m,1), alp(k-1,m)]=min(s(m,1:m-1)); 

    for t=1:m    
        S(t,alp(k-1,t))=S_temp(t,1); 
    end
end