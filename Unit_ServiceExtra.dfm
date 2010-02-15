object frm_serviceitemextra: Tfrm_serviceitemextra
  Left = 211
  Top = 143
  Width = 518
  Height = 399
  Caption = #21333#39033#26381#21153#25552#25104#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Width = 510
    Height = 309
    ActivePage = sht_same
    Align = alClient
    TabOrder = 0
    OnChanging = PageControl1Changing
    object sht_same: TTabSheet
      Caption = #32479#19968#35774#32622
      object Splitter1: TSplitter
        Left = 371
        Top = 0
        Height = 282
        Align = alRight
      end
      object GroupBox1: TGroupBox
        Left = 374
        Top = 0
        Width = 128
        Height = 282
        Align = alRight
        Caption = #35828#26126
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 108
          Height = 12
          Caption = #32479#19968#35774#32622#23545#27599#20010#21592#24037
        end
        object Label4: TLabel
          Left = 8
          Top = 46
          Width = 108
          Height = 12
          Caption = #19968#35270#21516#20161#23545#26381#21153#30340#25552
        end
        object Label5: TLabel
          Left = 8
          Top = 68
          Width = 108
          Height = 12
          Caption = #25104#19968#32463#35774#32622#20043#21518#23545#27599
        end
        object Label6: TLabel
          Left = 8
          Top = 89
          Width = 72
          Height = 12
          Caption = #20301#21592#24037#37117#19968#26679
        end
        object Label7: TLabel
          Left = 8
          Top = 112
          Width = 108
          Height = 12
          Caption = #20998#21035#35774#32622#35270#27599#20301#21592#24037
        end
        object Label8: TLabel
          Left = 8
          Top = 134
          Width = 108
          Height = 12
          Caption = #30340#19981#21516#21363#20351#23545#30456#21516#30340
        end
        object Label9: TLabel
          Left = 8
          Top = 156
          Width = 108
          Height = 12
          Caption = #26381#21153#20063#37319#21462#19981#21516#30340#35774
        end
        object Label10: TLabel
          Left = 8
          Top = 177
          Width = 12
          Height = 12
          Caption = #32622
        end
        object Label11: TLabel
          Left = 8
          Top = 198
          Width = 108
          Height = 12
          Caption = #32479#19968#35774#32622#21644#20998#21035#35774#32622
        end
        object Label12: TLabel
          Left = 8
          Top = 222
          Width = 108
          Height = 12
          Caption = #21482#33021#21462#20854#19968#37325#26032#35774#32622
        end
        object Label13: TLabel
          Left = 8
          Top = 246
          Width = 108
          Height = 12
          Caption = #35831#28857#20987#37325#26032#35774#32622#25353#38062
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 371
        Height = 282
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object sg_same: TStringGrid
          Left = 0
          Top = 0
          Width = 371
          Height = 241
          Align = alClient
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          OnClick = sg_sameClick
          OnSelectCell = sg_sameSelectCell
          ColWidths = (
            72
            88
            50
            79
            52)
        end
        object Panel3: TPanel
          Left = 0
          Top = 241
          Width = 371
          Height = 41
          Align = alBottom
          TabOrder = 1
          object Label2: TLabel
            Left = 174
            Top = 15
            Width = 48
            Height = 12
            AutoSize = False
            Caption = #25552#25104#25968#30446
          end
          object sbtn_sure1: TSpeedButton
            Left = 291
            Top = 10
            Width = 57
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
            OnClick = sbtn_sure1Click
          end
          object RadioGroup1: TRadioGroup
            Left = 0
            Top = 3
            Width = 169
            Height = 33
            Caption = #35774#32622
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #22266#23450#25552#25104
              #25353#30334#20998#27604)
            TabOrder = 0
          end
          object edt_Tcnumber1: TEdit
            Left = 227
            Top = 11
            Width = 57
            Height = 20
            TabOrder = 1
          end
        end
      end
    end
    object sht_specific: TTabSheet
      Caption = #20998#21035#35774#32622
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 153
        Top = 0
        Height = 282
      end
      object Panel4: TPanel
        Left = 156
        Top = 0
        Width = 346
        Height = 282
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object sg_specific: TStringGrid
          Left = 0
          Top = 0
          Width = 346
          Height = 241
          Align = alClient
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goTabs, goRowSelect]
          TabOrder = 0
          OnSelectCell = sg_specificSelectCell
          ColWidths = (
            72
            99
            57
            64
            64)
        end
        object Panel5: TPanel
          Left = 0
          Top = 241
          Width = 346
          Height = 41
          Align = alBottom
          TabOrder = 1
          object Label3: TLabel
            Left = 174
            Top = 15
            Width = 48
            Height = 12
            AutoSize = False
            Caption = #25552#25104#25968#30446
          end
          object sbtn_sure2: TSpeedButton
            Left = 278
            Top = 10
            Width = 57
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
            OnClick = sbtn_sure2Click
          end
          object RadioGroup2: TRadioGroup
            Left = 0
            Top = 3
            Width = 169
            Height = 33
            Caption = #35774#32622
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #22266#23450#25552#25104
              #25353#30334#20998#27604)
            TabOrder = 0
          end
          object edt_Tcnumber2: TEdit
            Left = 227
            Top = 11
            Width = 57
            Height = 20
            TabOrder = 1
          end
        end
      end
      object sg_Employee: TStringGrid
        Left = 0
        Top = 0
        Width = 153
        Height = 282
        Align = alLeft
        ColCount = 2
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goTabs, goRowSelect]
        TabOrder = 1
        OnClick = sg_EmployeeClick
        OnSelectCell = sg_EmployeeSelectCell
        ColWidths = (
          72
          99)
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 33
    Align = alTop
    TabOrder = 1
    object sbtn_front: TSpeedButton
      Left = 10
      Top = 6
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
      Top = 6
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
    object sbtn_close: TSpeedButton
      Left = 436
      Top = 6
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
    object sbtn_save: TSpeedButton
      Left = 304
      Top = 5
      Width = 64
      Height = 23
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
    object sbtn_Reconfig: TSpeedButton
      Left = 140
      Top = 6
      Width = 73
      Height = 22
      Caption = #37325#26032#35774#32622
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
      OnClick = sbtn_ReconfigClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 510
    Height = 23
    Panels = <
      item
        Width = 50
      end>
  end
end
