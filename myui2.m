function filtreGUI2()
    %# read image
    H = exponentiel_noyau(9, 9, 0.8);
    
    I = imread('cameraman.tif');
    
    II = imfilter(I, H);

% -------------------------- gauss -------------------------
    hFig = figure('menu','none');
    hAx = axes('Parent',hFig);
    uicontrol('Parent',hFig, 'Style','slider', 'Value',0.8, 'Min',0,...
        'Max',5, 'SliderStep',[1 10]./100, ...
        'Position',[150 5 300 20], 'Callback',@slider_callback) 
    hTxt = uicontrol('Style','text', 'Position',[290 28 20 15], 'String','0');
    figure(1) : imshow(II, 'Parent', hAx)


    function slider_callback(hObj, data)
        gamma = get(hObj,'Value'); % avoir la valeur du slider
        H = exponentiel_noyau(9, 9, gamma);
        II = imfilter(I, H);
        figure(1) : imshow(II, 'Parent',hAx) 
        set(hTxt, 'String',num2str(gamma)) 
    end
end