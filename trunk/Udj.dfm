object fdj: Tfdj
  Left = 184
  Top = 186
  BorderStyle = bsSingle
  Caption = #21333#25454#26597#35810
  ClientHeight = 437
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
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 692
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = #21333#25454#26597#35810
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
    Height = 255
    TabStop = False
    Align = alClient
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
    DataSource = adodm.dsdjsearch
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
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #33647#21697#21517#31216
        Footer.Alignment = taRightJustify
        Footer.Value = #33647#21697#31181#31867#65306
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 138
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #21333#20215
        Footer.FieldName = 'ypid'
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 96
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #25968#37327
        Footer.Value = #37329#39069#21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 103
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #37329#39069
        Footer.FieldName = #37329#39069
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #35268#26684
        Footers = <>
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = #21333#20301
        Footers = <>
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
      Left = 472
      Top = 16
      Width = 48
      Height = 13
      AutoSize = False
      Caption = #32534#21495
    end
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36141#33647#21333#20301
    end
    object search: TSpeedButton
      Left = 624
      Top = 8
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        96090000424D9609000000000000360000002800000028000000140000000100
        1800000000006009000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000FF00FF0000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        00FF0000CE0094FF0000CE000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000FF00FF4A4A
        4ACECECE5A5A5A000000848484CECECECECECECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECE0000000000CE0094FF0000FF
        0000CE000000848484CECECECECECECECECECECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECE0000004A4A4ACECECE8484845A5A5A00
        0000848484FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE
        0000000000000000000000000000CE0094FF0000FF0000CE000000FF00FF8484
        84DEE7DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEADB5AD00000000
        0000000000000000000000CECECE8484845A5A5A000000FF00FF848484FFFFFF
        FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE4A4A4ACE9429CE9429CE94
        299463290000000000FF0000CE000000FF00FFFF00FF848484FFFFFFDEE7DEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEADB5AD4A4A4AADB5ADADB5ADADB5AD848484
        0000008484845A5A5A000000FF00FFFF00FF848484FFFFFF94FFFFFFFFFF94FF
        FFFFFFFF94FFFFCECECE848484FFCE29FFCE29FFCE29CE9429CE942984848400
        0000000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFDEE7DEDEDEDEDEDEDE
        DEDEDEADB5AD848484ADB5ADADB5ADADB5ADADB5ADADB5AD8484840000000000
        00FF00FFFF00FFFF00FF848484FFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF84
        8484ADB5ADFFFF94FFFF94FFCE94FFCE29CE9429848484946329000000FF00FF
        FF00FFFF00FF848484FFFFFFFFFFFFDEE7DEDEE7DEDEDEDEDEDEDE848484ADB5
        ADCECECECECECEBDBDBDBDBDBDADB5AD848484848484000000FF00FFFF00FFFF
        00FF848484FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFF848484FFCE94FFFFCE
        FFFF94FFFF94FFFF94FFCE29848484CE9429000000FF00FFFF00FFFF00FF8484
        84FFFFFFFFFFFFDEE7DEDEE7DEDEDEDEDEDEDE848484CECECEDEE7DEDEDEDEDE
        DEDECECECEBDBDBD848484ADB5AD000000FF00FFFF00FFFF00FF848484FFFFFF
        FFFFFF94FFFFFFFFFF94FFFFFFFFFF848484FFCE94FFFFFFFFFFFFFFFFCEFFFF
        94FFCE94848484CE9429000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFDE
        E7DEDEE7DEDEE7DEDEDEDE848484CECECEFFFFFFFFFFFFDEDEDEDEDEDECECECE
        848484ADB5AD000000FF00FFFF00FFFF00FF848484FFFFFF94FFFFFFFFFF94FF
        FFFFFFFF94FFFF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFF94FFFF9484848484
        8484000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFDEE7DEDEE7DE
        DEDEDE848484ADB5ADFFFFFFFFFFFFFFFFFFDEDEDECECECE8484848484840000
        00FF00FFFF00FFFF00FF848484FFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCE
        CECE848484FFCE94FFFFFFFFFFFFFFFFCEFFFF94848484000000FF00FFFF00FF
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFDEE7DEDEE7DEDEE7DEDEDEDE8484
        84CECECEFFFFFFFFFFFFDEE7DECECECE848484000000FF00FFFF00FFFF00FFFF
        00FF848484FFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE848484
        ADB5ADFFCE94FFCE94ADB5AD000000FF00FFFF00FFFF00FFFF00FFFF00FF8484
        84FFFFFFFFFFFFFFFFFFDEE7DEDEE7DEDEE7DEDEDEDEDEDEDE848484ADB5ADCE
        CECECECECEADB5AD000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFF
        FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE8484848484848484
        84848484000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFF
        FFFFFFFFFFDEE7DEDEE7DEDEE7DEDEE7DEDEDEDE848484848484848484848484
        000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFF94FF
        FFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE000000FF
        00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDEE7DEDEE7DEDEE7DEDEE7DEDEDEDEDEDEDEBDBDBD000000FF00FFFF00
        FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF94
        FFFFFFFFFF94FFFFFFFFFFCECECECECECECECECE000000FF00FFFF00FFFF00FF
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDEE7DEDEE7DEBDBDBDBDBDBDBDBDBD000000FF00FFFF00FFFF00FFFF00FFFF
        00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF
        000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF8484
        84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFFFF
        FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFFFFFF000000
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFF000000FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFF000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF848484848484848484848484848484848484848484848484848484848484
        848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8484
        84848484848484848484848484848484848484848484848484848484848484FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = searchClick
    end
    object DBText1: TDBText
      Left = 304
      Top = 16
      Width = 65
      Height = 17
      DataField = #26085#26399
      DataSource = adodm.dsdjsearch
    end
    object bh: TMaskEdit
      Left = 504
      Top = 11
      Width = 118
      Height = 22
      EditMask = 'aa0000000000000;1; '
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      MaxLength = 15
      TabOrder = 0
      Text = '               '
      OnExit = bhExit
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 16
      Width = 121
      Height = 22
      TabStop = False
      DataField = #21333#20301#21517#31216
      DataSource = adodm.dsdjsearch
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ReadOnly = True
      TabOrder = 1
    end
  end
  object TabControl2: TTabControl
    Left = 0
    Top = 328
    Width = 692
    Height = 109
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
    object BitBtn3: TBitBtn
      Left = 528
      Top = 68
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381'(Esc)'
      ModalResult = 5
      TabOrder = 0
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
    object BitBtn6: TBitBtn
      Left = 430
      Top = 68
      Width = 75
      Height = 25
      Caption = #25171#21360'(&P)'
      TabOrder = 1
      OnClick = BitBtn6Click
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
    object DBEdit2: TDBEdit
      Left = 72
      Top = 16
      Width = 121
      Height = 22
      TabStop = False
      DataField = #25805#20316#20154
      DataSource = adodm.dsdjsearch
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 304
      Top = 16
      Width = 121
      Height = 22
      TabStop = False
      DataField = #24320#31080
      DataSource = adodm.dsdjsearch
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ReadOnly = True
      TabOrder = 3
    end
  end
end