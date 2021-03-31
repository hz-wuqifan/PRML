load("data1.mat")%读取数据
load("data2.mat")
plot(xi,ti,'o','linewidth',2);
hold on;
plot(xi,ti,'-');

%拟合
%一阶
X = [ones(10,1),xi];
wopt_best1 = inv(X'*X)*X'*ti;
t1 = wopt_best1(1) + wopt_best1(2)*xi;
plot(xi,t1,'-');
error_min1 = sum((t1 - ti).^2)/2;

%二阶
X = [ones(10,1),xi,xi.^2];
wopt_best2 = inv(X'*X)*X'*ti;
t2 = wopt_best2(1) + wopt_best2(2)*xi+ wopt_best2(3)*xi.^2;
plot(xi,t2,'-');
error_min2 = sum((t2 - ti).^2)/2;

%三阶
X = [ones(10,1),xi,xi.^2,xi.^3];
wopt_best3 = inv(X'*X)*X'*ti;
t3 = wopt_best3(1) + wopt_best3(2)*xi+ wopt_best3(3)*xi.^2 +wopt_best3(4)*xi.^3;
plot(xi,t3,'--');
error_min3 = sum((t3 - ti).^2)/2;

%四阶
X = [ones(10,1),xi,xi.^2,xi.^3,xi.^4];
wopt_best4 = inv(X'*X)*X'*ti;
t4 = wopt_best4(1) + wopt_best4(2)*xi+ wopt_best4(3)*xi.^2 +wopt_best4(4)*xi.^3 + wopt_best4(5) * xi.^4;
plot(xi,t4,'--');
error_min4 = sum((t4 - ti).^2)/2;

%九阶
X = [ones(10,1),xi,xi.^2,xi.^3,xi.^4,xi.^5,xi.^6,xi.^7,xi.^8,xi.^9];
wopt_best10 = inv(X'*X)*X'*ti;
t10 = wopt_best10(1) + wopt_best10(2)*xi+ wopt_best10(3)*xi.^2 +wopt_best10(4)*xi.^3 +wopt_best10(5)*xi.^4+wopt_best10(6)*xi.^5+wopt_best10(7)*xi.^6+wopt_best10(8)*xi.^7+wopt_best10(9)*xi.^8+wopt_best10(10)*xi.^9;
plot(xi,t10,'--','linewidth',3);
error_min10 = sum((t10 - ti).^2);

%数据2均方根误差
yw1 = wopt_best1(1) + wopt_best1(2)*xi2;
erms1 = sqrt(sum((yw1 - ti2).^2)/100);

yw2 = wopt_best2(1) + wopt_best2(2) * xi2 + wopt_best2(3) * xi2.^2;
erms2 = sqrt(sum((yw2 - ti2).^2)/100);

yw3 = wopt_best3(1) + wopt_best3(2) * xi2 + wopt_best3(3) * xi2.^2 + wopt_best3(4) * xi2.^3;
erms3 = sqrt(sum((yw3 - ti2).^2)/100);

yw4 = wopt_best4(1) + wopt_best4(2) * xi2 + wopt_best4(3) * xi2.^2 + wopt_best4(4) * xi2.^3 + wopt_best4(5) * xi2.^4;
erms4 = sqrt(sum((yw4 - ti2).^2)/100);

yw9 = wopt_best10(1) + wopt_best10(2) * xi2 + wopt_best10(3) * xi2.^2 + wopt_best10(4) * xi2.^3 + wopt_best10(5) * xi2.^4 + wopt_best10(6) * xi2.^5 + wopt_best10(7) * xi2.^6 + wopt_best10(8) * xi2.^7 + wopt_best10(9) * xi2.^8 + wopt_best10(10)* xi2.^9;
erms9 = sqrt(sum((yw9 - ti2).^2)/100);

%拟合
%九阶
X = [ones(10,1),xi,xi.^2,xi.^3,xi.^4,xi.^5,xi.^6,xi.^7,xi.^8,xi.^9];
I = eye(10);lamba = 0;
wopt_best_L10 = inv(X'*X+lamba * I)*X'*ti;
tL10 = wopt_best_L10(1) + wopt_best_L10(2)*xi+ wopt_best_L10(3)*xi.^2 +wopt_best_L10(4)*xi.^3 +wopt_best_L10(5)*xi.^4+wopt_best_L10(6)*xi.^5+wopt_best_L10(7)*xi.^6+wopt_best_L10(8)*xi.^7+wopt_best_L10(9)*xi.^8+wopt_best_L10(10)*xi.^9;
error_min_L110 = sum((t10 - ti).^2)*0.5+lamba*wopt_best_L10'*wopt_best_L10;

X = [ones(10,1),xi,xi.^2,xi.^3,xi.^4,xi.^5,xi.^6,xi.^7,xi.^8,xi.^9];
I = eye(10);lamba = exp(-18);
wopt_best_L210 = inv(X'*X+lamba * I)*X'*ti;
wopt_best_L210
tL10 = wopt_best_L210(1) + wopt_best_L210(2)*xi+ wopt_best_L210(3)*xi.^2 +wopt_best_L210(4)*xi.^3 +wopt_best_L210(5)*xi.^4+wopt_best_L210(6)*xi.^5+wopt_best_L210(7)*xi.^6+wopt_best_L210(8)*xi.^7+wopt_best_L210(9)*xi.^8+wopt_best_L210(10)*xi.^9;
error_min_L210 = sum((tL210 - ti).^2)/2+lamba*wopt_best_L210'*wopt_best_L210/2;
error_min_L210N = sum((tL210 - ti).^2)/2;
yw_2_9 = wopt_best_L210(1) + wopt_best_L210(2) * xi2 + wopt_best_L210(3) * xi2.^2 + wopt_best_L210(4) * xi2.^3 + wopt_best_L210(5) * xi2.^4 + wopt_best_L210(6) * xi2.^5 + wopt_best_L210(7) * xi2.^6 + wopt_best_L210(8) * xi2.^7 + wopt_best_L210(9) * xi2.^8 + wopt_best_L210(10)* xi2.^9;
ermsL9 = sqrt(sum((yw_2_9 - ti2).^2)/100);

X = [ones(10,1),xi,xi.^2,xi.^3,xi.^4,xi.^5,xi.^6,xi.^7,xi.^8,xi.^9];
I = eye(10);lamba = 1;
wopt_best_L310 = inv(X'*X+lamba * I)*X'*ti;
wopt_best_L310
tL310 = wopt_best_L310(1) + wopt_best_L310(2)*xi+ wopt_best_L310(3)*xi.^2 +wopt_best_L310(4)*xi.^3 +wopt_best_L310(5)*xi.^4+wopt_best_L310(6)*xi.^5+wopt_best_L310(7)*xi.^6+wopt_best_L310(8)*xi.^7+wopt_best_L310(9)*xi.^8+wopt_best_L310(10)*xi.^9;
error_min_L310 = sum((tL310 - ti).^2)/2+lamba*wopt_best_L310'*wopt_best_L310/2;
error_min_L310N = sum((tL310 - ti).^2)/2;
yw_3_9 = wopt_best_L310(1) + wopt_best_L310(2) * xi2 + wopt_best_L310(3) * xi2.^2 + wopt_best_L310(4) * xi2.^3 + wopt_best_L310(5) * xi2.^4 + wopt_best_L310(6) * xi2.^5 + wopt_best_L310(7) * xi2.^6 + wopt_best_L310(8) * xi2.^7 + wopt_best_L310(9) * xi2.^8 + wopt_best_L310(10)* xi2.^9;
ermsL29 = sqrt(sum((yw_3_9 - ti2).^2)/100);