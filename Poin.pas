unit Poin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.Win.ADODB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm10 = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    ZQuery1id: TIntegerField;
    ZQuery1nama_poin: TWideStringField;
    ZQuery1bobot: TWideStringField;
    ZQuery1jenis: TWideStringField;
    ZQuery1status: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
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
  Form10: TForm10;
  id:string;

implementation

{$R *.dfm}

uses HalamanUtama, LaporanPoin;

{ TForm10 }

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
editbersih;
       editenable;
       BitBtn1.Enabled := false;
       BitBtn2.Enabled := true;
       BitBtn3.Enabled := false;
       BitBtn4.Enabled := false;
       BitBtn5.Enabled := true;
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nama poin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom bobot harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom jenis harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Append;
    ZQuery1.FieldByName('nama_poin').AsString := Edit1.Text;
    ZQuery1.FieldByName('bobot').AsString := Edit2.Text;
    ZQuery1.FieldByName('jenis').AsString := ComboBox2.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from poin');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DISIMPAN');
    posisiawal;
    end;
end;

procedure TForm10.BitBtn3Click(Sender: TObject);
begin
 if Edit1.Text = '' then
    begin
    MessageDlg('Kolom nama poin harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom bobot harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom jenis harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Edit;
    ZQuery1.FieldByName('nama_poin').AsString := Edit1.Text;
    ZQuery1.FieldByName('bobot').AsString := Edit2.Text;
    ZQuery1.FieldByName('jenis').AsString := ComboBox2.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from poin');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DIUBAH');
    posisiawal;
    end;
end;

procedure TForm10.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('delete from poin where id="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from poin');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm10.BitBtn5Click(Sender: TObject);
begin
posisiawal
end;

procedure TForm10.BitBtn6Click(Sender: TObject);
begin
Form11.QuickRep1.Preview;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin
editenable;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := true;
BitBtn4.Enabled := true;
BitBtn5.Enabled := true;
id := ZQuery1.Fields[0].AsString;
Edit1.Text := ZQuery1.FieldByName('nama_poin').AsString;
Edit2.Text := ZQuery1.FieldByName('bobot').AsString;
ComboBox2.Text := ZQuery1.FieldByName('jenis').AsString;
end;

procedure TForm10.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
ComboBox2.Text := '';
end;

procedure TForm10.editenable;
begin
Edit1.Enabled := true;
Edit2.Enabled := true;
ComboBox2.Enabled := true;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm10.posisiawal;
begin
editbersih;
Edit1.Enabled := false;
Edit2.Enabled := false;
ComboBox2.Enabled := false;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := false;
BitBtn4.Enabled := false;
BitBtn5.Enabled := false;
end;

end.
