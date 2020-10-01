
t = [0 0.2 5];
x = linspace(0,1,1000);
U = zeros(3,1000);

for i=1:length(t)
    for k=1:length(x)
        U(i,k)=u(x(k),t(i));
    end
end

figure(1)
plot(x,U(1,:))
title('t=0')
xlabel('x')
ylabel('u')

figure(2)
plot(x,U(2,:))
title('t=0.2')
xlabel('x')
ylabel('u')

figure(3)
plot(x,U(3,:))
title('t=5')
xlabel('x')
ylabel('u')