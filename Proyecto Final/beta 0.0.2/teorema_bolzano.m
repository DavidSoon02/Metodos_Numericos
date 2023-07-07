function varargout = teorema_bolzano(varargin)
% TEOREMA_BOLZANO MATLAB code for teorema_bolzano.fig
%      TEOREMA_BOLZANO, by itself, creates a new TEOREMA_BOLZANO or raises the existing
%      singleton*.
%
%      H = TEOREMA_BOLZANO returns the handle to a new TEOREMA_BOLZANO or the handle to
%      the existing singleton*.
%
%      TEOREMA_BOLZANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEOREMA_BOLZANO.M with the given input arguments.
%
%      TEOREMA_BOLZANO('Property','Value',...) creates a new TEOREMA_BOLZANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before teorema_bolzano_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to teorema_bolzano_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help teorema_bolzano

% Last Modified by GUIDE v2.5 20-Jun-2023 10:22:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @teorema_bolzano_OpeningFcn, ...
                   'gui_OutputFcn',  @teorema_bolzano_OutputFcn, ...
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


% --- Executes just before teorema_bolzano is made visible.
function teorema_bolzano_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to teorema_bolzano (see VARARGIN)

% Choose default command line output for teorema_bolzano
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes teorema_bolzano wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = teorema_bolzano_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_intervalo_a_Callback(hObject, eventdata, handles)
% hObject    handle to txt_intervalo_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_intervalo_a as text
%        str2double(get(hObject,'String')) returns contents of txt_intervalo_a as a double


% --- Executes during object creation, after setting all properties.
function txt_intervalo_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_intervalo_a (see GCBO)
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
funcion = get(edit_funcion, 'String');

edit_intervalo_a = findobj(0, 'tag', 'txt_intervalo_a');
intervalo_a = get(edit_intervalo_a, 'String');

edit_intervalo_b = findobj(0, 'tag', 'txt_intervalo_b');
intervalo_b = get(edit_intervalo_b, 'String');

if isempty(funcion) || isempty(intervalo_a) || isempty(intervalo_b)
    msgbox ("Error uno o varios compos vacíos", "Campos vacíos")
else
    syms x;
    
    limite_izquierdo = limit(str2sym(funcion), x, str2sym(intervalo_a));
    limite_derecho = limit(str2sym(funcion), x, str2sym(intervalo_b));
    
    fa = subs(str2sym(funcion), x, str2sym(intervalo_a));
    fb = subs(str2sym(funcion), x, str2sym(intervalo_b));
    
    if subs(str2sym(funcion), x, str2sym(intervalo_a)) == limite_izquierdo && subs(str2sym(funcion), x, str2sym(intervalo_b)) == limite_derecho
        if fa * fb < 0
            text_resultado = findobj(0, 'tag', 'txt_resultado');
            set(text_resultado, 'String', 'La función es continúa y se cumple el teorema de Bolzano en el intervalo [a, b].');
        else
            text_resultado = findobj(0, 'tag', 'txt_resultado');
            set(text_resultado, 'String', 'La función es continúa pero no se cumple el teorema de Bolzano en el intervalo [a, b].');
        end
    else
        text_resultado = findobj(0, 'tag', 'txt_resultado');
        set(text_resultado, 'String', 'La función no es continúa y no se cumple el teorema de Bolzano.');
    end
    
end



function txt_intervalo_b_Callback(hObject, eventdata, handles)
% hObject    handle to txt_intervalo_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_intervalo_b as text
%        str2double(get(hObject,'String')) returns contents of txt_intervalo_b as a double


% --- Executes during object creation, after setting all properties.
function txt_intervalo_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_intervalo_b (see GCBO)
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
