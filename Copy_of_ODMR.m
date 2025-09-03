function varargout = ODMR(varargin)
% ODMR MATLAB code for ODMR.fig
%      ODMR, by itself, creates a new ODMR or raises the existing
%      singleton*.
%
%      H = ODMR returns the handle to a new ODMR or the handle to
%      the existing singleton*.
%
%      ODMR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ODMR.M with the given input arguments.
%
%      ODMR('Property','Value',...) creates a new ODMR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ODMR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ODMR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ODMR

% Last Modified by GUIDE v2.5 24-Oct-2017 14:57:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ODMR_OpeningFcn, ...
                   'gui_OutputFcn',  @ODMR_OutputFcn, ...
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


% --- Executes just before ODMR is made visible.
function ODMR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ODMR (see VARARGIN)
handles.d=daq.createSession('ni');
addAnalogInputChannel(handles.d,'Dev1', 0, 'Voltage');
%addDigitalChannel(handles.d,'Dev1','Port0/Line0', 'OutputOnly');  %blanking channel

handles.s = serial('COM5');
handles.s.BaudRate = 9600;
handles.s.DataBits = 8;
handles.s.StopBits = 1;
handles.s.Parity = 'none';
fopen(handles.s);
% handles.s = tcpip('134.74.27.30',5025);
% fopen(handles.s);
fprintf(handles.s, ':OUTP:STAT OFF');

% Choose default command line output for ODMR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ODMR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ODMR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function StartFreq_Callback(hObject, eventdata, handles)
% hObject    handle to StartFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartFreq as text
%        str2double(get(hObject,'String')) returns contents of StartFreq as a double


% --- Executes during object creation, after setting all properties.
function StartFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
fclose(handles.s)
delete(hObject);



function EndFreq_Callback(hObject, eventdata, handles)
% hObject    handle to EndFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndFreq as text
%        str2double(get(hObject,'String')) returns contents of EndFreq as a double


% --- Executes during object creation, after setting all properties.
function EndFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Step_Callback(hObject, eventdata, handles)
% hObject    handle to Step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Step as text
%        str2double(get(hObject,'String')) returns contents of Step as a double


% --- Executes during object creation, after setting all properties.
function Step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Power_Callback(hObject, eventdata, handles)
% hObject    handle to Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Power as text
%        str2double(get(hObject,'String')) returns contents of Power as a double


% --- Executes during object creation, after setting all properties.
function Power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Stop,'Value',0)
handles.nos=str2double(get(handles.No_of_samples,'String'));
handles.sr=str2double(get(handles.Sampling_rate,'String'));
handles.st=handles.nos/handles.sr;
set(handles.Sampling_time,'String',handles.st)

handles.d.NumberOfScans=handles.nos; % Setting the no. of samples of daq
handles.d.Rate=handles.sr; % Setting sampling rate of daq

SF=get(handles.StartFreq,'String');
EF=get(handles.EndFreq,'String');
Stp=get(handles.Step,'String');
fprintf(handles.s,':SOUR:SWE:RES:ALL');  % Reset Sweep
fprintf(handles.s, ':SOUR:FREQ:MODE SWE');  % Setting the signal generator to sweep mode
fprintf(handles.s, [':SOUR:FREQ:STAR ' SF 'MHz']);
fprintf(handles.s, [':SOUR:FREQ:STOP ' EF 'MHz']);
fprintf(handles.s, [':SOUR:SWE:STEP ' Stp 'MHz']);
% fprintf(handles.s, ':SOUR:SWE:DWEL 2s');
fprintf(handles.s, 'TRIG:SWE:SOUR SING');
fprintf(handles.s, [':SOUR:POW ' get(handles.Power,'String')]);
fprintf(handles.s, ':OUTP:STAT ON');
pause(1);
N=(str2double(EF)-str2double(SF))/str2double(Stp); % No. of sweep points
M=str2double(get(handles.Average,'String')); % No. of averages

freq=[str2double(SF)+str2double(Stp):str2double(Stp):str2double(EF)];
data_m=zeros(M,N);
data_avg=zeros(M+1,N);
set(handles.Contrast,'String','0');
for m=1:M

    fprintf(handles.s, ':SOUR:SWE:FREQ:MODE STEP'); % Setting the sweep mode to single point with each trigger
    set(handles.Current_average,'String',m)
    for n=1:N
 %      outputSingleScan(handles.d,1);
        Check=get(handles.Stop,'Value');
        if Check==1
            break
        else
            fprintf(handles.s, '*TRG');
%            pause(2);
            data=handles.d.startForeground; % data acquistion with NIDAQ
            data_m(m,n)=mean(data);
        
            if m == 1
                 data_avg(m,n)=data_m(m,n);
                 plot(handles.plot1,freq(1:n),data_avg(m,1:n),'b*-')
                 xlabel('Frequency (MHz)')
                 ylabel('Voltage (V)')
            else
                 data_avg(m,n)=((m-1)*data_avg(m-1,n)+data_m(m,n))/m;
                 plot(handles.plot1,freq(1:N),data_avg(m,:),'b*-')
                 xlabel('Frequency (MHz)')
                 ylabel('Voltage (V)')
            end
            handles.voltage=data_avg(m,:);
        end
  %      outputSingleScan(handles.d,0); %blanking amplifier
    end
    cont = round(100.*(max(data_avg(m,:)) - min(data_avg(m,:)))./max(data_avg(m,:)),2);
    set(handles.Contrast,'String',cont);
    data_avg(m+1,:)=data_avg(m,:);

    if Check==1
        break
    end
 
%     pause(30);
end
fprintf(handles.s,':OUTP:STAT OFF');
SaveStructure.freq=freq';
SaveStructure.Voltage=handles.voltage';
SaveStructure.Data(:,1) = freq';
SaveStructure.Data(:,2) = handles.voltage';

SaveStructure.ParamLabels = {'Start Freq. (MHz)','End Freq. (MHz)',...
    'Freq. Step (MHz)','MW Power (dBm)','Averages'};

SaveStructure.Parameters(1,1) = str2double(get(handles.StartFreq,'String'));
SaveStructure.Parameters(1,2) = str2double(get(handles.EndFreq,'String'));
SaveStructure.Parameters(1,3) = str2double(get(handles.Step,'String'));
SaveStructure.Parameters(1,4) = str2double(get(handles.Power,'String'));
SaveStructure.Parameters(1,5) = str2double(get(handles.Average,'String'));


%mkdir('ODMRdata')
save(['C:\Users\MerilesLab3\Documents\Matlab_Software_Koti\ODMRdata\odmr'...
    datestr(now,'yyyy-mm-dd_HHMMSS') '.mat'],'SaveStructure')

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function plot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot1



function Average_Callback(hObject, eventdata, handles)
% hObject    handle to Average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Average as text
%        str2double(get(hObject,'String')) returns contents of Average as a double


% --- Executes during object creation, after setting all properties.
function Average_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function No_of_samples_Callback(hObject, eventdata, handles)
% hObject    handle to No_of_samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of No_of_samples as text
%        str2double(get(hObject,'String')) returns contents of No_of_samples as a double
handles.nos=str2double(get(hObject,'String'));
handles.sr=str2double(get(handles.Sampling_rate,'String'));
handles.st=handles.nos/handles.sr;
set(handles.Sampling_time,'String',handles.st)

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function No_of_samples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to No_of_samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sampling_rate_Callback(hObject, eventdata, handles)
% hObject    handle to Sampling_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sampling_rate as text
%        str2double(get(hObject,'String')) returns contents of Sampling_rate as a double
handles.nos=str2double(get(handles.No_of_samples,'String'));
handles.sr=str2double(get(hObject,'String'));
handles.st=handles.nos/handles.sr;
set(handles.Sampling_time,'String',handles.st)

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Sampling_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sampling_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Stop



function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Contrast as text
%        str2double(get(hObject,'String')) returns contents of Contrast as a double


% --- Executes during object creation, after setting all properties.
function Contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
