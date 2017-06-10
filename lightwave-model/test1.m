clear;clc;

r = linspace(0, 2, 100);
o = linspace(0, 2*pi, 100);

x = r'*cos(o);
y = r'*sin(o);
m = input('m(������0-2֮�������)= ');
n = input('n(������1-3֮�������)= ');
z = abs(real(distez(m,n, r, o, 2*pi, 1)));
figure;
surf(x, y, z);
axis equal;
shading interp;
title(['\bfLP_' num2str(m) '_' num2str(n)], 'fontsize', 16);

% for m=0:2
%     for n=1:3
%         z = abs(real(distez(m,n, r, o, 2*pi, 1)));
%         subplot(3,3,m*3+n);
%         surf(x, y, z);
%         view(0,90);
%         shading interp;
%         axis equal;
%         title(['\bfLP_' num2str(m) '_' num2str(n)], 'fontsize', 14);
%     end
% end
