%% 2_b
% Define the functions
f1 = @(x1,x2) 5*x1 + x1.*x2.^2 + cos(3*x2).^2 - 1;
f2 = @(x1,x2) exp(2*x1-x2) + 4*sin(x2) - 2;

% Define the grid
x = linspace(-1,1,30);
[X,Y] = meshgrid(x);

% Starting to create 3D plot
figure(1);
% Plot semitransparent red mesh, z = f1
mesh(X,Y,f1(X,Y),'FaceAlpha','0.5','FaceColor','red'); hold on;
% Plot semitransparent green mesh, z = f2
mesh(X,Y,f2(X,Y),'FaceAlpha','0.5','FaceColor','green');
% Plot semitransparent blue mesh, z = 0, set the size of the area to size x
% to avoid area not match error
mesh(X,Y,zeros(size(X)),'FaceAlpha','0.5','FaceColor','blue');
% Labeling
xlabel('x'); ylabel('y'); zlabel('z');
hold off

