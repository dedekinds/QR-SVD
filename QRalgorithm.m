%function QRalgorithm()
A=rand(100,100);
for iter=1:50
[a b]=qr(A)
A=b*a
surf(A)
view(0,90)
title(['�������� ', num2str(iter)]);
picname=[num2str(iter) '.jpg'];%������ļ�������i=1ʱ��picname=1.fig
    %hold on % д�������ʱ������ǰ����ֳ��
%saveas(gcf,picname)
saveas(gcf,picname)
end
