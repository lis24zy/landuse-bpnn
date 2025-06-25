% 读取单波段的 TIFF 文件
imageData = imread('zhenzhi.tif');

% 获取图像的大小
[nRows, nCols] = size(imageData);

% 初始化结果矩阵
resultMatrix_output = zeros(nRows * nCols, 6);

% 遍历图像像素，并进行赋值操作
for i = 1:nRows
    for j = 1:nCols
        pixelValue = imageData(i, j);
        
        % 根据像素值进行赋值，确保在 1 到 6 的范围内
        if ~isempty(pixelValue) && pixelValue >= 1 && pixelValue <= 6
            rowIndex = (i - 1) * nCols + j;
            resultMatrix_output(rowIndex, pixelValue) = 1;
        end
    end
end

