object frm_servicemeal: Tfrm_servicemeal
  Left = 256
  Top = 171
  Width = 485
  Height = 370
  BorderIcons = [biSystemMenu]
  Caption = #36873#25321#26381#21153#22871#39184
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 177
    Top = 0
    Height = 312
  end
  object Panel2: TPanel
    Left = 0
    Top = 312
    Width = 477
    Height = 31
    Align = alBottom
    TabOrder = 0
    object sbtn_ok: TSpeedButton
      Left = 343
      Top = 4
      Width = 60
      Height = 22
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
      OnClick = sbtn_okClick
    end
    object SpeedButton2: TSpeedButton
      Left = 409
      Top = 4
      Width = 60
      Height = 22
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
      OnClick = SpeedButton2Click
    end
    object lbl_TotalSum: TLabel
      Left = 40
      Top = 8
      Width = 6
      Height = 12
    end
    object lbl_PromotionSum: TLabel
      Left = 113
      Top = 9
      Width = 6
      Height = 12
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #24635#20215':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 64
      Top = 8
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20248#24800#20215':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  object sg_Item: TStringGrid
    Left = 180
    Top = 0
    Width = 297
    Height = 312
    Align = alClient
    ColCount = 3
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 1
    ColWidths = (
      87
      103
      91)
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 177
    Height = 312
    Align = alLeft
    Indent = 19
    TabOrder = 2
    OnClick = TreeView1Click
  end
end
