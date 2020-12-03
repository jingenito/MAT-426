%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Explicit solver heat equation %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Goal: solve
%         u_t = k u_xx,  0<x<L, t>0
%         u(0,t) = a, u(L,t) = b
%         u(x,0) = f(x)
%
%   Method: Forward time, centered space finite differences
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%% Parameters
%%%%%%%%%%%%%%%%%%%%

    k = 1;

    L = 1; 
    T = 1; %final time
    
    dx = 0.1; 
    dt = 0.001; 
    
    x = 0:dx:L;  %vector of all space locations
    t = 0:dt:T; %vector of all time points
    
%%%%%%%%%%%%%%%%%%%%%%
%% Boundary conditions
%%%%%%%%%%%%%%%%%%%%%%
    
    a = 1; %left boundary
    b = 3; %right boundary
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial condition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     f = sin(4*pi*x);   
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialize u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    u = zeros(length(t),length(x));
    u(1,:) = f;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implement forward time centered space 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %The matrix u(i,j) has time encoded in the i variable
    %and space encoded in the j variable. For example u(1,j) 
    %is the initial condition (remember, MATLAB start indexing at 1).
    for i = 2:length(t) %Calculate next time step

        u(i,1) = a;   
        u(i,end) = b;
        
        for j = 2:length(x)-1
            u(i,j) = u(i-1,j) + (k*dt/(dx^2))*(u(i-1,j+1) - 2*u(i-1,j) + u(i-1,j-1));
        end
    end
          
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% YOU DO NOT NEED TO CHANGE
    %% ANYTHING BELOW THIS LINE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [X,T] = meshgrid(x,t);
 
    fig=figure();

    set(fig, 'Position',  [100 206 1100 420])
       
    for i = 1:length(t)
        clf
        subplot(1,2,1)
        plot(x,u(i,:))
        a = gca;
        a.FontSize = 16;
        axis([0 L min(f) max(f)])
    
        subplot(1,2,2)
        hold on
        s=surf(X,T,u);
        s.EdgeColor = 'none';
        angle = 30+.05*i;
        view(angle,25)
        xlabel('x','interpreter','latex')
        ylabel('t','interpreter','latex')
        zlabel('u','interpreter','latex')
        plot3(x,t(i)*ones(length(x),1),u(i,:))
        a = gca;
        a.FontSize = 16;
        hold off
        pause(0)
    end