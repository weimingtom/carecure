object DMod: TDMod
  OldCreateOrder = False
  Left = 288
  Top = 154
  Height = 510
  Width = 724
  object ADOConn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=data\caremdb.mdb;Pe' +
      'rsist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 96
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 168
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 232
    Top = 8
  end
  object ADOCON: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\eagle\Careprojec' +
      't\source\trunk\data\caremdb.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 72
  end
  object qrydata: TADOQuery
    Connection = ADOCON
    Parameters = <>
    Left = 96
    Top = 72
  end
  object qrydata2: TADOQuery
    Connection = ADOCON
    Parameters = <>
    Left = 160
    Top = 72
  end
  object qrydata3: TADOQuery
    Connection = ADOCON
    Parameters = <>
    Left = 224
    Top = 72
  end
  object tyg: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'OperatorTable'
    Left = 16
    Top = 416
    object tygusername: TWideStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'username'
      Size = 10
    end
    object tygoper: TWideStringField
      DisplayLabel = #30495#23454#22995#21517
      FieldName = 'oper'
      Size = 10
    end
    object tygDSDesigner: TWideStringField
      FieldName = #32844#21153
      Size = 10
    end
    object tygDSDesigner2: TIntegerField
      FieldName = #24180#40836
    end
    object tygDSDesigner3: TDateTimeField
      FieldName = #38599#20323#26085#26399
    end
    object tygDSDesigner4: TWideStringField
      FieldName = #24615#21035
      Size = 2
    end
    object tygDSDesigner5: TWideStringField
      FieldName = #23398#21382
      Size = 10
    end
    object tygDSDesigner6: TWideStringField
      FieldName = #20303#22336
      Size = 50
    end
    object tygDSDesigner7: TWideStringField
      FieldName = #36523#20221#35777#21495
      Size = 18
    end
    object tygDSDesigner8: TWideStringField
      FieldName = #32852#31995#26041#24335
      Size = 25
    end
    object tygDSDesigner9: TWideStringField
      FieldName = #22791#27880
      Size = 50
    end
    object tygDSDesigner10: TWideStringField
      FieldName = #25152#23646#37096#38376
      Size = 3
    end
    object tyguserid: TFloatField
      FieldName = 'userid'
    end
  end
  object dsyg: TDataSource
    DataSet = tyg
    Left = 48
    Top = 416
  end
  object TBH: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'bh'
    Left = 120
    Top = 232
  end
  object tuser: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'OperatorTable'
    Left = 328
    Top = 368
  end
  object dsuser: TDataSource
    DataSet = tuser
    Left = 360
    Top = 368
  end
  object toper: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 'select  * from oper '
    Parameters = <>
    Left = 328
    Top = 200
    object toperDSDesigner: TDateTimeField
      FieldName = #30331#24405#26102#38388
    end
    object toperDSDesigner2: TDateTimeField
      FieldName = #36864#20986#26102#38388
    end
    object toperuserid: TWideStringField
      FieldName = 'userid'
      Size = 50
    end
  end
  object dsoper: TDataSource
    DataSet = toper
    Left = 376
    Top = 200
  end
  object typzdk: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'ypzdk'
    Left = 480
    Top = 424
    object typzdkid: TWideStringField
      FieldName = 'id'
      Size = 8
    end
    object typzdkDSDesigner: TWideStringField
      FieldName = #21517#31216
      Size = 50
    end
    object typzdkDSDesigner2: TWideStringField
      FieldName = #32534#21495
      FixedChar = True
      Size = 16
    end
    object typzdkDSDesigner3: TWideStringField
      FieldName = #26465#30721
      Size = 15
    end
    object typzdkDSDesigner4: TWideStringField
      FieldName = #31616#30721
      Size = 10
    end
    object typzdkDSDesigner5: TWideStringField
      FieldName = #21333#20301
      Size = 4
    end
    object typzdkDSDesigner6: TWideStringField
      FieldName = #35268#26684
    end
    object typzdkDSDesigner7: TWideStringField
      FieldName = #29983#20135#21378#23478
      Size = 50
    end
    object typzdkDSDesigner8: TWideStringField
      FieldName = #25209#20934#25991#21495
      Size = 30
    end
    object typzdkDSDesigner9: TIntegerField
      FieldName = #26368#39640#38480#37327
    end
    object typzdkDSDesigner10: TIntegerField
      FieldName = #26368#20302#38480#37327
    end
    object typzdkDSDesigner11: TFloatField
      FieldName = #25209#21457#20215
    end
    object typzdkDSDesigner12: TFloatField
      FieldName = #38646#21806#20215
    end
    object typzdkDSDesigner13: TMemoField
      FieldName = #20027#27835
      BlobType = ftMemo
    end
    object typzdkDSDesigner14: TWideStringField
      FieldName = #21058#22411
      Size = 10
    end
    object typzdkDSDesigner15: TWideStringField
      FieldName = #20998#31867
      Size = 10
    end
    object typzdkDSDesigner16: TWideStringField
      FieldName = #29983#20135#25209#21495
    end
    object typzdkDSDesigner17: TWideStringField
      FieldName = #20379#24212#21830
      Size = 50
    end
    object typzdkDSDesigner18: TWideStringField
      FieldName = #27880#20876#21830#26631
    end
    object typzdkDSDesigner19: TWideStringField
      FieldName = #21512#26684#35777
    end
    object typzdkDSDesigner20: TFloatField
      FieldName = #20817#25442#28857
    end
  end
  object dsypzdk: TDataSource
    DataSet = typzdk
    Left = 520
    Top = 424
  end
  object YDTemp: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    Parameters = <>
    Left = 152
    Top = 168
  end
  object txstj: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 
      'select c.'#21517#31216',c.'#32534#21495' as '#29983#20135#25209#21495',c.'#25209#20934#25991#21495',sum(b.'#25968#37327') as '#38144#21806#25968#37327',sum(b.'#37329#39069') as '#38144 +
      #21806#37329#39069', sum(b.'#37329#39069'-b.'#25104#26412#37329#39069') as '#21033#28070', c.id as '#33647#21697#26631#35782#21495'  from cr b ,ypzdk c w' +
      'here (b.'#31867#22411'='#39#38646#21806#39' or b.'#31867#22411'='#39#25209#21457#39' or  b.'#31867#22411'='#39#22788#26041#39') and b.ypid=c.id  gro' +
      'up by c.'#21517#31216',c.id,c.'#32534#21495',c.'#25209#20934#25991#21495
    Parameters = <>
    Left = 448
    Top = 368
  end
  object dsxstj: TDataSource
    DataSet = txstj
    Left = 488
    Top = 368
  end
  object TXgPd: TADOQuery
    Connection = ADOCON
    Parameters = <>
    Left = 104
    Top = 168
  end
  object tdjsearch: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 
      'select a.crid,a.'#32534#21495' as '#21333#25454#21495',a.ypid as '#33647#21697#32534#21495',a.'#29983#20135#25209#21495',a.'#26377#25928#26399#33267',b.'#21517#31216', a.'#25968 +
      #37327' as '#25968#37327',a.'#21333#20215',a.'#37329#39069',a.'#25805#20316#20154',a.'#26085#26399',a.'#31867#22411',a.'#26588#32452',a.'#25187#29575',a.'#32467#27454#26041#24335',a.'#32467#27454#26085#26399',a.'#20316#24223#26085#26399 +
      ',a.'#21333#25454#29366#24577',a.'#20379#24212#21830',a.'#23458#25143',a.'#23548#36141#21592',a.'#24320#31080#21592',a.'#36141#36827#26085#26399'  from cr a,ypzdk b,kc c  w' +
      'here a.ypid=b.id and a.ypid=c.ypid order by '#26085#26399
    Parameters = <>
    Left = 328
    Top = 72
  end
  object dsdjsearch: TDataSource
    DataSet = tdjsearch
    Left = 376
    Top = 72
  end
  object ttemp: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 'select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid'
    Parameters = <>
    Left = 296
    Top = 312
  end
  object dstemp: TDataSource
    DataSet = ttemp
    Left = 336
    Top = 312
  end
  object TTYpzd: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 'select * from ypzdk'
    Parameters = <>
    Left = 608
    Top = 312
    object TTYpzdid: TWideStringField
      FieldName = 'id'
      Size = 8
    end
    object TTYpzdDSDesigner: TWideStringField
      FieldName = #21517#31216
      Size = 50
    end
    object TTYpzdDSDesigner2: TWideStringField
      FieldName = #32534#21495
      FixedChar = True
      Size = 16
    end
    object TTYpzdDSDesigner3: TWideStringField
      FieldName = #26465#30721
      Size = 15
    end
    object TTYpzdDSDesigner4: TWideStringField
      FieldName = #31616#30721
      Size = 10
    end
    object TTYpzdDSDesigner5: TWideStringField
      FieldName = #21333#20301
      Size = 4
    end
    object TTYpzdDSDesigner6: TWideStringField
      FieldName = #35268#26684
    end
    object TTYpzdDSDesigner7: TWideStringField
      FieldName = #29983#20135#21378#23478
      Size = 50
    end
    object TTYpzdDSDesigner8: TWideStringField
      FieldName = #25209#20934#25991#21495
      Size = 30
    end
    object TTYpzdDSDesigner9: TIntegerField
      FieldName = #26368#39640#38480#37327
    end
    object TTYpzdDSDesigner10: TIntegerField
      FieldName = #26368#20302#38480#37327
    end
    object TTYpzdDSDesigner11: TFloatField
      FieldName = #25209#21457#20215
    end
    object TTYpzdDSDesigner12: TFloatField
      FieldName = #38646#21806#20215
    end
    object TTYpzdDSDesigner13: TMemoField
      FieldName = #20027#27835
      BlobType = ftMemo
    end
    object TTYpzdDSDesigner14: TWideStringField
      FieldName = #21058#22411
      Size = 10
    end
    object TTYpzdDSDesigner15: TWideStringField
      FieldName = #20998#31867
      Size = 10
    end
    object TTYpzdDSDesigner16: TWideStringField
      FieldName = #29983#20135#25209#21495
    end
    object TTYpzdDSDesigner17: TWideStringField
      FieldName = #20379#24212#21830
      Size = 50
    end
  end
  object DsYpzd: TDataSource
    DataSet = TTYpzd
    Left = 656
    Top = 312
  end
  object TPhkc: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 'select a.*,b.*  from cr a,ypzdk b  where a.ypid=b.id'
    Parameters = <>
    Left = 536
    Top = 200
  end
  object DSPhkc: TDataSource
    DataSet = TPhkc
    Left = 576
    Top = 200
  end
  object tcr: TADODataSet
    CacheSize = 1000
    Connection = ADOCON
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select a.*,b.'#25209#20934#25991#21495',b.'#29983#20135#21378#23478',a.'#20379#24212#21830',b.'#32534#21495' as '#29983#20135#25209#21495',b.'#20817#25442#28857'  from cr a,ypz' +
      'dk b where a.ypid=b.id  and 1=2'
    ParamCheck = False
    Parameters = <>
    Left = 512
    Top = 8
    object tcrcrid: TAutoIncField
      FieldName = 'crid'
      ReadOnly = True
    end
    object tcrDSDesigner: TStringField
      FieldName = #32534#21495
      KeyFields = #32534#21495
      FixedChar = True
      Size = 18
    end
    object tcrDSDesigner2: TIntegerField
      FieldName = #20986#24211#21333#20301
    end
    object tcrDSDesigner3: TIntegerField
      FieldName = #20837#24211#21333#20301
    end
    object tcrDSDesigner4: TFloatField
      FieldName = #25968#37327
    end
    object tcrDSDesigner6: TBCDField
      FieldName = #37329#39069
      Required = True
      Precision = 15
    end
    object tcrDSDesigner7: TStringField
      FieldName = #25805#20316#20154
      Size = 12
    end
    object tcrDSDesigner8: TIntegerField
      FieldName = #24320#31080#20154
    end
    object tcrDSDesigner10: TDateTimeField
      FieldName = #26085#26399
    end
    object tcrDSDesigner12: TStringField
      FieldName = #31867#22411
      Size = 10
    end
    object tcrDSDesigner13: TBooleanField
      FieldName = #20986#20837
    end
    object tcrField: TStringField
      FieldKind = fkLookup
      FieldName = #33647#21697#21517#31216
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #21517#31216
      KeyFields = 'ypid'
      Required = True
      Size = 30
      Lookup = True
    end
    object tcrField2: TStringField
      FieldKind = fkLookup
      FieldName = #33647#21697#32534#21495
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #32534#21495
      KeyFields = 'ypid'
      Lookup = True
    end
    object tcrField3: TStringField
      FieldKind = fkLookup
      FieldName = #33647#21697#31616#30721
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #31616#30721
      KeyFields = 'ypid'
      Size = 10
      Lookup = True
    end
    object tcrField4: TFloatField
      FieldKind = fkLookup
      FieldName = #25209#21457#20215
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #25209#21457#20215
      KeyFields = 'ypid'
      Lookup = True
    end
    object tcrField5: TFloatField
      FieldKind = fkLookup
      FieldName = #38646#21806#20215
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #38646#21806#20215
      KeyFields = 'ypid'
      Lookup = True
    end
    object tcrField6: TStringField
      FieldKind = fkLookup
      FieldName = #21333#20301
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #21333#20301
      KeyFields = 'ypid'
      Size = 10
      Lookup = True
    end
    object tcrField7: TStringField
      FieldKind = fkLookup
      FieldName = #35268#26684
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #35268#26684
      KeyFields = 'ypid'
      Lookup = True
    end
    object tcrField8: TBCDField
      FieldName = #25104#26412#37329#39069
    end
    object tcrDSDesigner9: TWideStringField
      FieldKind = fkLookup
      FieldName = #29983#20135#21378#23478
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #29983#20135#21378#23478
      KeyFields = 'ypid'
      Size = 50
      Lookup = True
    end
    object tcrDSDesigner11: TWideStringField
      FieldKind = fkLookup
      FieldName = #25209#20934#25991#21495
      LookupDataSet = typzdk
      LookupKeyFields = 'id'
      LookupResultField = #25209#20934#25991#21495
      KeyFields = 'ypid'
      Size = 30
      Lookup = True
    end
    object tcrDSDesigner14: TWideStringField
      FieldName = #29983#20135#25209#21495
    end
    object tcrDSDesigner15: TBooleanField
      FieldName = #26159#21542#23457#26680
    end
    object tcrDSDesigner16: TWideStringField
      FieldName = #24739#32773#22995#21517
      Size = 10
    end
    object tcrDSDesigner17: TIntegerField
      FieldName = #24180#40836
    end
    object tcrDSDesigner18: TWideStringField
      FieldName = #24615#21035
      Size = 2
    end
    object tcrDSDesigner19: TWideStringField
      FieldName = #22320#22336
      Size = 50
    end
    object tcrDSDesigner20: TWideStringField
      FieldName = #25191#19994#21307#24072
      Size = 10
    end
    object tcrDSDesigner21: TWideStringField
      FieldName = #22788#26041#26469#28304
      Size = 50
    end
    object tcrDSDesigner22: TWideStringField
      FieldName = #35843#37197#21457#33647#20154
      Size = 10
    end
    object tcrDSDesigner23: TWideStringField
      FieldName = #23457#26680#20154
      Size = 10
    end
    object tcrDSDesigner5: TFloatField
      FieldName = #21333#20215
    end
    object tcrDSDesigner25: TDateTimeField
      FieldName = #36141#36827#26085#26399
    end
    object tcrDSDesigner26: TDateTimeField
      FieldName = #29983#20135#26085#26399
    end
    object tcrDSDesigner27: TDateTimeField
      FieldName = #26377#25928#26399#33267
    end
    object tcrypid: TWideStringField
      FieldName = 'ypid'
      Size = 8
    end
    object tcrDSDesigner28: TBCDField
      FieldName = #25240#21518#20215
      Precision = 19
    end
    object tcrDSDesigner29: TIntegerField
      FieldName = #25187#29575
    end
    object tcrDSDesigner30: TWideStringField
      FieldName = #21345#21495
    end
    object tcrDSDesigner31: TWideStringField
      FieldName = #33647#21697#20859#25252
      Size = 3
    end
    object tcra: TWideStringField
      FieldName = 'a.'#29983#20135#25209#21495
    end
    object tcrDSDesigner32: TWideStringField
      FieldName = #26588#32452
      Size = 50
    end
    object tcrDSDesigner33: TFloatField
      FieldName = #29616#23384#25968#37327
    end
    object tcra2: TWideStringField
      FieldName = 'a.'#20379#24212#21830
      Size = 30
    end
    object tcrDSDesigner24: TWideStringField
      FieldName = #23458#25143
      Size = 100
    end
    object tcrDSDesigner34: TWideStringField
      FieldName = #21457#31080#21495#30721
    end
    object tcrDSDesigner35: TWideStringField
      FieldName = #32467#27454#26041#24335
      Size = 4
    end
    object tcrDSDesigner36: TWideStringField
      FieldName = #20837#24211#22791#27880
      Size = 50
    end
    object tcrDSDesigner37: TWideStringField
      FieldName = #39564#25910#21592
    end
    object tcrDSDesigner38: TWideStringField
      FieldName = #21333#25454#29366#24577
      Size = 4
    end
    object tcrDSDesigner39: TWideStringField
      FieldName = #24320#31080#21592
      Size = 12
    end
    object tcrDSDesigner40: TWideStringField
      FieldName = #23548#36141#21592
      Size = 12
    end
    object tcrDSDesigner41: TFloatField
      FieldName = #20817#25442#28857
    end
  end
  object dscr: TDataSource
    DataSet = tcr
    Left = 552
    Top = 8
  end
  object tdw: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'company'
    Left = 440
    Top = 72
    object tdwDSDesigner: TWideStringField
      FieldName = #31616#30721
      Size = 10
    end
    object tdwDSDesigner2: TWideStringField
      FieldName = #21517#31216
      Size = 50
    end
    object tdwDSDesigner3: TWideStringField
      FieldName = #27861#20154
      Size = 16
    end
    object tdwDSDesigner4: TWideStringField
      FieldName = #30005#35805
      FixedChar = True
    end
    object tdwDSDesigner5: TWideStringField
      FieldName = #22320#22336
      Size = 50
    end
    object tdwDSDesigner6: TWideStringField
      FieldName = #22791#27880
      Size = 100
    end
    object tdwDSDesigner7: TWideStringField
      FieldName = #31867#22411
      Size = 10
    end
    object tdwDSDesigner8: TSmallintField
      FieldName = #20986#20837
    end
    object tdwDSDesigner9: TWideStringField
      FieldName = #32852#31995#20154
      Size = 10
    end
    object tdwclientid: TFloatField
      FieldName = 'clientid'
    end
  end
  object dsdw: TDataSource
    DataSet = tdw
    Left = 480
    Top = 72
  end
  object tkc: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'kc'
    Left = 528
    Top = 136
    object tkckcid: TAutoIncField
      FieldName = 'kcid'
      ReadOnly = True
    end
    object tkcDSDesigner: TFloatField
      FieldName = #25968#37327
    end
    object tkcDSDesigner2: TBCDField
      FieldName = #36141#36827#21333#20215
      Precision = 10
    end
    object tkcDSDesigner3: TBCDField
      FieldName = #36141#36827#37329#39069
      Precision = 15
    end
    object tkcDSDesigner5: TDateTimeField
      FieldName = #36141#36827#26085#26399
    end
    object tkcDSDesigner6: TDateTimeField
      FieldName = #29983#20135#26085#26399
    end
    object tkcDSDesigner7: TDateTimeField
      FieldName = #26377#25928#26399#33267
    end
    object tkcypid: TWideStringField
      FieldName = 'ypid'
      Size = 8
    end
    object tkcDSDesigner4: TWideStringField
      FieldName = #26588#32452
    end
  end
  object dskc: TDataSource
    DataSet = tkc
    Left = 568
    Top = 136
  end
  object TPd: TADODataSet
    CacheSize = 1000
    Connection = ADOCON
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select a.* ,b.*,(a.'#38646#21806#20215'*b.'#25968#37327') as '#38144#21806#37329#39069', (a.'#38646#21806#20215'*b.'#25968#37327'-'#36141#36827#37329#39069') as '#21033#28070' fr' +
      'om ypzdk a,kc b where a.id=b.ypid and '#25968#37327'>0'
    ParamCheck = False
    Parameters = <>
    Left = 456
    Top = 200
    object TPdid: TWideStringField
      FieldName = 'id'
      Size = 8
    end
    object TPdDSDesigner: TWideStringField
      FieldName = #21517#31216
      Size = 50
    end
    object TPdDSDesigner4: TWideStringField
      FieldName = #31616#30721
      Size = 10
    end
    object TPdDSDesigner18: TFloatField
      FieldName = #25968#37327
    end
    object TPdDSDesigner5: TWideStringField
      FieldName = #21333#20301
      Size = 4
    end
    object TPdDSDesigner6: TWideStringField
      FieldName = #35268#26684
    end
    object TPdDSDesigner7: TWideStringField
      FieldName = #29983#20135#21378#23478
      Size = 50
    end
    object TPdDSDesigner8: TWideStringField
      FieldName = #25209#20934#25991#21495
      Size = 30
    end
    object TPdDSDesigner11: TFloatField
      FieldName = #25209#21457#20215
    end
    object TPdDSDesigner12: TFloatField
      FieldName = #38646#21806#20215
    end
    object TPdDSDesigner19: TFloatField
      FieldName = #36141#36827#21333#20215
    end
    object TPdDSDesigner20: TFloatField
      FieldName = #36141#36827#37329#39069
    end
    object TPdDSDesigner2: TWideStringField
      FieldName = #26588#32452
    end
    object TPdDSDesigner3: TFloatField
      FieldName = #38144#21806#37329#39069
      ReadOnly = True
    end
    object TPdDSDesigner9: TFloatField
      FieldName = #21033#28070
      ReadOnly = True
    end
  end
  object DsPd: TDataSource
    DataSet = TPd
    Left = 496
    Top = 200
  end
  object TTemGys: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 'select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid'
    Parameters = <>
    Left = 392
    Top = 312
  end
  object DSTemGys: TDataSource
    DataSet = TTemGys
    Left = 432
    Top = 312
  end
  object TYdInfo: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'YdInfo'
    Left = 296
    Top = 424
    object TYdInfoID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TYdInfoDSDesigner: TWideStringField
      FieldName = #33647#24215#21517#31216
      Size = 60
    end
    object TYdInfoDSDesigner2: TWideStringField
      FieldName = #30005#35805
    end
    object TYdInfoDSDesigner3: TWideStringField
      FieldName = #22320#22336
      Size = 50
    end
    object TYdInfoDSDesigner4: TWideStringField
      FieldName = #28165#21333#26631#39064
      Size = 50
    end
    object TYdInfoDSDesigner1: TWideStringField
      FieldName = #31069#31119#35821'1'
      Size = 50
    end
    object TYdInfoDSDesigner22: TWideStringField
      FieldName = #31069#31119#35821'2'
      Size = 50
    end
    object TYdInfoDSDesigner32: TWideStringField
      FieldName = #31069#31119#35821'3'
      Size = 50
    end
    object TYdInfobt1: TWideStringField
      FieldName = 'bt1'
    end
    object TYdInfocom: TWideStringField
      FieldName = 'com'
    end
    object TYdInfoDSDesigner5: TWideStringField
      FieldName = #38646#21806#21333
      Size = 100
    end
    object TYdInfoDSDesigner6: TWideStringField
      FieldName = #20837#24211#21333
      Size = 100
    end
    object TYdInfoDSDesigner7: TWideStringField
      FieldName = #25209#21457#21333
      Size = 100
    end
    object TYdInfoDSDesigner8: TWideStringField
      FieldName = #22788#26041#21333
      Size = 100
    end
  end
  object DSYdInfo: TDataSource
    DataSet = TYdInfo
    Left = 344
    Top = 424
  end
  object DsHuiyuan: TDataSource
    DataSet = THuiyuan
    Left = 376
    Top = 136
  end
  object TPfTem: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    Parameters = <>
    Left = 161
    Top = 223
  end
  object TTyTemp: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 
      'select a.ypid,a.crid,a.'#32534#21495',a.'#25968#37327',a.'#21333#20215',a.'#37329#39069',a.'#25240#21518#20215',a.'#25187#29575',b.'#21517#31216',b.id ,b' +
      '.'#31616#30721',b.'#26465#30721',a.'#31867#22411' from cr a,ypzdk b where a.ypid=b.id'
    Parameters = <>
    Left = 488
    Top = 312
  end
  object DsTyTemp: TDataSource
    DataSet = TTyTemp
    Left = 544
    Top = 312
  end
  object TAPD: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'kc'
    Left = 328
    Top = 10
  end
  object DSAPD: TDataSource
    DataSet = TAPD
    Left = 368
    Top = 10
  end
  object TYpyh: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 
      'select a.id as '#33647#21697#32534#21495',a.'#21517#31216' as '#33647#21697#21517#31216',a.'#35268#26684',b.'#29983#20135#25209#21495' as '#29983#20135#25209#21495',b.'#26377#25928#26399#33267',a.'#29983#20135 +
      #21378#23478',b.'#29616#23384#25968#37327',b.'#26085#26399',b.'#20859#25252#20154',b.'#22806#35266#24773#20917',b.'#22788#29702#32467#26524',b.crid  from ypzdk a,cr b whe' +
      're a.id=b.ypid and b.'#31867#22411'='#39#20837#24211#39
    Parameters = <>
    Left = 392
    Top = 425
    object TYpyhDSDesigner: TWideStringField
      FieldName = #33647#21697#32534#21495
      Size = 8
    end
    object TYpyhDSDesigner2: TWideStringField
      FieldName = #33647#21697#21517#31216
      Size = 50
    end
    object TYpyhDSDesigner3: TWideStringField
      FieldName = #29983#20135#25209#21495
    end
    object TYpyhDSDesigner4: TFloatField
      FieldName = #29616#23384#25968#37327
    end
    object TYpyhDSDesigner5: TDateTimeField
      FieldName = #26085#26399
    end
    object TYpyhDSDesigner6: TWideStringField
      FieldName = #20859#25252#20154
      Size = 50
    end
    object TYpyhDSDesigner7: TWideStringField
      FieldName = #22806#35266#24773#20917
      Size = 50
    end
    object TYpyhDSDesigner8: TWideStringField
      FieldName = #22788#29702#32467#26524
      Size = 50
    end
    object TYpyhcrid: TAutoIncField
      FieldName = 'crid'
      ReadOnly = True
    end
    object TYpyhDSDesigner9: TWideStringField
      FieldName = #35268#26684
    end
    object TYpyhDSDesigner10: TDateTimeField
      FieldName = #26377#25928#26399#33267
    end
    object TYpyhDSDesigner11: TWideStringField
      FieldName = #29983#20135#21378#23478
      Size = 50
    end
  end
  object Dsypyh: TDataSource
    DataSet = TYpyh
    Left = 432
    Top = 425
  end
  object tcrlist: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    CommandText = 
      'select a.'#21517#31216' as '#33647#21697#21517#31216',c.'#29983#20135#25209#21495',a.'#25209#20934#25991#21495',c.'#26085#26399' as '#20837#24211#26102#38388',c.'#36141#36827#26085#26399',c.'#25968#37327' as '#20837#24211 +
      #25968#37327',a.'#29983#20135#21378#23478',c.'#20379#24212#21830' as '#20379#36135#21830',a.'#25209#21457#20215',a.'#38646#21806#20215',a.'#21058#22411',a.'#21333#20301',a.'#35268#26684',c.'#21457#31080#21495#30721',c.'#20837#24211#22791#27880',' +
      'c.'#39564#25910#21592',c.'#26377#25928#26399#33267',c.crid,a.id,c.'#21457#31080#21495#30721',c.'#26588#32452',c.'#21333#20215',c.'#37329#39069' from ypzdk a,kc b' +
      ',cr c  where a.id=b.ypid and a.id=c.ypid '
    Parameters = <>
    Left = 600
    Top = 10
  end
  object dscrlist: TDataSource
    DataSet = tcrlist
    Left = 632
    Top = 10
  end
  object TKhzl: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'khzl'
    Left = 616
    Top = 141
    object TKhzlDSDesigner: TAutoIncField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object TKhzlDSDesigner2: TWideStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object TKhzlDSDesigner3: TWideStringField
      FieldName = #22320#22336
      Size = 200
    end
    object TKhzlDSDesigner4: TWideStringField
      FieldName = #32852#31995#30005#35805
      Size = 50
    end
    object TKhzlDSDesigner5: TWideStringField
      FieldName = #23458#25143#32534#30721
      FixedChar = True
    end
    object TKhzlDSDesigner6: TWideStringField
      FieldName = #31616#30721
      FixedChar = True
    end
    object TKhzlDSDesigner7: TWideStringField
      FieldName = #22791#27880
      Size = 255
    end
  end
  object DSKhzl: TDataSource
    DataSet = TKhzl
    Left = 664
    Top = 141
  end
  object THYXF: TADODataSet
    Connection = ADOCON
    CursorType = ctStatic
    Parameters = <>
    Left = 432
    Top = 134
  end
  object DSHYXF: TDataSource
    DataSet = THYXF
    Left = 480
    Top = 134
  end
  object tbm: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'partment'
    Left = 424
    Top = 8
    object tbmDSDesigner2: TStringField
      CustomConstraint = 'x<>'#39#39' and x<>null'
      ConstraintErrorMessage = ' '#19981#33021#20026#31354
      FieldName = #37096#38376#21517#31216
      Required = True
      Size = 50
    end
    object tbmDSDesigner4: TWideStringField
      FieldName = #37096#38376#36127#36131#20154
      Size = 14
    end
    object tbmDSDesigner5: TWideStringField
      FieldName = #36127#36131#20154#32852#31995#26041#24335
      Size = 50
    end
    object tbmDSDesigner3: TWideStringField
      FieldName = #31616#30721
      Size = 10
    end
  end
  object dsbm: TDataSource
    DataSet = tbm
    Left = 464
    Top = 8
  end
  object TSccj: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'sccj'
    Left = 328
    Top = 256
    object TSccjID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TSccjDSDesigner: TWideStringField
      FieldName = #29983#20135#21378#23478
      Size = 50
    end
    object TSccjDSDesigner2: TWideStringField
      FieldName = #21378#23478#22320#22336
      Size = 50
    end
    object TSccjGMP: TWideStringField
      FieldName = #26159#21542'GMP'
      Size = 2
    end
    object TSccjDSDesigner3: TWideStringField
      FieldName = #32852#31995#26041#24335
      Size = 50
    end
    object TSccjDSDesigner4: TWideStringField
      FieldName = #22791#27880
      Size = 50
    end
    object TSccjDSDesigner5: TWideStringField
      FieldName = #31616#30721
    end
  end
  object Dsccj: TDataSource
    DataSet = TSccj
    Left = 376
    Top = 256
  end
  object DSZwr: TDataSource
    DataSet = TZwr
    Left = 632
    Top = 424
  end
  object TZwr: TADOTable
    Connection = ADOCON
    CursorType = ctStatic
    TableName = 'zhaiwu'
    Left = 592
    Top = 424
    object TZwrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TZwrDSDesigner: TWideStringField
      FieldName = #20538#21153#20154
    end
    object TZwrDSDesigner2: TWideStringField
      FieldName = #31616#30721
    end
    object TZwrDSDesigner3: TWideStringField
      FieldName = #32852#31995#26041#24335
    end
    object TZwrDSDesigner4: TWideStringField
      FieldName = #32852#31995#22320#22336
      Size = 50
    end
    object TZwrDSDesigner5: TBCDField
      FieldName = #27424#20538#37329#39069
      Precision = 19
    end
    object TZwrDSDesigner6: TWideStringField
      FieldName = #27424#20538#21407#22240
      Size = 50
    end
    object TZwrDSDesigner7: TDateTimeField
      FieldName = #31572#24212#24402#36824#26085#26399
    end
    object TZwrDSDesigner8: TWideStringField
      FieldName = #32463#25163#20154
    end
    object TZwrDSDesigner9: TWideStringField
      FieldName = #22791#27880
      Size = 50
    end
    object TZwrDSDesigner10: TDateTimeField
      FieldName = #27424#20538#26085#26399
    end
  end
  object THuiyuan: TADODataSet
    Connection = ADOCON
    Parameters = <>
    Left = 328
    Top = 136
  end
end
