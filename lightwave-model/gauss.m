function [ p ] = gauss( x, sigma, mu )
%GAUSS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

p = exp(-(x-mu).^2./(2*sigma.^2))./(sigma*sqrt(2*pi));
end

