function [ ah, ph, spec ] = opspec( opsig, srate, varargin )
%OPSPEC ��ѧƵ�׷�����
%   opsig   ��ѧ�ź�
%   srate   �źŲ�����
%   [h]     ��ͼ���

N = length(opsig);
fs = (0:N-1)*srate/N-srate/2;
opsig_fft = fftshift(fft(opsig,N));
opsig_abs = abs(opsig_fft);
opsigs = 2*opsig_abs/N;
if ~isempty(varargin) && isfloat(varargin{1})
    ah = varargin{1};
    axes(ah);
    hold on;
    ph = plot(ah, fs, opsigs, varargin{2:end});
    hold off;
else
    figure('name','Optical Spectrum Analyzer');
    ah = axes();
    ph = plot(ah, fs, opsigs, varargin{2:end});
    title('');
    xlabel('Frequency(Hz)');
    ylabel('Power(dBm)');
end
set(ah, 'xlim', minmax(fs));
grid(ah, 'on');
spec = opsig_abs;
end