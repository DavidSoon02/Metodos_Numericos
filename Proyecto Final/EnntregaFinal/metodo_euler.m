function varargout = metodo_euler(varargin)
% METODO_EULER MATLAB code for metodo_euler.fig
%      METODO_EULER, by itself, creates a new METODO_EULER or raises the existing
%      singleton*.
%
%      H = METODO_EULER returns the handle to a new METODO_EULER or the handle to
%      the existing singleton*.
%
%      METODO_EULER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODO_EULER.M with the given input arguments.
%
%      METODO_EULER('Property','Value',...) creates a new METODO_EULER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metodo_euler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metodo_euler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metodo_euler

% Last Modified by GUIDE v2.5 28-Aug-2023 10:36:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @metodo_euler_OpeningFcn, ...
                   'gui_OutputFcn',  @metodo_euler_OutputFcn, ...
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


% --- Executes just before metodo_euler is made visible.
function metodo_euler_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metodo_euler (see VARARGIN)

% Choose default command line output for metodo_euler
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metodo_euler wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metodo_euler_OutputFcn(hObject, eventdata, handles) 
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
funcion = str2func(['@(x, y)' funcion_str]); % Convertir el texto de la función a una función que se pueda evaluar

edit_limite_superior = findobj(0, 'tag', 'txt_limite_superior');
limite_superior = str2double(get(edit_limite_superior, 'String'));

edit_limite_inferior = findobj(0, 'tag', 'txt_limite_inferior');
limite_inferior = str2double(get(edit_limite_inferior, 'String'));

edit_valor_x = findobj(0, 'tag', 'txt_valor_x');
valor_x = str2double(get(edit_valor_x, 'String'));

edit_valor_y = findobj(0, 'tag', 'txt_valor_y');
valor_y = str2double(get(edit_valor_y, 'String'));

if isempty(funcion) || isempty(limite_superior) || isempty(limite_inferior) || isempty(valor_x) || isempty(valor_y)
    msgbox ("Error uno o varios compos vacíos", "Campos vacíos")
else
    limite_inferior = valor_x;
    % Tamaño del paso
    h = 0.1;    
    
    % Inicializar vectores para almacenar los valores calculados
    x_vals = valor_x:h:limite_superior;
    y_vals = zeros(size(x_vals));
    y_vals(1) = valor_y;
    
    % Implementar el método de Euler
    for i = 1:length(x_vals)-1
        y_vals(i+1) = y_vals(i) + h * funcion(x_vals(i), y_vals(i));
    end
    
    % Graficar la solución
    fig = figure;
    plot(x_vals, y_vals, '-o');
    xlabel('x');
    ylabel('y');
    title('Solución usando el método de Euler');
    grid on;
    
    fig_final = figure; % Crear una nueva figura llamada "fig_final"
    
    % Copiar los objetos gráficos de la primera figura a la figura final
    copyobj(allchild(fig), fig_final);

    % Definir la posición y tamaño del gráfico de la segunda figura en la figura final
    set(h_fig, 'Units', 'normalized'); % Cambiar a unidades normalizadas para que la posición y tamaño sean independientes del tamaño de la figura final
    set(h_fig, 'Position', [0.1, 0.1, 0.8, 0.4]); % [left, bottom, width, height]

    % Opcional: Ajustar el tamaño de la figura combinada
    %set(fig_final, 'Position', [100, 100, 800, 600]); % [left, bottom, width, height]
    
    % Guardar la figura como un archivo PDF
    nombre_archivo_pdf = 'resultados_metodo_euler.pdf';
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


function txt_limite_superior_Callback(hObject, eventdata, handles)
% hObject    handle to txt_limite_superior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_limite_superior as text
%        str2double(get(hObject,'String')) returns contents of txt_limite_superior as a double


% --- Executes during object creation, after setting all properties.
function txt_limite_superior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_limite_superior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_limite_inferior_Callback(hObject, eventdata, handles)
% hObject    handle to txt_limite_inferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_limite_inferior as text
%        str2double(get(hObject,'String')) returns contents of txt_limite_inferior as a double


% --- Executes during object creation, after setting all properties.
function txt_limite_inferior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_limite_inferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_x_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_x as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_x as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_y_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_y as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_y as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
