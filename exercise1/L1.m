load("data1.mat")%读取数据
plot(xi,ti,'o','linewidth',2);
hold on;
plot(xi,ti,'-');

%M=1,w=[0.9-1.3]',y=0.9-1.3x
wopt1 = [0.9 ,-1.3];
yw1 = wopt1(1) + wopt1(2)*xi;
error1 = sum((yw1 - ti).^2)/2;

%2)M=1,w=[1.0,-1.6]'
wopt2 = [1.0,-1.6]'
yw2 = wopt2(1) + wopt2(2)*xi;
error2 = sum((yw2 - ti).^2)/2;

%M=2,w=[1.8,-7.0,4.8]'
wopt3 = [1.8,-7.0,4.8]'
yw3 = wopt3(1) + wopt3(2) * xi + wopt3(3) * xi.^2;
error3 = sum((yw3 - ti).^2)/2;

%M=2,w=[2.1,-6.5,5.1]'
wopt4 = [2.1,-6.5,5.1]'
yw4 = wopt4(1) + wopt4(2) * xi + wopt4(3) * xi.^2;
error4 = sum((yw4 - ti).^2)/2;

%M=3,w=[-0.1,12,-40,30]'
wopt5 = [-0.1,12,-40,30]'
yw5 = wopt5(1) + wopt5(2) * xi + wopt5(3) * xi.^2 + wopt5(4) * xi.^3;
error5 = sum((yw5 - ti).^2)/2;

%M=3,w=[0,15,-30,20]'
wopt6 = [0,15,-30,20]'
yw6 = wopt6(1) + wopt6(2) * xi + wopt6(3) * xi.^2 + wopt6(4) * xi.^3;
error6 = sum((yw6 - ti).^2)/2;

%M=4,w=[-1，20，-70，78，-20]’
wopt7 = [-1,20,-70,78,-20]'
yw7 = wopt7(1) + wopt7(2) * xi + wopt7(3) * xi.^2 + wopt7(4) * xi.^3 + wopt7(5) * xi.^4;
error7 = sum((yw7 - ti).^2)/2;

%M=4,w=[-2，22，-68，78，-25]'
wopt8 = [-2,22,-68,78,-25]'
yw8 = wopt8(1) + wopt8(2) * xi + wopt8(3) * xi.^2 + wopt8(4) * xi.^3 + wopt8(5) * xi.^4;
error8 = sum((yw8 - ti).^2)/2;

%M=9,w=[-30，750-6600,30000,-80000,100000,-75000,14000,15000,-6200]'
wopt9 = [-30,750,-6600,30000,-80000,100000,-75000,14000,15000,-6200]'
yw9 = wopt9(1) + wopt9(2) * xi + wopt9(3) * xi.^2 + wopt9(4) * xi.^3 + wopt9(5) * xi.^4 + wopt9(6) * xi.^5 + wopt9(7) * xi.^6 + wopt9(8) * xi.^7 + wopt9(9) * xi.^8 + wopt9(10)* xi.^9;
error9 = sum((yw9 - ti).^2)/2;

%M=9,w=[-40,760,-6000,25000,-70000,110000,-80000,12000,16000,-6600]T
wopt10 = [-40,760,-6000,25000,-70000,110000,-80000,12000,16000,-6600]';
yw10 = wopt10(1) + wopt10(2) * xi + wopt10(3) * xi.^2 + wopt10(4) * xi.^3 + wopt10(5) * xi.^4 + wopt10(6) * xi.^5 + wopt10(7) * xi.^6 + wopt10(8) * xi.^7 + wopt10(9) * xi.^8 + wopt10(10)* xi.^9;
error10 = sum((yw10 - ti).^2)/2;

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
error_min10 = sum((t10 - ti).^2)/2;

%打印
wopt_best1
wopt_best2
wopt_best3
wopt_best4
wopt_best10