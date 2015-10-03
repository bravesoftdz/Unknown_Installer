{$R ..\..\Bin\Arquivo.res}
program Unknown_Installer;

uses
  Forms,
  Principal in 'Principal.pas' {Form1},
  BancoDeDados in 'BancoDeDados.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Unknown Installer [ BETA ]';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
