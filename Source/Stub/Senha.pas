unit Senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, jpeg, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Image4: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image5: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  xx, yy: integer;

implementation

uses Principal;

{$R *.dfm}





procedure TForm2.Image3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Edit1.Text = Form1.Senha then begin
    Hide;
    Form1.Show;
  end else
    Application.MessageBox('A senha está incorreta!', 'Erro', 16);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Label1.Caption := Form1.Caption;
end;

procedure TForm2.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const SC_DragMove = $F012;
begin
ReleaseCapture;
Form2.perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TForm2.Image5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const SC_DragMove = $F012;
begin
ReleaseCapture;
Form2.perform(WM_SysCommand, SC_DragMove, 0);
end;

end.
             