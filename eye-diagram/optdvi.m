function [ ah, ph ] = optdvi( opsig, srate, varargin )
%OPTDVI ��ѧʱ���ź���ʾ��
%   opsig   ��ѧ�ź�
%   srate   �źŲ�����
%   [h]     ��ͼ���

N = length(opsig);
ts = (0:N-1)/srate;
if ~isempty(varargin) && isfloat(varargin{1})
    ah = varargin{1};
    axes(ah);
    hold on;
    ph = plot(ah, ts, opsig, varargin{2:end});
    hold off;
else
    figure('name','Optical Time Domain Visualizer');
    ah = axes();
    ph = plot(ah, ts, opsig, varargin{2:end});
    title('');
    xlabel('Time(s)');
    ylabel('Power(w)');
end
set(ah, 'xlim', minmax(ts));
grid(ah, 'on');
end

