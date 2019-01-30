function [S,lambda,m] = IF_Poisson(S,lambda)

% we keep our assumption that gL=1/20 and VR=0
% typical values of S are small (less than 1/10) 
% let lambda be the rate that the neuron will receive an input current in one unit time, values for lambda are around 500Hz (i.e. 0.5)

% some initial default values 
T = 0; 
t_start = 0;
v_initial = 0;

fire_counter = 0;

hold on
while T < 1000
    
    dt = poissrnd(1./lambda);
    t_end = t_start + dt;
    t = t_start:0.01:t_end;
    v = v_initial*exp((-1./20)*(t-t_start));
    %plot(t,v,'-k');
    
    if (v_initial*exp((-1./20)*(t_end-t_start)) + S) < 1
        v_initial = v_initial*exp((-1./20)*(t_end-t_start)) + S;
        %plot([t_end t_end],[v_initial-S v_initial],'-k');
    else
        fire_counter = fire_counter + 1;
        v_initial = 0;
        %plot([t_end t_end],[0 1],'-r');
    end
    
    T = T + dt;
    t_start = t_end;
end
xlabel('t (unit times)');
ylabel('v(t)');
hold off

m = fire_counter./1000;
fprintf('S:%0.3f  Lambda:%0.3f  T:1000 (unit times)  m:%0.5f (times per unit time)\n',S,lambda,m);


