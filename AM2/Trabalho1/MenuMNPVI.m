%MENUMNPVI  Menu de M�todos Num�ricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condi��o inicial  
%
%INPUT:
%   f - fun��o do 2.� membro da Equa��o Diferencial
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   y0 - condi��o inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das solu��es aproxima��es
%
%   12/03/2020 - Arm�nioCorreia .: armenioc@isec.pt 

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
    disp('           M�todos Num�ricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('M�todos Num�ricos para PVI', ...
                   'M�todo de Euler',...
                   'M�todo RK2',...
                   'M�todo RK4',...
                   'M�todo ODE45',...
                   'Todos',...
                   'Sa�r');
    switch menuMNPVI
        case 1
              yEuler=NEuler(f,a,b,n,y0);
              erroEuler=abs(sExataP-yEuler);
              h = (b-a)/n;
              t = a:h:b;
              disp('-----------Solu��o aproximada do PVI - Euler ---------')
              
                %Mostrar valores
              disp('Euler')
                disp(yEuler);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroEuler);
                
                %Gr�fico
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
              disp('-----------Solu��o aproximada do PVI - RK2 ---------')
              
                %Mostrar valores
              disp('RK2')
                disp(yRK2);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroRK2);
                
                %Gr�fico
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
              disp('-----------Solu��o aproximada do PVI - RK4 ---------')
              
                %Mostrar valores
              disp('RK4')
                disp(yRK4);
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroRK4);
                
                %Gr�fico
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
              disp('-----------Solu��o aproximada do PVI - ODE45 ---------')
              
                %Mostrar valores
              disp('ODE45')
                disp(yODE45');
              disp('Exata')
                disp(sExataP);
              disp('Erro')
                disp(erroODE45);
                
                %Gr�fico
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
              yTodos=MNumericosPVI(f,a,b,n,y0);
              disp(yTodos);
        case 6
            break;
    end
    % disp('-----------Solu��o aproximada do PVI ---------')
    % disp(y)
    input('Prima numa tecla para continuar �')
end
            