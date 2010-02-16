object frm_GoodsWholeSale: Tfrm_GoodsWholeSale
  Left = 102
  Top = 122
  BorderStyle = bsSingle
  Caption = #25209#21457
  ClientHeight = 417
  ClientWidth = 692
  Color = clInactiveCaptionText
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 692
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = #33647#21697#25209#21457#21333
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 73
    Width = 692
    Height = 227
    Align = alClient
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
    DataSource = adodm.dscr
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
    ParentFont = False
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = DBGridEh1ColEnter
    OnColExit = DBGridEh1ColExit
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        AutoDropDown = True
        AutoFitColWidth = False
        DropDownWidth = 300
        EditButtons = <>
        FieldName = #33647#21697#31616#30721
        Footer.Value = #21697#31181#21512#35745#65306
        Footer.ValueType = fvtStaticText
        Footers = <>
        LookupDisplayFields = #31616#30721';'#32534#21495';'#21517#31216
        Width = 62
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #25968#37327
        Footer.FieldName = #33647#21697#31616#30721
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 68
      end
      item
        AutoDropDown = True
        AutoFitColWidth = False
        DropDownWidth = 300
        EditButtons = <>
        FieldName = #33647#21697#32534#21495
        Footer.EndEllipsis = True
        Footers = <>
        LookupDisplayFields = #31616#30721';'#32534#21495';'#21517#31216
        Width = 68
      end
      item
        AutoDropDown = True
        AutoFitColWidth = False
        DropDownWidth = 300
        EditButtons = <>
        FieldName = #33647#21697#21517#31216
        Footers = <>
        LookupDisplayFields = #31616#30721';'#32534#21495';'#21517#31216
        Width = 73
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #21333#20215
        Footer.Value = #21512#35745#65306
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #37329#39069
        Footer.EndEllipsis = True
        Footer.FieldName = #37329#39069
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 83
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #21333#20301
        Footers = <>
        ReadOnly = True
        Width = 71
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #35268#26684
        Footers = <>
        ReadOnly = True
        Width = 87
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #25209#21457#20215
        Footers = <>
        ReadOnly = True
      end>
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 29
    Width = 692
    Height = 44
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object Label2: TLabel
      Left = 512
      Top = 16
      Width = 48
      Height = 13
      AutoSize = False
      Caption = #32534#21495
    end
    object Label3: TLabel
      Left = 320
      Top = 16
      Width = 41
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36141#33647#21333#20301
    end
    object dw: TDBLookupComboboxEh
      Left = 72
      Top = 16
      Width = 121
      Height = 22
      DropDownBox.AutoDrop = True
      DropDownBox.Width = 200
      EditButtons = <>
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      KeyField = 'clientid'
      ListField = #31616#30721';'#21517#31216
      ListFieldIndex = 1
      ListSource = adodm.dsdw
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = dwChange
      OnExit = dwExit
    end
    object Edit2: TEdit
      Left = 568
      Top = 16
      Width = 105
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      TabOrder = 1
    end
  end
  object TabControl2: TTabControl
    Left = 0
    Top = 300
    Width = 692
    Height = 117
    Align = alBottom
    Style = tsFlatButtons
    TabOrder = 2
    object Label5: TLabel
      Left = 16
      Top = 20
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25805#20316#20154
    end
    object Label6: TLabel
      Left = 240
      Top = 20
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #24320#31080#20154
    end
    object Label7: TLabel
      Left = 488
      Top = 40
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #23454#20184#37329#39069#65306
    end
    object Label8: TLabel
      Left = 488
      Top = 64
      Width = 33
      Height = 17
      AutoSize = False
      Caption = #25214#38065#65306
    end
    object sncCurrencyLabel1: TsncCurrencyLabel
      Left = 560
      Top = 8
      Width = 129
      Height = 26
      Ctl3D = False
      DecimalSymbols.Strings = (
        #35282
        #20998)
      DigitalSymbols.Strings = (
        #20803
        #21313
        #30334
        #21315
        #19975
        #21313
        #30334
        #21315
        #20159
        #21313
        #30334
        #21315
        #19975)
      ParentColor = False
    end
    object Edit1: TEdit
      Left = 72
      Top = 17
      Width = 97
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ReadOnly = True
      TabOrder = 1
    end
    object ren: TDBLookupComboboxEh
      Left = 312
      Top = 17
      Width = 129
      Height = 22
      DropDownBox.AutoDrop = True
      DropDownBox.Width = 150
      EditButtons = <>
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      KeyField = 'ygid'
      ListField = #22995#21517';'#21592#24037#32534#21495
      ListSource = adodm.dsyg
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = renChange
      OnExit = renExit
    end
    object print: TCheckBox
      Left = 64
      Top = 80
      Width = 97
      Height = 17
      Caption = #25171#21360#25209#21457#21333
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object save: TBitBtn
      Left = 165
      Top = 75
      Width = 69
      Height = 25
      Caption = #23384#30424'(&S)'
      TabOrder = 4
      TabStop = False
      OnClick = saveClick
      Glyph.Data = {
        96090000424D9609000000000000360000002800000028000000140000000100
        1800000000006009000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000FF00FFFF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000FF00FF2963636394946394946394942931
        29293129293129293129293129293129293129293129293129ADB5ADADB5ADAD
        B5AD2931290063630063630000008484848484848484848484844A4A4A4A4A4A
        4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AADB5ADADB5ADADB5AD4A4A
        4A84848484848400000029636363949494CECE94CECE4A4A4A4A4A4A29312929
        3129293129293129293129293129293129CECECEADB5ADADB5AD293129639494
        006363000000848484848484ADB5ADADB5AD6363636363634A4A4A4A4A4A4A4A
        4A4A4A4A4A4A4A4A4A4A4A4A4ACECECEADB5ADADB5AD4A4A4A84848484848400
        000029636394CECE94CECE94CECE4A4A4A4A4A4A4A4A4A4A4A4A293129293129
        293129293129293129CECECEADB5ADADB5AD2931296394946394940000008484
        84ADB5ADADB5ADADB5AD6363636363636363636363634A4A4A4A4A4A4A4A4A4A
        4A4A4A4A4ACECECEADB5ADADB5AD4A4A4A84848484848400000029636394CECE
        94CECE94CECE4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A2931292931292931292931
        29CECECECECECEADB5AD293129639494639494000000848484ADB5ADADB5ADAD
        B5AD6363636363636363636363636363634A4A4A4A4A4A4A4A4A4A4A4ACECECE
        CECECEADB5AD4A4A4A84848484848400000029636394CECE94CECE94CECE4A4A
        4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A293129293129FFFFFFCECECEAD
        B5AD293129639494639494000000848484ADB5ADADB5ADADB5AD636363636363
        6363636363636363636363636363634A4A4A4A4A4AFFFFFFCECECEADB5AD4A4A
        4A848484848484000000296363CEFFFF94CECE94CECE4A4A4A4A4A4A4A4A4A4A
        4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A293129639494
        639494000000848484CECECEADB5ADADB5AD6363636363636363636363636363
        636363636363636363636363636363636363636363634A4A4A84848484848400
        0000296363CEFFFF94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CECE
        94CECE94CECE94CECE94CECE94CECE94CECE94CECE6394946394940000008484
        84CECECEADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADAD
        B5ADADB5ADADB5ADADB5ADADB5ADADB5AD848484848484000000296363CEFFFF
        CEFFFF94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CE
        CE94CECE94CECE94CECE94CECE94CECE639494000000848484CECECECECECEAD
        B5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5ADADB5AD
        ADB5ADADB5ADADB5ADADB5AD848484000000296363CEFFFFCEFFFF94CECE2963
        6329636329636329636329636329636329636329636329636329636329636329
        636394CECE94CECE639494000000848484CECECECECECEADB5AD5A5A5A5A5A5A
        5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AADB5
        ADADB5AD848484000000296363CEFFFFCEFFFF639494CEFFFFCEFFFFCEFFFF94
        FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF29636394CECE
        94CECE000000848484DEE7DECECECE848484DEDEDECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECECECE5A5A5AADB5ADADB5AD00
        0000296363CEFFFFCEFFFF639494FFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF
        94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF29636394CECE94CECE0000008484
        84DEE7DECECECE848484FFFFFFDEDEDEDEDEDEDEDEDEDEDEDEDEDEDECECECECE
        CECECECECECECECECECECECECECE5A5A5AADB5ADADB5AD000000296363CEFFFF
        CEFFFF639494FFFFFFFFFFFFCEFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
        FF94FFFF94FFFF94FFFF29636394CECE94CECE000000848484DEE7DEDEE7DE84
        8484FFFFFFFFFFFFFFFFFFDEE7DEDEDEDEDEDEDEDEDEDEDEDEDECECECECECECE
        CECECECECECE5A5A5AADB5ADADB5AD000000296363CEFFFFCEFFFF639494FFFF
        FFFFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF94FFFF94
        FFFF29636394CECE94CECE000000848484DEE7DEDEE7DE848484FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDEE7DEDEE7DEDEDEDEDEDEDEDEDEDECECECECECECE5A5A
        5AADB5ADADB5AD000000296363CEFFFFCEFFFF639494FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF94FFFF29636394CECE
        94CECE000000848484DEE7DEDEE7DE848484FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFDEE7DEDEE7DEDEDEDEDEDEDECECECECECECE5A5A5AADB5ADADB5AD00
        0000296363FFFFFFCEFFFF639494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF29636394CECE94CECE0000008484
        84FFFFFFDEE7DE848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
        E7DEDEE7DEDEDEDEDEDEDECECECE5A5A5AADB5ADADB5AD000000296363FFFFFF
        CEFFFF639494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
        FFCEFFFFCEFFFF94FFFF29636394CECE94CECE000000848484FFFFFFDEE7DE84
        8484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE7DEDEDEDE
        DEDEDECECECE5A5A5AADB5ADADB5AD000000296363FFFFFFFFFFFF639494FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFF94
        FFFF296363296363296363000000848484FFFFFFFFFFFF848484FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE7DEDEDEDEDEDEDE5A5A
        5A84848484848400000029636394CECEFFFFFF63949463946363946363946363
        9463639463639463639463639463639463639463639463639463296363BDBDBD
        FFFFFF000000848484FFFFFFFFFFFF848484CECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECECECE5A5A5ABDBDBDFFFFFF00
        0000296363296363296363639494639463639463639463639463639463639463
        6394636394636394636394636394636394632963632963632963630000008484
        8484848484848484848484848484848484848484848484848484848484848484
        8484848484848484848484848484848484848484848484000000}
      NumGlyphs = 2
    end
    object ret: TBitBtn
      Left = 272
      Top = 75
      Width = 72
      Height = 25
      Caption = #26032#21333'(&G)'
      TabOrder = 5
      OnClick = retClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object sf: TsncCurrencyEdit
      Left = 560
      Top = 32
      Width = 129
      Height = 24
      CurrencySymbol = #65509
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NegativeFont.Charset = DEFAULT_CHARSET
      NegativeFont.Color = clWindowText
      NegativeFont.Height = -11
      NegativeFont.Name = 'MS Sans Serif'
      NegativeFont.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      ZeroEmpty = False
      OnExit = sfExit
    end
    object zq: TsncCurrencyEdit
      Left = 560
      Top = 56
      Width = 129
      Height = 24
      CurrencySymbol = #65509
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NegativeFont.Charset = DEFAULT_CHARSET
      NegativeFont.Color = clWindowText
      NegativeFont.Height = -11
      NegativeFont.Name = 'MS Sans Serif'
      NegativeFont.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
      TabStop = True
      ZeroEmpty = False
    end
    object BitBtn3: TBitBtn
      Left = 384
      Top = 76
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381'(Esc)'
      ModalResult = 5
      TabOrder = 7
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
  object sum1: TDBSumList
    Active = False
    DataSet = adodm.tcr
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = #37329#39069
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 376
    Top = 120
  end
end
