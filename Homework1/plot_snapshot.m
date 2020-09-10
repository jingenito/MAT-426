function plot_snapshot(t,k)
x = 0 : 0.01 : 1;
for i=1:length(x)
    y(i) = u(x(i),t,k);
end

figure;
plot(x,y)
title("t=" + t + ", k=" + k)
ylabel('u')
xlabel('x')