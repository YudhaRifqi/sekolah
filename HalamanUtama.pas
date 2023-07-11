unit HalamanUtama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection, Vcl.StdCtrls;

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
    Label1: TLabel;
    OrangTua1: TMenuItem;
    Poin1: TMenuItem;
    Menu1: TMenuItem;
    Hubungan1: TMenuItem;
    Semester1: TMenuItem;
    User1: TMenuItem;
    Keluar1: TMenuItem;
    procedure Kelas1Click(Sender: TObject);
    procedure Siswa1Click(Sender: TObject);
    procedure WaliKelas1Click(Sender: TObject);
    procedure OrangTua1Click(Sender: TObject);
    procedure Poin1Click(Sender: TObject);
    procedure Hubungan1Click(Sender: TObject);
    procedure User1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Semester1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Kelas, Siswa, WaliKelas, OrangTua, LaporanOrangTua, Poin, Hubungan, User,
  Login, Semester;

procedure TForm1.Hubungan1Click(Sender: TObject);
begin
Form12.Show;
end;

procedure TForm1.Kelas1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.Keluar1Click(Sender: TObject);
begin
if Application.MessageBox('Benarkah Anda Akan Keluar Dari Aplikasi?', 'Konfirmasi', 4+32)=6
then Application.Terminate;
end;

procedure TForm1.Login1Click(Sender: TObject);
begin
Form16.Show;
end;

procedure TForm1.Logout1Click(Sender: TObject);
begin
if MessageDlg('Logout?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  Form1.Data1.Enabled := false;
  Form1.Menu1.Enabled := false;
  Form1.logout1.Enabled := false;
  Form1.Login1.Enabled := true;
end;
end;

procedure TForm1.OrangTua1Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TForm1.Poin1Click(Sender: TObject);
begin
Form10.Show;
end;

procedure TForm1.Semester1Click(Sender: TObject);
begin
Form17.Show;
end;

procedure TForm1.Siswa1Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.User1Click(Sender: TObject);
begin
Form14.Show;
end;

procedure TForm1.WaliKelas1Click(Sender: TObject);
begin
Form4.Show;
end;

end.
