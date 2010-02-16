object frm_StyleSet: Tfrm_StyleSet
  Left = 261
  Top = 244
  Width = 488
  Height = 353
  Caption = #30028#38754#39118#26684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 480
    Height = 29
    ButtonHeight = 21
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 372
    Top = 276
    Width = 85
    Height = 25
    Caption = #20851#38381'(Esc)'
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkClose
    Spacing = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 16
    Width = 449
    Height = 153
    Caption = #31995#32479#25552#20379#30340#30028#38754#35774#35745#19982#37197#33394#26041#26696
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #40664#35748#37197#33394
      #27969#37329#23681#26376
      #28861#28909#27801#28393
      #28385#22253#26149#33394
      #22825#28023#19968#29255
      #34013#35843#24773#24576
      #33889#33796#29087#20102
      #32043#33606#21520#34122
      #24515#36339#22238#24518
      #32418#31881#20339#20154
      #23490#23518#20043#32433
      #20351#29992#33258#23450#20041#30340#37197#33394#26041#26696)
    TabOrder = 2
  end
  object btnWriteBegin: TBitBtn
    Left = 277
    Top = 276
    Width = 75
    Height = 25
    Caption = #20445#23384#35774#32622
    TabOrder = 3
    OnClick = btnWriteBeginClick
  end
  object grpCustomStyle: TGroupBox
    Left = 16
    Top = 176
    Width = 449
    Height = 89
    Caption = #20351#29992#33258#23450#20041#30340#37197#33394#26041#26696
    TabOrder = 4
    object LoadBtn: TButton
      Left = 352
      Top = 48
      Width = 89
      Height = 25
      Caption = #36733#20837'SKN'#25991#20214
      TabOrder = 0
      OnClick = LoadBtnClick
    end
    object edtSkinAddress: TEdit
      Left = 8
      Top = 20
      Width = 433
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      TabOrder = 1
    end
  end
  object Dialog1: TOpenDialog
    Left = 24
    Top = 272
  end
end
