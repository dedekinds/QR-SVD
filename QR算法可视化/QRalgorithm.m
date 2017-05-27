%function QRalgorithm()
A=rand(40,40);%任取一个方阵，其可逆概率为1，可以QR分解（满秩
for iter=1:30
surf(A)
title(['迭代次数 ', num2str(iter)]);
picname=[num2str(iter) '.jpg'];%保存的文件名：如i=1时，picname=1.fig
    %hold on % 写后面的字时，不把前面的字冲掉
%saveas(gcf,picname)
saveas(gcf,picname)
[a b]=qr(A);
A=b*a;

end

%%
%下面是合成gif

filename= 'result.gif'; %命名gif文件的名字
%%
%你要输入的参数：（不包括切割，以后要是做GUI的话还是要的）
delaytimeN=0.8;                %动图的间隔时间
typeimg='jpg';                 %图片类型
N=length(dir(['*',typeimg]));  %读取文件个数
%%
%切割图片
%用画图打开图片，吸管工具可以获取图片的某点的像素位置
%假设截取的是长方形，那么左上角的点坐标设为x_1,y_1,右下角的点设为x_2,y_2
%那么下面的图片每个都用B=A(y_1:y_2,x_1:x_2,:)
%%
for i=1:N
    Img=imread([num2str(i),'.',typeimg]);
    figure(i)
    imshow(Img,'Border','tight'); %添加后面两个属性可以去掉灰边，似乎可以通过set(gcf,'color','white')不过这是填充颜色，不是切
    frame=getframe(i);
    im=frame2im(frame);%制作gif文件→必须是index索引图像
    [I,map]=rgb2ind(im,256);
    k=i;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',delaytimeN);%loopcount只是在i==1的时候才有用
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',delaytimeN);%?layTime用于设置gif文件的播放快慢
    end
    close all
end