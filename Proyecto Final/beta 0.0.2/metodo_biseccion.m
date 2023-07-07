function varargout = metodo_biseccion(varargin)
% METODO_BISECCION MATLAB code for metodo_biseccion.fig
%      METODO_BISECCION, by itself, creates a new METODO_BISECCION or raises the existing
%      singleton*.
%
%      H = METODO_BISECCION returns the handle to a new METODO_BISECCION or the handle to
%      the existing singleton*.
%
%      METODO_BISECCION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODO_BISECCION.M with the given input arguments.
%
%      METODO_BISECCION('Property','Value',...) creates a new METODO_BISECCION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metodo_biseccion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metodo_biseccion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metodo_biseccion

% Last Modified by GUIDE v2.5 20-Jun-2023 11:38:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @metodo_biseccion_OpeningFcn, ...
                   'gui_OutputFcn',  @metodo_biseccion_OutputFcn, ...
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


% --- Executes just before metodo_biseccion is made visible.
function metodo_biseccion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metodo_biseccion (see VARARGIN)

% Choose default command line output for metodo_biseccion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metodo_biseccion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metodo_biseccion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit_funcion= findobj(0, 'tag', 'txt_funcion');
funcion = get(edit_funcion, 'String');

edit_limite_superior = findobj(0, 'tag', 'txt_limite_superior');
limite_superior = get(edit_limite_superior, 'String');

edit_limite_inferior = findobj(0, 'tag', 'txt_limite_inferior');
limite_inferior = get(edit_limite_inferior, 'String');

edit_tolerancia = findobj(0, 'tag', 'txt_tolerancia');
tolerancia = get(edit_tolerancia, 'String');

if isempty(funcion) || isempty(limite_superior) || isempty(limite_inferior) || isempty(tolerancia)
    msgbox ("Error uno o varios compos vacíos", "Campos vacíos")
else
    syms x;
    fa = subs(str2sym(funcion), x, str2sym(limite_superior));
    fb = subs(str2sym(funcion), x, str2sym(limite_inferior));
    
    if fa * fb > 0
        disp('La función no cambia de signo en el intervalo dado.');
    end
    
    % Iniciar el proceso de bisección
    while (limite_inferior - limite_superior) / 2 > tolerancia
        % Calcular el punto medio
        c = (str2sym(limite_superior) + str2sym(limite_inferior)) / 2;

        % Evaluar la función en el punto medio
        fc = subs(str2sym(funcion), x, c);

        % Verificar si se encontró la raíz exacta
        if fc == 0
            break;
        end

        % Actualizar los extremos del intervalo
        
        if fa * fc < 0
            limite_inferior = c;
            fb = fc;
        else
            limite_superior = c;
            fa = fc;
        end
    end

    % Obtener la aproximación de la raíz
    raiz = (str2double(limite_superior) + str2double(limite_inferior)) / 2;
    
    text_resultado = findobj(0, 'tag', 'txt_resultado');
    set(text_resultado, 'String', ['La raíz es: ', num2str(raiz)]);
        
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


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
principal = 'principal.fig';
figura = openfig(principal);
figure(figura)



function txt_tolerancia_Callback(hObject, eventdata, handles)
% hObject    handle to txt_tolerancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_tolerancia as text
%        str2double(get(hObject,'String')) returns contents of txt_tolerancia as a double


% --- Executes during object creation, after setting all properties.
function txt_tolerancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_tolerancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
