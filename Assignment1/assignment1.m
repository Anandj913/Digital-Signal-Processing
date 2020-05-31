f = 1000;
fs = 5000;
t1 = 0:1/(10*12000):10/f;
t = 0:1/fs:255/fs; %As maximum samples we are taking is 256
x = 10*cos(2*pi*f*t)+ 6*cos(2*pi*2*f*t) + 2*cos(2*pi*4*f*t);
x1 = 10*cos(2*pi*f*t1)+ 6*cos(2*pi*2*f*t1) + 2*cos(2*pi*4*f*t1);

subplot(3,2,1);
plot(t1,x1);
grid on;
%axis([-6000, 6000, 0, 3]);
title("original signal");
xlabel("Time");
ylabel("Value");
subplot(3,2,2);
plot(t,x);
grid on;
axis([0, 0.01, -10, 20]);
title("Sampled signal at Fs = 8Khz");
xlabel("Time");
ylabel("Value");


N1 = 12;
sn1 = fft(x, N1);
sn1 = fftshift(sn1);
mag1 = abs(sn1);
mag1 = mag1/N1;
interval = fs/N1;
f1 = -fs/2:interval:fs/2 - interval;
subplot(3,2,3);
stem(f1,mag1);
grid on;
%axis([-6000, 6000, 0, 3]);
title("Fs = 8Khz, N = 12");
xlabel("Frequency");
ylabel("|X(f)|/N");

N2 = 64;
sn2 = fft(x, N2);
sn2 = fftshift(sn2);
mag2 = abs(sn2);
mag2 = mag2/N2;
interval = fs/N2;
f2 = -fs/2:interval:fs/2 - interval;
subplot(3,2,4);
stem(f2,mag2);
grid on;
%axis([-6000, 6000, 0, 3]);
title("Fs = 8Khz, N = 64");
xlabel("Frequency");
ylabel("|X(f)|/N");

N3 = 128;
sn3 = fft(x, N3);
sn3 = fftshift(sn3);
mag3 = abs(sn3);
mag3 = mag3/N3;
interval = fs/N3;
f3 = -fs/2:interval:fs/2 - interval;
subplot(3,2,5);
grid on;
stem(f3,mag3);
%axis([-6000, 6000, 0, 3]);
title("Fs = 8Khz, N = 128");
xlabel("Frequency");
ylabel("|X(f)|/N");

N4 = 256;
sn4 = fft(x, N4);
sn4 = fftshift(sn4);
mag4 = abs(sn4);
mag4 = mag4/N4;
interval = fs/N4;
f4 = -fs/2:interval:fs/2 - interval;
subplot(3,2,6);
grid on;
stem(f4,mag4);
%axis([-6000, 6000, 0, 3]);
title("Fs = 8Khz, N = 256");
xlabel("Frequency");
ylabel("|X(f)|/N");