function varargout = sistemas_numeracion(varargin)
% SISTEMAS_NUMERACION MATLAB code for sistemas_numeracion.fig
%      SISTEMAS_NUMERACION, by itself, creates a new SISTEMAS_NUMERACION or raises the existing
%      singleton*.
%
%      H = SISTEMAS_NUMERACION returns the handle to a new SISTEMAS_NUMERACION or the handle to
%      the existing singleton*.
%
%      SISTEMAS_NUMERACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SISTEMAS_NUMERACION.M with the given input arguments.
%
%      SISTEMAS_NUMERACION('Property','Value',...) creates a new SISTEMAS_NUMERACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sistemas_numeracion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sistemas_numeracion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sistemas_numeracion

% Last Modified by GUIDE v2.5 19-Jun-2023 22:32:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sistemas_numeracion_OpeningFcn, ...
                   'gui_OutputFcn',  @sistemas_numeracion_OutputFcn, ...
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


% --- Executes just before sistemas_numeracion is made visible.
function sistemas_numeracion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sistemas_numeracion (see VARARGIN)

% Choose default command line output for sistemas_numeracion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sistemas_numeracion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sistemas_numeracion_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in btn_binario_decimal.
function btn_binario_decimal_Callback(hObject, eventdata, handles)
% hObject    handle to btn_binario_decimal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
edit_numero = findobj(0, 'tag', 'txt_numero');
numero = get(edit_numero, 'String');

esBinario = ~isempty(regexp(numero, '^[01]+$'));

if isempty(numero)
    msgbox ("Error campo vacío", "Campos vacíos")
else
    if esBinario
        % Calcula el número de dígitos en el número binario
        numDigitos = numel(numero);

        % Inicializa la variable "decimal" a cero
        decimal = 0;

        % Recorre los dígitos del número binario
        for i = 1:numDigitos
            % Obtiene el dígito actual
            digito = str2double(numero(i));

            % Calcula el valor decimal correspondiente al dígito binario
            valorDecimal = digito * 2^(numDigitos - i);

            % Suma el valor decimal a la variable "decimal"
            decimal = decimal + valorDecimal;
        end

        text_resultado = findobj(0, 'tag', 'txt_resultado');
        set(text_resultado, 'String', ['Decimal: ' num2str(decimal)]);

    else
       msgbox("El número no es binario", "Número no binario") 
    end
end



% --- Executes on button press in btn_decimal_binario.
function btn_decimal_binario_Callback(hObject, eventdata, handles)
% hObject    handle to btn_decimal_binario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit_numero = findobj(0, 'tag', 'txt_numero');
numero = get(edit_numero, 'String');

if isempty(numero)
    msgbox ("Error campo vacío", "Campos vacíos")
else
    % Verifica que el número sea un entero positivo
    if isnumeric(str2num(numero)) && isscalar(str2num(numero)) && str2num(numero) > 0
        
        % Convierte el decimal a binario
        binVal = decimalToBinaryVector(str2num(numero));

        % Imprime el resultado
        text_resultado = findobj(0, 'tag', 'txt_resultado');
        set(text_resultado, 'String', ['Binario: ' num2str(binVal)]);
    else
        disp('El número no es un entero positivo');
    end
end


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
principal = 'principal.fig';
uiopen(principal)
