function [ bits ] = bitseq( nb )
%BITSEQ ����ֽ���������
%   nb      �ֽ������г���
%   bits    �������ɵ�ָ�����ȵ�����ֽ���

bits = 1e3*(randi(2, 1, nb) - 1);
end

