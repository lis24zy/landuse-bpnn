%%  ��ջ�������
warning off             % �رձ�����Ϣ
close all               % �رտ�����ͼ��
clear                   % ��ձ���
clc                     % ���������

%%  ��������
% res = xlsread('���ݼ�.xlsx');
duqu_input;
duqu_output;
get30_10;
%%  ����ѵ�����Ͳ��Լ�
% temp = randperm(600);

P_train = xunlian_input';
T_train = xunlian_output';
M = size(P_train, 2);

P_test = ceshi_input';
T_test = ceshi_output';
N = size(P_test, 2);

%%  ���ݹ�һ��
[p_train, ps_input] = mapminmax(P_train, 0, 1);
p_test = mapminmax('apply', P_test, ps_input);

[t_train, ps_output] = mapminmax(T_train, 0, 1);
t_test = mapminmax('apply', T_test, ps_output);

%%  ��������
net = newff(p_train, t_train, 10);

%%  ����ѵ������
net.trainParam.epochs = 1000;     % �������� 
net.trainParam.goal = 1e-6;       % �����ֵ
net.trainParam.lr = 0.01;         % ѧϰ��
net.trainFcn = 'trainlm';

%%  ѵ������
net = train(net, p_train, t_train);

%%  �������
t_sim1 = sim(net, p_train);
t_sim2 = sim(net, p_test );

%%  ���ݷ���һ��
T_sim1 = mapminmax('reverse', t_sim1, ps_output);
T_sim2 = mapminmax('reverse', t_sim2, ps_output);

for i = 1: 6

%%  ���������
error1(i, :) = sqrt(sum((T_sim1(i, :) - T_train(i, :)).^2) ./ M);%ѵ��
error2(i, :) = sqrt(sum((T_sim2(i, :) - T_test (i, :)).^2) ./ N);%����

%%  ��ͼ
figure
subplot(2, 1, 1)
plot(1: M, T_train(i, :), 'r-*', 1: M, T_sim1(i, :), 'b-o', 'LineWidth', 1)
legend('��ʵֵ','Ԥ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'ѵ����Ԥ�����Ա�'; ['RMSE=' num2str(error1(i, :))]};
title(string)
xlim([1, M])
grid

subplot(2, 1, 2)
plot(1: N, T_test(i, :), 'r-*', 1: N, T_sim2(i, :), 'b-o', 'LineWidth', 1)
legend('��ʵֵ','Ԥ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'���Լ�Ԥ�����Ա�';['RMSE=' num2str(error2(i, :))]};
title(string)
xlim([1, N])
grid

%%  �ָ���
disp('**************************')
disp(['���������', num2str(i)])
disp('**************************')

%%  ���ָ�����
% ����ϵ�� R2
R1(i, :) = 1 - norm(T_train(i, :) - T_sim1(i, :))^2 / norm(T_train(i, :) - mean(T_train(i, :)))^2;
R2(i, :) = 1 - norm(T_test (i, :) - T_sim2(i, :))^2 / norm(T_test (i, :) - mean(T_test (i, :)))^2;

disp(['ѵ�������ݵ�R2Ϊ��', num2str(R1(i, :))])
disp(['���Լ����ݵ�R2Ϊ��', num2str(R2(i, :))])

% ƽ��������� MAE
mae1(i, :) = sum(abs(T_sim1(i, :) - T_train(i, :))) ./ M ;
mae2(i, :) = sum(abs(T_sim2(i, :) - T_test (i, :))) ./ N ;

disp(['ѵ�������ݵ�MAEΪ��', num2str(mae1(i, :))])
disp(['���Լ����ݵ�MAEΪ��', num2str(mae2(i, :))])

% ƽ�������� MBE
mbe1(i, :) = sum(T_sim1(i, :) - T_train(i, :)) ./ M ;
mbe2(i, :) = sum(T_sim2(i, :) - T_test (i, :)) ./ N ;

disp(['ѵ�������ݵ�MBEΪ��', num2str(mbe1(i, :))])
disp(['���Լ����ݵ�MBEΪ��', num2str(mbe2(i, :))])

end
save('trained_network.mat', 'net', 'ps_input', 'ps_output');
duqu_whole