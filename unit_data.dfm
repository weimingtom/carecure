object WenYianData: TWenYianData
  OldCreateOrder = False
  Left = 216
  Top = 236
  Height = 480
  Width = 696
  object Database1: TDatabase
    AliasName = 'woofgangblank'
    DatabaseName = 'wxyData'
    LoginPrompt = False
    Params.Strings = (
      'username=sa'
      'password=')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object qry_data: TQuery
    DatabaseName = 'wxydata'
    Left = 80
    Top = 16
  end
  object qry_help: TQuery
    DatabaseName = 'wxydata'
    Left = 136
    Top = 24
  end
end
