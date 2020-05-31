N = 512;
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

[H,W]= freqz(h_r,1,w);
figure
plot(W,20*log10(abs(H)));
title("Frequency response for N=512, window = Rectangular ");
xlabel("Frequency");
ylabel("Magnitude in dB");


[H,W]= freqz(h_t,1,w);
figure
plot(W,20*log10(abs(H)));
title("Frequency response for N=512, window = Triangular");
xlabel("Frequency");
ylabel("Magnitude in dB");

[H,W]= freqz(h_hn,1,w);
figure
plot(W,20*log10(abs(H)));
title("Frequency response for N=512, window = Hanning ");
xlabel("Frequency");
ylabel("Magnitude in dB");

[H,W]= freqz(h_hm,1,w);
figure
plot(W,20*log10(abs(H)));
title("Frequency response for N=512, window = Hamming");
xlabel("Frequency");
ylabel("Magnitude in dB");

[H,W]= freqz(h_b,1,w);
figure
plot(W,20*log10(abs(H)));
title("Frequency response for N=512, window = Blackmnan ");
xlabel("Frequency");
ylabel("Magnitude in dB");



