mean = 0;
sigma = 5;
N= 128;
noise= sigma.*randn(N,1) + mean;
b = 1;
a = [1, -0.9, 0.8, -0.729];
X = filter(b,a,noise);
[h, w] = freqz(b,a,128);
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
subplot(1,2,1);
l1 =  (abs(h).^2).*sigma^2;
l2 = flip(l1);
l = [l2' l1'];
plot(-length(abs(h)):length(abs(h))-1,l);
title("Known PSD using H(f)");
subplot(1,2,2);
l2_new =  (abs(h_new).^2).*sigma_new;
l1_new = flip(l2_new);
l_new = [l2_new' l1_new'];
plot(-length(abs(h_new)):length(abs(h_new))-1,l);
title("Estimated PSD");









