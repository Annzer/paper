function y=Pathloss(fc,d,flag_PL,sigmal1)
Heff=30; %��վ���ߵ���Ч�߶�
Hms=2; %�ƶ�̨�߶�
diffn=0;
C_loss=0;
k1=160.43; %�ؾ�
k2=38.72;%б��
k3=0;%�ƶ�̨���ߵĸ߶�����
k4=0;%�ƶ�̨���߸߶� Okumura-Hata ��ֵϵ��
k5=-13.82;%��վ������Ч�߶�����
k6=-6.55;%lg��Heff��lg��d���� Okumura-Hata ��ֵϵ��
k7=0;%����������ֵϵ��
%sigma11=3; %��Ӱ˥��ı�׼��
if flag_PL==0 %��flag=0 ʹ�� COST231-Hata ���ģ�ͣ�ͨ�÷���ģ�ʹ��棩
    PL1=k1+k2*log10(d)+k3*Hms+k4*log10(Hms)+k5*log10(Heff)+k6*log10(Heff)*log10(d)+k7*diffn+C_loss;
    yinying=10*log10(lognrnd(0,sigmal1));%��Ӱ˥����Ӷ�����̫�ֲ�
    PL=PL1+yinying;
elseif flag_PL==1 %��flag=1ʹ�����ɿռ����ģ��
    PL1=32.45+20*log10(d)+20*log10(fc);
    yinying=10*log10(lognrnd(0,sigmal1));%��Ӱ˥����Ӷ�����̫�ֲ�
    PL=PL1+yinying;
end
y=10^((-1)*PL/10);
end

