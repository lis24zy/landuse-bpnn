% 设置随机数种子
rng(123); % 替换为您希望的种子值

% 假设 n 表示矩阵的行数
n = size(resultMatrix_input, 1);

% 计算需要提取的行数
trainRows = floor(0.6 * n); % 提取 60% 的行作为训练集
testRows = floor(0.1 * n);  % 提取 10% 的行作为测试集

% 随机生成索引，用于提取子矩阵
randomIndices = randperm(n);

% 提取训练集
trainIndices = randomIndices(1:trainRows);
xunlian_input = resultMatrix_input(trainIndices, :);
xunlian_output = resultMatrix_output(trainIndices, :);

% 提取测试集
remainingIndices = randomIndices(trainRows+1:end);
testIndices = remainingIndices(1:testRows);
ceshi_input = resultMatrix_input(testIndices, :);
ceshi_output = resultMatrix_output(testIndices, :);