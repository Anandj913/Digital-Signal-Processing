f = 1000;
fs = 12000;
fs2 = 24000;
t1 = 0:1/(10*12000):10/f;
t = 0:1/fs:10/f;
t_HIGH = 0:1/fs2:255/fs2;
x_sample_12 = 10*cos(2*pi*5*f*t) + 4*cos(2*pi*4*f*t) + 1*cos(2*pi*2*f*t);
x_original = 10*cos(2*pi*5*f*t1) + 4*cos(2*pi*4*f*t1) + 1*cos(2*pi*2*f*t1);
x_high = 10*cos(2*pi*5*f*t_HIGH) + 4*cos(2*pi*4*f*t_HIGH) + 1*cos(2*pi*2*f*t_HIGH);
subplot(3,2,1)
plot(t1,x_original);
title("Original signal");
%axis([0,0.01,-4,4]);
xlabel("Time");
ylabel("Magnitude");

subplot(3,2,2);
plot(t,x_sample_12);
axis([0,0.01,-15,15]);
title("Sampled signal at 12kHz");
%axis([0,0.01,-4,4]);
xlabel("Time");
ylabel("Magnitude");

subplot(3,2,3);
stem(t,x_sample_12);
axis([0,0.01,-15,15]);
title("Sampled signal at 12kHz");
%axis([0,0.01,-4,4]);
xlabel("Time");
ylabel("Magnitude");

ypad = [x_sample_12;zeros(size(x_sample_12))];
interpolated = ypad(1:end-1);
subplot(3,2,4);
inter_t = 0:1/fs:20/f;
stem(inter_t,interpolated);
title("Interpolated signal");
%axis([0,0.01,-4,4]);
xlabel("Time");
ylabel("Magnitude");


[b,a] = cheby1(20, 10, [0.5], 'low');
x_lowpass = filter(b,a,interpolated);
subplot(3,2,5);
plot(inter_t,x_lowpass);
title("Output of low pass filter");
%axis([0,0.01,-4,4]);
xlabel("Time");
ylabel("Magnitude");

subplot(3,2,6);
plot(t_HIGH, x_high);
title("Sampled signal at 24kHz");
axis([0,0.004,-10,10]);
xlabel("Time");
ylabel("Magnitude");

