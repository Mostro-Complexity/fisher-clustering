function [P,D]=fclassify(x,m)
% x为待分隔的有序样本，为列向量，共n个样本
% m为分隔数，分成m组，需要m-1个分隔点
% P为分隔点列表，第一个为第一分隔点，第n个为第n分隔点，共n-1个
% D为每次分隔的组内离差平方和，与P中元素一一对应
% P1为待选分隔点列表，D1为与P1中分隔点对应的组内离差平方和

%下面赋初值
n=size(x,1);
P1=[1:n-1]';
D1=zeros(n-1,1);
P=[];
D=[];
S=[]; %S为分割点排序向量
Sn=0; %n为S中元素数量

%下面求分隔点次序和对应距离
for Sn=1:m-1
%下面求每个备选分隔点对应的组内离差平方和
    for i=1:size(P1,1) %以下循环求D1(i)
        S=[P;P1(i)]; %从P1中取出元素加入S
        S=sort(S); %对S进行排序
        for i1=1:Sn  %遍历S中的元素，求P1(i)对应的组内离差平方和，Sn为S中元素个数
            if i1==1		
                G=x(1:S(1),:); %第一个小组
                D1(i)=ssdev(G);
            else
                G=x(S(i1-1)+1:S(i1),:);
                D1(i)=D1(i)+ssdev(G);
            end
        end
        G=x(S(Sn)+1:n,:);
        D1(i)=D1(i)+ssdev(G);
        S=[];
    end
%求每个备选分隔点对应的组内离差平方和完成
%下面求本次最优分割点
[d,p]=min(D1);
P=[P;P1(p)];
D=[D;d];
P1(p)=[];
D1(p)=[];
%求本次最优分割点完成
end
%求解完成
end

function d=ssdev(x) %求矩阵x的离差平方和,x每行是一个样本。
k=size(x,1);
d=sum(var(x))*(k-1);
%d=0;
%for h=1:k
%    d=d+(x(h,:)-mean(x))*(x(h,:)-mean(x))';
%end
end

