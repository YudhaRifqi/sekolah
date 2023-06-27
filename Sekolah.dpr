program Sekolah;

uses
  Vcl.Forms,
  HalamanUtama in 'HalamanUtama.pas' {Form1},
  Kelas in 'Kelas.pas' {Form2},
  Siswa in 'Siswa.pas' {Form3},
  WaliKelas in 'WaliKelas.pas' {Form4},
  LaporanKelas in 'LaporanKelas.pas' {Form5},
  LaporanWaliKelas in 'LaporanWaliKelas.pas' {Form6},
  LaporanSiswa in 'LaporanSiswa.pas' {Form7},
  OrangTua in 'OrangTua.pas' {Form8},
  LaporanOrangTua in 'LaporanOrangTua.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
