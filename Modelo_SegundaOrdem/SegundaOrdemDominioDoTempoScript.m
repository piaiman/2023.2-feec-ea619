close all;
clear all; 
clc;

%%%%%%  FUN��ES DE SEGUNDA ORDEM NO DOM�NIO DO TEMPO

    %%%%%% Autor Pedro Henrique Moraes dos Santos
    %%%%%% Date:18/08/2023
    %%%%%% Laborat�rio de An�lise Linear

%%%% OBSERVA��ES 

    tfinal = 100; %simulation time - auto
    tStepMax = 0.05;  % - auto 
    deltaX=0.001;
    
%%%% OBSERVA��ES 

        % A equa��o:
        %       mx"+(b)x'+(k)x = f(x)

        % Escrever a equa��o na forma:
        %    x"+(b/m)x'+(k/m)x = f(x)/m


%%%Definindo vari�veis:

        %Constante que acompanha (k/m)*x, sendo igual Beta:
             theta0 = 0;
             thetaDot0 = 0;

        %Constante que acompanha (k/m)*x, sendo igual Beta:
              w=[0:0.2:2];
              w1 = w;
              e=0.5;
            
        %Constante que acompanha (k/m)*x, sendo igual Omega:       
           omega = w.^2; 

        %Constante que acompanha (b/m)*x', sendo igual a Beta:
           beta = 2.*e.*w;
           
        %Constante que acompanha f(x)/m, sendo igual a Psi:
           omega1 =w1.^2; 
            
        %Constante que soma o valor final Const 
            Const=0;
            
            
%%%Abrindo modelo no simulink:

        sim('SegundaOrdemDominioDoTempoModel.slx');


%%%Extraindo dados e gr�fico modelo no simulink:

        rt= ans.tout;
        rtheta = ans.simout;
        
%%%Plotando informa��es:


        %Definindo limites do eixo x
        
%        [numRows,numCols] = size(rtheta);
%        
%                for c = 1:numCols
%                     for r = 1:nRows
%                         
%                         %menor taxa de varia�ao em menos linhas
%                         
%                         if ddeltaX > deltaX
%                             xmax = [c r];
%                         else
%                             
%                         end
% 
%                     end
%                 end
               
       
       
       [minThetaAll,maxThetaAll] = bounds(rtheta,"all");
       deltaY = abs(maxThetaAll - minThetaAll);
       ymin =  minThetaAll - deltaY*.1;
       ymax =  maxThetaAll + deltaY*.1;
        




        %Definindo limites do eixo y
       [minThetaAll,maxThetaAll] = bounds(rtheta,"all");
       deltaY = abs(maxThetaAll - minThetaAll);
       ymin =  minThetaAll - deltaY*.1;
       ymax =  maxThetaAll + deltaY*.1;
        
        
        figure
        plot(rt, rtheta)
        ylim([ymin ymax])
        xlabel('t (seconds)')
        ylabel('\theta (rad)')
        grid on
        title('Aplica��o de par�mentros distribu�dos no sistema de segunda ordem')
        legend('First','Second','Third','Location','NorthEastOutside')
