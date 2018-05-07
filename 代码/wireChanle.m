function [ ] = wireChanle(d,fc,v,delayTime,averagePower,choice,handles)


startT=0;
endT=5;
deltaT=1/10000;
t=startT:deltaT:endT;
wc=2*pi*fc;
c=3*10^8; %����
wm=wc*(v/c); %������������
fm=wm/(2*pi); %��������Ƶ��

averagePower=10.^(averagePower/10); %����ת����λ
averagePower=averagePower/sum(averagePower);
Np=length(delayTime);
for n=1:1:Np;
lenT(n)=length(startT+delayTime(n)*10^-6:deltaT:endT);
end
R0=zeros(Np,min(lenT));
R1=sqrt(averagePower(1))*LOS_Doppler_singlePath(d,fc,v,startT+delayTime(1)*10^-6,endT,deltaT);%����LOS�����յ����ŵ�ģ��

R0(1,1:min(lenT))=R1(1,1:min(lenT));

for n=2:1:Np
tempr=sqrt(averagePower(n))*Rayleigh_Doppler_singlePath(fc,v,startT+delayTime(n)*10^-6,endT,deltaT);%�������������յ����ŵ�ģ��
R0(n,:)=tempr(1:min(lenT));
clear tempr;
if choice==1
 t1=0:0.01:1;
axes(handles.axes1);

T = Rayleigh_Doppler_singlePath( fc,v,0,1,0.01 );
plot(t1,10*log10(T));
xlabel('ʱ��[ms]');
ylabel('���յ����ź�[dBm]');
title('�����ŵ�����');
end
R_LOS=(20000*R0(1,:)).*Pathloss(2140,d,0,2); %LOS�����յ����ŵ�����·�����(������Ӱ˥��)ģ�ͣ������Pathloss��������

R_NLOS=(20000*sum(R0(2:Np,:))).*Pathloss(2140,d,0,2); %�ྶ����˥���ŵ�����·�����(������Ӱ˥��)ģ�ͣ������Pathloss��������
if choice==2
 axes(handles.axes1);

plot(t(1:min(lenT)),10*log10(R_NLOS));
xlabel('ʱ��[ms]');
ylabel('���յ����ź�[dBm]');
title('�ྶ����˥���ŵ�����·�����');

end
% %+++++++++++++++++++++++++++++++++++
R=R_NLOS+R_LOS; %�����ŵ���LOS+�ྶ����˥��+���+��Ӱ˥�䣩
R=awgn(R,20);
%
% %+++++++++++++++++++++++++++++++++++
if choice==3
 axes(handles.axes1);
plot(t(1:min(lenT)),10*log10(R));
xlim([0 0.05])
title('�����ŵ���LOS+�ྶ����˥��+���+��Ӱ˥�䣩d=10Km v=10m/s,fc=900MHZ');
ylabel('�����ź�ǿ��[dBm]');
xlabel('ʱ��[ms]');
grid on
end


end

