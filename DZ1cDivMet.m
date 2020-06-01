clear
a=0; b=7;
m=50; x=linspace(a,b,m);
h=0.001; iter=2; eps=0.001;
f=@(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
y=f(x);
plot(x,f(x),x,0*x,':'); grid on;
xlabel('X'); ylabel('Y');
hold on
y_min=min(y); y_max=max(y);
if y_min<0 y_min=1.1*y_min; else y_min=0.9*y_min; end;
if y_max>0 y_max=1.1*y_max; else y_max=0.9*y_max; end;
axis([a,b,y_min,y_max]);
z=ginput(2); z1=z(1,1); z2=z(2,1);
f1=f(z1); f2=f(z2);z=(z1+z2)/2;y=f(z);
if (f1*f2<0)
P=plot(z1,0,'*',z2,0,'*',z,0,'*')
end
for i=1:iter
    if(f1*f2>0)
        break
    end
    z=(z1+z2)/2;
    y=f(z);
    delete(P);
    P=plot(z1,0,'*',z2,0,'*',z,0,'*')
if (f1*f2<0)
    while (abs(y)>=eps)
        if f1*y<0
            z2=z;
            z=(z1+z2)/2;
            y=f(z);
        else z1=z;
            z=(z1+z2)/2;
            y=f(z);
        end
    end
end
end
hold off