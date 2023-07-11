object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Halaman Utama'
  ClientHeight = 201
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 687
    Height = 201
    Align = alClient
    Alignment = taCenter
    Caption = 'SELAMAT DATANG DI SISTEM INFORMASI SEKOLAH'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 528
    ExplicitHeight = 24
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 72
    object File1: TMenuItem
      Caption = 'File'
      object Login1: TMenuItem
        Caption = 'Login'
        OnClick = Login1Click
      end
      object Logout1: TMenuItem
        Caption = 'Logout'
        Enabled = False
        OnClick = Logout1Click
      end
      object Keluar1: TMenuItem
        Caption = 'Keluar'
        OnClick = Keluar1Click
      end
    end
    object Data1: TMenuItem
      Caption = 'Master Data'
      Enabled = False
      object Siswa1: TMenuItem
        Caption = 'Siswa'
        OnClick = Siswa1Click
      end
      object WaliKelas1: TMenuItem
        Caption = 'Wali Kelas'
        OnClick = WaliKelas1Click
      end
      object Kelas1: TMenuItem
        Caption = 'Kelas'
        OnClick = Kelas1Click
      end
      object OrangTua1: TMenuItem
        Caption = 'Orang Tua'
        OnClick = OrangTua1Click
      end
      object Poin1: TMenuItem
        Caption = 'Poin'
        OnClick = Poin1Click
      end
      object User1: TMenuItem
        Caption = 'User'
        OnClick = User1Click
      end
    end
    object Menu1: TMenuItem
      Caption = 'Administrasi'
      Enabled = False
      object Hubungan1: TMenuItem
        Caption = 'Hubungan'
        OnClick = Hubungan1Click
      end
      object Semester1: TMenuItem
        Caption = 'Semester'
        OnClick = Semester1Click
      end
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Connected = True
    HostName = ''
    Port = 0
    Database = 'sekolah'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 'C:\Program Files (x86)\Embarcadero\libmysql.dll'
    Left = 32
    Top = 128
  end
end
