%function SVDimagealgorithm()
clear
I=imread('test.jpg');
R=double(I(:,:,1));
G=double(I(:,:,2));
B=double(I(:,:,3));
[Ru,Rz,Rv]=svd(R);
[Gu,Gz,Gv]=svd(G);
[Bu,Bz,Bv]=svd(B);
for k=1:2:25
R_new=Ru(:,1:k)*Rz(1:k,1:k)*Rv(:,1:k)';
G_new=Gu(:,1:k)*Gz(1:k,1:k)*Gv(:,1:k)';
B_new=Bu(:,1:k)*Bz(1:k,1:k)*Bv(:,1:k)';
I_new=cat(3,R_new,G_new,B_new);
imshow(uint8(I_new))
title(['真正的粉丝 ','(k=',num2str(k),')']);
picname=[num2str(k) '.jpg'];%保存的文件名：如i=1时，picname=1.fig
    %hold on % 写后面的字时，不把前面的字冲掉
%saveas(gcf,picname)
saveas(gcf,picname)
end


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
for i=1:2:N
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