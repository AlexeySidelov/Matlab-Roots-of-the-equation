clear
a=0; b=7;
m=50; x=linspace(a,b,m);
h=0.001; iter=5; eps=0.001;
f=@(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
y=f(x);
plot(x,f(x),x,0*x,':'); grid on;
xlabel('X'); ylabel('Y');
hold on
y_min=min(y); y_max=max(y);
if y_min<0 y_min=1.1*y_min; else y_min=0.9*y_min; end;
if y_max>0 y_max=1.1*y_max; else y_max=0.9*y_max; end;
y_lim=([y_min,y_max]);
z=ginput(1);
x1=z(1);
for i=1:iter
    yh=(f(x1+h)-f(x1))/h;
    x2=x1-f(x1)/yh;
    P=plot(x,f(x1)+yh*(x-x1),':',x1,f(x1),'*',x2,0,'*',x2,f(x2),'o')
    L=line([x2,x2],[0,f(x2)]);
    set(L,'LineStyle',':')
    x1=x2;
    if abs(f(x2))<eps break;
    end
    pause
    delete(P,L);
end
hold off
'End Iteration'