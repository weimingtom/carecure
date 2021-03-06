unit Unit_DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB,
  PublicFunOrPro, ImgList, Controls;

type
  TDMod = class(TDataModule)
    ADOConn: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOCON: TADOConnection;
    qrydata: TADOQuery;
    qrydata2: TADOQuery;
    qrydata3: TADOQuery;
    tyg: TADOTable;
    tygusername: TWideStringField;
    tygoper: TWideStringField;
    tygDSDesigner: TWideStringField;
    tygDSDesigner2: TIntegerField;
    tygDSDesigner3: TDateTimeField;
    tygDSDesigner4: TWideStringField;
    tygDSDesigner5: TWideStringField;
    tygDSDesigner6: TWideStringField;
    tygDSDesigner7: TWideStringField;
    tygDSDesigner8: TWideStringField;
    tygDSDesigner9: TWideStringField;
    tygDSDesigner10: TWideStringField;
    tyguserid: TFloatField;
    dsyg: TDataSource;
    TBH: TADOTable;
    tuser: TADOTable;
    dsuser: TDataSource;
    toper: TADODataSet;
    toperDSDesigner: TDateTimeField;
    toperDSDesigner2: TDateTimeField;
    toperuserid: TWideStringField;
    dsoper: TDataSource;
    typzdk: TADOTable;
    typzdkid: TWideStringField;
    typzdkDSDesigner: TWideStringField;
    typzdkDSDesigner2: TWideStringField;
    typzdkDSDesigner3: TWideStringField;
    typzdkDSDesigner4: TWideStringField;
    typzdkDSDesigner5: TWideStringField;
    typzdkDSDesigner6: TWideStringField;
    typzdkDSDesigner7: TWideStringField;
    typzdkDSDesigner8: TWideStringField;
    typzdkDSDesigner9: TIntegerField;
    typzdkDSDesigner10: TIntegerField;
    typzdkDSDesigner11: TFloatField;
    typzdkDSDesigner12: TFloatField;
    typzdkDSDesigner13: TMemoField;
    typzdkDSDesigner14: TWideStringField;
    typzdkDSDesigner15: TWideStringField;
    typzdkDSDesigner16: TWideStringField;
    typzdkDSDesigner17: TWideStringField;
    typzdkDSDesigner18: TWideStringField;
    typzdkDSDesigner19: TWideStringField;
    typzdkDSDesigner20: TFloatField;
    dsypzdk: TDataSource;
    YDTemp: TADODataSet;
    txstj: TADODataSet;
    dsxstj: TDataSource;
    TXgPd: TADOQuery;
    tdjsearch: TADODataSet;
    dsdjsearch: TDataSource;
    ttemp: TADODataSet;
    dstemp: TDataSource;
    TTYpzd: TADODataSet;
    TTYpzdid: TWideStringField;
    TTYpzdDSDesigner: TWideStringField;
    TTYpzdDSDesigner2: TWideStringField;
    TTYpzdDSDesigner3: TWideStringField;
    TTYpzdDSDesigner4: TWideStringField;
    TTYpzdDSDesigner5: TWideStringField;
    TTYpzdDSDesigner6: TWideStringField;
    TTYpzdDSDesigner7: TWideStringField;
    TTYpzdDSDesigner8: TWideStringField;
    TTYpzdDSDesigner9: TIntegerField;
    TTYpzdDSDesigner10: TIntegerField;
    TTYpzdDSDesigner11: TFloatField;
    TTYpzdDSDesigner12: TFloatField;
    TTYpzdDSDesigner13: TMemoField;
    TTYpzdDSDesigner14: TWideStringField;
    TTYpzdDSDesigner15: TWideStringField;
    TTYpzdDSDesigner16: TWideStringField;
    TTYpzdDSDesigner17: TWideStringField;
    DsYpzd: TDataSource;
    TPhkc: TADODataSet;
    DSPhkc: TDataSource;
    tcr: TADODataSet;
    tcrcrid: TAutoIncField;
    tcrDSDesigner: TStringField;
    tcrDSDesigner2: TIntegerField;
    tcrDSDesigner3: TIntegerField;
    tcrDSDesigner4: TFloatField;
    tcrDSDesigner6: TBCDField;
    tcrDSDesigner7: TStringField;
    tcrDSDesigner8: TIntegerField;
    tcrDSDesigner10: TDateTimeField;
    tcrDSDesigner12: TStringField;
    tcrDSDesigner13: TBooleanField;
    tcrField: TStringField;
    tcrField2: TStringField;
    tcrField3: TStringField;
    tcrField4: TFloatField;
    tcrField5: TFloatField;
    tcrField6: TStringField;
    tcrField7: TStringField;
    tcrField8: TBCDField;
    tcrDSDesigner9: TWideStringField;
    tcrDSDesigner11: TWideStringField;
    tcrDSDesigner14: TWideStringField;
    tcrDSDesigner15: TBooleanField;
    tcrDSDesigner16: TWideStringField;
    tcrDSDesigner17: TIntegerField;
    tcrDSDesigner18: TWideStringField;
    tcrDSDesigner19: TWideStringField;
    tcrDSDesigner20: TWideStringField;
    tcrDSDesigner21: TWideStringField;
    tcrDSDesigner22: TWideStringField;
    tcrDSDesigner23: TWideStringField;
    tcrDSDesigner5: TFloatField;
    tcrDSDesigner25: TDateTimeField;
    tcrDSDesigner26: TDateTimeField;
    tcrDSDesigner27: TDateTimeField;
    tcrypid: TWideStringField;
    tcrDSDesigner28: TBCDField;
    tcrDSDesigner29: TIntegerField;
    tcrDSDesigner30: TWideStringField;
    tcrDSDesigner31: TWideStringField;
    tcra: TWideStringField;
    tcrDSDesigner32: TWideStringField;
    tcrDSDesigner33: TFloatField;
    tcra2: TWideStringField;
    tcrDSDesigner24: TWideStringField;
    tcrDSDesigner34: TWideStringField;
    tcrDSDesigner35: TWideStringField;
    tcrDSDesigner36: TWideStringField;
    tcrDSDesigner37: TWideStringField;
    tcrDSDesigner38: TWideStringField;
    tcrDSDesigner39: TWideStringField;
    tcrDSDesigner40: TWideStringField;
    tcrDSDesigner41: TFloatField;
    dscr: TDataSource;
    tdw: TADOTable;
    tdwDSDesigner: TWideStringField;
    tdwDSDesigner2: TWideStringField;
    tdwDSDesigner3: TWideStringField;
    tdwDSDesigner4: TWideStringField;
    tdwDSDesigner5: TWideStringField;
    tdwDSDesigner6: TWideStringField;
    tdwDSDesigner7: TWideStringField;
    tdwDSDesigner8: TSmallintField;
    tdwDSDesigner9: TWideStringField;
    tdwclientid: TFloatField;
    dsdw: TDataSource;
    tkc: TADOTable;
    tkckcid: TAutoIncField;
    tkcDSDesigner: TFloatField;
    tkcDSDesigner2: TBCDField;
    tkcDSDesigner3: TBCDField;
    tkcDSDesigner5: TDateTimeField;
    tkcDSDesigner6: TDateTimeField;
    tkcDSDesigner7: TDateTimeField;
    tkcypid: TWideStringField;
    tkcDSDesigner4: TWideStringField;
    dskc: TDataSource;
    TPd: TADODataSet;
    TPdid: TWideStringField;
    TPdDSDesigner: TWideStringField;
    TPdDSDesigner4: TWideStringField;
    TPdDSDesigner18: TFloatField;
    TPdDSDesigner5: TWideStringField;
    TPdDSDesigner6: TWideStringField;
    TPdDSDesigner7: TWideStringField;
    TPdDSDesigner8: TWideStringField;
    TPdDSDesigner11: TFloatField;
    TPdDSDesigner12: TFloatField;
    TPdDSDesigner19: TFloatField;
    TPdDSDesigner20: TFloatField;
    TPdDSDesigner2: TWideStringField;
    TPdDSDesigner3: TFloatField;
    TPdDSDesigner9: TFloatField;
    DsPd: TDataSource;
    TTemGys: TADODataSet;
    DSTemGys: TDataSource;
    TYdInfo: TADOTable;
    TYdInfoID: TAutoIncField;
    TYdInfoDSDesigner: TWideStringField;
    TYdInfoDSDesigner2: TWideStringField;
    TYdInfoDSDesigner3: TWideStringField;
    TYdInfoDSDesigner4: TWideStringField;
    TYdInfoDSDesigner1: TWideStringField;
    TYdInfoDSDesigner22: TWideStringField;
    TYdInfoDSDesigner32: TWideStringField;
    TYdInfobt1: TWideStringField;
    TYdInfocom: TWideStringField;
    TYdInfoDSDesigner5: TWideStringField;
    TYdInfoDSDesigner6: TWideStringField;
    TYdInfoDSDesigner7: TWideStringField;
    TYdInfoDSDesigner8: TWideStringField;
    DSYdInfo: TDataSource;
    DsHuiyuan: TDataSource;
    TPfTem: TADODataSet;
    TTyTemp: TADODataSet;
    DsTyTemp: TDataSource;
    TAPD: TADOTable;
    DSAPD: TDataSource;
    TYpyh: TADODataSet;
    TYpyhDSDesigner: TWideStringField;
    TYpyhDSDesigner2: TWideStringField;
    TYpyhDSDesigner3: TWideStringField;
    TYpyhDSDesigner4: TFloatField;
    TYpyhDSDesigner5: TDateTimeField;
    TYpyhDSDesigner6: TWideStringField;
    TYpyhDSDesigner7: TWideStringField;
    TYpyhDSDesigner8: TWideStringField;
    TYpyhcrid: TAutoIncField;
    TYpyhDSDesigner9: TWideStringField;
    TYpyhDSDesigner10: TDateTimeField;
    TYpyhDSDesigner11: TWideStringField;
    Dsypyh: TDataSource;
    tcrlist: TADODataSet;
    dscrlist: TDataSource;
    TKhzl: TADOTable;
    TKhzlDSDesigner: TAutoIncField;
    TKhzlDSDesigner2: TWideStringField;
    TKhzlDSDesigner3: TWideStringField;
    TKhzlDSDesigner4: TWideStringField;
    TKhzlDSDesigner5: TWideStringField;
    TKhzlDSDesigner6: TWideStringField;
    TKhzlDSDesigner7: TWideStringField;
    DSKhzl: TDataSource;
    THYXF: TADODataSet;
    DSHYXF: TDataSource;
    tbm: TADOTable;
    tbmDSDesigner2: TStringField;
    tbmDSDesigner4: TWideStringField;
    tbmDSDesigner5: TWideStringField;
    tbmDSDesigner3: TWideStringField;
    dsbm: TDataSource;
    TSccj: TADOTable;
    TSccjID: TAutoIncField;
    TSccjDSDesigner: TWideStringField;
    TSccjDSDesigner2: TWideStringField;
    TSccjGMP: TWideStringField;
    TSccjDSDesigner3: TWideStringField;
    TSccjDSDesigner4: TWideStringField;
    TSccjDSDesigner5: TWideStringField;
    Dsccj: TDataSource;
    DSZwr: TDataSource;
    TZwr: TADOTable;
    TZwrID: TAutoIncField;
    TZwrDSDesigner: TWideStringField;
    TZwrDSDesigner2: TWideStringField;
    TZwrDSDesigner3: TWideStringField;
    TZwrDSDesigner4: TWideStringField;
    TZwrDSDesigner5: TBCDField;
    TZwrDSDesigner6: TWideStringField;
    TZwrDSDesigner7: TDateTimeField;
    TZwrDSDesigner8: TWideStringField;
    TZwrDSDesigner9: TWideStringField;
    TZwrDSDesigner10: TDateTimeField;
    THuiyuan: TADODataSet;
    ttj: TADOTable;
    dstj: TDataSource;
    ctemp: TADOCommand;
    cback: TADOCommand;
    ImageList2: TImageList;
    ImageList1: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMod: TDMod;

implementation

{$R *.dfm}
procedure TDMod.DataModuleCreate(Sender: TObject);
begin
try
begin
ADOCON.ConnectionString:= DB_CONNString;
ADOCON.Connected:=true;
end
except
end;
end;


end.

