clear; close all; clc;
% Problem parameters
k1=3.44; % cart spring constant (N/m)
b1=0.53; % cart viscous damping coefficient (Ns/m)
m1=5.53; % cart mass (kg)
x10=1; % cart initial position (m)
v10=0; % cart initial velocity (m/s)
F=0;
% Set time
simTime=9; % simulation time (s)
tStep=0.01; % simulation time step
iterations=simTime/tStep;
t=0:iterations;
% Pre-allocate variables for speed
x1=zeros(iterations,1);
x1(1,:)=x10;
v1=zeros(iterations,1);
v1(1,:)=v10;
a1=zeros(iterations,1);
a1(1,:)=-(b1*v10+k1*x10)/m1;
% Set up video
v=VideoWriter('cart.avi');
v.FrameRate=100;
open(v);
% I terative process of solving the ODE's with Euler's Method
for n=2:(iterations+1)
x1(n,:)=x1(n-1,:)+v1(n-1,:)*tStep;
v1(n,:)=v1(n-1,:)+a1(n-1,:)*tStep;
a1(n,:)=-(b1*v1(n,:)+k1*x1(n,:))/m1;
% Plot for the video
subplot(2,1,1)
hold on;
plot(t(:,1:n),x1(1:n,:),'r')
xlim([0 iterations])
xlabel('time (t)')
ylabel('Cart Position (m)')
legend('Cart')
title('Spring-Mass-Damper System');
subplot(2,1,2)
hold on;
fill([0 7 7 0],[0 0 1.5 1.5],'w'); % clears background
plot([0 x1(n,:)+3],[0.25 0.25],'y'); % damper line
plot([1 x1(n,:)+0.5],[0.25 0.25],'g'); % damper
plot([0 x1(n,:)+3],[0.75 0.75],'b'); % spring
fill([x1(n,:)+2 x1(n,:)+3 x1(n,:)+3 x1(n,:)+2],[0 0 1 1],'r'); % mass
fill([0 0.1 0.1 0],[0 0 1 1],[0.5 0.5 0.5]);
xlim([0 7]);
ylim([0 1.5]);
frame=getframe(gcf);
drawnow();
writeVideo(v,frame)
end
close(v);