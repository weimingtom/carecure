object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Huida  POS '#21069#21488#25910#27454#32467#24080
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 688
    Height = 426
    Align = alClient
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 88
    object N1: TMenuItem
      Caption = 'F1~F4 '#36827#20837#25910#27454#21488
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #31995#32479#35774#32622'(&S)'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #36864#20986'(&E)'
      OnClick = N3Click
    end
  end
end
