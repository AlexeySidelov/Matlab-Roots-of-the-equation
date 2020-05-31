clear
a=-3; b=3;
m=100; x=linspace(a,b,m);
f='sin(exp(x))';
plot(x,eval(f),x,0*x,':'); grid on
xlabel('X'); ylabel('Y');
z=ginput(1);
[zr,fr]=fzero(f,z(1))
hold on
plot(zr,fr,'r*',z(1),z(2),'g*')
hold off