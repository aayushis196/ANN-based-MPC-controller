clc
clear all

dt=0.001; % ds=c*dt => ds=dt
s_dot=1.0;
L = 2.6;  % length of wheel base
x_ref=zeros;
y_ref=zeros;
theta_ref=zeros;
x_t=zeros;
y_t=zeros;
theta_t=zeros;
S=zeros;
v_ref=zeros;
w_ref=zeros;

for s=0:s_dot*dt:2*pi

i=s*1000+1;
i=int32(i);
S(i)=s;
%path
% for lissajous x=a*cos(s) and y=b*sin(2s)
%v_ref= s_dot*sqrt(4*b^2+a^2-x^2-4*y^2)
%w_ref=(y_dot*x-4*x_dot*y)/(4*b^2+a^2-x^2-4*y^2)

x_ref(i)= 30*cos(s) + rand();
y_ref(i)= 50*sin(2*s)+ rand();
x_dot=-30*sin(s)*s_dot;
y_dot=50*2*cos(2*s)*s_dot;
theta_ref(i)= atan2(y_dot,x_dot)+rand();
if theta_ref(i)<0
    theta_ref(i)=theta_ref(i)+2*pi;
end

x_t(i)= 30*cos(s);
y_t(i)= 50*sin(2*s);
theta_t(i)= atan2(y_dot,x_dot);
if theta_t(i)<0
    theta_t(i)=theta_t(i)+2*pi;
end

v_ref(i)= s_dot*sqrt(4*50^2+30^2-x_t(i)^2-4*y_t(i)^2) + rand();
w_ref(i)= (y_dot*x_t(i)-4*x_dot*y_t(i))/(4*50^2+30^2-x_t(i)^2-4*y_t(i)^2) +rand() ;

end

input(1,:)= x_ref;
input(2,:)= y_ref;
input(3,:)= theta_ref;
input(4,:)= v_ref;
input(5,:)= w_ref;
target(1,:)=x_t;
target(2,:)=y_t;
target(3,:)=theta_t;

plot(x_t,y_t);
hold
plot(x_ref,y_ref);