function varargout = propagacion_errores(varargin)
% PROPAGACION_ERRORES MATLAB code for propagacion_errores.fig
%      PROPAGACION_ERRORES, by itself, creates a new PROPAGACION_ERRORES or raises the existing
%      singleton*.
%
%      H = PROPAGACION_ERRORES returns the handle to a new PROPAGACION_ERRORES or the handle to
%      the existing singleton*.
%
%      PROPAGACION_ERRORES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROPAGACION_ERRORES.M with the given input arguments.
%
%      PROPAGACION_ERRORES('Property','Value',...) creates a new PROPAGACION_ERRORES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before propagacion_errores_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to propagacion_errores_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help propagacion_errores

% Last Modified by GUIDE v2.5 19-Jun-2023 21:20:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @propagacion_errores_OpeningFcn, ...
                   'gui_OutputFcn',  @propagacion_errores_OutputFcn, ...
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


% --- Executes just before propagacion_errores is made visible.
function propagacion_errores_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to propagacion_errores (see VARARGIN)

% Choose default command line output for propagacion_errores
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes propagacion_errores wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = propagacion_errores_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function txt_error_x_Callback(hObject, eventdata, handles)
% hObject    handle to txt_error_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_error_x as text
%        str2double(get(hObject,'String')) returns contents of txt_error_x as a double


% --- Executes during object creation, after setting all properties.
function txt_error_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_error_x (see GCBO)
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



function txt_error_y_Callback(hObject, eventdata, handles)
% hObject    handle to txt_error_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_error_y as text
%        str2double(get(hObject,'String')) returns contents of txt_error_y as a double


% --- Executes during object creation, after setting all properties.
function txt_error_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_error_y (see GCBO)
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
edit_valor_x= findobj(0, 'tag', 'txt_valor_x');
valor_x = get(edit_valor_x, 'String');
edit_error_x = findobj(0, 'tag', 'txt_error_x');
error_x = get(edit_error_x, 'String');

edit_valor_y = findobj(0, 'tag', 'txt_valor_y');
valor_y = get(edit_valor_y, 'String');
edit_error_y = findobj(0, 'tag', 'txt_error_y');
error_y = get(edit_error_y, 'String');

edit_valor_funcion = findobj(0, 'tag', 'txt_funcion');
valor_funcion = get(edit_valor_funcion, 'String');

if isempty(valor_x) || isempty(error_x) || isempty(valor_y) || isempty(error_y) || isempty(valor_funcion)
    msgbox('Error: Uno o varios campos están vacíos', 'Campos vacíos');
else
    syms x y;
    df_dx = diff(str2sym(valor_funcion), x);
    df_dy = diff(str2sym(valor_funcion), y);
    
    delta_f = sqrt((abs(df_dx * str2num(error_x)))^2 + (abs(df_dy * str2num(error_y)))^2);
    
    resultado = eval(subs(str2sym(valor_funcion), [x, y], [str2sym(valor_x), str2sym(valor_y)]));
    
    f_with_error_plus = str2sym(valor_funcion) + delta_f;
    resultado_f_with_error_plus = eval(subs(f_with_error_plus, [x, y], [str2sym(valor_x), str2sym(valor_y)]));
    
    f_with_error_minus = str2sym(valor_funcion) - delta_f;
    resultado_f_with_error_minus = eval(subs(f_with_error_minus, [x, y], [str2sym(valor_x), str2sym(valor_y)]));
    
    error = resultado - resultado_f_with_error_minus;
    error2 = resultado_f_with_error_plus - resultado;
    
    %if error == error2
        text_resultado = findobj(0, 'tag', 'txt_resultado');
        set(text_resultado, 'String', ['Valor de f: ' num2str(resultado)  newline 'Error: ±' num2str(error)]);
    %end
    
    x_coords = [resultado_f_with_error_minus, resultado, resultado_f_with_error_plus]; % Puedes ajustar estos valores según tus necesidades
    y_coords = [0, 0, 0]; % Los valores y se mantienen en 0 para que estén en una línea recta

    % Crear una nueva figura
    fig = figure;

    % Graficar los puntos en una recta numérica en la figura
    plot(x_coords, y_coords, 'Marker', 'o', 'LineStyle', '-', 'Color', 'b');
    xlabel('Valores');
    title('Gráfico');
    axis([min(x_coords)-1 max(x_coords)+1 -1 1]); % Ajusta los límites del eje y según tus necesidades

    % Agregar los valores debajo de cada punto
    text(x_coords, y_coords-0.1, num2str([resultado_f_with_error_minus; resultado; resultado_f_with_error_plus]), 'HorizontalAlignment', 'center');

    % Abrir la figura en una ventana externa
    figure(fig);
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
