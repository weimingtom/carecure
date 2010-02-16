object frm_cardmanager: Tfrm_cardmanager
  Left = 243
  Top = 174
  Width = 432
  Height = 363
  Caption = #39038#23458#21345#31649#29702
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
    Top = 0
    Width = 424
    Height = 329
    ActivePage = sht_password
    Align = alClient
    TabOrder = 0
    object sht_currency: TTabSheet
      Caption = #39038#23458#20805#20540
      object Label1: TLabel
        Left = 16
        Top = 15
        Width = 48
        Height = 12
        Caption = #39038#23458#32534#21495
      end
      object Label2: TLabel
        Left = 16
        Top = 45
        Width = 48
        Height = 12
        Caption = #39038#23458#21345#21495
      end
      object Label7: TLabel
        Left = 16
        Top = 224
        Width = 48
        Height = 12
        Caption = #20805#20540#37329#39069
      end
      object Label8: TLabel
        Left = 224
        Top = 224
        Width = 48
        Height = 12
        Caption = #20805#20540#26102#38388
      end
      object Label12: TLabel
        Left = 224
        Top = 253
        Width = 48
        Height = 12
        Caption = #25805#20316#21592#24037
      end
      object sbtn_Search1: TSpeedButton
        Left = 224
        Top = 40
        Width = 73
        Height = 25
        Caption = #25628#32034
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
        OnClick = sbtn_Search1Click
      end
      object Label25: TLabel
        Left = 17
        Top = 255
        Width = 48
        Height = 12
        AutoSize = False
        Caption = #37197#36865#31215#20998
      end
      object edt_CusNo1: TEdit
        Left = 80
        Top = 13
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 0
      end
      object edt_CardNo1: TEdit
        Left = 80
        Top = 41
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 72
        Width = 414
        Height = 137
        Caption = #25551#36848#20449#24687
        TabOrder = 5
        object Label3: TLabel
          Left = 13
          Top = 24
          Width = 48
          Height = 12
          AutoSize = False
          Caption = #21345#30340#31867#22411
        end
        object Label4: TLabel
          Left = 223
          Top = 103
          Width = 48
          Height = 12
          Caption = #29616#26377#37329#39069
        end
        object Label5: TLabel
          Left = 13
          Top = 78
          Width = 48
          Height = 12
          Caption = #19978#27425#20805#20540
        end
        object Label6: TLabel
          Left = 223
          Top = 75
          Width = 48
          Height = 12
          Caption = #20805#20540#37329#39069
        end
        object Label9: TLabel
          Left = 223
          Top = 21
          Width = 48
          Height = 12
          Caption = #28040#36153#31215#20998
        end
        object Label10: TLabel
          Left = 224
          Top = 48
          Width = 48
          Height = 12
          Caption = #39044#23384#37329#39069
        end
        object Label11: TLabel
          Left = 14
          Top = 50
          Width = 48
          Height = 12
          Caption = #35686#21578#37329#39069
        end
        object edt_CardType1: TEdit
          Left = 80
          Top = 21
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 0
        end
        object edt_Curcurrency1: TEdit
          Left = 280
          Top = 101
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 6
        end
        object dtp_LastTime1: TDateTimePicker
          Left = 80
          Top = 72
          Width = 121
          Height = 20
          Date = 37915.582335775460000000
          Time = 37915.582335775460000000
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 4
        end
        object edt_LastCurrency1: TEdit
          Left = 280
          Top = 70
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 5
        end
        object edt_CostScore1: TEdit
          Left = 280
          Top = 19
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 1
        end
        object edt_StoreCurrency1: TEdit
          Left = 280
          Top = 45
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 3
        end
        object edt_WarningCurrency1: TEdit
          Left = 80
          Top = 45
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ReadOnly = True
          TabOrder = 2
        end
      end
      object edt_CurrencyAdded: TEdit
        Left = 80
        Top = 221
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 2
        OnExit = edt_CurrencyAddedExit
      end
      object dtp_ThisTime: TDateTimePicker
        Left = 280
        Top = 221
        Width = 121
        Height = 20
        Date = 37915.583350196760000000
        Time = 37915.583350196760000000
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 312
        Top = 0
        Width = 102
        Height = 73
        Caption = #36873#25321
        ItemIndex = 0
        Items.Strings = (
          #39038#23458#32534#21495
          #39038#23458#21345#21495)
        TabOrder = 6
        OnClick = RadioGroup1Click
      end
      object edt_Empno: TEdit
        Left = 280
        Top = 248
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 4
      end
      object Panel1: TPanel
        Left = 0
        Top = 271
        Width = 416
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 7
        object sbtn_save1: TSpeedButton
          Left = 272
          Top = 5
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
          OnClick = sbtn_save1Click
        end
        object sbtn_close1: TSpeedButton
          Left = 344
          Top = 3
          Width = 65
          Height = 24
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
          OnClick = sbtn_close1Click
        end
      end
      object edt_Score: TEdit
        Left = 80
        Top = 251
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 8
      end
    end
    object sht_password: TTabSheet
      Caption = #23494#30721#20462#25913
      ImageIndex = 1
      object sbtn_save2: TSpeedButton
        Left = 272
        Top = 276
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
        OnClick = sbtn_save2Click
      end
      object sbtn_close2: TSpeedButton
        Left = 344
        Top = 275
        Width = 65
        Height = 24
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
        OnClick = sbtn_close2Click
      end
      object Label15: TLabel
        Left = 14
        Top = 222
        Width = 48
        Height = 12
        Caption = #21407#26377#23494#30721
      end
      object Label16: TLabel
        Left = 221
        Top = 224
        Width = 48
        Height = 12
        Caption = #26032#30340#23494#30721
      end
      object Label17: TLabel
        Left = 14
        Top = 251
        Width = 48
        Height = 12
        Caption = #20877#36755#19968#27425
      end
      object Label13: TLabel
        Left = 16
        Top = 15
        Width = 48
        Height = 12
        Caption = #39038#23458#32534#21495
      end
      object Label14: TLabel
        Left = 16
        Top = 45
        Width = 48
        Height = 12
        Caption = #39038#23458#21345#21495
      end
      object SpeedButton6: TSpeedButton
        Left = 224
        Top = 40
        Width = 73
        Height = 25
        Caption = #25628#32034
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
        OnClick = SpeedButton6Click
      end
      object edt_OldPassword: TEdit
        Left = 80
        Top = 219
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edt_OldPasswordExit
      end
      object edt_NewPassword1: TEdit
        Left = 280
        Top = 221
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        PasswordChar = '*'
        TabOrder = 3
      end
      object edt_NewPassword2: TEdit
        Left = 80
        Top = 248
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        PasswordChar = '*'
        TabOrder = 4
      end
      object edt_CardNo2: TEdit
        Left = 80
        Top = 41
        Width = 121
        Height = 20
        Color = 14020849
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 1
      end
      object edt_CusNo2: TEdit
        Left = 80
        Top = 13
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 0
      end
      object RadioGroup2: TRadioGroup
        Left = 312
        Top = 0
        Width = 102
        Height = 73
        Caption = #36873#25321
        ItemIndex = 0
        Items.Strings = (
          #39038#23458#32534#21495
          #39038#23458#21345#21495)
        TabOrder = 5
        OnClick = RadioGroup2Click
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 72
        Width = 415
        Height = 137
        Caption = #25551#36848#20449#24687
        TabOrder = 6
        object Label18: TLabel
          Left = 13
          Top = 24
          Width = 48
          Height = 12
          AutoSize = False
          Caption = #21345#30340#31867#22411
        end
        object Label19: TLabel
          Left = 223
          Top = 103
          Width = 48
          Height = 12
          Caption = #29616#26377#37329#39069
        end
        object Label20: TLabel
          Left = 13
          Top = 78
          Width = 48
          Height = 12
          Caption = #19978#27425#20805#20540
        end
        object Label21: TLabel
          Left = 223
          Top = 77
          Width = 48
          Height = 12
          Caption = #20805#20540#37329#39069
        end
        object Label22: TLabel
          Left = 223
          Top = 21
          Width = 48
          Height = 12
          Caption = #28040#36153#31215#20998
        end
        object Label23: TLabel
          Left = 224
          Top = 48
          Width = 48
          Height = 12
          Caption = #39044#23384#37329#39069
        end
        object Label24: TLabel
          Left = 14
          Top = 50
          Width = 48
          Height = 12
          Caption = #35686#21578#37329#39069
        end
        object edt_CardType2: TEdit
          Left = 80
          Top = 21
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 0
        end
        object edt_Curcurrency2: TEdit
          Left = 280
          Top = 101
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 6
        end
        object dtp_LastTime2: TDateTimePicker
          Left = 80
          Top = 72
          Width = 121
          Height = 20
          Date = 37915.582335775460000000
          Time = 37915.582335775460000000
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 4
        end
        object edt_LastCurrency2: TEdit
          Left = 280
          Top = 70
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 5
        end
        object edt_CostScore2: TEdit
          Left = 280
          Top = 21
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 1
        end
        object edt_StoreCurrency2: TEdit
          Left = 280
          Top = 45
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 3
        end
        object edt_WarningCurrency2: TEdit
          Left = 80
          Top = 45
          Width = 121
          Height = 20
          Color = 14020849
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          TabOrder = 2
        end
      end
    end
  end
end
