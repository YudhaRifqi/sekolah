unit Siswa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn6: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
  end;

var
  Form3: TForm3;
  id : string;

implementation

{$R *.dfm}

uses LaporanSiswa;

{ TForm3 }

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
editbersih;
       editenable;
       BitBtn1.Enabled := false;
       BitBtn2.Enabled := true;
       BitBtn3.Enabled := false;
       BitBtn4.Enabled := false;
       BitBtn5.Enabled := true;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nis kelas harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom nisn harus diisi', mtInformation, [mbOK], 0);
    end else
    if (RadioButton1.Checked=false) and (RadioButton2.Checked=false)then
    begin
    MessageDlg('Kolom jenis kelamin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit3.Text = '' then
    begin
    MessageDlg('Kolom nama harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit4.Text = '' then
    begin
    MessageDlg('Kolom nik harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit5.Text = '' then
    begin
    MessageDlg('Kolom tempat lahir harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit6.Text = '' then
    begin
    MessageDlg('Kolom alamat harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit7.Text = '' then
    begin
    MessageDlg('Kolom telepon harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit8.Text = '' then
    begin
    MessageDlg('Kolom hp harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Append;
    ZQuery1.FieldByName('nis').AsString := Edit1.Text;
    ZQuery1.FieldByName('nisn').AsString := Edit2.Text;
    ZQuery1.FieldByName('nama_siswa').AsString := Edit3.Text;
    ZQuery1.FieldByName('nik').AsString := Edit4.Text;
    ZQuery1.FieldByName('tempat_lahir').AsString := Edit5.Text;
    ZQuery1.FieldByName('tanggal_lahir').AsDateTime := DateTimePicker1.DateTime;
    ZQuery1.FieldByName('alamat').AsString := Edit6.Text;
    ZQuery1.FieldByName('telepon').AsString := Edit7.Text;
    ZQuery1.FieldByName('hp').AsString := Edit8.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    if RadioButton1.Checked = true then
    ZQuery1.FieldByName('jenis_kelamin').AsString := RadioButton1.Caption;
    if RadioButton2.Checked = true then
    ZQuery1.FieldByName('jenis_kelamin').AsString := RadioButton2.Caption;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from siswa');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DISIMPAN');
    posisiawal;
    end;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nis kelas harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom nisn harus diisi', mtInformation, [mbOK], 0);
    end else
    if (RadioButton1.Checked=false) and (RadioButton2.Checked=false)then
    begin
    MessageDlg('Kolom jenis kelamin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit3.Text = '' then
    begin
    MessageDlg('Kolom nama harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit4.Text = '' then
    begin
    MessageDlg('Kolom nik harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit5.Text = '' then
    begin
    MessageDlg('Kolom tempat lahir harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit6.Text = '' then
    begin
    MessageDlg('Kolom alamat harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit7.Text = '' then
    begin
    MessageDlg('Kolom telepon harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit8.Text = '' then
    begin
    MessageDlg('Kolom hp harus diisi', mtInformation, [mbOK], 0);
    end else
    if (Edit1.Text = ZQuery1.Fields[1].AsString) and (Edit2.Text = ZQuery1.Fields[2].AsString)then
    begin
      ShowMessage('DATA TIDAK ADA PERUBAHAN');
      posisiawal;
    end else
    begin
    ZQuery1.Edit;
    ZQuery1.FieldByName('nis').AsString := Edit1.Text;
    ZQuery1.FieldByName('nisn').AsString := Edit2.Text;
    ZQuery1.FieldByName('nama_siswa').AsString := Edit3.Text;
    ZQuery1.FieldByName('nik').AsString := Edit4.Text;
    ZQuery1.FieldByName('tempat_lahir').AsString := Edit5.Text;
    ZQuery1.FieldByName('tanggal_lahir').AsDateTime := DateTimePicker1.DateTime;
    ZQuery1.FieldByName('alamat').AsString := Edit6.Text;
    ZQuery1.FieldByName('telepon').AsString := Edit7.Text;
    ZQuery1.FieldByName('hp').AsString := Edit8.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    if RadioButton1.Checked = true then
    ZQuery1.FieldByName('jenis_kelamin').AsString := RadioButton1.Caption;
    if RadioButton2.Checked = true then
    ZQuery1.FieldByName('jenis_kelamin').AsString := RadioButton2.Caption;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from siswa');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DIUBAH');
    posisiawal;
    end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from siswa where id="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from siswa');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
Form7.QuickRep1.Preview;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
editenable;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := true;
BitBtn4.Enabled := true;
BitBtn5.Enabled := true;
id := ZQuery1.Fields[0].AsString;
Edit1.Text := ZQuery1.FieldByName('nis').AsString;
Edit2.Text := ZQuery1.FieldByName('nisn').AsString;
Edit3.Text := ZQuery1.FieldByName('nama_siswa').AsString;
Edit4.Text := ZQuery1.FieldByName('nik').AsString;
Edit5.Text := ZQuery1.FieldByName('tempat_lahir').AsString;
DateTimePicker1.DateTime := ZQuery1.FieldByName('tanggal_lahir').AsDateTime;
Edit6.Text := ZQuery1.FieldByName('alamat').AsString;
Edit7.Text := ZQuery1.FieldByName('telepon').AsString;
Edit8.Text := ZQuery1.FieldByName('hp').AsString;
if ZQuery1.FieldByName('jenis_kelamin').AsString = 'L' then
RadioButton1.Checked := true;
if ZQuery1.FieldByName('jenis_kelamin').AsString = 'P' then
RadioButton2.Checked := true;
end;

procedure TForm3.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
RadioButton1.Checked := false;
RadioButton2.Checked := false;
Edit3.Clear;
Edit4.Clear;
Edit5.Clear;
Edit6.Clear;
Edit7.Clear;
Edit8.Clear;
end;

procedure TForm3.editenable;
begin
Edit1.Enabled := true;
Edit2.Enabled := true;
RadioButton1.Enabled := true;
RadioButton2.Enabled := true;
DateTimePicker1.Enabled := true;
Edit3.Enabled := true;
Edit4.Enabled := true;
Edit5.Enabled := true;
Edit6.Enabled := true;
Edit7.Enabled := true;
Edit8.Enabled := true;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm3.posisiawal;
begin
editbersih;
Edit1.Enabled := false;
Edit2.Enabled := false;
RadioButton1.Enabled := false;
RadioButton2.Enabled := false;
Edit3.Enabled := false;
Edit4.Enabled := false;
Edit5.Enabled := false;
Edit6.Enabled := false;
Edit7.Enabled := false;
Edit8.Enabled := false;
DateTimePicker1.Date := now;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := false;
BitBtn4.Enabled := false;
BitBtn5.Enabled := false;
end;

end.
