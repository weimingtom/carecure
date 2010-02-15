object frm_customer: Tfrm_customer
  Left = 139
  Top = 120
  Width = 679
  Height = 518
  Caption = #39038#23458#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 33
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvNone
    TabOrder = 0
    object sbtn_front: TSpeedButton
      Left = 8
      Top = 5
      Width = 65
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
      Left = 80
      Top = 5
      Width = 65
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
    object sbtn_append: TSpeedButton
      Left = 152
      Top = 5
      Width = 65
      Height = 22
      Caption = #26032#24314
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbtn_appendClick
    end
    object sbtn_edit: TSpeedButton
      Left = 224
      Top = 5
      Width = 65
      Height = 22
      Caption = #20462#25913
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      OnClick = sbtn_editClick
    end
    object sbtn_save: TSpeedButton
      Left = 296
      Top = 5
      Width = 65
      Height = 22
      Caption = #20445#23384
      Enabled = False
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
    object sbtn_print: TSpeedButton
      Left = 519
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
    object sbtn_close: TSpeedButton
      Left = 597
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
      OnClick = sbtn_closeClick
    end
    object sbtn_delete: TSpeedButton
      Left = 368
      Top = 5
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 671
    Height = 458
    ActivePage = sht_content
    Align = alClient
    TabOrder = 1
    OnChanging = PageControl1Changing
    object sht_main: TTabSheet
      Caption = #39038#23458#21015#34920
      OnShow = sht_mainShow
      object sg: TStringGrid
        Left = 0
        Top = 0
        Width = 663
        Height = 424
        Hint = #21333#20987#23519#30475#35814#32454#20449#24687#65292#21452#20987#19968#26465#36873#20013#30340#35760#24405#36827#34892#20462#25913
        Align = alClient
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sgDblClick
        OnSelectCell = sgSelectCell
        ColWidths = (
          124
          120
          123
          146
          141)
      end
    end
    object sht_content: TTabSheet
      Caption = #39038#23458#20449#24687
      ImageIndex = 1
      OnShow = sht_contentShow
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #39038#23458#32534#21495
      end
      object Label2: TLabel
        Left = 240
        Top = 16
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #39038#23458#22995#21517
      end
      object Label9: TLabel
        Left = 24
        Top = 92
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #32852#31995#30005#35805
      end
      object Label10: TLabel
        Left = 240
        Top = 91
        Width = 58
        Height = 13
        AutoSize = False
        Caption = #25163#25552#30005#35805
      end
      object Label11: TLabel
        Left = 24
        Top = 272
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #22791'    '#27880
      end
      object Label12: TLabel
        Left = 25
        Top = 56
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #24615'    '#21035
      end
      object Label4: TLabel
        Left = 448
        Top = 224
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #37038#25919#32534#30721
      end
      object Label5: TLabel
        Left = 240
        Top = 56
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #39038#23458#31867#21035
      end
      object Label7: TLabel
        Left = 16
        Top = 225
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #32852#31995#22320#22336
      end
      object sbtn_AddCusType: TSpeedButton
        Left = 416
        Top = 51
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = sbtn_AddCusTypeClick
      end
      object Label3: TLabel
        Left = 448
        Top = 186
        Width = 48
        Height = 12
        Caption = #27880#20876#26085#26399
      end
      object edt_Cusno: TEdit
        Left = 88
        Top = 16
        Width = 105
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 0
      end
      object edt_Cusname: TEdit
        Left = 304
        Top = 16
        Width = 113
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 1
      end
      object edt_Phone: TEdit
        Left = 88
        Top = 90
        Width = 105
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 3
      end
      object edt_Mobile: TEdit
        Left = 304
        Top = 87
        Width = 113
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 4
      end
      object mm_Remark: TMemo
        Left = 80
        Top = 256
        Width = 553
        Height = 129
        Color = 14020849
        Enabled = False
        TabOrder = 5
      end
      object cbb_Sex: TComboBox
        Left = 88
        Top = 52
        Width = 105
        Height = 20
        Color = 14020849
        Enabled = False
        ItemHeight = 12
        TabOrder = 2
        Items.Strings = (
          #22899
          #30007)
      end
      object edt_zipcode: TEdit
        Left = 512
        Top = 224
        Width = 121
        Height = 20
        Color = 14020849
        TabOrder = 6
      end
      object cbb_Type: TComboBox
        Left = 304
        Top = 52
        Width = 113
        Height = 20
        ItemHeight = 12
        TabOrder = 7
        OnEnter = cbb_TypeEnter
      end
      object GroupBox1: TGroupBox
        Left = 17
        Top = 123
        Width = 424
        Height = 89
        Caption = #29616#20195#32852#31995#26041#24335
        TabOrder = 8
        object Label6: TLabel
          Left = 24
          Top = 28
          Width = 33
          Height = 13
          AutoSize = False
          Caption = 'E-mail'
        end
        object Label8: TLabel
          Left = 24
          Top = 58
          Width = 27
          Height = 13
          AutoSize = False
          Caption = 'Oicq'
        end
        object Label13: TLabel
          Left = 254
          Top = 56
          Width = 18
          Height = 12
          Caption = 'Msn'
        end
        object Label14: TLabel
          Left = 225
          Top = 25
          Width = 48
          Height = 12
          Caption = 'Homepage'
        end
        object edt_Email: TEdit
          Left = 72
          Top = 24
          Width = 105
          Height = 20
          TabOrder = 0
        end
        object edt_Oicq: TEdit
          Left = 72
          Top = 56
          Width = 105
          Height = 20
          TabOrder = 1
        end
        object edt_Homepage: TEdit
          Left = 288
          Top = 25
          Width = 113
          Height = 20
          TabOrder = 2
        end
        object edt_Msn: TEdit
          Left = 288
          Top = 55
          Width = 113
          Height = 20
          TabOrder = 3
        end
      end
      object edt_Address: TEdit
        Left = 80
        Top = 224
        Width = 337
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 9
      end
      object RadioGroup1: TRadioGroup
        Left = 456
        Top = 16
        Width = 185
        Height = 145
        Caption = #35774#23450#20449#24687#20445#23494#31243#24230
        ItemIndex = 0
        Items.Strings = (
          #23545#20351#29992#26412#31995#32479#30340#20154#24320#25918
          #23545#26412#31995#32479#30340#31649#29702#21592#24320#25918
          #20449#24687#20005#26684#20445#23494#65288#19981#24320#25918#65289)
        TabOrder = 10
      end
      object dtp_Register: TDateTimePicker
        Left = 516
        Top = 184
        Width = 121
        Height = 20
        Date = 37907.000000000000000000
        Time = 37907.000000000000000000
        TabOrder = 11
      end
    end
  end
end
