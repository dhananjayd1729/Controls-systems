clear; close all; clc;
% Problem parameters
k1=3.17; % cart spring constant (N/m)
b1=0.529; % cart viscous damping coefficient (Ns/m)
m1=5.27; % cart mass (kg)
z10=1; % cart initial position (m)
v10=0; % cart initial velocity (m/s)
% Set time
simTime=10; % simulation time (s)
tStep=0.001; % simulation time step
iterations=simTime/tStep;
t=0:iterations;
% Pre-allocate variables for speed and add initial conditions
z1=zeros(iterations,1);
z1(1,:)=z10;
v1=zeros(iterations,1);
v1(1,:)=v10;
a1=zeros(iterations,1);
a1(1,:)=-(b1*v10+k1*z10)/m1;
% Solve the ODE's with Euler's Method
for n=2:(iterations+1)
z1(n,:)=z1(n-1,:)+v1(n-1,:)*tStep; % cart position
v1(n,:)=v1(n-1,:)+a1(n-1,:)*tStep; % cart velocity
a1(n,:)=-(b1*v1(n,:)+k1*z1(n,:))/m1; % cart acceleration
end
% Plot results
subplot(3,1,1)
hold on;
plot(t',z1,'r')
ylabel('Position (m)')
title('Position, Velocity, & Acceleration as a Function of Time')
legend('Cart')
subplot(3,1,2)
hold on;
plot(t',v1,'b')
ylabel('Velocity (m/s)')
legend('Cart')
subplot(3,1,3)
hold on;
plot(t',a1,'g')
ylabel('Acceleration (m/s^2)')
xlabel('time (iterations)')
legend('Cart')