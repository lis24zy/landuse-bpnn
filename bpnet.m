
xunlian_input = xunlian_input';
xunlian_output = xunlian_output';

ceshi_input = ceshi_input';
ceshi_output = ceshi_output';


%��ʼ��������

net=newff(minmax(xunlian_input),[12,6],{'tansig','purelin'},'traingdm')
inputWeights=net.IW{1,1}    % ��ȡ����㵽���ز�֮���Ȩ�ء�
inputbias=net.b{1}          %��ȡ����㵽���ز�֮���ƫ�
layerWeights=net.LW{2,1}    %��ȡ���ز㵽�����֮���Ȩ�ء�
layerbias=net.b{2}          %��ȡ���ز㵽�����֮���ƫ�
net.trainParam.show=50      %����ѵ��������ÿ��50�ε�����ʾһ��ѵ��״̬��
net.trainParam.lr=0.07      %����ѧϰ��Ϊ0.07��
net.trainParam.mc=0.1       %���ö�������Ϊ0.1��
net.trainParam.epochs=1000  %����ѵ��������������Ϊ1000�Ρ�
net.trainParam.goal=5e-3    %����ѵ����Ŀ�����Ϊ5e-3
% ѵ������
[net,tr]=train(net,xunlian_input,xunlian_output)
% ʵ��ֵ��Ԥ��ֵ�Ա�
x=1:1:331917;
out=sim(net,ceshi_input )
%out1=sim(net,resultMatrix_input)
out=round(out);
plot(x,out,'*')
hold on
plot(x,ceshi_output,'o')
save neu10 net