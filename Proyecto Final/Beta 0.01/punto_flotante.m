function varargout = punto_flotante(varargin)
% PUNTO_FLOTANTE MATLAB code for punto_flotante.fig
%      PUNTO_FLOTANTE, by itself, creates a new PUNTO_FLOTANTE or raises the existing
%      singleton*.
%
%      H = PUNTO_FLOTANTE returns the handle to a new PUNTO_FLOTANTE or the handle to
%      the existing singleton*.
%
%      PUNTO_FLOTANTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PUNTO_FLOTANTE.M with the given input arguments.
%
%      PUNTO_FLOTANTE('Property','Value',...) creates a new PUNTO_FLOTANTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before punto_flotante_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to punto_flotante_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help punto_flotante

% Last Modified by GUIDE v2.5 19-Jun-2023 22:47:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @punto_flotante_OpeningFcn, ...
                   'gui_OutputFcn',  @punto_flotante_OutputFcn, ...
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


% --- Executes just before punto_flotante is made visible.
function punto_flotante_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to punto_flotante (see VARARGIN)

% Choose default command line output for punto_flotante
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes punto_flotante wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = punto_flotante_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_numero_Callback(hObject, eventdata, handles)
% hObject    handle to txt_numero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_numero as text
%        str2double(get(hObject,'String')) returns contents of txt_numero as a double


% --- Executes during object creation, after setting all properties.
function txt_numero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_numero (see GCBO)
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
% handles    structure with handles and user data (see GUIDATA
edit_numero = findobj(0, 'tag', 'txt_numero');
numero = get(edit_numero, 'String');

if isempty(numero)
    msgbox ("Error campo vacío", "Campos vacíos")
else
    cadena = num2str(numero, '%e');
    [mantisa, exponente] = sscanf(cadena, '%f%*c%d');
    
    text_resultado = findobj(0, 'tag', 'txt_resultado');
    set(text_resultado, 'String', ['Mantisa: ' num2str(mantisa)  newline 'Exponente:' num2str(exponente)]);

end


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
principal = 'principal.fig';
uiopen(principal)
