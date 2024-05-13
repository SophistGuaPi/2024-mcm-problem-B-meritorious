% Load the image
function [x,y,depth]=get_depth(siz)
img = imread('Ionian Sea.png');
% Convert the image to grayscale if it is not already
if size(img, 3) == 3
img = rgb2gray(img);
end
% Convert to double for processing
img = double(img);
% % Normalize the image to get the intensity values between 0 and 1
x=max(img(:)) - min(img(:));
img = (img - min(img(:))) / x;
img=imresize(img,siz);
% Assuming that land is represented by the higher values and sea by lower values,
% set the threshold for sea level, which is normalized to 0.5 in this case
sea_level_threshold = 0.5; % This needs to be adjusted based on your image data
% Set land (values above the sea level threshold) to NaN so they are not plotted
img(img > sea_level_threshold) = NaN;
img =img.*x;
% Generate x and y coordinates based on image size
[x, y] = meshgrid(1:size(img,2), 1:size(img,1));
depth=img;
end
% Create the 3D plot using the surf function
% figure;
% surf(x, y, img, 'EdgeColor', 'none'); % The land will not be plotted
% % Adjust the view angle for better visualization
% view(45, 30);
% % Add labels and title if needed
% xlabel('X-axis');
% ylabel('Y-axis');
% zlabel('Depth');
% % Use the 'jet' colormap for the ocean depth to replicate the rainbow color
% distribution
% colormap(jet);
% % Add a color bar to indicate the scale
% colorbar;
% % Optional: Adjust lighting to improve the appearance
% camlight left;
% lighting phong;
% % Save the plot to a file
% saveas(gcf, '3D_ocean_floor_plot_with_jet_colormap.png');
