% 读取三个具有相同行列数的单波段 TIFF 文件

imageData1 = imread('yuan1_clcd.tif');
imageData2 = imread('yuan2_glc.tif');
imageData3 = imread('yuan3_lucc.tif');
imageData4 = imread('QD1_citydist.tif');
imageData5 = imread('qd2_dem.tif');
imageData6 = imread('qd3_gradaspect.tif');
imageData7 = imread('qd4_grad.tif');
imageData8 = imread('qd5_ni_li.tif');
imageData9 = imread('qd6_raildist.tif');
% 获取图像的大小
[nRows, nCols] = size(imageData1);

% 初始化结果矩阵
resultMatrix_input= zeros(nRows * nCols, 12);
resultMatrix_input=double(resultMatrix_input);

% 遍历图像像素，并进行赋值操作
for i = 1:nRows
    for j = 1:nCols
        pixelValue1 = imageData1(i, j);
        pixelValue2 = imageData2(i, j);
        pixelValue3 = imageData3(i, j);
        pixelValue4 = imageData4(i, j);
        pixelValue5 = imageData5(i, j);
        pixelValue6 = imageData6(i, j);
        pixelValue7 = imageData7(i, j);
        pixelValue8 = imageData8(i, j);
        pixelValue9 = imageData9(i, j);
        % 根据像素值进行赋值，确保在 1 到 6 的范围内
        if ~isempty(pixelValue1) && pixelValue1 >= 1 && pixelValue1 <= 6
            resultMatrix_input((i-1)*nCols + j, pixelValue1) = resultMatrix_input((i-1)*nCols + j, pixelValue1) + 1;
        end
        
        if ~isempty(pixelValue2) && pixelValue2 >= 1 && pixelValue2 <= 6
            resultMatrix_input((i-1)*nCols + j, pixelValue2) = resultMatrix_input((i-1)*nCols + j, pixelValue2) + 1;
        end
        
        if ~isempty(pixelValue3) && pixelValue3 >= 1 && pixelValue3 <= 6
            resultMatrix_input((i-1)*nCols + j, pixelValue3) = resultMatrix_input((i-1)*nCols + j, pixelValue3) + 1;
        end
        if ~isempty(pixelValue4)
            resultMatrix_input((i-1)*nCols + j, 7) = pixelValue4;
        end
        
        if ~isempty(pixelValue5)
            resultMatrix_input((i-1)*nCols + j, 8) = pixelValue5;
        end
        
        if ~isempty(pixelValue6)
            resultMatrix_input((i-1)*nCols + j, 9) = pixelValue6;
        end
        if ~isempty(pixelValue7)
            resultMatrix_input((i-1)*nCols + j, 10) = pixelValue7;
        end
        
        if ~isempty(pixelValue8)
            resultMatrix_input((i-1)*nCols + j, 11) = pixelValue8;
        end
        
        if ~isempty(pixelValue9)
            resultMatrix_input((i-1)*nCols + j, 12) = pixelValue9;
        end
    end
end
invalidValue = -3.402823466385289e+38;
% % 要替换的无效值或缺失值
[nRows, nCols] = size(resultMatrix_input);
% 
% 遍历图像像素，并进行赋值操作
% for i = 1:nRows
%     for j = 1:nCols
%         if abs(resultMatrix_input(i, j) - invalidValue) < eps
%             resultMatrix_input(i, j) = 0;
%         end
%     end
% end
for i = 1:nRows
    for j = 1:nCols
        if resultMatrix_input(i,j)<-0
            resultMatrix_input(i,j)=0;
        end
    end
end
