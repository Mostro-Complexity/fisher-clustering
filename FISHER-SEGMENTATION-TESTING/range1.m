function [D,a,b]=range1(vector)
    %D 返回计算所得的极差矩阵 
    [a,b]=size(vector); 
    %求矩阵大小,a 为指标数,b 为样品数 
    k=3;%当只计算单指标数据时，k=a=1 
    D = zeros(b, b);
    for i=1:b     
        for j=i:b         
            D(i, j) = sum(max(vector(:,i:j), [], 2) - min(vector(:,i:j), [], 2));     
        end
    end
end