unit HalamanUtama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    Data1: TMenuItem;
    Siswa1: TMenuItem;
    WaliKelas1: TMenuItem;
    Kelas1: TMenuItem;
    ZConnection1: TZConnection;
    procedure Kelas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Kelas;

procedure TForm1.Kelas1Click(Sender: TObject);
begin
Form2.Show;
end;

end.