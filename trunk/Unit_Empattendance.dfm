object frm_empattend: Tfrm_empattend
  Left = 184
  Top = 122
  Width = 807
  Height = 569
  Caption = #21592#24037#32771#21220
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
    Left = 589
    Top = 0
    Width = 2
    Height = 535
    Align = alRight
  end
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 535
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object sg_attend: TStringGrid
      Left = 1
      Top = 1
      Width = 587
      Height = 505
      Align = alClient
      ColCount = 9
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 506
      Width = 587
      Height = 28
      Panels = <
        item
          Width = 50
        end>
    end
  end
  object pnlRight: TPanel
    Left = 591
    Top = 0
    Width = 208
    Height = 535
    Align = alRight
    ParentBackground = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 185
      Height = 169
      Caption = #35831#36755#20837#21592#24037#32534#21495#36827#34892#32771#21220
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #21592#24037#32534#21495
      end
      object sbtn_save: TSpeedButton
        Left = 104
        Top = 133
        Width = 70
        Height = 24
        Caption = #32771#21220
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
      object sbtn_Search: TSpeedButton
        Left = 104
        Top = 45
        Width = 70
        Height = 24
        Caption = #25628#32034#21592#24037
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
        OnClick = sbtn_SearchClick
      end
      object Label6: TLabel
        Left = 8
        Top = 78
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #36873#25321#29677#27425
      end
      object edt_Empno: TEdit
        Left = 8
        Top = 46
        Width = 87
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 0
      end
      object cbb_TimeSet: TComboBox
        Left = 8
        Top = 104
        Width = 89
        Height = 20
        Style = csDropDownList
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ItemHeight = 12
        TabOrder = 1
        Items.Strings = (
          #19978#21320#19978#29677
          #19978#21320#19979#29677
          #19979#21320#19978#29677
          #19979#21320#19979#29677
          #26202#19978#19978#29677
          #26202#19978#19979#29677)
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 184
      Width = 185
      Height = 137
      Caption = #26597#30475#32771#21220#26085#24535
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 60
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #25490#24207
      end
      object dtp_Search: TDateTimePicker
        Left = 10
        Top = 18
        Width = 161
        Height = 20
        Date = 37155.964779085640000000
        Time = 37155.964779085640000000
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 0
      end
      object cbb_OrderBy: TComboBox
        Left = 50
        Top = 57
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ItemHeight = 12
        TabOrder = 1
        Text = #21592#24037#32534#21495
        Items.Strings = (
          #21592#24037#32534#21495
          #21592#24037#22995#21517)
      end
      object BitBtn3: TBitBtn
        Left = 93
        Top = 97
        Width = 75
        Height = 25
        Caption = #36827#34892#25628#32034
        TabOrder = 2
        OnClick = BitBtn3Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 328
      Width = 185
      Height = 201
      Caption = #29305#27530#32771#21220
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 24
        Width = 168
        Height = 12
        Caption = #22914#26524#20320#26377#29305#27530#21407#22240#26080#27861#36827#34892#29305#27530
        WordWrap = True
      end
      object Label4: TLabel
        Left = 8
        Top = 56
        Width = 168
        Height = 12
        Caption = #32771#21220#65292#35831#28857#20987#20197#19979#25353#38062#36827#34892#29305#27530
      end
      object Label5: TLabel
        Left = 8
        Top = 88
        Width = 36
        Height = 12
        Caption = #32771#21220#12290
      end
      object sbtn_special: TSpeedButton
        Left = 8
        Top = 160
        Width = 169
        Height = 49
        Caption = #29305#27530#32771#21220
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
        OnClick = sbtn_specialClick
      end
    end
  end
end
