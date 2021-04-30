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
                   'Método ODE45',...
                   'Todos',...
                   'Saír');
    switch menuMNPVI
        case 1
              yEuler=NEuler(f,a,b,n,y0);
              erroEuler=abs(sExataP-yEuler);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - Euler ---------')
              
                %Mostrar valores
              disp('Euler')
                disp(yEuler);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroEuler);
                
                %Gráfico
              plot(t,yEuler,"-go");     %Euler
              hold on
              plot(t,sExataP,"-b");     %Exata
              hold on
              plot(t,erroEuler,"-ro");  %Erro
              hold off
              
        case 2
              yRK2=NRK2(f,a,b,n,y0);
              erroRK2=abs(sExataP-yRK2);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - RK2 ---------')
              
                %Mostrar valores
              disp('RK2')
                disp(yRK2);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroRK2);
                
                %Gráfico
              plot(t,yRK2,"-go");     %Euler
              hold on
              plot(t,sExataP,"-b");     %Exata
              hold on
              plot(t,erroRK2,"-ro");  %Erro
              hold off
              
        case 3
              yRK4=NRK4(f,a,b,n,y0);
              erroRK4=abs(sExataP-yRK4);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - RK4 ---------')
              
                %Mostrar valores
              disp('RK4')
                disp(yRK4);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroRK4);
                
                %Gráfico
              plot(t,yRK4,"-go");     %Euler
              hold on
              plot(t,sExataP,"-b");     %Exata
              hold on
              plot(t,erroRK4,"-ro");  %Erro
              hold off
              
              
        case 4
              yODE45=ODE45(f,a,b,n,y0);
              erroODE45=abs(sExataP-yODE45');
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solução aproximada do PVI - ODE45 ---------')
              
                %Mostrar valores
              disp('ODE45')
                disp(yODE45');
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroODE45);
                
                %Gráfico
              plot(t,yODE45',"-go");     %Euler
              hold on
              plot(t,sExataP,"-b");     %Exata
              hold on
              plot(t,erroODE45,"-ro");  %Erro
              hold off
              
%               disp('ODE45')
%                 disp(yODE45');
%               plot(t,yODE45,"-ro");
        case 5
              yTodos=MNumericosPVI(f,a,b,n,y0,sExataP);
              disp(yTodos);
        case 6
            break;
    end
    % disp('-----------Solução aproximada do PVI ---------')
    % disp(y)
    input('Prima numa tecla para continuar »')
end
            
