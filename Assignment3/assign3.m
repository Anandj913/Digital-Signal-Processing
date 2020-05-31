L =1000;
wc = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
h_n = [;];
k = 1:L;
y_n = [;];
H=[;];
W=[;];
power = [];
t = 0:511;
for i=1:8
    temp = [];
    temp = cos(wc(i)*k);
    h_n(i,:)= temp;
end
value = input('Enter the number you want to send \n', 's');
x_n = gen_signal(value,L);

fprintf('\nProcessing convolution with 8 filters\n');
for i=1:8
    y_n(i,:) = conv(x_n,h_n(i,:));
end
for i =1:8
    [H(i,:), W(i,:)] = freqz(y_n(i,:), 1024);
    H(i,:) = abs(H(i,:));
end
plot(t,H(1,:),'b',t,H(2,:),'g',t,H(3,:),'r',t,H(4,:),'c',t,H(5,:),'m',t,H(6,:),'y',t,H(7,:),'k',t,H(8,:),'o' );
ylim([0,250]);
fprintf('\nProcessing power of signal\n');
for i=1:8
    power(i) = rms(y_n(i,:))^2;
end

power

fprintf('\nDecoding the value\n');
[max,I] = maxk(power,2);
I = sort(I);
result = decode(I);
fprintf('\nEntered value is: %s\n',result);