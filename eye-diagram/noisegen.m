function [ pulse_noise,  noise_sig ] = noisegen( pulse, a, b )
%NOISE ���ź���ӳ��Ժͼ�������
%   a   ��������ϵ��
%   b   ��������ϵ��
%   pulse_niose     �������������Ĺ�����
%   noise_sig       ������ӵ������ź�

N = length(pulse);
% ���ɳ��Ժͼ�������
% noise_sig = a*pluse.*(rand(1,N)-0.5)+b*(rand(1,N)-0.5);
noise_sig = a*pulse.*randn(1,N)+b*(rand(1,N)-0.5);
pulse_noise = pulse + noise_sig;
end

