function varargout = principal(varargin)
% PRINCIPAL MATLAB code for principal.fig
%      PRINCIPAL, by itself, creates a new PRINCIPAL or raises the existing
%      singleton*.
%
%      H = PRINCIPAL returns the handle to a new PRINCIPAL or the handle to
%      the existing singleton*.
%
%      PRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINCIPAL.M with the given input arguments.
%
%      PRINCIPAL('Property','Value',...) creates a new PRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before principal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to principal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help principal

% Last Modified by GUIDE v2.5 28-Aug-2023 11:15:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @principal_OpeningFcn, ...
                   'gui_OutputFcn',  @principal_OutputFcn, ...
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


% --- Executes just before principal is made visible.
function principal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to principal (see VARARGIN)

% Choose default command line output for principal
handles.output = hObject;

% Cargar la imagen
imageFileName = 'principal.png'; % Ruta de tu imagen
image = imread(imageFileName);

% Mostrar la imagen en el Axes
axes(handles.image_axes); % Cambia 'imageAxes' si usaste un Tag diferente
imshow(image);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes principal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = principal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(principal)
errores = 'errores.fig';
figura = openfig(errores);
figure(figura)


% --- Executes on button press in btn_propagacion.
function btn_propagacion_Callback(hObject, eventdata, handles)
% hObject    handle to btn_propagacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
propagacion = 'propagacion_errores.fig';
figura = openfig(propagacion);
figure(figura)


% --- Executes on button press in btn_sistemas_numeracion.
function btn_sistemas_numeracion_Callback(hObject, eventdata, handles)
% hObject    handle to btn_sistemas_numeracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
close(gcf)
sistemas = 'sistemas_numeracion.fig';
figura = openfig(sistemas);
figure(figura)


% --- Executes on button press in btn_punto_flotante.
function btn_punto_flotante_Callback(hObject, eventdata, handles)
% hObject    handle to btn_punto_flotante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
punto = 'punto_flotante.fig';
figura = openfig(punto);
figure(figura)


% --- Executes on button press in btn_teorema_bolzano.
function btn_teorema_bolzano_Callback(hObject, eventdata, handles)
% hObject    handle to btn_teorema_bolzano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
teorema = 'teorema_bolzano.fig';
figura = openfig(teorema);
figure(figura)


% --- Executes on button press in btn_metodo_biseccion.
function btn_metodo_biseccion_Callback(hObject, eventdata, handles)
% hObject    handle to btn_metodo_biseccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
metodo = 'metodo_biseccion.fig';
figura = openfig(metodo);
figure(figura)


% --- Executes on button press in btn_espacios_metricos.
function btn_espacios_metricos_Callback(hObject, eventdata, handles)
% hObject    handle to btn_espacios_metricos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
espacios = 'espacios_metricos.fig';
figura = openfig(espacios);
figure(figura)


% --- Executes on button press in btn_series_taylor.
function btn_series_taylor_Callback(hObject, eventdata, handles)
% hObject    handle to btn_series_taylor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
series = 'series_taylor.fig';
figura = openfig(series);
figure(figura)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
cuadratura = 'cuadratura_gauss.fig';
figura = openfig(cuadratura);
figure(figura)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
close(gcf)
euler = 'metodo_euler.fig';
figura = openfig(euler);
figure(figura)
