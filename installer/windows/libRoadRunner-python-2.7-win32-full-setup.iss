; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "roadrunner"
#define MyAppVersion "1.0.1"
#define MyAppPublisher "University of Washington, Seattle, WA, USA"
#define MyAppURL "http://libroadrunner.org/"
#define MyAppSetupIconFile "libroadrunner_logo_tan.ico"
#define ThisInstallerPostfix "win32-full-setup"

#define PyInstaller "python-2.7.6.msi"
#define NumpyInstaller "numpy-1.8.0-win32-superpack-python2.7.exe"
#define MatplotlibInstaller "matplotlib-1.3.1.win32-py2.7.exe"
;#define DateutilInstaller "python-dateutil-2.2.win32-py2.7.exe"
;#define PyparsingInstaller "pyparsing-2.0.1.win32-py2.7.exe"
;#define SixInstaller "six-1.5.2.win32-py2.7.exe"
#define PipInstaller "get-pip.py"

;downloads turned off, installers packaged
;#define PyInstallerURL "http://python.org/ftp/python/2.7.6/python-2.7.6.msi" 
;#define NumpyInstallerURL "http://downloads.sourceforge.net/project/numpy/NumPy/1.8.0/numpy-1.8.0-win32-superpack-python2.7.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fnumpy%2Ffiles%2FNumPy%2F&ts=1390956336&use_mirror=softlayer-ams"
;#define MatplotlibInstallerURL "https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.3.1/matplotlib-1.3.1.win32-py2.7.exe"
;#define DateutilInstallerURL "http://www.lfd.uci.edu/~gohlke/pythonlibs/#python-dateutil" ;there does not appear to be a direct URL to the file
;#define PyparsingInstallerURL "http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyparsing" The one from "http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-2.0.1/pyparsing-2.0.1.win32-py2.7.exe" did not work.
;#define SixInstaller "http://www.lfd.uci.edu/~gohlke/pythonlibs/#six"
;#define PipInstallerURL "https://raw.github.com/pypa/pip/master/contrib/get-pip.py"
 
#define Py "Python"
#define PyVer "2.7"
#define Numpy "numpy"
;#define NumpyVer "1.0"
#define Matplotlib "matplotlib"
;#define MatplotlibVer "1.0"
#define AppDir "roadrunner"
#define Pip "C:\Python27\Scripts\pip.exe"

;Used for downloader
;#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3B0C903B-773D-48DE-84D5-EA90B0BF67AE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DisableWelcomePage=yes
DefaultDirName={code:SetDefaultAppDirName}
;DefaultDirName=C:\Python27\Lib\site-packages\{#AppDir}

;enable the next line for debug only
;DisableDirPage=yes


;DefaultGroupName=libRoadRunner
DisableProgramGroupPage=yes
;LicenseFile=..\..\LICENSE.txt
;InfoBeforeFile=..\..\NOTICE.txt
DisableReadyPage=yes
;DisableFinishedPage=yes   ;finished page is good feedback
OutputDir=.
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-{#Py}-{#PyVer}-{#ThisInstallerPostfix}
SetupIconFile={#MyAppSetupIconFile}
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\..\site-packages\{#AppDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\LICENSE.TXT"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\NEWS.TXT"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\NOTICE.TXT"; DestDir: "{app}"; DestName:"NOTICE1.TXT"; Flags: ignoreversion
Source: "libRoadrunner-installer-dependencies\NOTICE.TXT"; DestDir: "{app}"; DestName:"NOTICE2.TXT"; Flags: ignoreversion
Source: "..\..\bin\iconv.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\libxml2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\zlib1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\msvcr100.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\msvcp100.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "libRoadrunner-installer-dependencies\{#MatplotlibInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist

Source: "libRoadrunner-installer-dependencies\{#PipInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist
Source: "libRoadrunner-installer-dependencies\{#NumpyInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist 
Source: "libRoadrunner-installer-dependencies\{#PyInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{tmp}\{#PipInstaller}"; Verb: "open"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized
Filename: "{#Pip}"; Parameters: "install python-dateutil"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized
Filename: "{#Pip}"; Parameters: "install pyparsing"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized
Filename: "{#Pip}"; Parameters: "install six"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized

[Code]
//////////////////////////////////////////////////////////////////////////////
const
  appDir = '{#AppDir}';
  pyReg = 'SOFTWARE\{#Py}\PythonCore\{#PyVer}\InstallPath';
  pyRegWow6443Node = 'SOFTWARE\Wow6432Node\{#Py}\PythonCore\{#PyVer}\InstallPath';

var
  installPython, installMatplot, installNumpy: Boolean;
  DefaultAppDirName: String;


//////////////////////////////////////////////////////////////////////////////
procedure ExitProcess(exitCode:integer);
  external 'ExitProcess@kernel32.dll stdcall';

//////////////////////////////////////////////////////////////////////////////
function GetPathForPythonSitePackages(): string;
var          
  InstallPath: string;
begin
  
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyReg, '', InstallPath) then
    begin
    Log('HKLM pyReg: '+ InstallPath);
    Result := InstallPath + 'Lib\site-packages\';
    end
  else
  if RegQueryStringValue(HKEY_CURRENT_USER, pyReg, '', InstallPath) then
    begin
    Log('HKCU pyReg: '+ InstallPath);
    Result := InstallPath + 'Lib\site-packages\'; 
    end
  else
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyRegWow6443Node, '', InstallPath) then
    begin
    Log('HKLM pyRegWow6443Node: '+ InstallPath);
    Result := InstallPath + 'Lib\site-packages\';
    end
  else
    begin
    MsgBox('Our installer did not find your Python installation. You need '
    + 'Python to run {#MyAppName}. In the next step use [Your Python installation'
    + ' location]\Lib\site-packages\{#AppDir} directory.',mbError,MB_OK);
    //ExitProcess(1);
    end
end;

//////////////////////////////////////////////////////////////////////////////
function IsPythonInstalled(): Boolean;
var          
  InstallPath: string; //not really used here
begin
  
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyReg, '', InstallPath) then
    begin
    Result := True;
    end
  else
  if RegQueryStringValue(HKEY_CURRENT_USER, pyReg, '', InstallPath) then
    begin
    Result := True;
    end
  else
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyRegWow6443Node, '', InstallPath) then
    begin
    Result := True;
    end
  else
    begin
    Result := False;
    end
end;

//////////////////////////////////////////////////////////////////////////////
function SetDefaultAppDirName(Value: String): String;
begin
  Result := DefaultAppDirName;
end;

//////////////////////////////////////////////////////////////////////////////
function IsInstalled(name: String): Boolean;
//function IsInstalled(name: string; version: string): boolean;  //ver not neeeded
var          
  InstallPath: string;
  reg : string;
begin
  //reg := 'Software\' + name + '\' + version
  // + '\InstallPath'
  // Log('reg Python: ' + reg)
  
  //if Numpy/ matplotlib installed - direct check for file
  InstallPath := GetPathForPythonSitePackages() + name + '/__init__.py'
  Log('install dir: ' + InstallPath)
  if FileExists(InstallPath) then
  //if RegQueryStringValue(HKEY_CURRENT_USER, reg, 'InstallPath', InstallPath) then
   //numpy doesnt have a reg entry! (also gets its install path, not used here)
    begin 
    Result := True;
    end
  else 
    begin
    Result := False;
    end;
end;

//////////////////////////////////////////////////////////////////////////////
procedure RunMsiInstaller(execName: string);
var
  ResultCode: Integer;
  ExecPath: String;
  ExecCommand: String;
begin
  ExecPath := ExpandConstant('{tmp}\') + execName;
  ExecCommand := '/i ' + ExecPath + ''; //+ ' /qb'; //qb does it silently
 
  //Check that the msi installer file is present
  if FileExists(ExecPath) then
    begin
    Log('ExecPath exists : ' + ExecPath);
    end 
  else 
    begin
    Log('ExecPath doe not exist : ' + ExecPath);
    MsgBox('Could not find ' + execName + ' installer',mbError,MB_OK);
    ExitProcess(1);
    //something went wrong: hell or high water python installer must be there
    end;
  
  //execute msi installer, otherwie error and exit
  if not ShellExec('', 'msiexec.exe', ExecCommand, '', SW_SHOWNORMAL, 
                   ewWaitUntilTerminated, ResultCode) then
      //msi exec not working
      MsgBox('Msi installer failed to run!' + #13#10 + ExecCommand + ' ' +  
             SysErrorMessage(ResultCode), mbError, MB_OK);
end;

//////////////////////////////////////////////////////////////////////////////
function InitializeSetup(): Boolean;
var
tmpPy: String;
begin
  //if python installed get path for python site-packages
  //if isInstalled('{#Py}\PythonCore','{#PyVer}') then
  if IsPythonInstalled() then
  begin
    Log('Python: ' + 'True');
    installPython := False;
    //Python must be installed, get its path
    DefaultAppDirName := GetPathForPythonSitePackages() + AppDir;
    Log('SetDefaultAppDirName: ' + DefaultAppDirName);    
  end
  else //Add Python to tmp folder [ // or download list.. ]
  begin
    Log('Python: ' + 'False');
    installPython := True;
    tmpPy := ExpandConstant('{tmp}\{#PyInstaller}');
    //FileCopy(ExpandConstant('{#PyInstaller}'), tmpPy, false);
    ExtractTemporaryFile('{#PyInstaller}')
    Log('tmpPy: '+ tmpPy);

    {//Check that the msi tmpPy installer file is present
    if FileExists(tmpPy) then
      begin
      Log('tmpPy exists : ' + tmpPy);
      end 
    else 
      begin
      Log('MSI tmpPy does not exist : ' + tmpPy);
      MsgBox('Could not find MSI' + tmpPy + ' installer',mbError,MB_OK);
      ExitProcess(1);
      //something went wrong: hell or high water python installer must be there
      end;
     }
    DefaultAppDirName := 'C:\Python27\Lib\site-packages\{#AppDir}' //pretend default path 
                                                                   //will be used when python is installed
                                                                   //not seeing another way to prepopulate
                                                                   //the Dir Destination page.
                                                                   //installing Pyton earlier not an option
                                                                   //as {tmp} was not created yet, so cant
                                                                   //extract python installer yet 
    //itd_addfile('{#PyInstallerURL}',ExpandConstant('{tmp}\{#PyInstaller}'));
    //itd_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyPython.exe',ExpandConstant('{tmp}\setup-dummyPython.exe'));
  end;

  Result := True; //Required for fwd progress, false would exist
end;

//////////////////////////////////////////////////////////////////////////////
procedure InitializeWizard();
begin
 //itd_init;  //turned off when packaging installers

  //Install Python now if needed, we want it in place before anything else is done
  if (installPython) then
     RunMsiInstaller('{#PyInstaller}');

  //Python must be installed, get its path
  DefaultAppDirName := GetPathForPythonSitePackages() + AppDir;
  Log('SetDefaultAppDirName: ' + DefaultAppDirName);

  //Check if Numpy is installed
  if IsInstalled('{#Numpy}') then
  //if IsInstalled('{#Numpy}','{#NumpyVer}') then  //ver not needed
    begin
    Log('Numpy: ' + 'True');
    installNumpy := False;
    end 
  else
    //Add Numpy to d/l list
    begin
    Log('Numpy: ' + 'False');
    installNumpy := True;

    //filecopy(ExpandConstant('{#NumpyInstaller}'),ExpandConstant('{tmp}\{#NumpyInstaller}'),false);
    ExtractTemporaryFile('{#NumpyInstaller}');

    //The following were used to test downloader srategy
    //itd_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyNump.exe',
    //            ExpandConstant('{tmp}\setup-dummyNump.exe'));
    end;
 
  //Check if Matplotlib is installed
  if IsInstalled('{#Matplotlib}') then
  //if IsInstalled('{#Matplotlib}','{#MatplotlibVer}') then   //ver not needed
    begin
    Log('Matplotlib: ' + 'True');
    installMatplot := False;
    end
  else
    //Add Matplotlib to d/l list
    begin
    Log('Matplotlib: ' + 'False');
    installMatplot := True;

    //filecopy(ExpandConstant('{#MatplotlibInstaller}'),ExpandConstant('{tmp}\{#MatplotlibInstaller}'),false);
    ExtractTemporaryFile('{#MatplotlibInstaller}');
    //ExtractTemporaryFile('{#DateutilInstaller}');
    //ExtractTemporaryFile('{#PyparsingInstaller}');
    //ExtractTemporaryFile('{#SixInstaller}');


    //The following were used to test downloader srategy
    //td_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyMatplot.exe',
    //            ExpandConstant('{tmp}\setup-dummyMatplot.exe'));
    end;

  //Downloads turned off, packaging installers.
  //Start the download after the "Ready to install" screen is shown
  //itd_downloadafter(wpReady);
end;

//////////////////////////////////////////////////////////////////////////////
procedure RunOtherInstaller(execName: string);
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\' + execName), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Other installer failed to run!' + #13#10 + execName +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end; 

//////////////////////////////////////////////////////////////////////////////
// Install Numpy and Matplotlib if mising
procedure CurStepChanged(CurStep: TSetupStep);
var 
   ResultCode: Integer;
begin
  if CurStep=ssInstall then //If on the installation step
  //Lets install those files that were downloaded for us 
    begin 
    if ForceDirectories(ExpandConstant('{app}')) then 
      begin
      Log('app: ' + ExpandConstant('{app}'));
      if (installNumpy) then                                    
        RunOtherInstaller('{#NumpyInstaller}');
      if (installMatplot) then
        begin
        RunOtherInstaller('{#MatplotlibInstaller}');
        //RunOtherInstaller('{#DateutilInstaller}');
        //RunOtherInstaller('{#PyparsingInstaller}');
        //RunOtherInstaller('{#SixInstaller}');
        end;
      end;
    end;
end;