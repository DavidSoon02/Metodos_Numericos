function varargout = cuadratura_gauss(varargin)
% CUADRATURA_GAUSS MATLAB code for cuadratura_gauss.fig
%      CUADRATURA_GAUSS, by itself, creates a new CUADRATURA_GAUSS or raises the existing
%      singleton*.
%
%      H = CUADRATURA_GAUSS returns the handle to a new CUADRATURA_GAUSS or the handle to
%      the existing singleton*.
%
%      CUADRATURA_GAUSS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUADRATURA_GAUSS.M with the given input arguments.
%
%      CUADRATURA_GAUSS('Property','Value',...) creates a new CUADRATURA_GAUSS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cuadratura_gauss_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cuadratura_gauss_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cuadratura_gauss

% Last Modified by GUIDE v2.5 27-Aug-2023 17:38:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cuadratura_gauss_OpeningFcn, ...
                   'gui_OutputFcn',  @cuadratura_gauss_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cuadratura_gauss is made visible.
function cuadratura_gauss_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cuadratura_gauss (see VARARGIN)

% Choose default command line output for cuadratura_gauss
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cuadratura_gauss wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cuadratura_gauss_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_funcion_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_calcular.
function btn_calcular_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit_funcion= findobj(0, 'tag', 'txt_funcion');
funcion_str = get(edit_funcion, 'String');
funcion_str_modified = strrep(funcion_str, '^', '.^');
funcion = str2func(['@(x)' funcion_str_modified]); % Convertir el texto de la función a una función que se pueda evaluar

edit_limite_a = findobj(0, 'tag', 'txt_limite_a');
limite_a = str2double(get(edit_limite_a, 'String'));

edit_limite_b = findobj(0, 'tag', 'txt_limite_b');
limite_b = str2double(get(edit_limite_b, 'String'));

if isempty(funcion) || isempty(limite_a) || isempty(limite_b)
    msgbox ("Error uno o varios compos vacíos", "Campos vacíos")
else
    % Realizar la cuadratura de Gauss-Kronrod
    [result, error] = quadgk(funcion, limite_a, limite_b);
    
    text_resultado = findobj(0, 'tag', 'txt_resultado');
    set(text_resultado, 'String', ['Resultado de la integral: ' num2str(result) newline 'Estimación del error: ' num2str(error)]);
    
    % Crear puntos para la gráfica
    x_vals = linspace(limite_a, limite_b, 1000);
    y_vals = funcion(x_vals);
    
    % Calcular la integral acumulativa (antiderivada) de la función
    integral_vals = zeros(size(x_vals));
    for i = 1:length(x_vals)
        integral_vals(i) = quadgk(funcion, limite_a, x_vals(i));
    end
    
    % Graficar la función y la aproximación de la cuadratura de Gauss
    fig = figure;
    plot(x_vals, y_vals);
    hold on;
    plot(x_vals, integral_vals);
    legend('Función', 'Aproximación Gauss');
    xlabel('x');
    ylabel('y');
    title('Cuadratura de Gauss');
    grid on;
    hold off;
    
    
    fig_final = figure; % Crear una nueva figura llamada "fig_final"
    
    % Copiar los objetos gráficos de la primera figura a la figura final
    copyobj(allchild(fig), fig_final);

    % Definir la posición y tamaño del gráfico de la segunda figura en la figura final
    set(h_fig, 'Units', 'normalized'); % Cambiar a unidades normalizadas para que la posición y tamaño sean independientes del tamaño de la figura final
    set(h_fig, 'Position', [0.1, 0.1, 0.8, 0.4]); % [left, bottom, width, height]

    % Opcional: Ajustar el tamaño de la figura combinada
    %set(fig_final, 'Position', [100, 100, 800, 600]); % [left, bottom, width, height]
    
    % Guardar la figura como un archivo PDF
    nombre_archivo_pdf = 'resultados_cuadratura_gauss.pdf';
    print(fig_final, nombre_archivo_pdf, '-dpdf', '-bestfit'); 
    close(h_fig);
    close(fig_final)
end

% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
principal = 'principal.fig';
figura = openfig(principal);
figure(figura)

function txt_limite_a_Callback(hObject, eventdata, handles)
% hObject    handle to txt_limite_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_limite_a as text
%        str2double(get(hObject,'String')) returns contents of txt_limite_a as a double


% --- Executes during object creation, after setting all properties.
function txt_limite_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_limite_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_limite_b_Callback(hObject, eventdata, handles)
% hObject    handle to txt_limite_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_limite_b as text
%        str2double(get(hObject,'String')) returns contents of txt_limite_b as a double


% --- Executes during object creation, after setting all properties.
function txt_limite_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_limite_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
