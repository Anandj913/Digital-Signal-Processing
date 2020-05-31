f = 1000;
fs = 20000;
t1 = 0:1/(10*fs):10/f;
t = 0:1/fs:10/f;

x1 = square(2*pi*f*t1);
x = square(2*pi*f*t);

subplot(2,2,1);
plot(t1,x1);
grid on;
axis([0, 0.010, -4,4]);
title("original signal");
xlabel("Time");
ylabel("Value");

subplot(2,2,2);
plot(t,x);
grid on;
axis([0, 0.010, -4, 4]);
title("Sampled signal at Fs = 20Khz");
xlabel("Time");
ylabel("Value");


N1 = 128;
sn1 = fft(x, N1);
sn1 = fftshift(sn1);
mag1 = abs(sn1);
mag1 = mag1/N1;
interval = fs/N1;
f1 = -fs/2:interval:fs/2 - interval;
subplot(2,2,3);
plot(f1,mag1);
grid on;
%axis([-6000, 6000, 0, 3]);
title("Fs = 20Khz, N = 128");
xlabel("Frequency");
ylabel("|X(f)|/N");

N2 = 256;
sn2 = fft(x, N2);
sn2 = fftshift(sn2);
mag2 = abs(sn2);
mag2 = mag2/N2;
interval = fs/N2;
f2 = -fs/2:interval:fs/2 - interval;
subplot(2,2,4);
plot(f2,mag2);
grid on;
%axis([-6000, 6000, 0, 3]);
title("Fs = 20Khz, N = 256");
xlabel("Frequency");
ylabel("|X(f)|/N");
