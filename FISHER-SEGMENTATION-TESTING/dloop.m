function [L,P]=dloop(vector) %n 为要分割的段数
    [D,a,b]=range1(vector); 
    L = zeros(b, b); % 最优代价，行为元素数量，列为切割次数
    P = ones(b, b); % 最优切割位置，行为元素数量，列为切割次数
    s = inf(b, b); % 代价，行为元素数量，列为切割点位置
    for n=2:b % 从左到右，参与分类元素数目
        for k=1:n-1 % 切割次数
            for j=k+1:n % 从左到右，切割点位置
                if k==1
                    s(n,j-1) = D(1,j-1) + D(j, n);
                else
                    s(n,j-1) = L(P(j,k-1)) + D(j, n);
                end            
            end

            % 更新P, L
            [L(n, k), P(n, k)] = min(s(n, :));
        end
    end
end