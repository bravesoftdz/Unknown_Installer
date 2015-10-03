{


  Desenvolvido por Maickonn Richard.
  Contato: senjaxus@gmail.com

  Use e abuse destas fontes para estudos.



}

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, acPNG, jpeg, StdCtrls, Buttons, Gauges, IniFiles, ShellAPI, FileCtrl, ShlObj, ActiveX, ComObj, Registry, zLibEx, Unit_Win7Taskbar,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TInstalar = class(TThread)
  private
  public
    Cancelar: Boolean;
    procedure Execute; override;
  end;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button3: TButton;
    Button4: TButton;
    Panel4: TPanel;
    Label12: TLabel;
    Image3: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Panel5: TPanel;
    Label17: TLabel;
    Image4: TImage;
    Label18: TLabel;
    Image5: TImage;
    Label20: TLabel;
    Label21: TLabel;
    CheckBox1: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    Panel6: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Memo2: TMemo;
    Button10: TButton;
    Button11: TButton;
    Panel7: TPanel;
    Image6: TImage;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Gauge1: TGauge;
    Label28: TLabel;
    Timer1: TTimer;
    CheckBox3: TCheckBox;
    Label19: TLabel;
    Panel8: TPanel;
    Label29: TLabel;
    Image7: TImage;
    Label30: TLabel;
    CheckBox2: TCheckBox;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Cancelar_BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    Diretorio: String;

    NomeSoft, VerSoft, DistSoft, SiteSoft, DestinoInst, NomePasta, ArquivoPrincipal, AbrirArquivo, Senha: String;
    QuantidadeArquivos: Integer;

    ListaTudo, ListaPastas, ListaArquivos: TStrings;

    Instalar: TInstalar;

    IniciaInstalacao: Boolean;

    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetTemporaryDir: String;
var
  tempFolder: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function ExtrairIni(hModule: THANDLE; lpType, lpName: PChar; lParam: DWORD): BOOL; stdcall;
var
  Info, FH, BW: DWORD;
begin
  result := True;
  Info := FindResource(0, lpName, lpType);
  FH := CreateFile(PChar(GetTemporaryDir + '_Config_.ini'), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  WriteFile(FH, LockResource(LoadResource(0, Info))^, SizeOfResource(0, Info), BW, nil);
  CloseHandle(FH);
end;

function ExtrairLicenca(hModule: THANDLE; lpType, lpName: PChar; lParam: DWORD): BOOL; stdcall;
var
  Info, FH, BW: DWORD;
begin
  result := True;
  Info := FindResource(0, lpName, lpType);
  FH := CreateFile(PChar(GetTemporaryDir + '_Licenca_.txt'), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  WriteFile(FH, LockResource(LoadResource(0, Info))^, SizeOfResource(0, Info), BW, nil);
  CloseHandle(FH);
end;

function ExtrairRoteiro(hModule: THANDLE; lpType, lpName: PChar; lParam: DWORD): BOOL; stdcall;
var
  Info, FH, BW: DWORD;
begin
  result := True;
  Info := FindResource(0, lpName, lpType);
  FH := CreateFile(PChar(GetTemporaryDir + '_Roteiro_.txt'), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  WriteFile(FH, LockResource(LoadResource(0, Info))^, SizeOfResource(0, Info), BW, nil);
  CloseHandle(FH);
end;

function ExtrairArquivo(hModule: THANDLE; lpType, Local, Nome: PChar; lParam: DWORD): BOOL; stdcall;
var
  Info, FH, BW: DWORD;
begin
  result := True;
  Info := FindResource(0, Nome, lpType);
  FH := CreateFile(PChar(Local + '\' + Nome), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  WriteFile(FH, LockResource(LoadResource(0, Info))^, SizeOfResource(0, Info), BW, nil);
  CloseHandle(FH);
end;


function ExtractFileExt(App: String): String;
var
  i: Integer;
  s: String;
begin
  for i := Length(App) downto 1 do
  begin
    s := App[i] + s;
    if App[i] = '.' then
      Break;
  end;
  result := s;
end;

procedure SepararPastasArquivos(ListaCompleta, AlvoListaPastas, AlvoListaArquivos: TStrings);
var
  i: Integer;
begin
  for i := 0 to ListaCompleta.Count - 1 do
  begin
    if Pos('.', ExtractFileExt(ListaCompleta.Strings[i])) > 0 then
      AlvoListaArquivos.Add(ListaCompleta.Strings[i])
    else
      AlvoListaPastas.Add(ListaCompleta.Strings[i]);
  end;
end;

procedure CriarAtalho(ANomeArquivo, AParametros, ADiretorioInicial, ANomedoAtalho, APastaDoAtalho: string);
var
  MeuObjeto: IUnknown;
  MeuSLink: IShellLink;
  MeuPFile: IPersistFile;
  Diretorio: string;
  wNomeArquivo: WideString;
  MeuRegistro: TRegIniFile;
begin
  // Cria e instancia os objetos usados para criar o atalho
  MeuObjeto := CreateComObject(CLSID_ShellLink);
  MeuSLink := MeuObjeto as IShellLink;
  MeuPFile := MeuObjeto as IPersistFile;
  with MeuSLink do
  begin
    SetArguments(PChar(AParametros));
    SetPath(PChar(ANomeArquivo));
    SetWorkingDirectory(PChar(ADiretorioInicial));
  end;
  // Pega endereço da pasta Desktop do Windows
  MeuRegistro := TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
  Diretorio := MeuRegistro.ReadString('Shell Folders', 'Desktop', '');
  wNomeArquivo := Diretorio + '\' + ANomedoAtalho + '.lnk';
  // Cria de fato o atalho na tela
  MeuPFile.Save(PWChar(wNomeArquivo), False);
  MeuRegistro.Free;
end;

procedure CriarAtalho2(var caminho_atual, caminho_destino: string);
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  WFileName: WideString;

begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  with MySLink do
  begin
    SetArguments(PChar(caminho_atual));
    SetPath(PChar(caminho_atual));
    SetWorkingDirectory(PChar(ExtractFilePath(caminho_atual)));
  end;
  WFileName := caminho_destino;
  MyPFile.Save(PWChar(WFileName), False);
end;

function GetStartMenuDirectory: string;
  procedure FreePidl(pidl: PItemIDList);
  var
    allocator: IMalloc;
  begin
    if Succeeded(SHGetMalloc(allocator)) then
    begin
      allocator.Free(pidl);
{$IFDEF VER100}
      allocator.Release;
{$ENDIF}
    end;
  end;

var
  pidl: PItemIDList;
  buf: array [0 .. MAX_PATH] of Char;
begin
  if Succeeded(SHGetSpecialFolderLocation(Application.Handle, CSIDL_STARTMENU, pidl)) then
    SHGetPathFromIDList(pidl, buf);

  result := StrPas(buf);
  FreePidl(pidl);
end;

procedure CriaShortCut(aNome, aFileName: string; aLocation: Integer);
var
  IObject: IUnknown;
  ISLink: IShellLink;
  IPFile: IPersistFile;
  pidl: PItemIDList;
  InFolder: array [0 .. MAX_PATH] of Char;
  TargetName: String;
  LinkName, s: WideString;
begin
  TargetName := aFileName;

  IObject := CreateComObject(CLSID_ShellLink);
  ISLink := IObject as IShellLink;
  IPFile := IObject as IPersistFile;

  with ISLink do
  begin
    SetPath(PChar(TargetName));
    SetWorkingDirectory(PChar(ExtractFilePath(TargetName)));
  end;

  SHGetSpecialFolderLocation(0, aLocation, pidl);
  SHGetPathFromIDList(pidl, InFolder);

  s := InFolder;
  LinkName := s + '\' + aNome + '.LNK';

  if FileExists(LinkName) then
  else
    IPFile.Save(PWChar(LinkName), False);

end;


procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder: String);
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  Directory: String;
  WFileName: WideString;
  MyReg: TRegIniFile;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  with MySLink do
  begin
    SetArguments(PChar(Parameters));
    SetPath(PChar(FileName));
    SetWorkingDirectory(PChar(InitialDir));
  end;
  MyReg := TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
  Directory := MyReg.ReadString('Shell Folders', 'Desktop', '');
  WFileName := Directory + '\' + ShortcutName + '.lnk';
  MyPFile.Save(PWChar(WFileName), False);
  MyReg.Free;
end;

procedure Cancel;
var
  i: Integer;
begin
  for i := 0 to Form1.ListaArquivos.Count - 1 do
  begin
    DeleteFile(Form1.Edit1.Text + '\' + Form1.ListaArquivos.Strings[i]);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Panel3.BringToFront;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Panel2.BringToFront;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Button3.Enabled := True;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Button3.Enabled := False;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Panel3.BringToFront;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Panel4.BringToFront;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Panel4.BringToFront;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Panel5.BringToFront;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Panel6.BringToFront;

  Memo2.Lines.Strings[1] := ' - ' + Edit1.Text;

  if CheckBox3.Checked then
    Memo2.Lines.Strings[4] := ' - Sim'
  else
    Memo2.Lines.Strings[4] := ' - Não';

  if CheckBox1.Checked then
    Memo2.Lines.Strings[7] := ' - Sim'
  else
    Memo2.Lines.Strings[7] := ' - Não';

  Memo2.Lines.Strings[10] := intToStr(QuantidadeArquivos);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Panel5.BringToFront;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin

  if (Edit1.Text[Length(Edit1.Text)] = '\') then
    Edit1.Text := Copy(Edit1.Text, 1, Length(Edit1.Text) - 1);

  InitializeTaskbarAPI;
  Panel7.BringToFront;
  IniciaInstalacao := True;
  Instalar := TInstalar.Create;
  Instalar.FreeOnTerminate := True;

end;

procedure TForm1.Cancelar_BtnClick(Sender: TObject);
var
  buttonSelected: Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('Você tem certeza que deseja cancelar a instalação?', mtWarning, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  begin
    if IniciaInstalacao then
    begin
      Instalar.Terminate;
      Cancel;
    end;
    Application.Terminate;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin

  SysUtils.ForceDirectories(GetTemporaryDir + '\Unknown Installer\');
  ListaTudo := TStringList.Create;
  ListaPastas := TStringList.Create;
  ListaArquivos := TStringList.Create;

  ExtrairIni(0, RT_RCDATA, 'INICONFIG', 0);
  ExtrairLicenca(0, RT_RCDATA, 'LICEN', 0);
  ExtrairRoteiro(0, RT_RCDATA, 'ROTEI', 0);
  Diretorio := GetTemporaryDir + '_Config_.ini';
  Ini := TIniFile.Create(Diretorio);

  NomeSoft := Ini.ReadString('CONFIG', 'NomeSoft', 'Unnamed');
  VerSoft := Ini.ReadString('CONFIG', 'VerSoft', '1.5');
  DistSoft := Ini.ReadString('CONFIG', 'DistSoft', 'Distribuidora Lab');
  SiteSoft := Ini.ReadString('CONFIG', 'SiteSoft', 'http://www.meusite.com.br');
  DestinoInst := Ini.ReadString('CONFIG', 'DestinoInst', 'Program Files');
  NomePasta := Ini.ReadString('CONFIG', 'NomePasta', 'Unnamed Folder');
  ArquivoPrincipal := Ini.ReadString('CONFIG', 'ArquivoPrincipal', 'Meu Soft.exe');
  AbrirArquivo := Ini.ReadString('CONFIG', 'AbrirArquivo', '');
  Senha := Ini.ReadString('CONFIG', 'Senha', '');
  QuantidadeArquivos := Ini.ReadInteger('CONFIG', 'Quantidade', 0);

  // Configurar Labels do Forms
  Form1.Caption := NomeSoft + ' - Instalação';
  Label1.Caption := 'Bem-Vindo a Instalação do ' + NomeSoft;
  Label3.Caption := 'Software: ' + NomeSoft;
  Label4.Caption := 'Versão: ' + VerSoft;
  Label5.Caption := 'Site: ' + SiteSoft;
  Label19.Caption := 'Distribuidora: ' + DistSoft;

  Memo1.Lines.LoadFromFile(GetTemporaryDir + '_Licenca_.txt');

  if DestinoInst = 'ProgramFiles' then
    Edit1.Text := GetEnvironmentVariable('ProgramFiles') + '\' + NomePasta
  else
    Edit1.Text := DestinoInst;

  // Roteiro
  Gauge1.MaxValue := QuantidadeArquivos;
  Gauge1.Progress := 0;
  ListaTudo.LoadFromFile(GetTemporaryDir + '_Roteiro_.txt');
  SepararPastasArquivos(ListaTudo, ListaPastas, ListaArquivos);

  // CheckBox's
  if ArquivoPrincipal = '' then
  begin
    CheckBox1.Checked := False;
    CheckBox2.Checked := False;
    CheckBox3.Checked := False;
    CheckBox1.Enabled := False;
    CheckBox2.Enabled := False;
    CheckBox3.Enabled := False;
  end;
  //

  Panel2.BringToFront;

end;

procedure TForm1.Label5Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(SiteSoft), nil, nil, 1);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  chosenDirectory: string;
begin
  if SelectDirectory('Select a directory', '', chosenDirectory) then
  begin
    Edit1.Text := chosenDirectory + '\' + NomeSoft;
  end;

end;

{ TInstalar }

procedure DescomprimirA(arquivo: PChar; arquivoS: PChar); export; stdcall;
var
  InputStream, OutputStream: TFileStream;
  DeCompressionStream: TZDecompressionStream;
  InputFileName, OutputFileName: PChar;
begin
  try
    // Descomprimir
    InputFileName := arquivo;
    OutputFileName := arquivoS;
    InputStream := TFileStream.Create(InputFileName, fmOpenRead);
    OutputStream := TFileStream.Create(OutputFileName, fmCreate);
    DeCompressionStream := TZDecompressionStream.Create(InputStream);
    OutputStream.CopyFrom(DeCompressionStream, 0);
    DeCompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
  except
    DeCompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
  end;
end;

procedure TInstalar.Execute;
var
  i: Integer;
begin
  inherited;

  for i := 0 to Form1.ListaPastas.Count - 1 do
  begin
    if Cancelar then
      Break;

    ForceDirectories(Form1.Edit1.Text + '\' + Form1.ListaPastas.Strings[i]);

    Synchronize(
      procedure
      begin
        Form1.Gauge1.Progress := Form1.Gauge1.Progress + 1;
      end);
  end;

  For i := 0 to Form1.ListaArquivos.Count - 1 do
  begin
    if Cancelar then
      Break;

    ExtrairArquivo(0, RT_RCDATA, PChar(GetTemporaryDir + '\Unknown Installer\'), PChar(ExtractFileName(Form1.ListaArquivos.Strings[i])), 0);
    DescomprimirA(PChar(GetTemporaryDir + '\Unknown Installer\' + ExtractFileName(Form1.ListaArquivos.Strings[i])), PChar(Form1.Edit1.Text + '\' + ExtractFilePath(Form1.ListaArquivos.Strings[i]) + ExtractFileName(Form1.ListaArquivos.Strings[i])));
    // GetTemporaryDir+'\Unknown Installer\'
    DeleteFile(GetTemporaryDir + '\Unknown Installer\' + ExtractFileName(Form1.ListaArquivos.Strings[i]));

    Synchronize(
      procedure
      begin
        Form1.Gauge1.Progress := Form1.Gauge1.Progress + 1;
        SetTaskbarProgressValue(Form1.Gauge1.Progress, Form1.Gauge1.MaxValue);
      end);
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Gauge1.Progress = QuantidadeArquivos then
  begin
    Panel8.BringToFront;

    // Cria atalhos
    if Form1.CheckBox1.Checked then
    begin
      CreateShortcut(Form1.Edit1.Text + '\' + Form1.ArquivoPrincipal, '', ExtractFilePath(Form1.Edit1.Text + '\' + Form1.ArquivoPrincipal), Form1.NomeSoft, ExtractFilePath(Form1.Edit1.Text + '\' + Form1.ArquivoPrincipal));
    end;
    if CheckBox3.Checked then
      CriaShortCut(Form1.NomeSoft, Form1.Edit1.Text + '\' + Form1.ArquivoPrincipal, CSIDL_STARTMENU);
    //

    // Executa arquivo após instalar
    if not(Form1.AbrirArquivo = '') then
    begin
      ShellExecute(0, 'open', PChar(Form1.Edit1.Text + '\' + Form1.AbrirArquivo), nil, nil, 1);
    end;
    //

    Timer1.Enabled := False;
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    ShellExecute(0, 'open', PChar(Form1.Edit1.Text + '\' + ArquivoPrincipal), nil, nil, 1);

  Application.Terminate;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('Você tem certeza que deseja cancelar a instalação?', mtWarning, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  begin
    if IniciaInstalacao then
    begin
      Instalar.Terminate;
      Cancel;
    end;
    Application.Terminate;
  end
  else
    CanClose := False;

end;

end.
