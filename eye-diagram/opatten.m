function [ asig ] = opatten( opsig, atten )
%OPATTEN ��˥����
%   opsig   ������ź�
%   atten   ��˥���ȣ�dB��
%   asig    ����˥����Ĺ��ź�

asig = opsig*10^(-atten/10);
end

