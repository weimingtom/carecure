object frm_frontcheck: Tfrm_frontcheck
  Left = 205
  Top = 130
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsNone
  Caption = #21069#21488#25910#38134
  ClientHeight = 529
  ClientWidth = 804
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
    Left = 511
    Top = 0
    Height = 529
    Align = alCustom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 529
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object sg_CostList: TStringGrid
      Left = 0
      Top = 33
      Width = 485
      Height = 247
      Align = alClient
      ColCount = 8
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      ColWidths = (
        107
        104
        101
        74
        72
        73
        74
        84)
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 502
      Width = 485
      Height = 27
      Panels = <
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 100
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 485
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object lbl_dayofweek: TLabel
        Left = 136
        Top = 14
        Width = 78
        Height = 12
        Caption = 'lbl_dayofweek'
      end
      object sbtn_Attend: TSpeedButton
        Left = 235
        Top = 6
        Width = 75
        Height = 22
        Caption = #21592#24037#32771#21220
        Flat = True
        OnClick = sbtn_AttendClick
      end
      object Label1: TLabel
        Left = 14
        Top = 14
        Width = 48
        Height = 12
        Caption = #20170#22825#26159#65306
      end
      object lbl_today: TLabel
        Left = 64
        Top = 14
        Width = 54
        Height = 12
        Caption = 'lbl_today'
      end
      object sbtn_Card: TSpeedButton
        Left = 158
        Top = 6
        Width = 75
        Height = 22
        Caption = #39038#23458#20805#20540
        Flat = True
        Transparent = False
        OnClick = sbtn_CardClick
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 280
      Width = 485
      Height = 222
      ActivePage = sht_Item
      Align = alBottom
      TabOrder = 3
      object sht_Item: TTabSheet
        Caption = #28040#36153#26381#21153#39033#30446
        object sg_Item: TStringGrid
          Left = 0
          Top = 0
          Width = 473
          Height = 197
          Align = alCustom
          ColCount = 4
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 1
          ColWidths = (
            72
            76
            82
            64)
        end
        object Panel4: TPanel
          Left = 0
          Top = 165
          Width = 477
          Height = 30
          Align = alBottom
          ParentBackground = False
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 143
            Top = 4
            Width = 70
            Height = 22
            Caption = #28155#21152#39033#30446
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
            OnClick = SpeedButton1Click
          end
          object SpeedButton3: TSpeedButton
            Left = 220
            Top = 4
            Width = 72
            Height = 22
            Caption = #21024#38500#39033#30446
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
            OnClick = SpeedButton3Click
          end
          object sbtn_addEmp1: TSpeedButton
            Left = 48
            Top = 4
            Width = 88
            Height = 22
            Caption = #28155#21152#26381#21153#21592#24037
            Enabled = False
            Flat = True
            OnClick = sbtn_addEmp1Click
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #28040#36153#26381#21153#22871#39184
        ImageIndex = 1
        object sg_Meal: TStringGrid
          Left = 0
          Top = 0
          Width = 473
          Height = 133
          Align = alClient
          ColCount = 4
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            70
            74
            75
            70)
        end
        object Panel5: TPanel
          Left = 0
          Top = 133
          Width = 473
          Height = 30
          Align = alBottom
          ParentBackground = False
          TabOrder = 1
          object SpeedButton4: TSpeedButton
            Left = 143
            Top = 4
            Width = 70
            Height = 22
            Caption = #28155#21152#22871#39184
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
            OnClick = SpeedButton4Click
          end
          object SpeedButton5: TSpeedButton
            Left = 220
            Top = 4
            Width = 69
            Height = 22
            Caption = #21024#38500#22871#39184
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
            OnClick = SpeedButton5Click
          end
          object sbtn_addEmp2: TSpeedButton
            Left = 48
            Top = 4
            Width = 88
            Height = 22
            Caption = #28155#21152#26381#21153#21592#24037
            Enabled = False
            Flat = True
            OnClick = sbtn_addEmp2Click
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 485
    Top = 0
    Width = 319
    Height = 529
    Align = alRight
    ParentBackground = False
    TabOrder = 1
    object sbtn_print: TSpeedButton
      Left = 108
      Top = 214
      Width = 141
      Height = 22
      Caption = #25171#21360#24403#21069#23567#31080
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
    object GroupBox1: TGroupBox
      Left = 3
      Top = 0
      Width = 319
      Height = 89
      Caption = #21047#21345
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 22
        Width = 48
        Height = 12
        Caption = #39038#23458#32534#21495
      end
      object sbtn_Sure: TSpeedButton
        Left = 104
        Top = 49
        Width = 85
        Height = 28
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
        Layout = blGlyphRight
        NumGlyphs = 2
        Spacing = 10
        OnClick = sbtn_SureClick
      end
      object SpeedButton2: TSpeedButton
        Left = 207
        Top = 15
        Width = 81
        Height = 28
        Caption = #20250#21592#25628#32034
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
      object sbtn_Other: TSpeedButton
        Left = 208
        Top = 49
        Width = 81
        Height = 28
        Caption = #25955#23458#28040#36153
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
        OnClick = sbtn_OtherClick
      end
      object edt_CusNo: TEdit
        Left = 67
        Top = 19
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 0
        OnKeyPress = edt_CusNoKeyPress
      end
    end
    object s: TGroupBox
      Left = 3
      Top = 90
      Width = 319
      Height = 119
      Caption = #39038#23458#20449#24687
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 44
        Width = 48
        Height = 12
        Caption = #39038#23458#22995#21517
      end
      object Label7: TLabel
        Left = 8
        Top = 69
        Width = 48
        Height = 12
        Caption = #21150#21345#31867#22411
      end
      object Label8: TLabel
        Left = 150
        Top = 43
        Width = 48
        Height = 12
        Caption = #21345#20869#20313#39069
      end
      object Label9: TLabel
        Left = 150
        Top = 68
        Width = 48
        Height = 12
        Caption = #24635#20849#28040#36153
      end
      object Label10: TLabel
        Left = 151
        Top = 94
        Width = 48
        Height = 12
        Caption = #28040#36153#31215#20998
      end
      object Label11: TLabel
        Left = 8
        Top = 92
        Width = 48
        Height = 12
        Caption = #20139#21463#25240#25187
      end
      object Label12: TLabel
        Left = 8
        Top = 18
        Width = 48
        Height = 12
        Caption = #39038#23458#32534#21495
      end
      object TLabel
        Left = 152
        Top = 16
        Width = 48
        Height = 12
        Caption = #39038#23458#21345#21495
      end
      object edt_CusName: TEdit
        Left = 64
        Top = 41
        Width = 81
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 1
      end
      object edt_CusType: TEdit
        Left = 64
        Top = 64
        Width = 81
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 2
      end
      object edt_Curcurrency: TEdit
        Left = 204
        Top = 38
        Width = 85
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 4
      end
      object edt_TotalCost: TEdit
        Left = 204
        Top = 64
        Width = 85
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 5
      end
      object edt_CostScore: TEdit
        Left = 204
        Top = 91
        Width = 85
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 6
      end
      object edt_Discount: TEdit
        Left = 64
        Top = 90
        Width = 81
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 3
      end
      object edt_CusNo1: TEdit
        Left = 63
        Top = 13
        Width = 82
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = edt_CusNoKeyPress
      end
      object edt_CardNo: TEdit
        Left = 204
        Top = 12
        Width = 85
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 7
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 242
      Width = 319
      Height = 49
      Caption = #32467#31639#31867#22411
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #29616#37329#32467#31639
        #39038#23458#21345#32467#31639)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object GroupBox4: TGroupBox
      Left = -5
      Top = 300
      Width = 319
      Height = 229
      Caption = #20184#38065
      TabOrder = 3
      object Label13: TLabel
        Left = 8
        Top = 24
        Width = 48
        Height = 12
        Caption = #28040#36153#21512#35745
      end
      object Label15: TLabel
        Left = 144
        Top = 24
        Width = 48
        Height = 12
        Caption = #25171#25240#21518#35745
      end
      object sbtn_save: TSpeedButton
        Left = 104
        Top = 183
        Width = 65
        Height = 25
        Caption = #32467#36134
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = [fsBold]
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
        ParentFont = False
        OnClick = sbtn_saveClick
      end
      object Label18: TLabel
        Left = 24
        Top = 48
        Width = 42
        Height = 12
        Caption = 'Label18'
      end
      object Label19: TLabel
        Left = 8
        Top = 144
        Width = 48
        Height = 12
        Caption = #25910#38134#21592#24037
      end
      object SpeedButton6: TSpeedButton
        Left = 196
        Top = 182
        Width = 75
        Height = 22
        Caption = #20851#38381#31383#21475
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
        OnClick = SpeedButton6Click
      end
      object edt_CostSum: TEdit
        Left = 64
        Top = 21
        Width = 73
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 0
      end
      object edt_DiscountSum: TEdit
        Left = 200
        Top = 20
        Width = 73
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 1
      end
      object pnlCard: TPanel
        Left = 8
        Top = 48
        Width = 273
        Height = 89
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object Label17: TLabel
          Left = 0
          Top = 58
          Width = 48
          Height = 12
          Caption = #29992#25143#23494#30721
        end
        object Label4: TLabel
          Left = 0
          Top = 32
          Width = 48
          Height = 12
          Caption = #26368#26032#20313#39069
        end
        object Label2: TLabel
          Left = 0
          Top = 5
          Width = 48
          Height = 12
          Caption = #21345#20869#20313#39069
        end
        object Label3: TLabel
          Left = 138
          Top = 7
          Width = 48
          Height = 12
          Caption = #21363#23558#25187#38500
        end
        object edt_CardMoney: TEdit
          Left = 57
          Top = 5
          Width = 71
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 0
        end
        object edt_LatestMoney: TEdit
          Left = 56
          Top = 29
          Width = 206
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 1
        end
        object edt_Password: TEdit
          Left = 55
          Top = 54
          Width = 209
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          PasswordChar = '*'
          TabOrder = 2
        end
        object edt_CostMoney: TEdit
          Left = 193
          Top = 3
          Width = 71
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 3
        end
      end
      object pnlCash: TPanel
        Left = 8
        Top = 40
        Width = 265
        Height = 65
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        object Label14: TLabel
          Left = 0
          Top = 13
          Width = 48
          Height = 12
          Caption = #24635#35745#20849#25910
        end
        object Label16: TLabel
          Left = 0
          Top = 40
          Width = 48
          Height = 12
          Caption = #24212#35813#25214#38646
        end
        object edt_Payment: TEdit
          Left = 55
          Top = 11
          Width = 209
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 0
          OnExit = edt_PaymentExit
          OnKeyPress = edt_PaymentKeyPress
        end
        object edt_change: TEdit
          Left = 55
          Top = 36
          Width = 209
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 1
          OnKeyPress = edt_changeKeyPress
        end
      end
      object edt_EmpNo: TEdit
        Left = 65
        Top = 138
        Width = 121
        Height = 20
        Color = clBtnShadow
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
end
