
xunlian_input = xunlian_input';
xunlian_output = xunlian_output';

ceshi_input = ceshi_input';
ceshi_output = ceshi_output';


%初始化神经网络

net=newff(minmax(xunlian_input),[12,6],{'tansig','purelin'},'traingdm')
inputWeights=net.IW{1,1}    % 获取输入层到隐藏层之间的权重。
inputbias=net.b{1}          %获取输入层到隐藏层之间的偏差。
layerWeights=net.LW{2,1}    %获取隐藏层到输出层之间的权重。
layerbias=net.b{2}          %获取隐藏层到输出层之间的偏差。
net.trainParam.show=50      %设置训练过程中每隔50次迭代显示一次训练状态。
net.trainParam.lr=0.07      %设置学习率为0.07。
net.trainParam.mc=0.1       %设置动量因子为0.1。
net.trainParam.epochs=1000  %设置训练的最大迭代次数为1000次。
net.trainParam.goal=5e-3    %设置训练的目标误差为5e-3
% 训练网络
[net,tr]=train(net,xunlian_input,xunlian_output)
% 实际值与预测值对比
x=1:1:331917;
out=sim(net,ceshi_input )
%out1=sim(net,resultMatrix_input)
out=round(out);
plot(x,out,'*')
hold on
plot(x,ceshi_output,'o')
save neu10 net