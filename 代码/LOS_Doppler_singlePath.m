function [ y ] = LOS_Doppler_singlePath( d,fc,v,startT,endT,deltaT )
%LOS_DOPPLER_SINGLEPATH �˴���ʾ�йش˺�����ժҪ
%fc���ز�Ƶ��
%v�������ٶ�
%startT,endT,�ŵ�����Ŀ�ʼʱ�䣬��ֹʱ�䣬ͨ��startT=0,endT=1;

%   �˴���ʾ��ϸ˵��
numT = (endT-startT)/deltaT+1;
t = startT:deltaT:endT;
wc = 2*pi*fc;
c = 300*10^3;%����
wm = wc*(v/c);%��������Ƶ��  
fm = wm/(2*pi);

sigma_u = sqrt(1/2);
alpha=atan(28/(d*1000));%��λ��
wn=wm*cos(alpha);
lambda=c/fc;
phi=(2*pi*d*1000)/(lambda*cos(alpha));%��n��·���ĸ�������
T=sigma_u*(cos(wn*t+phi)+j*sin(wn*t+phi));
y=T; 

end
