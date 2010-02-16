object frm_BizDictionary: Tfrm_BizDictionary
  Left = 234
  Top = 180
  Width = 544
  Height = 372
  Caption = #22522#26412#20449#24687
  Color = clInactiveCaptionText
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 536
    Height = 297
    ActivePage = TabSheet3
    Align = alTop
    HotTrack = True
    Images = adodm.ImageList1
    MultiLine = True
    RaggedRight = True
    Style = tsFlatButtons
    TabHeight = 50
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #21592#24037#20449#24687
      ImageIndex = 12
      OnShow = TabSheet1Show
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 528
        Height = 237
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
        Ctl3D = False
        DataSource = adodm.dsyg
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 2
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        ParentCtl3D = False
        RowHeight = 20
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #21592#24037#32534#21495
            Footer.Value = #21592#24037#20154#25968':'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Width = 68
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #22995#21517
            Footer.FieldName = 'ygid'
            Footer.ValueType = fvtCount
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #31616#30721
            Footers = <>
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #24615#21035
            Footers = <>
            KeyList.Strings = (
              #30007
              #22899)
            PickList.Strings = (
              #30007
              #22899)
            Width = 36
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #24180#40836
            Footers = <>
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            DropDownShowTitles = True
            DropDownSizing = True
            DropDownSpecRow.CellsText = '<Null>;<Null>'
            DropDownWidth = 200
            EditButtons = <>
            FieldName = #37096#38376#21517#31216
            Footers = <>
            LookupDisplayFields = #31616#30721';'#37096#38376#21517#31216
            Width = 102
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #32844#21153
            Footers = <>
            KeyList.Strings = (
              #33829#19994#21592
              #25910#27454#21592
              #32463#29702
              #20250#35745
              #37319#36141#21592
              #20854#23427#20154#21592)
            PickList.Strings = (
              #33829#19994#21592
              #25910#27454#21592
              #32463#29702
              #20250#35745
              #37319#36141#21592
              #20854#23427#20154#21592)
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #38599#20323#26085#26399
            Footers = <>
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #23398#21382
            Footers = <>
            KeyList.Strings = (
              #39640#20013#20197#19979
              #39640#20013'/'#20013#19987
              #19987#31185
              #26412#31185
              #30805#22763
              #30805#22763#20197#19978)
            PickList.Strings = (
              #39640#20013#20197#19979
              #39640#20013'/'#20013#19987
              #19987#31185
              #26412#31185
              #30805#22763
              #30805#22763#20197#19978)
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #20303#22336
            Footers = <>
            Width = 137
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #36523#20221#35777#21495
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #32852#31995#26041#24335
            Footers = <>
            Width = 140
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #22791#27880
            Footers = <>
            Width = 192
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #37096#38376#20449#24687
      ImageIndex = 14
      OnShow = TabSheet2Show
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 528
        Height = 237
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
        DataSource = adodm.dsbm
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh2KeyDown
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #37096#38376#32534#21495
            Footer.Value = #37096#38376#20010#25968#65306
            Footer.ValueType = fvtStaticText
            Footers = <>
            Width = 135
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #37096#38376#21517#31216
            Footer.FieldName = #37096#38376#21517#31216
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 187
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #31616#30721
            Footers = <>
            Width = 173
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24448#26469#21333#20301
      ImageIndex = 11
      OnShow = TabSheet3Show
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 528
        Height = 237
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
        DataSource = adodm.dsdw
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 4
        ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh3KeyDown
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #21517#31216
            Footer.Value = #21333#20301#20010#25968
            Footer.ValueType = fvtStaticText
            Footers = <>
            Width = 99
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #31616#30721
            Footer.FieldName = 'clientid'
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 83
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            DropDownSpecRow.ShowIfNotInKeyList = False
            EditButtons = <>
            FieldName = #31867#22411
            Footers = <>
            PickList.Strings = (
              #20379#24212#21830
              #22823#25209#37327#23458#25143
              #36830#38145#33647#24215)
          end
          item
            AutoDropDown = True
            AutoFitColWidth = False
            DblClickNextVal = True
            DropDownSpecRow.ShowIfNotInKeyList = False
            EditButtons = <>
            FieldName = #20986#20837
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2')
            PickList.Strings = (
              #20986#24211
              #20837#24211
              #26377#20986#26377#20837)
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #27861#20154
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #32852#31995#20154
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #30005#35805
            Footers = <>
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #22320#22336
            Footers = <>
            Width = 126
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = #22791#27880
            Footers = <>
            Width = 121
          end>
      end
    end
  end
  object BitBtn6: TBitBtn
    Left = 350
    Top = 312
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
  object BitBtn7: TBitBtn
    Left = 445
    Top = 312
    Width = 75
    Height = 25
    Caption = #36864#20986'(Esc)'
    TabOrder = 2
    OnClick = BitBtn7Click
    Kind = bkIgnore
  end
  object PrintDBGridEh1: TPrintDBGridEh
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
    PrintFontName = #23435#20307
    Units = MM
    Left = 160
    Top = 96
  end
end
