function [x,y,plotFractal]=fractal(N,g,m,tol)
    %para probar (N = 500, d=3, m=0.1, tol=1*10^(-5)
    x=linspace(-2,2,N+1);   %Cambiar limites segun GUI
    y=linspace(-2,2,N+1);  
    [X,Y]=meshgrid(x,y);
    Z=X+1i*Y;
  
    for i=1:N
        Z= Z- m*((subfunc(Z,g)./devFunc(Z,g)));
    end
    [row,col] = size(Z);
    plotFractal=zeros(row,col);         
    root=roots([1 0 0 -1]); %% toca crear un polinomio de grado d, para el ejemplo funciona

    for i=1:g
        zRoot = (abs(Z-root(i))<=tol);
        plotFractal=plotFractal+zRoot*i;
    end
    colormap(jet);     
    imagesc(x,y,plotFractal) 
    
end

function y=subfunc(x,g)
    y=(x.^g)-1; %toca cambiar f(x) respecto a GUI, para el ejemplo sirve
end

function y1=devFunc(x,g)
   y1=g*(x.^(g-1)); %toca cambiar f'(x) respecto a GUI, para el ejemplo sirve
end


