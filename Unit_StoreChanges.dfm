object frm_StoreChanges: Tfrm_StoreChanges
  Left = 250
  Top = 86
  Width = 696
  Height = 600
  Caption = #24211#23384#32479#35745
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 688
    Height = 49
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 12
      Height = 13
      AutoSize = False
      Caption = #20174
    end
    object Label4: TLabel
      Left = 160
      Top = 16
      Width = 32
      Height = 13
      AutoSize = False
      Caption = #21040
    end
    object fromdate: TDBDateTimeEditEh
      Left = 32
      Top = 8
      Width = 121
      Height = 24
      EditButtons = <>
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object todate: TDBDateTimeEditEh
      Left = 192
      Top = 8
      Width = 121
      Height = 24
      EditButtons = <>
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object BitBtn5: TBitBtn
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = #21047#26032'(&R)'
      TabOrder = 2
      OnClick = BitBtn5Click
      Kind = bkRetry
    end
    object BitBtn1: TBitBtn
      Left = 426
      Top = 8
      Width = 70
      Height = 25
      Caption = #25171#21360'(&p)'
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        96090000424D9609000000000000360000002800000028000000140000000100
        1800000000006009000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000FF00
        FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFF7F7F7DEDEDEDEDEDECECECECE
        CECECECECEADB5ADADB5ADADB5ADADB5ADADB5AD0000005A5A5A000000FF00FF
        FF00FFFF00FFFF00FF848484FFFFFFF7F7F7DEDEDEDEDEDECECECECECECECECE
        CEADB5ADADB5ADADB5ADADB5ADADB5AD0000005A5A5A000000FF00FFFF00FFFF
        00FFFF00FF848484FFFFFFF7F7F7DEDEDEDEDEDECECECECECECECECECEADB5AD
        ADB5ADADB5ADADB5ADADB5AD0000005A5A5A5A5A5A000000FF00FFFF00FFFF00
        FF848484FFFFFFF7F7F7DEDEDEDEDEDECECECECECECECECECEADB5ADADB5ADAD
        B5ADADB5ADADB5AD0000005A5A5A5A5A5A000000FF00FFFF00FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005A5A5A5A5A5A000000FF00FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000005A5A5A5A5A5A000000FF00FF848484FFFFFFF7F7F7F7F7F7DEDE
        DEDEDEDECECECECECECECECECE00FF0000FF0000FF0000FF00CECECECECECE00
        00000000005A5A5A000000FF00FF848484FFFFFFF7F7F7F7F7F7DEDEDEDEDEDE
        CECECECECECECECECEF7F7F7F7F7F7F7F7F7F7F7F7CECECECECECE0000000000
        005A5A5A000000FF00FF848484FFFFFFFFFFFFF7F7F7F7F7F7DEDEDEDEDEDECE
        CECECECECE007B00007B00007B00007B00CECECECECECE000000848484000000
        000000FF00FF848484FFFFFFFFFFFFF7F7F7F7F7F7DEDEDEDEDEDECECECECECE
        CE848484848484848484848484CECECECECECE000000848484000000000000FF
        00FF848484FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7DEDEDEDEDEDECECECECECECE
        CECECECECECECECECECECECECECECE000000848484848484000000FF00FF8484
        84FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7DEDEDEDEDEDECECECECECECECECECECE
        CECECECECECECECECECECE000000848484848484000000FF00FF848484848484
        8484848484848484848484848484848484848484848484848484848484848484
        8484848484848400000084848484848484848400000084848484848484848484
        8484848484848484848484848484848484848484848484848484848484848484
        848484000000848484848484848484000000848484FFFFFFFFFFFFFFFFFFF7F7
        F7F7F7F7F7F7F7DEDEDEDEDEDEDEDEDECECECECECECECECECECECECE00000084
        8484000000848484848484000000848484FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7
        F7F7F7DEDEDEDEDEDEDEDEDECECECECECECECECECECECECE0000008484840000
        00848484848484000000FF00FF84848484848484848484848484848484848484
        8484848484848484848484848484848484848484848484000000848484000000
        848484000000FF00FF8484848484848484848484848484848484848484848484
        8484848484848484848484848484848484848400000084848400000084848400
        0000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000848484000000848484000000000000FF00
        FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000848484000000848484000000000000FF00FFFF00FF
        FF00FF848484CECECEFFFFFFCE3100CE3100CE3100CE3100CE3100CE3100CE31
        00FFFFFF000000848484848484000000848484000000FF00FFFF00FFFF00FF84
        8484CECECEFFFFFF636363636363636363636363636363636363636363FFFFFF
        000000848484848484000000848484000000FF00FFFF00FFFF00FFFF00FF8484
        84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE00
        0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE0000000000
        00000000000000FF00FFFF00FFFF00FFFF00FFFF00FF848484CECECEFFFFFFFF
        3129FF3129FF3129FF3129FF3129FF3129FF3129FFFFFF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484CECECEFFFFFF6363636363
        63636363636363636363636363636363FFFFFF000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCECECE000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF848484CECECEFFFFFFFF6329FF6329FF6329FF6329FF63
        29FF6329FF6329FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF848484CECECEFFFFFF848484848484848484848484848484848484
        848484FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF848484CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCECECE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        848484CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECE
        CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84
        8484848484848484848484848484848484848484848484848484848484848484
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8484848484
        84848484848484848484848484848484848484848484848484848484FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 517
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381'(Esc)'
      ModalResult = 5
      TabOrder = 4
      OnClick = BitBtn3Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
        44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
        00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
        33833F333383F33300003333AA463362A433333333383F333833F33300003333
        6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
        33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
        6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
        000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
        333383333333F3330000333333322AAA4333333333333833333F333300003333
        333322A4333333333333338333F333330000333333344A433333333333333338
        3F333333000033333336A24333333333333333833F333333000033333336AA43
        33333333333333833F3333330000333333336663333333333333333888333333
        0000}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 688
    Height = 517
    ActivePage = TabSheet2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #24211#23384#21464#21160#26126#32454
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 680
        Height = 483
        TabStop = False
        Align = alClient
        DataSource = DMod.dscrlist
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #38144#21806#32534#21495
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #21517#31216
            Footers = <>
            Width = 90
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #21333#20301
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #35268#26684
            Footers = <>
            Width = 56
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #25968#37327
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #37329#39069
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #31867#22411
            Footers = <>
          end
          item
            AutoFitColWidth = False
            Checkboxes = False
            EditButtons = <>
            FieldName = #20986#20837
            Footers = <>
            KeyList.Strings = (
              'false'
              'true')
            PickList.Strings = (
              #24211#23384#20943#23569
              #24211#23384#22686#21152)
            Width = 53
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #26085#26399
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #29983#20135#21378#23478
            Footers = <>
            Width = 131
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #21058#22411
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #25805#20316#20154
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #22995#21517
            Footers = <>
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24211#23384#21464#21160#32479#35745
      ImageIndex = 1
      object Label1: TLabel
        Left = 64
        Top = 40
        Width = 36
        Height = 16
        Caption = #20837#24211#65306
      end
      object Label3: TLabel
        Left = 64
        Top = 72
        Width = 36
        Height = 16
        Caption = #30424#30408#65306
      end
      object Label5: TLabel
        Left = 320
        Top = 40
        Width = 36
        Height = 16
        Caption = #36864#33647#65306
      end
      object Label6: TLabel
        Left = 320
        Top = 80
        Width = 36
        Height = 16
        Caption = #38144#21806#65306
      end
      object Label7: TLabel
        Left = 320
        Top = 176
        Width = 36
        Height = 16
        Caption = #30424#20111#65306
      end
      object Label8: TLabel
        Left = 320
        Top = 144
        Width = 36
        Height = 16
        Caption = #25253#25439#65306
      end
      object Label9: TLabel
        Left = 112
        Top = 8
        Width = 145
        Height = 13
        AutoSize = False
        Caption = #24211#23384#22686#21152#39033#30446
      end
      object Label10: TLabel
        Left = 376
        Top = 8
        Width = 129
        Height = 13
        AutoSize = False
        Caption = #24211#23384#20943#23569#39033#30446
      end
      object Bevel1: TBevel
        Left = 272
        Top = 24
        Width = 9
        Height = 201
        Shape = bsLeftLine
      end
      object Label11: TLabel
        Left = 376
        Top = 100
        Width = 36
        Height = 16
        Caption = #25209#21457#65306
      end
      object Label12: TLabel
        Left = 376
        Top = 124
        Width = 36
        Height = 16
        Caption = #38646#21806#65306
      end
      object Label13: TLabel
        Left = 54
        Top = 236
        Width = 36
        Height = 16
        Caption = #21512#35745#65306
      end
      object Label14: TLabel
        Left = 318
        Top = 236
        Width = 36
        Height = 16
        Caption = #21512#35745#65306
      end
      object Label15: TLabel
        Left = 320
        Top = 264
        Width = 36
        Height = 16
        Caption = #24046#39069#65306
      end
      object rk: TEdit
        Left = 104
        Top = 40
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 0
        Text = 'rk'
      end
      object py: TEdit
        Left = 104
        Top = 72
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit1'
      end
      object ty: TEdit
        Left = 360
        Top = 40
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit1'
      end
      object xs: TEdit
        Left = 360
        Top = 72
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit1'
      end
      object pk: TEdit
        Left = 360
        Top = 176
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 4
        Text = 'Edit1'
      end
      object bs: TEdit
        Left = 360
        Top = 144
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 5
        Text = 'Edit1'
      end
      object pf: TEdit
        Left = 416
        Top = 96
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 6
        Text = 'pf'
      end
      object ls: TEdit
        Left = 416
        Top = 120
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ReadOnly = True
        TabOrder = 7
        Text = 'ls'
      end
      object zj: TEdit
        Left = 102
        Top = 232
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 8
        Text = 'zj'
      end
      object js: TEdit
        Left = 358
        Top = 232
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 9
        Text = 'js'
      end
      object ce: TEdit
        Left = 360
        Top = 264
        Width = 121
        Height = 24
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        TabOrder = 10
        Text = 'ce'
      end
    end
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 208
    Top = 56
  end
end
