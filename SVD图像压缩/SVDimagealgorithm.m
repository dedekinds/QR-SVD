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
title(['�����ķ�˿ ','(k=',num2str(k),')']);
picname=[num2str(k) '.jpg'];%������ļ�������i=1ʱ��picname=1.fig
    %hold on % д�������ʱ������ǰ����ֳ��
%saveas(gcf,picname)
saveas(gcf,picname)
end


filename= 'result.gif'; %����gif�ļ�������
%%
%��Ҫ����Ĳ��������������и�Ժ�Ҫ����GUI�Ļ�����Ҫ�ģ�
delaytimeN=0.8;                %��ͼ�ļ��ʱ��
typeimg='jpg';                 %ͼƬ����
N=length(dir(['*',typeimg]));  %��ȡ�ļ�����
%%
%�и�ͼƬ
%�û�ͼ��ͼƬ�����ܹ��߿��Ի�ȡͼƬ��ĳ�������λ��
%�����ȡ���ǳ����Σ���ô���Ͻǵĵ�������Ϊx_1,y_1,���½ǵĵ���Ϊx_2,y_2
%��ô�����ͼƬÿ������B=A(y_1:y_2,x_1:x_2,:)
%%
for i=1:2:N
    Img=imread([num2str(i),'.',typeimg]);
    figure(i)
    imshow(Img,'Border','tight'); %��Ӻ����������Կ���ȥ���ұߣ��ƺ�����ͨ��set(gcf,'color','white')�������������ɫ��������
    frame=getframe(i);
    im=frame2im(frame);%����gif�ļ���������index����ͼ��
    [I,map]=rgb2ind(im,256);
    k=i;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',delaytimeN);%loopcountֻ����i==1��ʱ�������
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',delaytimeN);%?layTime��������gif�ļ��Ĳ��ſ���
    end
    close all
end