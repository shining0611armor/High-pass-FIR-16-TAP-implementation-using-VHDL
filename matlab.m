
nf=512;% number of total samples
f1=15; % frequency of signal x1 ia 15 Hz.
f2=30; %Hz
f3=70; %Hz
fc=25; % Hz cut of frequency 
fs=500; %Hz, sampling frequency
k=1:nf;
x1(k)=sin(2*pi*f1*k/fs);
x2(k)=cos(2*pi*f2*k/fs);
x3(k)=sin(2*pi*f3*k/fs);
xt=x1+x2+x3;  % test signal
xf=fft(xt,nf);
xf2=fftshift(xf); % frequency representation of xt

kf1=(-nf/2:(nf/2)-1)*fs/nf; % range of horizental axis from -fs/2 to +fs/2

figure;
subplot(3,2,1)
plot(x1);% plot x1
title(['x1:',num2str(f1),'Hz',]);
subplot(3,2,2)
plot(x2);% plot  x2
title(['x2:',num2str(f2),'Hz',]);
subplot(3,2,3)
plot(x3);% plot  x3
title(['x3:',num2str(f3),'Hz',]);
subplot(3,2,4)
plot(xt);%plot  xt
title('xt:');
subplot(3,2,5)
plot(kf1,abs(xf));%plot xf
title('fft');
subplot(3,2,6)
plot(kf1,abs(xf2));%plot  xf2
title('fftshift');

b16=Num;
 % import  filter coefficeints b16 from designed filter in fdatool
 xc_b16=conv(b16,xt);% convolution the filter with input signal
xf_b16=fftshift(fft(xc_b16,nf));% the output of filter is conversted to frequency domian
%binary=de2bi(Num);

figure;
subplot(2,2,1)
plot(xt)% plot the input signal in time domain
title('xt before filtering');
subplot(2,2,2)
plot(kf1,abs(xf2));% plot the  input signal in frequency domain
title('xf before filtering');
subplot(2,2,3)
plot(xc_b16); % plot the output filter in time domain
title('xt after filtering');
subplot(2,2,4)
plot(kf1,abs(xf_b16));% plot the output filter in frequency domain
title('xf after filtering');




 xt_256=fix(127/(max(abs(xt))).*xt);%8 bit representation of samples
 xt_256_t=xt_256';

 
 b16_1024=fix(511/max(abs(b16)).*b16); %10 bit representation of filter coefficients
 b16_256_t=b16_1024'; % column vector of b16_256

 
xc_b16_256=conv(b16_1024,xt_256);
xf_b16_256=fftshift(fft((xc_b16_256.*max(abs(b16))*max(abs(xt))/(127*127)),nf));



xf_y=fftshift(fft((y.*max(abs(b16))*max(abs(xt))/(127*127)),nf));


figure;
plot(kf1, abs(xf_b16_256));
title('xf-b16-256');


figure
plot(kf1,abs(xf_b16))
hold on
plot(kf1, abs(xf_b16_256),'r')
hold on
plot(kf1, abs(xf_y),'g')





