function varargout = series_taylor(varargin)
% SERIES_TAYLOR MATLAB code for series_taylor.fig
%      SERIES_TAYLOR, by itself, creates a new SERIES_TAYLOR or raises the existing
%      singleton*.
%
%      H = SERIES_TAYLOR returns the handle to a new SERIES_TAYLOR or the handle to
%      the existing singleton*.
%
%      SERIES_TAYLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIES_TAYLOR.M with the given input arguments.
%
%      SERIES_TAYLOR('Property','Value',...) creates a new SERIES_TAYLOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before series_taylor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to series_taylor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help series_taylor

% Last Modified by GUIDE v2.5 31-Jul-2023 16:46:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @series_taylor_OpeningFcn, ...
                   'gui_OutputFcn',  @series_taylor_OutputFcn, ...
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


% --- Executes just before series_taylor is made visible.
function series_taylor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to series_taylor (see VARARGIN)

% Choose default command line output for series_taylor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes series_taylor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = series_taylor_OutputFcn(hObject, eventdata, handles) 
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



function txt_orden_Callback(hObject, eventdata, handles)
% hObject    handle to txt_orden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_orden as text
%        str2double(get(hObject,'String')) returns contents of txt_orden as a double


% --- Executes during object creation, after setting all properties.
function txt_orden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_orden (see GCBO)
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
funcion = str2func(['@(x)' funcion_str]); % Convertir el texto de la función a una función que se pueda evaluar

edit_orden = findobj(0, 'tag', 'txt_orden');
orden = str2double(get(edit_orden, 'String'));

if isempty(funcion) || isempty(orden)
    msgbox ("Error uno o varios compos vacíos", "Campos vacíos")
else
    syms x;  
    punto_expansion = 0;
    
    %Calcula las derivadas hasta el orden deseado (4 en este caso)
    derivadas = cell(orden, 1);
    derivadas{1} = funcion;
    for i = 2:orden
        derivadas{i} = diff(derivadas{i-1}, x);
    end
    
    %Escribe la serie de Taylor
    serie_taylor = funcion;
    for i = 2:orden
        serie_taylor = serie_taylor + (derivadas{i} * (x - punto_expansion)^i) / factorial(i);
    end
    
    text_resultado = findobj(0, 'tag', 'txt_resultado');
    set(text_resultado, 'String', ['Serie de Taylor: ' string(serie_taylor)]);
    
    % Graficar la función original y su aproximación mediante la serie de Taylor
    figure;
    fplot(funcion, 'b', 'DisplayName', 'Función original');
    hold on;
    fplot(serie_taylor, 'r--', 'DisplayName', ['Serie de Taylor (Orden ', num2str(orden), ')']);
    legend;
    xlabel('x');
    ylabel('y');
    grid on;  
    
    filename = 'resultado_serie_taylor.pdf';
    print('-dpdf', filename); % Salvar la figura en PDF
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
