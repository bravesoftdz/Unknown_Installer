unit powered;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Principal, Senha;

{$R *.dfm}

procedure TForm3.Timer1Timer(Sender: TObject);
begin
    Form1.Show;
    Hide;
    Timer1.Enabled := false;
end;

end.
