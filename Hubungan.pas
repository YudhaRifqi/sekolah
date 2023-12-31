unit Hubungan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.DBCtrls, Vcl.Mask, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompListbox, IWDBStdCtrls;

type
  TForm12 = class(TForm)
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    Siswa: TZQuery;
    Ortu: TZQuery;
    Hubungan: TZQuery;
    Siswaid: TIntegerField;
    Siswanis: TWideStringField;
    Siswanisn: TWideStringField;
    Siswanama_siswa: TWideStringField;
    Siswanik: TWideStringField;
    Siswatempat_lahir: TWideStringField;
    Siswatanggal_lahir: TDateField;
    Siswajenis_kelamin: TWideStringField;
    Siswaalamat: TWideStringField;
    Siswatelepon: TWideStringField;
    Siswahp: TWideStringField;
    Siswastatus: TWideStringField;
    Ortuid: TIntegerField;
    Ortunik: TWideStringField;
    Ortunama: TWideStringField;
    Ortupendidikan: TWideStringField;
    Ortupekerjaan: TWideStringField;
    Ortutelepon: TWideStringField;
    Ortualamat: TWideStringField;
    Ortujk: TWideStringField;
    Ortuagama: TWideStringField;
    Ortuis_active: TWideStringField;
    Hubunganid: TIntegerField;
    Hubungansiswa_id: TIntegerField;
    Hubunganortu_id: TIntegerField;
    Hubunganstatus_hub_anak: TWideStringField;
    Hubunganketerangan: TWideStringField;
    Hubunganstatus_ortu: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    DataSource1: TDataSource;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ZQuery1: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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
  Form12: TForm12;
  id:string;

implementation

{$R *.dfm}

uses HalamanUtama, LaporanHubungan;

procedure TForm12.BitBtn1Click(Sender: TObject);
begin
editbersih;
       editenable;
       BitBtn1.Enabled := false;
       BitBtn2.Enabled := true;
       BitBtn3.Enabled := false;
       BitBtn4.Enabled := false;
       BitBtn5.Enabled := true;
end;

procedure TForm12.BitBtn2Click(Sender: TObject);
begin
    if ComboBox1.text = '' then
    begin
    MessageDlg('Kolom siswa harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom ortu harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox3.text = '' then
    begin
    MessageDlg('Kolom status hub anak harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox4.text = '' then
    begin
    MessageDlg('Kolom status orang tua harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox5.text = '' then
    begin
    MessageDlg('Kolom agama harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    Hubungan.Append;
    Hubungan.FieldByName('siswa_id').AsString := ComboBox1.Text;
    Hubungan.FieldByName('ortu_id').AsString := ComboBox2.Text;
    Hubungan.FieldByName('status_hub_anak').AsString := ComboBox3.Text;
    Hubungan.FieldByName('keterangan').AsString := ComboBox4.Text;
    Hubungan.FieldByName('status_ortu').AsString := ComboBox5.Text;
    Hubungan.Post;
    ZQuery1.Close;
    ZQUery1.Open;

    Hubungan.SQL.Clear;
    Hubungan.SQL.Add('select * from hubungan');
    Hubungan.Open;
    ShowMessage('DATA BERHASIL DISIMPAN');
    posisiawal;
    end;
end;

procedure TForm12.BitBtn3Click(Sender: TObject);
begin
if ComboBox1.text = '' then
    begin
    MessageDlg('Kolom siswa harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom ortu harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox3.text = '' then
    begin
    MessageDlg('Kolom status hub anak harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox4.text = '' then
    begin
    MessageDlg('Kolom status orang tua harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox5.text = '' then
    begin
    MessageDlg('Kolom agama harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ShowMessage('DATA BERHASIL DIUBAH');
    hubungan.SQL.Clear;
    hubungan.SQL.Add('Update hubungan set siswa_id= "'+Combobox1.Text+'",ortu_id="'+combobox2.Text+'",status_hub_anak="'+combobox3.Text+'",keterangan="'+combobox4.Text+'",status_ortu="'+combobox5.Text+'" where id="'+id+'"');
    hubungan. ExecSQL;

    hubungan.SQL.Clear;
    hubungan.SQL.Add('select * from hubungan');
    hubungan.Open;
    Zquery1.Close;
    zquery1.Open;
    posisiawal;
    end;

end;

procedure TForm12.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('delete from hubungan where id="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('SELECT hubungan.id,  hubungan.siswa_id, siswa.nama_siswa,  hubungan.ortu_id, ortu.nama, hubungan.status_hub_anak, hubungan.keterangan, hubungan.status_ortu');
ZQuery1.SQL.Add('from ((hubungan inner join siswa on hubungan.siswa_id = siswa.id) inner join ortu on hubungan.ortu_id = ortu.id)');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm12.BitBtn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm12.BitBtn6Click(Sender: TObject);
begin
Form13.QuickRep1.Preview;
end;

procedure TForm12.ComboBox1Change(Sender: TObject);
begin
  Siswa.Locate('id', StrToInt(ComboBox1.Text), []);
  Edit1.Text := Siswa.FieldByName('nama_siswa').AsString;
end;

procedure TForm12.ComboBox2Change(Sender: TObject);
begin
  Ortu.Locate('id', StrToInt(ComboBox2.Text), []);
  Edit2.Text := Ortu.FieldByName('nama').AsString;
end;

procedure TForm12.DBGrid1CellClick(Column: TColumn);
begin
editenable;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := true;
BitBtn4.Enabled := true;
BitBtn5.Enabled := true;
id := ZQuery1.Fields[0].AsString;
ComboBox1.Text := ZQuery1.FieldByName('siswa_id').AsString;
Edit1.Text := ZQuery1.FieldByName('nama_siswa').AsString;
ComboBox2.Text := ZQuery1.FieldByName('ortu_id').AsString;
Edit2.Text := ZQuery1.FieldByName('nama').AsString;
ComboBox3.Text := ZQuery1.FieldByName('status_hub_anak').AsString;
ComboBox4.Text := ZQuery1.FieldByName('keterangan').AsString;
ComboBox5.Text := ZQuery1.FieldByName('status_ortu').AsString;
end;

procedure TForm12.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
ComboBox1.Text := '';
ComboBox2.Text := '';
ComboBox3.Text := '';
ComboBox4.Text := '';
ComboBox5.Text := '';
end;

procedure TForm12.editenable;
begin
ComboBox1.Enabled := true;
ComboBox2.Enabled := true;
ComboBox3.Enabled := true;
ComboBox4.Enabled := true;
ComboBox5.Enabled := true;
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  Siswa.First;
  while not Siswa.Eof do
  begin
    ComboBox1.Items.Add(siswa.FieldByName('id').AsString);
    Siswa.Next;
  end;
  Ortu.First;
  while not Ortu.Eof do
  begin
    ComboBox2.Items.Add(Ortu.FieldByName('id').AsString);
    Ortu.Next;
  end;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm12.posisiawal;
begin
editbersih;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := false;
BitBtn4.Enabled := false;
BitBtn5.Enabled := false;
ComboBox1.Enabled := false;
ComboBox2.Enabled := false;
ComboBox3.Enabled := false;
ComboBox4.Enabled := false;
ComboBox5.Enabled := false;
end;

end.
