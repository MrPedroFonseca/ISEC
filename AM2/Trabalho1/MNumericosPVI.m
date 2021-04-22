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

function y = MNumericosPVI(f,a,b,n,y0,sExataP)
    NEuler(f,a,b,n,y0,sExataP);
    NRK2(f,a,b,n,y0,sExataP);
    NRK4(f,a,b,n,y0,sExataP);
    for i=1:n
        % ---
    end
end

