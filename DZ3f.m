n=input('Введите n ','s')
f=@(x)x.^n-1;
fzero(f,0.5)
