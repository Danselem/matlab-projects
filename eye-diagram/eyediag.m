function [ eyeplot, ah, ph ] = eyediag( elsig, timew, srate, timeo, varargin )
%EYEDIAG ��ͼ������
%   elsig   ���������ź�
%   timew   ʱ�䴰���
%   srate   �źŲ�����

elsig = elsig(floor(timeo*srate+1):end);
parts = floor(length(elsig)/(timew*srate));
partl = floor(timew*srate);
times = (1:partl)/srate;
eyeplot = reshape(elsig(1:parts*partl), [partl, parts]);
if ~isempty(varargin) && isfloat(varargin{1})
    ah = varargin{1};
    axes(ah);
    hold on;
    ph = plot(ah, times, eyeplot, varargin{2:end});
    hold off;
else
    figure('name','Eye Diagram Analyzer');
    ah = axes();
    ph = plot(ah, times, eyeplot, varargin{2:end});
    title('');
    xlabel('time(s)');
    ylabel('Amplitude');
end
set(ah, 'xlim', minmax(times));
grid(ah, 'on');
end

