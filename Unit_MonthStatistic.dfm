object frm_monthstatistic: Tfrm_monthstatistic
  Left = 282
  Top = 246
  Width = 630
  Height = 492
  Caption = #26376#33829#19994#39069#32479#35745
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
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 622
    Height = 400
    ActivePage = sht_List
    Align = alClient
    TabOrder = 0
    OnChanging = PageControl1Changing
    object sht_List: TTabSheet
      Caption = #32479#35745#21015#34920
      object sg_List: TStringGrid
        Left = 0
        Top = 0
        Width = 614
        Height = 373
        Hint = #21452#20987#35760#24405#26597#30475#35814#32454#20449#24687
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sg_ListDblClick
        OnSelectCell = sg_ListSelectCell
        ColWidths = (
          95
          94
          94
          95
          77
          70
          74)
      end
    end
    object sht_Detail: TTabSheet
      Caption = #35814#32454#20449#24687
      ImageIndex = 1
      OnShow = sht_DetailShow
      object sg_Detail: TStringGrid
        Left = 0
        Top = 0
        Width = 614
        Height = 366
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnSelectCell = sg_DetailSelectCell
        ColWidths = (
          86
          89
          76
          76
          79
          69
          64
          64)
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 33
    Align = alTop
    TabOrder = 1
    object sbtn_front: TSpeedButton
      Left = 8
      Top = 5
      Width = 60
      Height = 22
      Caption = #21069#21333
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbtn_frontClick
    end
    object sbtn_back: TSpeedButton
      Left = 74
      Top = 5
      Width = 60
      Height = 22
      Caption = #21518#21333
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbtn_backClick
    end
    object Label1: TLabel
      Left = 146
      Top = 10
      Width = 72
      Height = 13
      AutoSize = False
      Caption = #36755#20837#32479#35745#24180#26376
    end
    object sbtn_monthstatistic: TSpeedButton
      Left = 334
      Top = 6
      Width = 85
      Height = 22
      Caption = #24320#22987#32479#35745
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
        703337F37777777FF7F33080000000007033373777777777F73F087000111000
        77037F3777333777FF7F08000111110007037F777F3333777F7F0F0001111100
        07037F777F3333777F7F0F000811110008037F777FF33377737F0F7000881000
        780373F777FFF777F373308000000000803337F77777777737F330F800000008
        8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      OnClick = sbtn_monthstatisticClick
    end
    object sbtn_close: TSpeedButton
      Left = 544
      Top = 5
      Width = 61
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
      OnClick = sbtn_closeClick
    end
    object sbtn_print: TSpeedButton
      Left = 472
      Top = 5
      Width = 65
      Height = 22
      Caption = #25171#21360
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = sbtn_printClick
    end
    object edt_monthstatistic: TEdit
      Left = 222
      Top = 6
      Width = 107
      Height = 20
      MaxLength = 7
      TabOrder = 0
      Text = 'YYYY-MM'
      OnEnter = edt_monthstatisticEnter
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 622
    Height = 32
    Panels = <
      item
        Width = 120
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end>
  end
end
