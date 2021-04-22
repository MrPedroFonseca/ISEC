%NEULER  Método de Euler para ED/PVI.
%   y = NEuler(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%   y(i+1) = y(i)+h*f(t(i),y(i)) , i =0,1,...,n-1
%
%   03/03/2020 - ArménioCorreia .: armenioc@isec.pt 

function y = NRK4(f,a,b,n,y0,~)
    h = (b-a)/n;
    t=a:h:b;
    y=zeros(1,n+1);
    y(1)=y0;
    for i=1:n
        k1 = f(t(i), y(i));
        k2 = f(t(i)+(h/2), y(i)+(h*k1)/2);
        k3 = f(t(i)+(h/2), y(i)+h*(k2/2));
        k4 = f(t(i)+h, y(i)+(h*k3));

        y(i+1)=y(i)+(h/6)*(k1+2*k2+2*k3+k4);
        t(i+1)=t(i)+h;
    end
end

