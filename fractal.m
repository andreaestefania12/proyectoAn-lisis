function fractal(N,d,m,tol)
    x=linspace(-2,2,N+1);   
    y=linspace(-2,2,N+1);  
    [X,Y]=meshgrid(x,y);
    Z=X+1i*Y;
  
    for i=1:N
        Z= Z- m*((subfunc(Z,d)./devFunc(Z,d)));
    end
    [row,col] = size(Z);
    plotFractal=zeros(row,col);         
    root=roots([1 0 0 -1]); 

    for i=1:d
        zRoot = (abs(Z-root(i))<=tol);
        plotFractal=plotFractal+zRoot*i;
    end

    colormap(jet);     
    imagesc(plotFractal) 
    
end

function y=subfunc(x,d)
    y=(x.^d)-1;
end

function y1=devFunc(x,d)
   y1=d*(x.^(d-1));
end


