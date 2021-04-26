%MENUMNPVI  Menu de Métodos Numéricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%
%   12/03/2020 - ArménioCorreia .: armenioc@isec.pt 

function y=MenuMNPVI(f,a,b,n,y0,sExataP)

% strF='y+exp(3*t)';
% f=@(t,y)eval(vectorize(strF)); % interface01PVI //////??????
% 
% a  = 1;
% b  = 1.5;
% n  = 2;
% y0 = 2;


menuMNPVI = 1;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           Métodos Numéricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('Métodos Numéricos para PVI', ...
                   'Método de Euler',...
                   'Método RK2',...
                   'Método RK4',...
                   'Todos',...
                   'Saír');
    switch menuMNPVI
        case 1
              y=NEuler(f,a,b,n,y0,sExataP);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - Euler ---------')
              plot(t,y,"-ro");
        case 2
              y=NRK2(f,a,b,n,y0,sExataP);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - RK2 ---------')
              plot(t,y,"-ro");
        case 3
              y=NRK4(f,a,b,n,y0,sExataP); 
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - RK4 ---------')
              plot(t,y,"-ro");
        case 4
              y=ODE45(f,a,b,n,y0,sExataP);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - ODE45 ---------')
              plot(t,y,"-ro");
        case 5
              %y=MNumericosPVI(f,a,b,n,y0,sExataP);
        case 6
            break;
    end
   % disp('-----------Solução aproximada do PVI ---------')
    disp(y)
    input('Prima numa tecla para continuar »')
end
            
