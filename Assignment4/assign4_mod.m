order = 4;
filename = "fivewo.wav";
[X,Fs] = audioread(filename);
norm = Fs/2;
value = input('Enter the number of bandpass filters  \n');
[B_l, A_l] = butter(order*2, 240/norm);
noise = rand(1,length(X));
result = zeros(1,length(X));
B = [;];
A = [;];
Y = [;];
Y_e = [;];
Y_el = [;];
r = nthroot(5760/90, value);
for i = 1:value
    [B(i,:), A(i,:)] = butter(order/2, [(90*(r.^(i-1)))/norm, (90*(r.^(i)))/norm]);
    Y(i,:) = filter(B(i,:),A(i,:),X);
    Y_e(i,:) = abs(hilbert(Y(i,:)));
    Y_el(i,:) = filter(B_l, A_l, Y_e(i,:));
    n = filter(B(i,:),A(i,:),noise);
    result = result + n.*Y_el(i,:);
end
result = result';
s1 = 'result';
s2 = '.wav';
r1 = strcat(s1,int2str(value));
r2 = strcat(r1,s2);
audiowrite(r2,result,Fs);


