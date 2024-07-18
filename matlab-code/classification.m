clc;
clear all
close all
warning off
%case 1
L=10; %Line length of fedder
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0 0 0 0  10]
t1(1,5)

[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1 0 0 1 10]
t2(1,5)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[0 1 0 1 10]
t3(1,5)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[0 0 1 1 10]
t4(1,5)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1 1 0 0 10]
t5(1,5)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1 1 0 1 10]
t6(1,5)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[0 1 1 0 10]
t7(1,5)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[0 1 1 1 10]
t8(1,5)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1 0 1 0 10]
t9(1,5)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1 0 1 1 10]
t10(1,5)
xdata1=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata1=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
%case 2
L=5; %Line length of fedder
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0 0 0 0  5]
t1(1,5)

[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1 0 0 1 5]
t2(1,5)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[0 1 0 1 5]
t3(1,5)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[0 0 1 1 5]
t4(1,5)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1 1 0 0 5]
t5(1,5)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1 1 0 1 5]
t6(1,5)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[0 1 1 0 5]
t7(1,5)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[0 1 1 1 5]
t8(1,5)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1 0 1 0 5]
t9(1,5)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1 0 1 1 5]
t10(1,5)
xdata2=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata2=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
%case 3
L=1; %Line length of fedder
simopt = simset('solver','ode23tb','SrcWorkspace','Current','Dstworkspace','Current');%initiliaze sim option
[tout,xout,yout] = sim('Normal6.slx',[0 0.4],simopt);
x1=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x1(1,8)
t1=[0 0 0 0  10]
t1(1,5)

[tout,xout,yout] = sim('AG6.slx',[0 0.4],simopt);
x2=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x2(1,8)
t2=[1 0 0 1 10]
t2(1,5)
[tout,xout,yout] = sim('BG6.slx',[0 0.4],simopt);
x3=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x3(1,8)
t3=[0 1 0 1 10]
t3(1,5)
[tout,xout,yout] = sim('CG6.slx',[0 0.4],simopt);
x4=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x4(1,8)
t4=[0 0 1 1 10]
t4(1,5)
[tout,xout,yout] = sim('AB6.slx',[0 0.4],simopt);
x5=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x5(1,8)
t5=[1 1 0 0 10]
t5(1,5)
[tout,xout,yout] = sim('ABG6.slx',[0 0.4],simopt);
x6=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x6(1,8)
t6=[1 1 0 1 10]
t6(1,5)
[tout,xout,yout] = sim('BC6.slx',[0 0.4],simopt);
x7=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x7(1,8)
t7=[0 1 1 0 10]
t7(1,5)
[tout,xout,yout] = sim('BCG6.slx',[0 0.4],simopt);
x8=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x8(1,8)
t8=[0 1 1 1 10]
t8(1,5)
[tout,xout,yout] = sim('AC6.slx',[0 0.4],simopt);
x9=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x9(1,8)
t9=[1 0 1 0 10]
t9(1,5)
[tout,xout,yout] = sim('ACG6.slx',[0 0.4],simopt);
x10=[Va6 Vb6 Vc6 Ia6 Ib6 Ic6 V06 I06]
x10(1,8)
t10=[1 0 1 1 10]
t10(1,5)
xdata3=vertcat(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
tdata3=vertcat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10)
xdata=[xdata1;xdata2;xdata3;xdata1;xdata2;xdata3;xdata1;xdata2;xdata3;]
tdata=[tdata1;tdata2;tdata3;tdata1;tdata2;tdata3;tdata1;tdata2;tdata3;]
