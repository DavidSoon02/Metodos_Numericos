function varargout = espacios_metricos(varargin)
% ESPACIOS_METRICOS MATLAB code for espacios_metricos.fig
%      ESPACIOS_METRICOS, by itself, creates a new ESPACIOS_METRICOS or raises the existing
%      singleton*.
%
%      H = ESPACIOS_METRICOS returns the handle to a new ESPACIOS_METRICOS or the handle to
%      the existing singleton*.
%
%      ESPACIOS_METRICOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESPACIOS_METRICOS.M with the given input arguments.
%
%      ESPACIOS_METRICOS('Property','Value',...) creates a new ESPACIOS_METRICOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before espacios_metricos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to espacios_metricos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help espacios_metricos

% Last Modified by GUIDE v2.5 04-Jul-2023 10:51:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @espacios_metricos_OpeningFcn, ...
                   'gui_OutputFcn',  @espacios_metricos_OutputFcn, ...
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


% --- Executes just before espacios_metricos is made visible.
function espacios_metricos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to espacios_metricos (see VARARGIN)

% Choose default command line output for espacios_metricos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes espacios_metricos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = espacios_metricos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_valor_x1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_x1 as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_x1 as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_y1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_y1 as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_y1 as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_y1 (see GCBO)
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
edit_x1 = findobj(0, 'tag', 'txt_valor_x1');
x1 = get(edit_x1, 'String');

edit_x2 = findobj(0, 'tag', 'txt_valor_x2');
x2 = get(edit_x2, 'String');

edit_y1 = findobj(0, 'tag', 'txt_valor_y1');
y1 = get(edit_y1, 'String');

edit_y2 = findobj(0, 'tag', 'txt_valor_y2');
y2 = get(edit_y2, 'String');

if isempty(x1) && isempty(x2) && isempty(y1) && isempty(y2)
    msgbox ("Error uno o más campos están vacíos", "Campos vacíos")
else
    v1 = [str2double(x1),str2double(y1)];
    v2 = [str2double(x2),str2double(y2)];
    dist_euclidiana = norm(v1 - v2);
    dist_manhattan = sum(abs(v1 - v2));
    text_resultado = findobj(0, 'tag', 'txt_resultado');
    set(text_resultado, 'String', ['Distancia euclidiana: ' num2str(dist_euclidiana)]);
    text_resultado2 = findobj(0, 'tag', 'txt_resultado2');
    set(text_resultado2, 'String', ['Distancia de Manhattan: ' num2str(dist_manhattan)]);
    
    % Crear una nueva figura para mostrar los resultados
    h_fig = figure;
    text(0.5, 0.9, get(text_resultado, 'String'), 'FontSize', 14, 'HorizontalAlignment', 'center');
    text(0.5, 0.7, get(text_resultado2, 'String'), 'FontSize', 14, 'HorizontalAlignment', 'center');
    title('Resultados de espacios métricos');
    axis off;

    % Guardar la figura como un archivo PDF
    nombre_archivo_pdf = 'resultados_espacios_metricos.pdf';
    print(h_fig, nombre_archivo_pdf, '-dpdf', '-bestfit');  
    close(h_fig)
end


function txt_valor_x2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_x2 as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_x2 as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_y2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor_y2 as text
%        str2double(get(hObject,'String')) returns contents of txt_valor_y2 as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
