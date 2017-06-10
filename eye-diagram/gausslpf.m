function [ pulselp, pulse_fft, pulse_fft_lf, gauss_lf, fset ] = gausslpf( pulse, cfreq, srate )
%GAUSSLPF ��˹��ͨ�˲���
%   �˴���ʾ��ϸ˵��

plen = length(pulse);
N = 2^nextpow2(plen);
n = 0:N-1;
% ��ȡ��ʵƵ�����䣬������Ƶ�����Ƶ��м�
fset = n*srate/N-srate/2;
pulse_fft = fftshift(fft(pulse,N));
% ���ɸ�˹��ͨ������
gauss_lf = gaussmf(fset, [cfreq/sqrt(2*log(2)),0]);
% Ƶ���˲�
pulse_fft_lf = pulse_fft.*gauss_lf;
% ��ԭ��ʱ���ź�
pulselp = ifft(fftshift(pulse_fft_lf),N);
pulselp = pulselp(1:plen);
end

