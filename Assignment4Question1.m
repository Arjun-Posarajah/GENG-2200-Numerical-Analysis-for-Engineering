
clear all; % Clear Workspace
syms AB BC AD BD CD DE CE Ax Ay Ey % Define all Variables as Symbols
eq1=Ax+AD==0; % Equation 1
eq2=Ay+AB==0; % Equation 2
eq3=74+BC+(3/5)*BD==0; % Equation 3
eq4=-AB-(4/5)*BD==0; % Equation 4
eq5=-BC+(3/5)*CE==0; % Equation 5
eq6=-24-CD-(4/5)*CE==0; % Equation 6
eq7=-AD+DE-(3/5)*BD==0; % Equation 7
eq8=CD+(4/5)*BD==0; % Equation 8
eq9=-DE-(3/5)*CE==0; % Equation 9
eq10=Ey+(4/5)*CE==0; % Equation 10
[data_out]=solve(eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10); % Solve all equations together
fprintf('AB=%f \nBC=%f \nAD=%f \nBD=%f \nCD=%f \nDE=%f \nCE=%f \nAx=%f \nAy=%f \nEy=%f \n',double(data_out.AB),double(data_out.BC),double(data_out.AD ),double(data_out.BD ),double(data_out.CD ),double(data_out.DE ),double(data_out.CE ),double(data_out.Ax ),double(data_out.Ay ),double(data_out.Ey)); % print all equation variables in double precision