{$R UAC.res}
program Stub;

uses
  Forms,
  SysUtils,
  Principal in 'Principal.pas' {Form1},
  Senha in 'Senha.pas' {Form2},
  powered in 'powered.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Unknown Installer';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.ShowMainForm := false;
  Form3.Show;
  {
  if not(Form1.Senha='') then begin
    Application.ShowMainForm := false;
    Form2.Show;
  end;
  }
  Application.Run;
end.
