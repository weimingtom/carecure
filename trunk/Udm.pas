unit Udm;

interface

uses
  Classes, ADODB, DB, ImgList,Messages, Dialogs,Controls;

type
  Tadodm = class(TDataModule)
    ydconn: TADOConnection;
    typzdk: TADOTable;
    tyg: TADOTable;
    dsypzdk: TDataSource;
    dsyg: TDataSource;
    ImageList1: TImageList;
    tbm: TADOTable;
    tdw: TADOTable;
    dsbm: TDataSource;
    dsdw: TDataSource;
    tygygid: TBCDField;
    tygDSDesigner: TStringField;
    tygDSDesigner2: TStringField;
    tygDSDesigner3: TStringField;
    tygDSDesigner4: TSmallintField;
    tygDSDesigner5: TDateTimeField;
    tygDSDesigner6: TStringField;
    tygDSDesigner7: TStringField;
    tygDSDesigner8: TStringField;
    tygDSDesigner9: TStringField;
    tygDSDesigner10: TStringField;
    tygDSDesigner11: TStringField;
    tygDSDesigner12: TStringField;
    tygField: TStringField;
    tygDSDesigner13: TStringField;
    tkc: TADOTable;
    dskc: TDataSource;
    tkckcid: TBCDField;
    tkcDSDesigner: TIntegerField;
    tkcDSDesigner2: TBCDField;
    tkcDSDesigner3: TBCDField;
    tkcypid: TBCDField;
    dscr: TDataSource;
    dsoper: TDataSource;
    dsuser: TDataSource;
    dsydjcb: TDataSource;
    toper: TADODataSet;
    tuser: TADOTable;
    ydjcb: TADODataSet;
    tcr: TADODataSet;
    ttemp: TADODataSet;
    dstemp: TDataSource;
    ttj: TADOTable;
    dstj: TDataSource;
    typzdkid: TBCDField;
    typzdkDSDesigner: TStringField;
    typzdkDSDesigner2: TStringField;
    typzdkDSDesigner3: TStringField;
    typzdkDSDesigner4: TStringField;
    typzdkDSDesigner5: TStringField;
    typzdkDSDesigner6: TStringField;
    typzdkDSDesigner7: TStringField;
    typzdkDSDesigner8: TStringField;
    typzdkDSDesigner9: TIntegerField;
    typzdkDSDesigner10: TIntegerField;
    typzdkDSDesigner11: TBCDField;
    typzdkDSDesigner12: TBCDField;
    typzdkDSDesigner13: TMemoField;
    typzdkDSDesigner14: TStringField;
    typzdkDSDesigner15: TStringField;
    tbmDSDesigner: TStringField;
    tbmDSDesigner2: TStringField;
    tbmDSDesigner3: TStringField;
    tdwclientid: TBCDField;
    tdwDSDesigner: TStringField;
    tdwDSDesigner2: TStringField;
    tdwDSDesigner3: TStringField;
    tdwDSDesigner4: TStringField;
    tdwDSDesigner5: TStringField;
    tdwDSDesigner6: TStringField;
    tdwDSDesigner7: TStringField;
    tdwDSDesigner8: TWordField;
    tdwDSDesigner9: TStringField;
    ctemp: TADOCommand;
    cback: TADOCommand;
    backconn: TADOConnection;
    tcrlist: TADODataSet;
    dscrlist: TDataSource;
    tcrcrid: TBCDField;
    tcrypid: TBCDField;
    tcrDSDesigner: TStringField;
    tcrDSDesigner2: TIntegerField;
    tcrDSDesigner3: TIntegerField;
    tcrDSDesigner4: TIntegerField;
    tcrDSDesigner5: TBCDField;
    tcrDSDesigner6: TBCDField;
    tcrDSDesigner7: TStringField;
    tcrDSDesigner8: TIntegerField;
    tcrDSDesigner10: TDateTimeField;
    tcrDSDesigner12: TStringField;
    tcrDSDesigner13: TBooleanField;
    ImageList2: TImageList;
    tcrField: TStringField;
    tcrField2: TStringField;
    tcrField3: TStringField;
    tcrField4: TFloatField;
    tcrField5: TFloatField;
    tcrField6: TStringField;
    tcrField7: TStringField;
    tcrField8: TBCDField;
    tdjsearch: TADODataSet;
    dsdjsearch: TDataSource;
    tdjsearchypid: TBCDField;
    tdjsearchDSDesigner: TStringField;
    tdjsearchDSDesigner2: TIntegerField;
    tdjsearchDSDesigner3: TIntegerField;
    tdjsearchDSDesigner4: TBCDField;
    tdjsearchDSDesigner5: TBCDField;
    tdjsearchDSDesigner6: TStringField;
    tdjsearchDSDesigner7: TIntegerField;
    tdjsearchDSDesigner8: TDateTimeField;
    tdjsearchDSDesigner9: TStringField;
    tdjsearchDSDesigner10: TBooleanField;
    tdjsearchField: TStringField;
    tdjsearchField2: TStringField;
    tdjsearchIntegerField: TStringField;
    tdjsearchField3: TStringField;
    tdjsearchField4: TStringField;
    txstj: TADODataSet;
    dsxstj: TDataSource;
    tdjsearchField5: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  adodm: Tadodm;

implementation

{$R *.dfm}

procedure Tadodm.DataModuleCreate(Sender: TObject);
begin
try
begin
ydconn.ConnectionString:='FILE NAME=huida.udl';
ydconn.Connected:=true;
backconn.ConnectionString:='FILE NAME=huida.udl';
backconn.Connected:=true;
end
except
messagedlg('数据库连接错误，请重新设定！',mtwarning,[mbOK],0);
end;
end;

end.
