% Vector=[6.0 6.0 5.3 4.0 5.7 6.3 5.3 4.7 8.3 7.7 7.7 10.3]' ;
% Vector=Vector(1:6);
% Vector=rand(12,2);

[data, name] = xlsread('DMU SCORE.xlsx');
Vector = data(2:end,3:end);
Vector = mapminmax(Vector', 0, 1)';

[P,D]=fclassify(Vector,10);

P=sort(P)
class = ones(size(Vector,1),1);
for i=1:length(P)-1
    class(P(i)+1:P(i+1)) = i+1;
end
class(P(end)+1:end)=i+2;

Vector=[Vector,class];
name(1,3:8)=num2cell(data(1,3:8));
name{1,9}='class';
name(2:end,3:end)=num2cell(Vector);
name(2:end,1)=num2cell([1:size(Vector,1)]);
xlswrite('DMU CLASSES.xlsx',name);