function [ opsig ] = modulate( elsig, ext )
%MODULATE ���źŵ�����
%   elsig   ����������ź�
%   ext     �����������

k = 10^(ext/10);
% ��ֹ��ĸ����0
if k < eps
    k = eps;
end
opsig = elsig*(k-1)/(k+1)+max(elsig)/(k-1);
end

