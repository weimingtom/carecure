object frm_unit: Tfrm_unit
  Left = 353
  Top = 237
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21333#20301#20449#24687
  ClientHeight = 151
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 48
    Height = 12
    Caption = #21333#20301#21517#31216
  end
  object Label2: TLabel
    Left = 40
    Top = 38
    Width = 24
    Height = 12
    Caption = #22320#22336
  end
  object Label3: TLabel
    Left = 40
    Top = 67
    Width = 24
    Height = 12
    Caption = #30005#35805
  end
  object Label4: TLabel
    Left = 40
    Top = 95
    Width = 24
    Height = 12
    Caption = #20256#30495
  end
  object sbtn_sure: TSpeedButton
    Left = 112
    Top = 123
    Width = 65
    Height = 22
    Cursor = crHandPoint
    Caption = #30830#23450
    Flat = True
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
    OnClick = sbtn_sureClick
  end
  object SpeedButton3: TSpeedButton
    Left = 184
    Top = 123
    Width = 65
    Height = 22
    Cursor = crHandPoint
    Caption = #20851#38381
    Flat = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    OnClick = sbtn_closeClick
  end
  object edt_UnitName: TEdit
    Left = 71
    Top = 8
    Width = 258
    Height = 20
    Color = 14020849
    MaxLength = 30
    TabOrder = 0
  end
  object edt_address: TEdit
    Left = 72
    Top = 35
    Width = 257
    Height = 20
    Color = 14020849
    MaxLength = 30
    TabOrder = 1
  end
  object edt_telephone: TEdit
    Left = 72
    Top = 63
    Width = 257
    Height = 20
    Color = 14020849
    MaxLength = 20
    TabOrder = 2
  end
  object edt_fax: TEdit
    Left = 72
    Top = 91
    Width = 257
    Height = 20
    Color = 14020849
    MaxLength = 20
    TabOrder = 3
  end
end