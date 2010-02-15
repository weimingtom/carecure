object Fuser2: TFuser2
  Left = 256
  Top = 151
  Width = 344
  Height = 208
  Caption = #22686#21152#29992#25143
  Color = clScrollBar
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 100
    Height = 16
    AutoSize = False
    Caption = #29992#25143#21517#31216
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 54
    Width = 100
    Height = 16
    AutoSize = False
    Caption = #30495#23454#22995#21517
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 92
    Width = 100
    Height = 16
    AutoSize = False
    Caption = #36755#20837#23494#30721
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 131
    Width = 100
    Height = 16
    AutoSize = False
    Caption = #30830#35748#23494#30721
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 225
    Top = 8
    Width = 2
    Height = 169
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 16
    Width = 97
    Height = 22
    DataField = 'username'
    DataSource = adodm.dsuser
    ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 53
    Width = 97
    Height = 22
    DataField = 'oper'
    DataSource = adodm.dsuser
    ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 90
    Width = 97
    Height = 22
    DataField = 'password'
    DataSource = adodm.dsuser
    ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
    PasswordChar = '*'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 112
    Top = 128
    Width = 97
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
    PasswordChar = '*'
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 248
    Top = 100
    Width = 75
    Height = 25
    Caption = #30830#23450'(&P)'
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(Esc)'
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Memo1: TMemo
    Left = 240
    Top = 8
    Width = 89
    Height = 89
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
    Lines.Strings = (
      #29992#25143#21517#31216':'#30331
      #24405#26102#29992#21517' '
      ''
      #30495#23454#22995#21517':'#25805
      #20316#26102#29992#21517
      '')
    TabOrder = 6
  end
end
