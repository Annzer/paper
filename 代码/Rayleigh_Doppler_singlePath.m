function [ y ] = Rayleigh_Doppler_singlePath( fc,v,startT,endT,deltaT )
%RAYLEIGH_DOPPLER_SINGLEPATH �˴���ʾ�йش˺�����ժҪ
%fc���ز�Ƶ��
%v�������ٶ�
%startT,endT,�ŵ�����Ŀ�ʼʱ�䣬��ֹʱ�䣬ͨ��startT=0,endT=1;
%   �˴���ʾ��ϸ˵��
%numT = (endT-startT)/deltaT+1;
t=startT:deltaT:endT;
wc=2*pi*fc;%�ز�
c=300*10^3;%����
wm=wc*(v/c);%��������Ƶ��
fm=wm/(2*pi);
N0=100;%���䲨��Ŀ
N=4*N0;
sigma_u=sqrt(1/2);%��һ������ϵ��
Tc=zeros(1,length(startT:deltaT:endT));
Ts=zeros(1,length(startT:deltaT:endT));
T=zeros(1,length(startT:deltaT:endT));

%b,c,d������[-0.5,0.5)�����1�е��������
b=rand(1,1)-0.5*ones(1,1);
c=rand(1,length(startT:deltaT:endT))-0.5*ones(1,length(startT:deltaT:endT));
d=rand(1,length(startT:deltaT:endT))-0.5*ones(1,length(startT:deltaT:endT));

theta=2*pi*b;%����һ�����·��

%ÿ�����ز��������λ
phi=2*pi*c;
ipsi=2*pi*d;

for i=1:N0
    alpha(i)=((2*i-1)*pi+theta)/N;%��i�����䲨�������
    wn(i)=wm*cos(alpha(i));%��n��·���Ķ�����Ƶ��
    Tc=Tc+(2*cos(wn(i)*t+phi(i))*cos(ipsi(i)));
    Ts=Ts+(2*cos(wn(i)*t+phi(i))*sin(ipsi(i)));
    
end
  T=(sigma_u*(1/N0^0.5)).*(Tc+j*Ts);%�õ������ź�
 
  y=T(:);
end
