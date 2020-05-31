N = 8;
k = (N-1)/2;
k = floor(k);
n = 0:1:(N-1);
Wc = 0.25;
w = -pi:1/1000:pi;

rec_win =  ones(1,length(n));
tri_win = 1-2*(n-(N-1)/2)/(N-1);
hann_win = 0.5 - 0.5*cos(2*pi*n/(N-1));
hamm_win = 0.54 - 0.46*cos(2*pi*n/(N-1));
black_win = 0.42 - 0.5*cos(2*pi*n/(N-1))+ 0.08*cos(4*pi*n/(N-1));

hd =  ones(1,length(n));
for m=1:N
    if(m == k)
        hd(m) = Wc/pi;
    else
        hd(m) = (sin(Wc*(m -k)))/(pi*(m-k));
    end
end

h_r = ones(1,length(n));
h_t = ones(1,length(n));
h_hn = ones(1,length(n));
h_hm =  ones(1,length(n));
h_b = ones(1,length(n));

for m =1:N
    h_r(m)= hd(m)*rec_win(m);
    h_t(m)= hd(m)*tri_win(m);
    h_hn(m)= hd(m)*hann_win(m);
    h_hm(m)= hd(m)*hamm_win(m);
    h_b(m)= hd(m)*black_win(m);
end

f_pass = 6000*0.1*Wc;
f_stop = 6000*1.5*Wc;
t = 0:1/6000:3*N/(6000);
feq = -1:2/(3*N):1-2/(3*N);
noise = rand(1,3*N+1);
x_n = 5*cos(2*pi*f_pass*t) + 5*cos(2*pi*f_stop*t);
noise_nor = (max(x_n)/10)*noise/abs(max(noise));
x_with_noise = noise_nor + x_n;


Y_rec = filtfilt(h_r,1,x_with_noise);
Y_tri = filtfilt(h_t,1,x_with_noise);
Y_hann = filtfilt(h_hn,1,x_with_noise);
Y_hamm = filtfilt(h_hm,1,x_with_noise);
Y_black = filtfilt(h_b,1,x_with_noise);

subplot(2,2,1);
plot(t,x_with_noise);
title("Original Signal with noise N=8");
axis([0 0.05 -10, 10]);
xlabel("Time");
ylabel("Magnitude");

subplot(2,2,2);
plot(t,Y_rec);
axis([0 0.05 -10, 10]);
title("Filtered output for rectangular window");
xlabel("Time");
ylabel("Magnitude");

subplot(2,2,3);
x_frq = fftshift(abs(fft(x_with_noise,3*N)))/3*N;

plot(feq, 20*log10(x_frq));
grid on;
title("Original Frequency domain signal");
xlabel("frequency");
ylabel("Magnitude in db");


subplot(2,2,4);
y_frq = fftshift(abs(fft(Y_rec,3*N)))/3*N;

plot(feq, 20*log10(y_frq));
grid on;
title("Frequency domain of filtered signal for rectangular window");
xlabel("frequency");
ylabel("Magnitude in db");







