x = rand(100,1);
t = rand (100,1);
xbar = mean(x);
tbar = mean(t);

sumXT = 0;
sumX2 = 0;
for i =1:100
    sumXT = sumXT + x(i)*t(i);
    sumX2 = sumX2 + x(i)^2;
end

w1 = (sumXT - 100*xbar*tbar)/(sumX2-100*xbar^2);
w0 = tbar - w1 *xbar;

XX =[ones(100,1),x];
w = inv(XX'*XX)*XX'*t;