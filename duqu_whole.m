% 读取三个具有相同行列数的单波段 TIFF 文件

imageData11 = imread('whole_CLCD.tif');
imageData12 = imread('whole_GLC.tif');
imageData13 = imread('whole_LUCC.tif');
imageData14 = imread('QD1.tif');
imageData15 = imread('QD2.tif');
imageData16 = imread('QD3.tif');
imageData17 = imread('QD4.tif');
imageData18 = imread('QD5.tif');
imageData19 = imread('QD6.tif');
% 获取图像的大小
[nRows1, nCols1] = size(imageData11);

% 初始化结果矩阵
resultMatrix_wholeinput= zeros(nRows1 * nCols1, 12);
resultMatrix_wholeinput=double(resultMatrix_wholeinput);

% 遍历图像像素，并进行赋值操作
for i = 1:nRows1
    for j = 1:nCols1
        pixelValue11 = imageData11(i, j);
        pixelValue12 = imageData12(i, j);
        pixelValue13 = imageData13(i, j);
        pixelValue14 = imageData14(i, j);
        pixelValue15 = imageData15(i, j);
        pixelValue16 = imageData16(i, j);
        pixelValue17 = imageData17(i, j);
        pixelValue18 = imageData18(i, j);
        pixelValue19 = imageData19(i, j);
        % 根据像素值进行赋值，确保在 1 到 6 的范围内
        if ~isempty(pixelValue11) && pixelValue11 >= 1 && pixelValue11 <= 6
            resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue11) = resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue11) + 1;
        end
        
        if ~isempty(pixelValue12) && pixelValue12 >= 1 && pixelValue12 <= 6
            resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue12) = resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue12) + 1;
        end
        
        if ~isempty(pixelValue13) && pixelValue13 >= 1 && pixelValue13 <= 6
            resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue13) = resultMatrix_wholeinput((i-1)*nCols1 + j, pixelValue13) + 1;
        end
        if ~isempty(pixelValue14)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 7) = pixelValue14;
        end
        
        if ~isempty(pixelValue15)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 8) = pixelValue15;
        end
        
        if ~isempty(pixelValue16)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 9) = pixelValue16;
        end
        if ~isempty(pixelValue17)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 10) = pixelValue17;
        end
        
        if ~isempty(pixelValue18)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 11) = pixelValue18;
        end
        
        if ~isempty(pixelValue19)
            resultMatrix_wholeinput((i-1)*nCols1 + j, 12) = pixelValue19;
        end
    end
end
invalidValue = -3.402823466385289e+38;
% % 要替换的无效值或缺失值
[nRows1, nCols1] = size(resultMatrix_wholeinput);
% 
% 遍历图像像素，并进行赋值操作
% for i = 1:nRows
%     for j = 1:nCols
%         if abs(resultMatrix_input(i, j) - invalidValue) < eps
%             resultMatrix_input(i, j) = 0;
%         end
%     end
% end
for i = 1:nRows1
    for j = 1:nCols1
        if resultMatrix_wholeinput(i,j)<-0
            resultMatrix_wholeinput(i,j)=0;
        end
    end
end
