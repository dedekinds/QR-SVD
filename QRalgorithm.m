%function QRalgorithm()
A=rand(100,100);
for iter=1:50
[a b]=qr(A)
A=b*a
surf(A)
view(0,90)
title(['迭代次数 ', num2str(iter)]);
picname=[num2str(iter) '.jpg'];%保存的文件名：如i=1时，picname=1.fig
    %hold on % 写后面的字时，不把前面的字冲掉
%saveas(gcf,picname)
saveas(gcf,picname)
end
