% 加载神经网络和归一化参数
load('trained_network.mat');

% 加载新的输入数据
whole_input = resultMatrix_wholeinput'; % 加载新的输入数据

% 对输入数据进行归一化处理
p_whole = mapminmax('apply', whole_input, ps_input);

% 使用神经网络进行预测
t_pred = sim(net, p_whole);

% 对预测结果进行反归一化处理
whole_output = mapminmax('reverse', t_pred, ps_output);

[nRows, nCols] = size(imageData11);
% load neu10
% out1=sim(net,resultMatrix_input');
out1=whole_output;
out1=round(out1);
out1=out1';
%out1=sim(net,p1)
% 初始化结果矩阵
real = zeros(nRows , nCols);

% 遍历图像像素，并进行赋值操作
for i = 1:nRows
    for j = 1:nCols
        rowIndex = (i - 1) * nCols + j;
        if out1(rowIndex, 1) ==1
            real(i,j)=1;
        end  
        if out1(rowIndex, 2) ==1
            real(i,j)=2;
        end 
        if out1(rowIndex, 3) ==1
            real(i,j)=3;
        end 
        if out1(rowIndex, 4) ==1
            real(i,j)=4;
        end 
        if out1(rowIndex, 5) ==1
            real(i,j)=5;
        end 
        if out1(rowIndex, 6) ==1
            real(i,j)=6;
        end 
    end     
end
% for i = 1:nRows
%     for j = 1:nCols
%         if real(i,j)==0
%             real(i,j)=15;
%         end
%     end
% end
real=uint8(real);
imwrite(real,'output.tif');