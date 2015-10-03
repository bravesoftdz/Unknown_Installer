unit BancoDeDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDataModule1 = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1NomeSoft: TMemoField;
    ClientDataSet1VersaoSoft: TMemoField;
    ClientDataSet1Distribuidora: TMemoField;
    ClientDataSet1Site: TMemoField;
    ClientDataSet1DiretorioInstall: TMemoField;
    ClientDataSet1NomePasta: TMemoField;
    ClientDataSet1ArquivoPrincipal: TMemoField;
    ClientDataSet1SemPrincipal: TBooleanField;
    ClientDataSet1AbrirAposInstall: TBooleanField;
    ClientDataSet1ArquivoAposInstall: TMemoField;
    ClientDataSet1ArquivosEPastas: TMemoField;
    ClientDataSet1UsarIcone: TBooleanField;
    ClientDataSet1Licenca: TMemoField;
    ClientDataSet1Senha: TMemoField;
    ClientDataSet1LocalSaveInstall: TMemoField;
    ClientDataSet1LocalIcone: TMemoField;
    ClientDataSet1LocalArquivos: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
