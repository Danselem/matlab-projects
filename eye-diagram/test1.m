clear;clc;
% ������������������ͼ����

% ����ȫ�ֱ���
brate = 1e10;       % ����
btime = 1/brate;    % ��������ʱ��
srate = 128*brate;  % ������
rtime = 0.05*btime; % ������ʱ��
ftime = 0.05*btime; % �½���ʱ��
blen = 256;         % �ֽ������г���

%% �ⷢ���
% ����ֽ�������������������ֽ�������
bits = bitseq(blen);
% �ǹ��������������������ɷǹ����������
[pulse, times] = nrzpulse(bits, rtime, ftime, brate, srate);
% ���ʱ����ӻ��Ǳ�
ht0 = optdvi(pulse, srate, '', 'r');
legend(ht0,{'����ԭʼ�ź�'});
title(ht0,'ԭʼ�ź�ʱ��ͼ');
% ���Ƶ����ӻ��Ǳ�
hf0 = opspec(pulse, srate, '', 'b');
legend(hf0,{'����ԭʼ�ź�'});
title(hf0,'ԭʼ�ź�Ƶ��ͼ');
% optdvi(pulse,srate,subplot(121),'r');
% opspec(pulse,srate,subplot(122),'b');
% ����������ɵ��������ɹ����壬���������
pulse_optic = modulate(pulse, 30);

%% ����ջ�
% ��˥������ģ����˴�������˥��
pulse_atten = opatten(pulse_optic, 30);
% �����̽ͷ�����������������������Ͱ�����������
[pulse_noise, noise_sig] = noisegen(pulse_atten, 0.3, 0.2);

% ���ʱ����ӻ��Ǳ�
ht1 = optdvi(pulse_noise, srate, '', 'b');
optdvi(noise_sig, srate, ht1, 'y');
optdvi(pulse_atten, srate, ht1, 'r');
legend(ht1,{'����ԭʼ�ź�','����ԭʼ�ź�','����ԭʼ�ź�'});
title(ht1,'��������ʱ��ͼ');
% ���Ƶ����ӻ��Ǳ�
hf1 = opspec(pulse_noise, srate, '', 'b');
opspec(noise_sig, srate, hf1, 'y');
opspec(pulse_atten, srate, hf1, 'r');
legend(hf1,{'����ԭʼ�ź�','����ԭʼ�ź�','����ԭʼ�ź�'});
title(hf1,'��������Ƶ��ͼ');

% ��˹��ͨ�˲��������˴󲿷�����
[pulse_low,~,~,gauss_lf,fset] = gausslpf(pulse_atten, 0.75*brate, srate);
noise_low = gausslpf(noise_sig, 0.75*brate, srate);
pulse_noise_low = gausslpf(pulse_noise, 0.75*brate, srate);

% ���ʱ����ӻ��Ǳ�
ht2 = optdvi(pulse_noise, srate, '', 'color',[0 0.8 0.6]);
optdvi(noise_low, srate, ht2, 'color',[1 0.8 0]);
optdvi(pulse_noise_low, srate, ht2, 'b');
optdvi(pulse_low, srate, ht2, 'color',[1 0 1]);
optdvi(pulse_atten, srate, ht2, 'r');
legend(ht2,{'����ԭʼ�ź�','������ͨ�ź�','���ӵ�ͨ�ź�','�����ͨ�ź�','����ԭʼ�ź�'});
title(ht2,'��ͨ����ʱ��ͼ');
% ���Ƶ����ӻ��Ǳ�
hf2 = opspec(pulse_noise, srate, '', 'color',[0 1 1]);
opspec(pulse_atten, srate, hf2, 'y');
opspec(pulse_low, srate, hf2, 'r');
opspec(noise_low, srate, hf2, 'g');
opspec(pulse_noise_low, srate, hf2, 'b');
% ������Ƹ�˹�˲�����
hold on;plot(hf2,fset,gauss_lf,'color',[1 0 1]);hold off;
legend(hf2,{'����ԭʼ�ź�','����ԭʼ�ź�','�����ͨ�ź�','������ͨ�ź�','���ӵ�ͨ�ź�','��˹��������'});
title(hf2,'��ͨ����Ƶ��ͼ');
% ��ͼ�����ǣ�������ͼ
[eyeplot, heye] = eyediag(pulse_noise_low,2*btime,srate,0.5*btime,'','k');
title(heye,'�����ź���ͼ');