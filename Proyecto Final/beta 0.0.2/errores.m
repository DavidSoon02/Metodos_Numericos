function varargout = errores(varargin)
% ERRORES MATLAB code for errores.fig
%      ERRORES, by itself, creates a new ERRORES or raises the existing
%      singleton*.
%
%      H = ERRORES returns the handle to a new ERRORES or the handle to
%      the existing singleton*.
%
%      ERRORES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ERRORES.M with the given input arguments.
%
%      ERRORES('Property','Value',...) creates a new ERRORES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before errores_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to errores_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help errores

% Last Modified by GUIDE v2.5 18-Jun-2023 19:32:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @errores_OpeningFcn, ...
                   'gui_OutputFcn',  @errores_OutputFcn, ...
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


% --- Executes just before errores is made visible.
function errores_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to errores (see VARARGIN)

% Choose default command line output for errores
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes errores wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = errores_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_valor_exacto_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_exacto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_exacto as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_exacto as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_exacto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_exacto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_aproximado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_aproximado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_aproximado as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_aproximado as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_aproximado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_aproximado (see GCBO)
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

%toma de datos de los txt
edit_valor_exacto = findobj(0, 'tag', 'txt_valor_exacto');
valor_exacto = get(edit_valor_exacto, 'String');
edit_valor_aproximado = findobj(0, 'tag', 'txt_valor_aproximado');
valor_aproximado = get(edit_valor_aproximado, 'String');

% Verificar que los campos no estén vacíos
if isempty(valor_exacto) || isempty(valor_aproximado)
    % Mostrar un mensaje de error o realizar alguna acción
    msgbox('Error: Uno o ambos campos están vacíos', 'Campos vacíos');
else
    % Cálculo del error absoluto
    error_absoluto = abs(str2double(valor_exacto) - str2double(valor_aproximado));

    % Cálculo del error relativo
    error_relativo = (error_absoluto / abs(str2double(valor_exacto))) * 100;

    %visualizar los datos en pantalla
    text_valor_absoluto= findobj(0, 'tag', 'label_valor_absoluto');
    text_valor_relativo= findobj(0, 'tag', 'label_valor_relativo'); 
    set(text_valor_absoluto, 'String', ['Error absoluto: ' num2str(error_absoluto)])
    set(text_valor_relativo, 'String', ['Error relativo: ' num2str(error_relativo) '%'])
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
