unit WaliKelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit6: TEdit;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
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
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  id : string;

implementation

{$R *.dfm}

uses LaporanWaliKelas;

{ TForm4 }

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
editbersih;
       editenable;
       BitBtn1.Enabled := false;
       BitBtn2.Enabled := true;
       BitBtn3.Enabled := false;
       BitBtn4.Enabled := false;
       BitBtn5.Enabled := true;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nama kelas harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if (RadioButton1.Checked=false) and (RadioButton2.Checked=false)then
    begin
    MessageDlg('Kolom jenis kelamin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit3.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit4.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit5.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit6.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Append;
    ZQuery1.FieldByName('nip/nik').AsString := Edit1.Text;
    ZQuery1.FieldByName('nama').AsString := Edit2.Text;
    ZQuery1.FieldByName('pendidikan').AsString := Edit3.Text;
    ZQuery1.FieldByName('telepon').AsString := Edit4.Text;
    ZQuery1.FieldByName('matpel').AsString := Edit5.Text;
    ZQuery1.FieldByName('alamat').AsString := Edit6.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    if RadioButton1.Checked = true then
    ZQuery1.FieldByName('jk').AsString := RadioButton1.Caption;
    if RadioButton2.Checked = true then
    ZQuery1.FieldByName('jk').AsString := RadioButton2.Caption;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from wali_kelas');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DISIMPAN');
    posisiawal;
    end;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nama kelas harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if (RadioButton1.Checked=false) and (RadioButton2.Checked=false)then
    begin
    MessageDlg('Kolom jenis kelamin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit3.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit4.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit5.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit6.Text = '' then
    begin
    MessageDlg('Kolom jurusan harus diisi', mtInformation, [mbOK], 0);
    end else
    if (Edit1.Text = ZQuery1.Fields[1].AsString) and (Edit2.Text = ZQuery1.Fields[2].AsString)then
    begin
      ShowMessage('DATA TIDAK ADA PERUBAHAN');
      posisiawal;
    end else
    begin
    ZQuery1.Edit;
    ZQuery1.FieldByName('nip/nik').AsString := Edit1.Text;
    ZQuery1.FieldByName('nama').AsString := Edit2.Text;
    ZQuery1.FieldByName('pendidikan').AsString := Edit3.Text;
    ZQuery1.FieldByName('telepon').AsString := Edit4.Text;
    ZQuery1.FieldByName('matpel').AsString := Edit5.Text;
    ZQuery1.FieldByName('alamat').AsString := Edit6.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    if RadioButton1.Checked = true then
    ZQuery1.FieldByName('jk').AsString := RadioButton1.Caption;
    if RadioButton2.Checked = true then
    ZQuery1.FieldByName('jk').AsString := RadioButton2.Caption;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from wali_kelas');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DIUBAH');
    posisiawal;
  end;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from wali_kelas where id="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from wali_kelas');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
begin
Form6.QuickRep1.Preview
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
editenable;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := true;
BitBtn4.Enabled := true;
BitBtn5.Enabled := true;
id := ZQuery1.Fields[0].AsString;
Edit1.Text := ZQuery1.FieldByName('nip/nik').AsString;
Edit2.Text := ZQuery1.FieldByName('nama').AsString;
Edit3.Text := ZQuery1.FieldByName('pendidikan').AsString;
Edit4.Text := ZQuery1.FieldByName('telepon').AsString;
Edit5.Text := ZQuery1.FieldByName('matpel').AsString;
Edit6.Text := ZQuery1.FieldByName('alamat').AsString;
if ZQuery1.FieldByName('jk').AsString = 'L' then
RadioButton1.Checked := true;
if ZQuery1.FieldByName('jk').AsString = 'P' then
RadioButton2.Checked := true;

end;

procedure TForm4.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
RadioButton1.Checked := false;
RadioButton2.Checked := false;
Edit3.Clear;
Edit4.Clear;
Edit5.Clear;
Edit6.Clear;
end;

procedure TForm4.editenable;
begin
Edit1.Enabled := true;
Edit2.Enabled := true;
RadioButton1.Enabled := true;
RadioButton2.Enabled := true;
Edit3.Enabled := true;
Edit4.Enabled := true;
Edit5.Enabled := true;
Edit6.Enabled := true;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.posisiawal;
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
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := false;
BitBtn4.Enabled := false;
BitBtn5.Enabled := false;
end;

end.
