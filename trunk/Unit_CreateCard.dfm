object frm_createcard: Tfrm_createcard
  Left = 288
  Top = 215
  Width = 635
  Height = 483
  Caption = #39038#23458#21150#21345
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 627
    Height = 41
    Align = alTop
    TabOrder = 0
    object sbtn_front: TSpeedButton
      Left = 8
      Top = 8
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
      Left = 72
      Top = 8
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
    object sbtn_append: TSpeedButton
      Left = 136
      Top = 8
      Width = 60
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
      Left = 200
      Top = 8
      Width = 60
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
      Left = 264
      Top = 8
      Width = 60
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
    object sbtn_delete: TSpeedButton
      Left = 328
      Top = 8
      Width = 60
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
    object sbtn_print: TSpeedButton
      Left = 479
      Top = 8
      Width = 60
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
      Left = 551
      Top = 8
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
      OnClick = sbtn_closeClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 627
    Height = 386
    ActivePage = sht_Card
    Align = alClient
    TabOrder = 1
    OnChanging = PageControl1Changing
    object sht_Customer: TTabSheet
      Caption = #23458#25143#21015#34920
      OnShow = sht_CustomerShow
      object sg_Customer: TStringGrid
        Left = 0
        Top = 0
        Width = 619
        Height = 359
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnSelectCell = sg_CustomerSelectCell
        ColWidths = (
          75
          76
          79
          79
          114
          70
          97)
      end
    end
    object sht_Card: TTabSheet
      Caption = #21019#24314#26032#21345
      ImageIndex = 1
      OnShow = sht_CardShow
      object Label1: TLabel
        Left = 40
        Top = 16
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #23458#25143#21345#21495
      end
      object Label2: TLabel
        Left = 336
        Top = 16
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #23458#25143#32534#21495
      end
      object Label3: TLabel
        Left = 40
        Top = 73
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #23458#25143#22995#21517
      end
      object Label4: TLabel
        Left = 336
        Top = 72
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #21150#21345#31867#22411
      end
      object Label5: TLabel
        Left = 40
        Top = 131
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #26368#20302#28040#36153
      end
      object Label6: TLabel
        Left = 336
        Top = 133
        Width = 48
        Height = 12
        Caption = #20139#21463#25240#25187
      end
      object Label7: TLabel
        Left = 40
        Top = 161
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #29616#26377#37329#39069
      end
      object Label8: TLabel
        Left = 336
        Top = 161
        Width = 48
        Height = 12
        Caption = #39044#23384#37329#39069
      end
      object Label9: TLabel
        Left = 40
        Top = 188
        Width = 48
        Height = 12
        Caption = #25253#35686#37329#39069
      end
      object Label10: TLabel
        Left = 336
        Top = 189
        Width = 48
        Height = 12
        Caption = #28040#36153#31215#20998
      end
      object Label11: TLabel
        Left = 40
        Top = 217
        Width = 24
        Height = 12
        Caption = #22791#27880
      end
      object Label12: TLabel
        Left = 40
        Top = 44
        Width = 48
        Height = 12
        Caption = #21345#21495#23494#30721
      end
      object Label13: TLabel
        Left = 336
        Top = 43
        Width = 48
        Height = 12
        Caption = #20877#36755#19968#27425
      end
      object Label14: TLabel
        Left = 40
        Top = 102
        Width = 48
        Height = 12
        Caption = #21150#21345#26085#26399
      end
      object Label15: TLabel
        Left = 336
        Top = 102
        Width = 48
        Height = 12
        Caption = #21150#21345#21592#24037
      end
      object SpeedButton1: TSpeedButton
        Left = 558
        Top = 68
        Width = 23
        Height = 22
        Caption = 'Go'
        OnClick = SpeedButton1Click
      end
      object edt_CardNo: TEdit
        Left = 96
        Top = 12
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 0
      end
      object edt_CusNo: TEdit
        Left = 409
        Top = 12
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 1
        OnExit = edt_CusNoExit
      end
      object edt_CusName: TEdit
        Left = 96
        Top = 69
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object edt_MinCost: TEdit
        Left = 96
        Top = 129
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object edt_Discount: TEdit
        Left = 408
        Top = 129
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
      object edt_curcurrency: TEdit
        Left = 96
        Top = 157
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 10
        Text = '1.00'
      end
      object edt_Storecurrency: TEdit
        Left = 408
        Top = 157
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 11
      end
      object edt_Warningcurrency: TEdit
        Left = 96
        Top = 185
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 12
      end
      object edt_Costscore: TEdit
        Left = 408
        Top = 184
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 13
      end
      object edt_Password1: TEdit
        Left = 96
        Top = 40
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        PasswordChar = '*'
        TabOrder = 2
      end
      object edt_Password2: TEdit
        Left = 408
        Top = 39
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        PasswordChar = '*'
        TabOrder = 3
        OnExit = edt_Password2Exit
      end
      object mm_remark: TMemo
        Left = 72
        Top = 216
        Width = 513
        Height = 129
        Color = 14020849
        Enabled = False
        TabOrder = 14
      end
      object dtp_CreateDate: TDateTimePicker
        Left = 96
        Top = 98
        Width = 153
        Height = 20
        Date = 37915.404300416670000000
        Time = 37915.404300416670000000
        Enabled = False
        TabOrder = 6
      end
      object edt_Empno: TEdit
        Left = 408
        Top = 98
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        TabOrder = 7
      end
      object cbb_CardType: TComboBox
        Left = 408
        Top = 69
        Width = 150
        Height = 20
        Color = 14020849
        Enabled = False
        ItemHeight = 12
        TabOrder = 5
        OnEnter = cbb_CardTypeEnter
        OnExit = cbb_CardTypeExit
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 627
    Height = 29
    Panels = <
      item
        Width = 50
      end>
  end
end
