object Form1: TForm1
  Left = 117
  Top = 167
  Width = 800
  Height = 481
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 792
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = #38144#21806#32479#35745
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TabControl2: TTabControl
    Left = 0
    Top = 368
    Width = 792
    Height = 86
    Align = alBottom
    Style = tsFlatButtons
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 12
      Height = 13
      AutoSize = False
      Caption = #20174
    end
    object Label4: TLabel
      Left = 160
      Top = 24
      Width = 32
      Height = 13
      AutoSize = False
      Caption = #21040
    end
    object SpeedButton1: TSpeedButton
      Left = 552
      Top = 17
      Width = 80
      Height = 22
      Caption = #25353#33647#21697#20998#31867
      Flat = True
    end
    object SpeedButton2: TSpeedButton
      Left = 312
      Top = 17
      Width = 80
      Height = 22
      GroupIndex = 1
      Caption = #25353#37096#38376#20998#31867
      Flat = True
    end
    object SpeedButton3: TSpeedButton
      Left = 472
      Top = 17
      Width = 80
      Height = 22
      GroupIndex = 3
      Caption = #25353#25209#38646#20998#31867
      Flat = True
    end
    object SpeedButton4: TSpeedButton
      Left = 392
      Top = 17
      Width = 80
      Height = 22
      GroupIndex = 2
      Down = True
      Caption = #25353#20154#21592#20998#31867
      Flat = True
    end
    object BitBtn3: TBitBtn
      Left = 712
      Top = 14
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381'(Esc)'
      ModalResult = 5
      TabOrder = 2
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
    object fromdate: TDBDateTimeEditEh
      Left = 32
      Top = 16
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
    end
    object todate: TDBDateTimeEditEh
      Left = 192
      Top = 16
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
    end
    object BitBtn5: TBitBtn
      Left = 641
      Top = 14
      Width = 70
      Height = 25
      Caption = #25171#21360'(&p)'
      TabOrder = 3
      TabStop = False
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
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = []
    Page.BottomMargin = 2
    Page.LeftMargin = 2
    Page.RightMargin = 2
    Page.TopMargin = 2
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
    Left = 360
    Top = 72
  end
end
