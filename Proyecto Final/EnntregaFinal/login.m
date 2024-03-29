function varargout = login(varargin)
% LOGIN MATLAB code for login.fig
%      LOGIN, by itself, creates a new LOGIN or raises the existing
%      singleton*.
%
%      H = LOGIN returns the handle to a new LOGIN or the handle to
%      the existing singleton*.
%
%      LOGIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGIN.M with the given input arguments.
%
%      LOGIN('Property','Value',...) creates a new LOGIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before login_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to login_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help login

% Last Modified by GUIDE v2.5 17-Jun-2023 18:18:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @login_OpeningFcn, ...
                   'gui_OutputFcn',  @login_OutputFcn, ...
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


% --- Executes just before login is made visible.
function login_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to login (see VARARGIN)

% Choose default command line output for login
handles.output = hObject;

imageFileName = 'login.png'; % Ruta de tu imagen
image = imread(imageFileName);

% Mostrar la imagen en el Axes
axes(handles.image_axes); % Cambia 'imageAxes' si usaste un Tag diferente
imshow(image);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes login wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = login_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_user_Callback(hObject, eventdata, handles)
% hObject    handle to txt_user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_user as text
%        str2double(get(hObject,'String')) returns contents of txt_user as a double


% --- Executes during object creation, after setting all properties.
function txt_user_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_password_Callback(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_password as text
%        str2double(get(hObject,'String')) returns contents of txt_password as a double


% --- Executes during object creation, after setting all properties.
function txt_password_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_login.
function btn_login_Callback(hObject, eventdata, handles)
% hObject    handle to btn_login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
username = get(handles.txt_user, 'String');
password = get(handles.txt_password, 'String');

if strcmp(username, 'admin') && strcmp(password, 'admin')
    %Abrir formulario
    close(login);
    rutaFormulario = 'principal.fig';
    figura = openfig(rutaFormulario);
    figure(figura)
else
    % Acceso denegado
    msgbox('Nombre de usuario o contraseña incorrectos', 'Error');
end
