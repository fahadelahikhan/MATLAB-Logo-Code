clc
clearvars
close all

% Generate the surface data for the MATLAB logo
L = 160 * membrane(1, 100);

% Create a figure and configure the axes
figure('Renderer', 'opengl');
ax = axes;
s = surface(L);
s.EdgeColor = "none";
s.FaceColor = [0.9, 0.2, 0.2];

% Set axis limits for a tight fit
ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

% Adjust camera view for 3D perspective
ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

% Adjust the aspect ratio to fill the figure window
ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 0.9];

% Add lighting for a 3D effect
l1 = light('Position', [160 400 80], 'Style', 'local', 'Color', [0 0.8 0.8]);
l2 = light('Position', [0.5 -1 0.4], 'Color', [0.8 0.8 0]);

% Applying lighting and surface effects for realism
s.FaceLighting = 'gouraud';
s.AmbientStrength = 0.4;
s.DiffuseStrength = 0.7;
s.BackFaceLighting = 'lit';
s.SpecularStrength = 1;
s.SpecularColorReflectance = 1;
s.SpecularExponent = 10;

% Turn off axis lines for a clean look
axis off;
set(gcf, 'Color', 'white');

% Enable anti-aliasing for smoother appearance
set(gcf, 'GraphicsSmoothing', 'on');

% Save the figure as a high-resolution PNG
print('MATLAB_Logo', '-dpng', '-r300');
