{


  Desenvolvido por Maickonn Richard.
  Contato: senjaxus@gmail.com

  Use e abuse destas fontes para estudos.



}

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FileCtrl, ExtDlgs, IniFiles, zLibEx, Unit_Win7Taskbar,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, IconChangerUnit, MidasLib;

type
  TInserirArquivos = class(TThread)
  private
  public
    procedure Execute; override;
    procedure InserirArquivos(Lista: TStrings; Progresso: TProgressBar);
  end;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    TabSheet4: TTabSheet;
    Label8: TLabel;
    Edit7: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ListBox1: TListBox;
    Button2: TButton;
    TabSheet5: TTabSheet;
    CheckBox2: TCheckBox;
    Image1: TImage;
    Button3: TButton;
    TabSheet6: TTabSheet;
    Edit8: TEdit;
    CheckBox3: TCheckBox;
    Memo2: TMemo;
    Label9: TLabel;
    TabSheet7: TTabSheet;
    Label10: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    Label13: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SaveDialog1: TSaveDialog;
    Label14: TLabel;
    ProgressBar1: TProgressBar;
    Label15: TLabel;
    Label16: TLabel;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    S1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenDialog2: TOpenDialog;
    SaveDialog2: TSaveDialog;
    PopupMenu1: TPopupMenu;
    R1: TMenuItem;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Local, SaveL: String;
    ConfigInst: TIniFile;
    ListaTudo, ListaPastas, ListaArquivos: TStrings;
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  LocalStub = '\Stub\Stub.exe';

implementation

{$R *.dfm}

uses BancoDeDados;

procedure CarregarAlteracoes(LocalParaCarregar: string);
begin
  try

    DataModule1.ClientDataSet1.LoadFromFile(LocalParaCarregar);
    DataModule1.ClientDataSet1.LogChanges := false;

    with Form1 do
    begin

      Edit1.Text := DataModule1.ClientDataSet1.FieldByName('NomeSoft').Value;
      Edit2.Text := DataModule1.ClientDataSet1.FieldByName('VersaoSoft').Value;
      Edit3.Text := DataModule1.ClientDataSet1.FieldByName('Distribuidora').Value;
      Edit4.Text := DataModule1.ClientDataSet1.FieldByName('Site').Value;
      if not(DataModule1.ClientDataSet1.FieldByName('DiretorioInstall').Value = '') then
      begin
        Edit5.Text := DataModule1.ClientDataSet1.FieldByName('DiretorioInstall').Value;
        ComboBox1.ItemIndex := 1;
        Edit5.Enabled := true;
      end;
      Edit6.Text := DataModule1.ClientDataSet1.FieldByName('NomePasta').Value;
      Edit7.Text := DataModule1.ClientDataSet1.FieldByName('ArquivoPrincipal').Value;
      CheckBox1.Checked := DataModule1.ClientDataSet1.FieldByName('SemPrincipal').Value;
      CheckBox3.Checked := DataModule1.ClientDataSet1.FieldByName('AbrirAposInstall').Value;
      Edit8.Text := DataModule1.ClientDataSet1.FieldByName('ArquivoAposInstall').Value;

      ListBox1.Items.Text := DataModule1.ClientDataSet1.FieldByName('ArquivosEPastas').Value;
      ListaTudo.Text := DataModule1.ClientDataSet1.FieldByName('LocalArquivos').Value;

      CheckBox2.Checked := DataModule1.ClientDataSet1.FieldByName('UsarIcone').Value;
      Edit11.Text := DataModule1.ClientDataSet1.FieldByName('LocalIcone').Value;
      Memo2.Lines.Text := DataModule1.ClientDataSet1.FieldByName('Licenca').Value;
      Edit9.Text := DataModule1.ClientDataSet1.FieldByName('Senha').Value;
      Edit12.Text := DataModule1.ClientDataSet1.FieldByName('LocalSaveInstall').Value;

      DataModule1.ClientDataSet1.First;
      DataModule1.ClientDataSet1.Delete;

    end;

    Application.MessageBox('Alterações carregadas com sucesso!', 'Aviso', 64);
  except
    Application.MessageBox('Não foi possível carregar as alterações!', 'Erro', 16);

  end;

end;

procedure SalvarConfiguracoes(LocalParaSalvar: String);
begin
  try
    with DataModule1 do
    begin

      ClientDataSet1.LogChanges := false;
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('NomeSoft').Value := Form1.Edit1.Text;
      ClientDataSet1.FieldByName('VersaoSoft').Value := Form1.Edit2.Text;
      ClientDataSet1.FieldByName('Distribuidora').Value := Form1.Edit3.Text;
      ClientDataSet1.FieldByName('Site').Value := Form1.Edit4.Text;
      ClientDataSet1.FieldByName('DiretorioInstall').Value := Form1.Edit5.Text;
      ClientDataSet1.FieldByName('NomePasta').Value := Form1.Edit6.Text;
      ClientDataSet1.FieldByName('ArquivoPrincipal').Value := Form1.Edit7.Text;
      ClientDataSet1.FieldByName('SemPrincipal').Value := Form1.CheckBox1.Checked;
      ClientDataSet1.FieldByName('AbrirAposInstall').Value := Form1.CheckBox3.Checked;
      ClientDataSet1.FieldByName('ArquivoAposInstall').Value := Form1.Edit8.Text;
      ClientDataSet1.FieldByName('LocalArquivos').Value := Form1.ListaTudo.Text;
      ClientDataSet1.FieldByName('ArquivosEPastas').Value := Form1.ListBox1.Items.Text;
      ClientDataSet1.FieldByName('UsarIcone').Value := Form1.CheckBox2.Checked;
      ClientDataSet1.FieldByName('LocalIcone').Value := Form1.Edit11.Text;
      ClientDataSet1.FieldByName('Licenca').Value := Form1.Memo2.Lines.Text;
      ClientDataSet1.FieldByName('Senha').Value := Form1.Edit9.Text;
      ClientDataSet1.FieldByName('LocalSaveInstall').Value := Form1.Edit12.Text;

      ClientDataSet1.SaveToFile(LocalParaSalvar);
      ClientDataSet1.Delete;

      Application.MessageBox('Alterações salvas com sucesso!', 'Unknown Installer', 64);

    end;
  except
    Application.MessageBox('Não foi possível salvar as alterações!', 'Erro', 16);
  end;
end;

procedure extrairStub(Local: String);
var
  Fres: TResourceStream;
  fFile: TFileStream;
begin
  { Cria uma instância de TResourceStream para manipulá-lo mais tarde }
  Fres := TResourceStream.Create(0, 'STUB01', RT_RCDATA);
  { Cria em memória o arquivo gravado no Resource }
  fFile := TFileStream.Create(Local, fmCreate);
  try
    { Copia do Resource }
    fFile.CopyFrom(Fres, Fres.Size);
  finally
    { Libera as variáveis necessárias. }
    Fres.Free;
    fFile.Free;
  end;
end;

procedure ComprimirA(arquivo: PChar; arquivoS: PChar; metodo: Integer); export; stdcall;
var
  InputStream, OutputStream: TFileStream;
  CompressionStream: TZCompressionStream;
  InputFileName, OutputFileName: PChar;
begin
  try
    // Comprime
    InputFileName := arquivo;
    OutputFileName := arquivoS;
    InputStream := TFileStream.Create(InputFileName, fmOpenRead);
    OutputStream := TFileStream.Create(OutputFileName, fmCreate);
    case metodo of
      0:
        CompressionStream := TZCompressionStream.Create(OutputStream, zcFastest);
      1:
        CompressionStream := TZCompressionStream.Create(OutputStream, zcDefault);
      2:
        CompressionStream := TZCompressionStream.Create(OutputStream, zcMax);
    end;
    CompressionStream.CopyFrom(InputStream, InputStream.Size);
    CompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
  except
    CompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
  end;
end;

procedure InserirIni;
var
  H, FH, Size, BR: DWORD;
  Local: String;
  Buf: Pointer;
begin
  Local := ExtractFilePath(ParamStr(0));
  H := BeginUpdateResource(PChar(Form1.SaveL), false);
  FH := CreateFile(PChar(Local + '_Config_.ini'), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Size := GetFileSize(FH, nil);
  GetMem(Buf, Size);
  ReadFile(FH, Buf^, Size, BR, nil);
  CloseHandle(FH);
  UpdateResource(H, RT_RCDATA, PChar(UpperCase('INICONFIG')), 0, Buf, Size);
  FreeMem(Buf);
  EndUpdateResource(H, false);
end;

procedure InserirLicenca;
var
  H, FH, Size, BR: DWORD;
  Local: String;
  Buf: Pointer;
begin
  Local := ExtractFilePath(ParamStr(0));
  H := BeginUpdateResource(PChar(Form1.SaveL), false);
  FH := CreateFile(PChar(Local + '_Licença_.txt'), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Size := GetFileSize(FH, nil);
  GetMem(Buf, Size);
  ReadFile(FH, Buf^, Size, BR, nil);
  CloseHandle(FH);
  UpdateResource(H, RT_RCDATA, PChar(UpperCase('LICEN')), 0, Buf, Size);
  FreeMem(Buf);
  EndUpdateResource(H, false);
end;

procedure InserirRoteiro;
var
  H, FH, Size, BR: DWORD;
  Local: String;
  Buf: Pointer;
begin
  Local := ExtractFilePath(ParamStr(0));
  H := BeginUpdateResource(PChar(Form1.SaveL), false);
  FH := CreateFile(PChar(Local + '_Roteiro_.txt'), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Size := GetFileSize(FH, nil);
  GetMem(Buf, Size);
  ReadFile(FH, Buf^, Size, BR, nil);
  CloseHandle(FH);
  UpdateResource(H, RT_RCDATA, PChar(UpperCase('ROTEI')), 0, Buf, Size);
  FreeMem(Buf);
  EndUpdateResource(H, false);
end;

function ExtractFileExt(App: String): String;
var
  I: Integer;
  s: String;
begin
  for I := Length(App) downto 1 do
  begin
    s := App[I] + s;
    if App[I] = '.' then
      Break;
  end;
  Result := s;
end;

procedure SepararPastasArquivos(ListaCompleta, AlvoListaPastas, AlvoListaArquivos: TStrings);
var
  I: Integer;
begin
  AlvoListaPastas.Clear;
  AlvoListaArquivos.Clear;
  for I := 0 to ListaCompleta.Count - 1 do
  begin
    if Pos('.', ExtractFileExt(ListaCompleta.Strings[I])) > 0 then
      AlvoListaArquivos.Add(ListaCompleta.Strings[I])
    else
      AlvoListaPastas.Add(ListaCompleta.Strings[I]);
  end;
end;

function GetTemporaryDir: String;
var
  tempFolder: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  Result := StrPas(tempFolder);
end;

procedure TInserirArquivos.InserirArquivos(Lista: TStrings; Progresso: TProgressBar);
var
  I: Integer;
  H, FH, Size, BR: DWORD;
  Local: String;
  Buf: Pointer;
begin
  Local := ExtractFilePath(ParamStr(0));

  Synchronize(
    procedure
    begin
      Progresso.Max := Lista.Count - 1;
    end);

  SysUtils.ForceDirectories(GetTemporaryDir + '\Unknown Installer\');

  for I := 0 to Lista.Count - 1 do
  begin
    if Pos('.', ExtractFileExt(Lista.Strings[I])) > 0 then
    begin
      Synchronize(
        procedure
        begin
          Form1.Label14.Caption := 'Progresso: [ ' + intToStr(I + 1) + ' / ' + intToStr(Lista.Count) + ' ]';
          Form1.Label15.Caption := 'Comprimindo e injetando o arquivo: ' + ExtractFileName(Lista.Strings[I]);
          Application.ProcessMessages;
        end);
      ComprimirA(PChar(Lista.Strings[I]), PChar(GetTemporaryDir + '\Unknown Installer\' + ExtractFileName(Lista.Strings[I])), 2);
      H := BeginUpdateResource(PChar(Form1.SaveL), false);
      FH := CreateFile(PChar(GetTemporaryDir + '\Unknown Installer\' + ExtractFileName(Lista.Strings[I])), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
      Size := GetFileSize(FH, nil);
      GetMem(Buf, Size);
      ReadFile(FH, Buf^, Size, BR, nil);
      CloseHandle(FH);
      UpdateResource(H, RT_RCDATA, PChar(ExtractFileName(Lista.Strings[I])), 0, Buf, Size);
      FreeMem(Buf);
      EndUpdateResource(H, false);

      Synchronize(
        procedure
        begin
          Progresso.Position := I;
          SetTaskbarProgressValue(I, Progresso.Max);
          Application.ProcessMessages;
        end);

      DeleteFile(GetTemporaryDir + '\Unknown Installer\' + ExtractFileName(Lista.Strings[I]));
    end;
  end;

  RenameFile(Form1.SaveL, Form1.Edit12.Text);

  Synchronize(
    procedure
    begin
      Form1.Label15.Caption := 'Instalador Compilado com Sucesso!';
      SetTaskbarProgressValue(0, Progresso.Max);
      FlashWindow(Application.Handle, true);
      Application.MessageBox('Seu instalador foi compilado com sucesso!', 'Aviso', 64);
    end);
end;

procedure ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(Path + SR.Name);
      end
      else
        until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  end;

  procedure GetSubDirectories(const directory: string; list: TStrings);
  var
    SR: TSearchRec;
  begin
    try
      if FindFirst(IncludeTrailingPathDelimiter(directory) + '*.*', faDirectory, SR) < 0 then
        Exit
      else
        repeat
          if ((SR.Attr and faDirectory <> 0) AND (SR.Name <> '.') AND (SR.Name <> '..')) then
            list.Add(IncludeTrailingPathDelimiter(directory) + SR.Name);
        until FindNext(SR) <> 0;
    finally
      SysUtils.FindClose(SR);
    end;
  end;

  procedure AddAllFilesInDir(const Dir: string; list: TStrings);
  var
    SR: TSearchRec;
  begin
    if FindFirst(IncludeTrailingBackslash(Dir) + '*.*', faAnyFile or faDirectory, SR) = 0 then
      try
        repeat
          if (SR.Attr and faDirectory) = 0 then
            list.Add(SR.Name)
          else if (SR.Name <> '.') and (SR.Name <> '..') then
            AddAllFilesInDir(IncludeTrailingBackslash(Dir) + SR.Name, list); // recursive call!
        until FindNext(SR) <> 0;
      finally
        FindClose(SR);
      end;
  end;

  procedure ListarTudo(const diretorio: String; Lista, Lista2: TStrings);
  var
    Dirs, Files: TStrings;
    I: Integer;
  begin
    Dirs := TStringList.Create;
    Files := TStringList.Create;
    GetSubDirectories(diretorio, Dirs);
    for I := 0 to Dirs.Count - 1 do
    begin
      ListFileDir(Dirs.Strings[I] + '\', Files);
    end;
    Lista.Text := Dirs.Text;
    Lista2.Text := Files.Text;

  end;

  procedure GetAllSubFolders(sPath: String; list: TStrings);
  var
    Path: String;
    Rec: TSearchRec;
  begin
    try
      Path := IncludeTrailingBackslash(sPath);
      if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
        try
          repeat
            if (Rec.Name <> '.') and (Rec.Name <> '..') then
            begin
              list.Add(Path + Rec.Name);
              GetAllSubFolders(Path + Rec.Name, list);
            end;
          until FindNext(Rec) <> 0;
        finally
          FindClose(Rec);
        end;
    except
      Exit;
    end;
  end;

  procedure TForm1.ComboBox1Change(Sender: TObject);
  begin
    if ComboBox1.ItemIndex = 0 then
    begin
      Edit5.Enabled := false;
      Edit6.Enabled := true;
    end
    else
    begin
      Edit5.Enabled := true;
      Edit6.Enabled := false;
    end;
  end;

  procedure TForm1.Button1Click(Sender: TObject);
  begin
    if OpenDialog1.Execute then
      Edit7.Text := OpenDialog1.FileName;
  end;

  procedure TForm1.Button2Click(Sender: TObject);
  var
    chosenDirectory, linha: string;
    I: Integer;
  begin
    if SelectDirectory('Select a directory', '', chosenDirectory) then
    begin
      ListBox1.Clear;

      GetAllSubFolders(chosenDirectory, ListBox1.Items);
      ListaTudo.Text := ListBox1.Items.Text;

      for I := 0 to ListBox1.Items.Count - 1 do
      begin
        linha := ListBox1.Items.Strings[I];
        Delete(linha, 1, Length(chosenDirectory) + 1);
        ListBox1.Items.Strings[I] := linha;
      end;

    end;

    Label16.Caption := 'Quantidade de Arquivos+Pastas: ' + intToStr(ListBox1.Items.Count);
  end;

  procedure TForm1.Button3Click(Sender: TObject);
  begin
    if OpenPictureDialog1.Execute then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      Edit11.Text := OpenPictureDialog1.FileName;
    end;
  end;

  procedure TForm1.Button4Click(Sender: TObject);
  begin
    if SaveDialog1.Execute then
    begin
      Edit12.Text := SaveDialog1.FileName + '.exe';
    end;
  end;

  procedure TForm1.FormCreate(Sender: TObject);
  begin
    Local := ExtractFilePath(ParamStr(0));
    ListaTudo := TStringList.Create;
    ListaPastas := TStringList.Create;
    ListaArquivos := TStringList.Create;
    OpenDialog1.InitialDir := Local;
    OpenDialog2.InitialDir := Local;
    PageControl1.Pages[0].Show;
  end;

  procedure TForm1.N1Click(Sender: TObject);
  begin
    if (OpenDialog2.Execute()) then
    begin
      CarregarAlteracoes(OpenDialog2.FileName);
    end;
  end;

  procedure TForm1.R1Click(Sender: TObject);
  begin
    if ListBox1.ItemIndex < 0 then
      Exit;

    ListaTudo.Delete(ListBox1.ItemIndex);
    ListBox1.DeleteSelected;
  end;

  procedure TForm1.S1Click(Sender: TObject);
  begin
    if (SaveDialog2.Execute()) then
    begin
      SalvarConfiguracoes(SaveDialog2.FileName + '.unkconfig'); // unkconfig

    end;

  end;

  procedure TForm1.Button6Click(Sender: TObject);
  begin
    if (SaveDialog2.Execute()) then
    begin
      DataModule1.ClientDataSet1.LoadFromFile(SaveDialog2.FileName + '.xml');

    end;
  end;

  procedure TForm1.Button5Click(Sender: TObject);
  var
    Inserir: TInserirArquivos;
  begin
    if (Edit9.Text = Edit10.Text) and (not(Trim(Edit12.Text) = '')) then
    begin
      if (FileExists(Edit12.Text)) then
        DeleteFile(Edit12.Text);

      SaveL := Copy(Form1.Edit12.Text, 1, Length(Form1.Edit12.Text) - 4) + '.UnkIns';
      InitializeTaskbarAPI;
      // CopyFile(PChar(Local+'Stub.exe'), PChar(SaveL), true);
      if (FileExists(SaveL)) then
        DeleteFile(SaveL);

      extrairStub(SaveL);
      if (CheckBox2.Checked) and (not(Edit11.Text = '')) then
        ChangeExeIcon(SaveL, 'MAINICON', Edit11.Text);

      ConfigInst := TIniFile.Create(Local + '\_Config_.ini');

      ConfigInst.WriteString('CONFIG', 'NomeSoft', Edit1.Text);
      ConfigInst.WriteString('CONFIG', 'VerSoft', Edit2.Text);
      ConfigInst.WriteString('CONFIG', 'DistSoft', Edit3.Text);
      ConfigInst.WriteString('CONFIG', 'SiteSoft', Edit4.Text);

      if ComboBox1.ItemIndex = 0 then
        ConfigInst.WriteString('CONFIG', 'DestinoInst', 'ProgramFiles')
      else
        ConfigInst.WriteString('CONFIG', 'DestinoInst', Edit5.Text);

      ConfigInst.WriteString('CONFIG', 'NomePasta', Edit6.Text);

      if CheckBox1.Checked then
        ConfigInst.WriteString('CONFIG', 'ArquivoPrincipal', '')
      else
        ConfigInst.WriteString('CONFIG', 'ArquivoPrincipal', ExtractFileName(Edit7.Text));

      if CheckBox3.Checked then
        ConfigInst.WriteString('CONFIG', 'AbrirArquivo', Edit8.Text)
      else
        ConfigInst.WriteString('CONFIG', 'AbrirArquivo', '');

      ConfigInst.WriteString('CONFIG', 'Senha', Edit9.Text);

      SepararPastasArquivos(ListaTudo, ListaPastas, ListaArquivos);

      ConfigInst.WriteInteger('CONFIG', 'Quantidade', ListaTudo.Count);

      ConfigInst.Free;

      Memo2.Lines.SaveToFile(Local + '\_Licença_.txt');

      ListBox1.Items.SaveToFile(Local + '\_Roteiro_.txt');

      Inserir := TInserirArquivos.Create;
      Inserir.FreeOnTerminate := true;

    end
    else
      Application.MessageBox('Não foi possível compilar o Instalador!', 'Erro', 16);

  end;

  { TInserirArquivos }

  procedure TInserirArquivos.Execute;
  begin
    inherited;

    InserirIni;
    InserirLicenca;
    InserirRoteiro;
    DeleteFile(Form1.Local + '\_Config_.ini');
    DeleteFile(Form1.Local + '_Roteiro_.txt');
    DeleteFile(Form1.Local + '\_Licença_.txt');
    Form1.PageControl1.Enabled := false;
    InserirArquivos(Form1.ListaArquivos, Form1.ProgressBar1);
    Form1.PageControl1.Enabled := true;
  end;

end.
