%функция fzero не выводит комплесных корней (и если есть несколько вещественных
%корней, то выводит только один из них),а solve выводит все корни, ключая
%комплексные
f=@(x)x.^2+1;
fzero(f,0.5) 
syms x;
Eq=x^2+1;
a=solve(Eq)