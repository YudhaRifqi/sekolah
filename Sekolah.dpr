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
  LaporanOrangTua in 'LaporanOrangTua.pas' {Form9},
  Poin in 'Poin.pas' {Form10},
  LaporanPoin in 'LaporanPoin.pas' {Form11},
  Hubungan in 'Hubungan.pas' {Form12},
  LaporanHubungan in 'LaporanHubungan.pas' {Form13};

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
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
