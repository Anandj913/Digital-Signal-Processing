mean = 0;
sigma = 5;
N= 128;
noise= sigma.*randn(N,1) + mean;
b = [1, -0.5, 0.7];
a = [1, -0.9, 0.8, -0.729];
X = filter(b,a,noise);
L = 8;
M = 16;
D = 0;
X_div = [;];
for i=1:L
    X_div(i,:) = X((1+(i-1)*M):(M + (i-1)*M));
end
n = 0:1:(M-1);
hamm_win = 0.54 - 0.46*cos(2*pi*n/(M-1));
U = sumsqr(hamm_win)/M;
P_n = [;];
for i=1:L
    P_n(i,:) = X_div(i,:).*hamm_win;
end
f = -0.5:0.01:0.5;
COS = 0;
SIN = 0;
P_f = zeros(L, length(f));
for j = 1:L
    for F = 1:length(f)
        COS = 0;
        SIN = 0;
        for i = 1:M
            COS = COS + cos(2*pi*f(F)*i)*P_n(j,i);
            SIN = SIN + sin(2*pi*f(F)*i)*P_n(j,i);
        end
        P_f(j,F) = (COS^2 + SIN^2)/(M*U);
    end
end
Pw_f = zeros(L,length(P_f(1,:)));
for i = 1:L
    Pw_f = Pw_f + P_f(i,:);
end
Pw_f = Pw_f./L;
[h, w] = freqz(b,a,128);
%----------------parametric_method------------
p = 6;
r = zeros(p+1);
for i = 0:p
    for j = 1:(N-i)
        r(i+1) = r(i+1) + X(j)*X(j+i);
    end
    r(i+1)= r(i+1)/N;
end
mat = zeros(p,p);
mat2 = zeros(1,p);
for i = 1:p
    mat2(1,i) = r(i+1);
end
for i = 1:p
    for j = 1:p
        mat(i,j) = r(abs(i-j)+1);
    end
end
mat_inv = inv(mat);
coff_a = mat2*mat_inv;
coff_a = coff_a';
sigma_new = 0;
for i=1:p
    sigma_new = sigma_new + coff_a(i,1)*r(i+1);
end
sigma_new = sigma_new + r(1);
b_new = 1;
a_new = ones(p+1);
for i=1:p
    a_new(i+1) = coff_a(i);
end
[h_new, w_new] = freqz(b_new,a_new(:,1),128);
%------------------plotting results-----------------
subplot(3,1,1);
l1 =(abs(h).^2).*sigma^2;
l2 = flip(l1);
l = [l2' l1'];
plot(-length(abs(h)):length(abs(h))-1,l);
title("Known PSD using H(f)");
subplot(3,1,2);
plot(1:length(Pw_f), Pw_f);
title("Estimated PSD using Welch Non-parametric method");
subplot(3,1,3);
l2_new =  (abs(h_new).^2).*sigma_new;
l1_new = flip(l2_new);
l_new = [l2_new' l1_new'];
plot(-length(abs(h_new)):length(abs(h_new))-1,l);
title("Estimated PSD using parametric method");









