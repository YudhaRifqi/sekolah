program Sekolah;

uses
  Vcl.Forms,
  HalamanUtama in 'HalamanUtama.pas' {Form1},
  Kelas in 'Kelas.pas' {Form2},
  Siswa in 'Siswa.pas' {Form3},
  WaliKelas in 'WaliKelas.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
