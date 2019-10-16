 
function [array] = sect(vector,n)  
%vector 为样品矩阵，当直接对样品矩阵进行分割时调用该函数
%array 返回样品最优 n 分割的分割点号 
%n 为要分割的段数
[a,b]=size(vector); 

[d,a,b]=range1(vector);
for num=n:-1:2   
    [S,alp]=divi(vector,num,d);
    if num == n       
        array(num-1)=alp(1, b);  
    else
        array(num-1)=alp(array(num));  
    end
end
 