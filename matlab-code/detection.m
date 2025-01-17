clc;
clear all
close all
warning off
%case 1
rf=0.1; %fault resistance
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0]
t1(1,1)
[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1]
t2(1,1)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[1]
t3(1,1)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[1]
t4(1,1)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1]
t5(1,1)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1]
t6(1,1)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[1]
t7(1,1)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[1]
t8(1,1)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1]
t9(1,1)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1]
t10(1,1)
xdata1=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata1=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
%case 2
rf=10; %fault resistance
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0]
t1(1,1)

[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1]
t2(1,1)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[1]
t3(1,1)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[1]
t4(1,1)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1]
t5(1,1)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1]
t6(1,1)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[1]
t7(1,1)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[1]
t8(1,1)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1]
t9(1,1)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1]
t10(1,1)
xdata2=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata2=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
%case 3
rf=100; %fault resistance
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0]
t1(1,1)

[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1]
t2(1,1)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[1]
t3(1,1)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[1]
t4(1,1)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1]
t5(1,1)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1]
t6(1,1)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[1]
t7(1,1)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[1]
t8(1,1)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1]
t9(1,1)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1]
t10(1,1)
xdata3=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata3=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
xdata=[xdata1;xdata2;xdata3;xdata1;xdata2;xdata3;xdata1;xdata2;xdata3;]
tdata=[tdata1;tdata2;tdata3;tdata1;tdata2;tdata3;tdata1;tdata2;tdata3;]
