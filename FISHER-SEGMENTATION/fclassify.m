function [P,D]=fclassify(x,m)
% xΪ���ָ�������������Ϊ����������n������
% mΪ�ָ������ֳ�m�飬��Ҫm-1���ָ���
% PΪ�ָ����б�����һ��Ϊ��һ�ָ��㣬��n��Ϊ��n�ָ��㣬��n-1��
% DΪÿ�ηָ����������ƽ���ͣ���P��Ԫ��һһ��Ӧ
% P1Ϊ��ѡ�ָ����б���D1Ϊ��P1�зָ����Ӧ���������ƽ����

%���渳��ֵ
n=size(x,1);
P1=[1:n-1]';
D1=zeros(n-1,1);
P=[];
D=[];
S=[]; %SΪ�ָ����������
Sn=0; %nΪS��Ԫ������

%������ָ������Ͷ�Ӧ����
for Sn=1:m-1
%������ÿ����ѡ�ָ����Ӧ���������ƽ����
    for i=1:size(P1,1) %����ѭ����D1(i)
        S=[P;P1(i)]; %��P1��ȡ��Ԫ�ؼ���S
        S=sort(S); %��S��������
        for i1=1:Sn  %����S�е�Ԫ�أ���P1(i)��Ӧ���������ƽ���ͣ�SnΪS��Ԫ�ظ���
            if i1==1		
                G=x(1:S(1),:); %��һ��С��
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
%��ÿ����ѡ�ָ����Ӧ���������ƽ�������
%�����󱾴����ŷָ��
[d,p]=min(D1);
P=[P;P1(p)];
D=[D;d];
P1(p)=[];
D1(p)=[];
%�󱾴����ŷָ�����
end
%������
end

function d=ssdev(x) %�����x�����ƽ����,xÿ����һ��������
k=size(x,1);
d=sum(var(x))*(k-1);
%d=0;
%for h=1:k
%    d=d+(x(h,:)-mean(x))*(x(h,:)-mean(x))';
%end
end
