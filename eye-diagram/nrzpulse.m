function [ pulse, times ] = nrzpulse( bits, rtime, ftime, brate, srate )
%NRZPLUSE �ǹ���������������
%   bits    �ֽ���������
%   rtime   ������ʱ��
%   ftime   �½���ʱ��
%   brate   ���ʣ�bit rate = bits per second
%   srate   �����ʣ�sample rate = sample length per second

bsl = length(bits);             % �ֽ��볤�ȣ�������
btime = 1/brate;                % һ���ֽ���������ռʱ��
tsl = round(bsl*btime*srate);   % ʱ�����г��ȣ��ܲ�������

% ������������
rside = gaussmf(linspace(-rtime,0,round(srate*rtime)),[rtime/3,0]);
redge = [(rside-rside(1))/(1-rside(1)), ones(1, round((btime-rtime)*srate))];
% �����½�����
fside = gaussmf(linspace(0,ftime,round(srate*ftime)),[ftime/3,0]);
fedge = [(fside-fside(end))/(1-fside(end)), zeros(1, round((btime-ftime)*srate))];
% ����ˮƽ����
hedge = ones(1,round(btime*srate));
% ʱ������
times = linspace(0,bsl*btime, tsl);
% �����ź���
pulse = zeros(1,tsl);

% ��һ�ֽ��뱸��
btmp = 0;
for i = 1:bsl
    % ƴ��������
    if btmp < bits(i)
        pulse(round((i-1)*btime*srate+1):round((i)*btime*srate)) = redge;
    end
    % ƴ���½���
    if btmp > bits(i)
        pulse(round((i-1)*btime*srate+1):round((i)*btime*srate)) = fedge;
    end
    % ƴ��ˮƽ��
    if btmp == bits(i)
        pulse(round((i-1)*btime*srate+1):round((i)*btime*srate)) = hedge*bits(i);
    end
    % �����ֽڱ���
    btmp = bits(i);
end
end

