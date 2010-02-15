object frm_specialattend: Tfrm_specialattend
  Left = 174
  Top = 166
  Width = 585
  Height = 417
  Caption = #29305#27530#32771#21220
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 364
    Width = 577
    Height = 26
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 577
    Height = 331
    Align = alClient
    TabOrder = 1
    object sg_Reason: TStringGrid
      Left = 1
      Top = 89
      Width = 575
      Height = 241
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      ColWidths = (
        64
        64
        109
        115
        164
        64)
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 575
      Height = 88
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 13
        Width = 97
        Height = 13
        AutoSize = False
        Caption = #35831#36755#20837#21592#24037#32534#21495
      end
      object Label2: TLabel
        Left = 43
        Top = 38
        Width = 48
        Height = 12
        Caption = #21592#24037#22995#21517
      end
      object Label5: TLabel
        Left = 18
        Top = 64
        Width = 72
        Height = 12
        Caption = #29305#27530#32771#21220#21407#22240
      end
      object Label3: TLabel
        Left = 235
        Top = 15
        Width = 48
        Height = 12
        Caption = #36215#22987#26102#38388
      end
      object Label4: TLabel
        Left = 235
        Top = 40
        Width = 48
        Height = 12
        Caption = #32467#26463#26102#38388
      end
      object cbb_Reason: TComboBox
        Left = 104
        Top = 58
        Width = 305
        Height = 20
        Color = 14020849
        ItemHeight = 12
        TabOrder = 0
      end
      object edt_Empname: TEdit
        Left = 104
        Top = 35
        Width = 121
        Height = 20
        Color = 14020849
        ReadOnly = True
        TabOrder = 1
      end
      object edt_Empno: TEdit
        Left = 104
        Top = 10
        Width = 121
        Height = 20
        Color = 14020849
        TabOrder = 2
        OnExit = edt_EmpnoExit
      end
      object GroupBox1: TGroupBox
        Left = 416
        Top = 6
        Width = 145
        Height = 73
        Caption = #35828#26126
        TabOrder = 3
        object Label6: TLabel
          Left = 5
          Top = 21
          Width = 132
          Height = 12
          Caption = #29305#27530#32771#21220#26159#30001#20110#26576#31181#21407#22240
        end
        object Label7: TLabel
          Left = 5
          Top = 48
          Width = 132
          Height = 12
          Caption = #20320#26080#27861#36827#34892#27491#24120#32771#21220#32780#35774
        end
      end
      object dtp_Timestart: TMaskEdit
        Left = 288
        Top = 8
        Width = 120
        Height = 20
        EditMask = '##:##:##;1;_'
        MaxLength = 8
        TabOrder = 4
        Text = '  :  :  '
      end
      object dtp_Timeend: TMaskEdit
        Left = 288
        Top = 32
        Width = 120
        Height = 20
        EditMask = '##:##:##;1;_'
        MaxLength = 8
        TabOrder = 5
        Text = '  :  :  '
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 33
    Align = alTop
    TabOrder = 2
    object sbtn_save: TSpeedButton
      Left = 14
      Top = 6
      Width = 65
      Height = 22
      Caption = #20445#23384
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sbtn_saveClick
    end
    object sbtn_delete: TSpeedButton
      Left = 94
      Top = 6
      Width = 65
      Height = 22
      Caption = #21024#38500
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbtn_deleteClick
    end
    object SpeedButton2: TSpeedButton
      Left = 494
      Top = 5
      Width = 65
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
  end
end
