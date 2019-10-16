Vector=[6.0 6.0 5.3 4.0 5.7 6.3 5.3 4.7 8.3 7.7 7.7 10.3] ;
Vector=Vector(1:6);
% [data, name] = xlsread('DMU SCORE.xlsx');
% Vector = data(2:end,3:end)';% 列为样品，行为指标
% Vector=Vector(:,1:4);
Vector = mapminmax(Vector, 0, 1);


% [D,a,b]=range1(Vector)
[array] = sect(Vector,5) 
% [L, P] = dloop(Vector);
% i=size(Vector, 2);
% k=8; %分割次数
% cut = [];
% while(1)
%     i=P(i,k);
%     cut = [cut,i];
%     k=k-1;
%     if i==1
%         break
%     end
% end
% cut