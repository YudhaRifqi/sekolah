unit User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm14 = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
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
  Form14: TForm14;
  id : string;

implementation

{$R *.dfm}

uses HalamanUtama, LaporanUser;

procedure TForm14.BitBtn1Click(Sender: TObject);
begin
editbersih;
       editenable;
       BitBtn1.Enabled := false;
       BitBtn2.Enabled := true;
       BitBtn3.Enabled := false;
       BitBtn4.Enabled := false;
       BitBtn5.Enabled := true;
end;

procedure TForm14.BitBtn2Click(Sender: TObject);
begin
if Edit1.Text = '' then
    begin
    MessageDlg('Kolom username harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom password harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom level harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Append;
    ZQuery1.FieldByName('username').AsString := Edit1.Text;
    ZQuery1.FieldByName('password').AsString := Edit2.Text;
    ZQuery1.FieldByName('level').AsString := ComboBox2.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    ZQuery1.FieldByName('created_at').AsDateTime := now;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from user');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DISIMPAN');
    posisiawal;
    end;
end;

procedure TForm14.BitBtn3Click(Sender: TObject);
begin
if Edit1.Text = '' then
    begin
    MessageDlg('Kolom username harus diisi', mtInformation, [mbOK], 0);
    end else
    if Edit2.Text = '' then
    begin
    MessageDlg('Kolom password harus diisi', mtInformation, [mbOK], 0);
    end else
    if ComboBox2.text = '' then
    begin
    MessageDlg('Kolom level harus diisi', mtInformation, [mbOK], 0);
    end else
    begin
    ZQuery1.Edit;
    ZQuery1.FieldByName('username').AsString := Edit1.Text;
    ZQuery1.FieldByName('password').AsString := Edit2.Text;
    ZQuery1.FieldByName('level').AsString := ComboBox2.Text;
    ZQuery1.FieldByName('status').AsString := 'true';
    ZQuery1.FieldByName('updated_at').AsDateTime := now;
    ZQuery1.Post;

    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from user');
    ZQuery1.Open;
    ShowMessage('DATA BERHASIL DIUBAH');
    posisiawal;
    end;
end;

procedure TForm14.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('delete from user where id="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from user');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm14.BitBtn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm14.BitBtn6Click(Sender: TObject);
begin
Form15.QuickRep1.Preview;
end;

procedure TForm14.DBGrid1CellClick(Column: TColumn);
begin
editenable;
BitBtn1.Enabled := true;
BitBtn2.Enabled := false;
BitBtn3.Enabled := true;
BitBtn4.Enabled := true;
BitBtn5.Enabled := true;
id := ZQuery1.Fields[0].AsString;
Edit1.Text := ZQuery1.FieldByName('username').AsString;
Edit2.Text := ZQuery1.FieldByName('password').AsString;
ComboBox2.Text := ZQuery1.FieldByName('level').AsString;
end;

procedure TForm14.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
ComboBox2.Text := '';
end;

procedure TForm14.editenable;
begin
Edit1.Enabled := true;
Edit2.Enabled := true;
ComboBox2.Enabled := true;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm14.posisiawal;
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
