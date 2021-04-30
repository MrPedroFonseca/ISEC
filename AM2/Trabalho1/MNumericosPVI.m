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

function y=MNumericosPVI(f,a,b,n,y0,sExataP)

    MetodoEuler=NEuler(f,a,b,n,y0);
    erroEuler=abs(sExataP-MetodoEuler); % calculo do erro
    
    MetodoRK2=NRK2(f,a,b,n,y0);
    erroRK2=abs(sExataP-MetodoRK2);
    
    MetodoRK4=NRK4(f,a,b,n,y0);
    erroRK4=abs(sExataP-MetodoRK4);
    
    MetodoODE45=ODE45(f,a,b,n,y0);
    erroODE45=abs(sExataP-MetodoODE45');
    
    h=(b-a)/n;
    t=a:h:b;
    
   
    plot(t,sExataP,"--k^");  %RK4
    hold on
    plot(t,MetodoEuler',"-ro");     %Euler
    hold on
    plot(t,MetodoRK2',"-b+");     %RK2
    hold on
    plot(t,MetodoRK4,"-g*");  %RK4
    hold on
    plot(t,MetodoODE45,"-yo");  %RK4
    hold off
    grid on
    legend('Euler','RK2','RK4','ODE45')

    y=table(sExataP',MetodoEuler',erroEuler',MetodoRK2',erroRK2',MetodoRK4',erroRK4',MetodoODE45, erroODE45','VariableNames',{'Exata','MetodoEuler','Erro Euler','MetodoRK2','Erro RK2','MetodoRK4','Erro RK4','MetodoODE45','Erro ODE45'});
end

