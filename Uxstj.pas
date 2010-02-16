unit Uxstj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh, Buttons,
  PrnDbgeh, GridsEh;

type
  Tfxstj = class(TForm)
    Label1: TLabel;
    PrintDBGridEh1: TPrintDBGridEh;
    TabControl2: TTabControl;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    fromdate: TDBDateTimeEditEh;
    todate: TDBDateTimeEditEh;
    BitBtn5: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGridEh1: TDBGridEh;
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    printtitle:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fxstj: Tfxstj;

implementation

uses Unit_DataModule;

{$R *.dfm}

procedure Tfxstj.BitBtn5Click(Sender: TObject);
begin
printdbgrideh1.Title.Text:=' 销 售 统 计 ' +'('+fromdate.Text+'-'+todate.Text +'  '+printtitle+')' ;
printdbgrideh1.AfterGridText.Text:=datetostr(date);
printdbgrideh1.Preview;
end;

procedure Tfxstj.SpeedButton2Click(Sender: TObject);
var sqlstr,wherestr:string;
begin
  
  printtitle:=speedbutton2.Caption;
 sqlstr:='select a.部门名称,sum(b.金额) as 销售金额 , sum(b.金额-b.成本金额) as 利润 from partment a,cr b ,ygb c where (b.类型=''零售'' or b.类型=''批发'' ) and b.开票人=c.ygid and c.所属部门=a.部门编号 ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and 日期>='''+trim(fromdate.Text)+''' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  日期>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by a.部门名称 ';
 dbgrideh1.Columns[0].FieldName:='部门名称';
 DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;



end;

procedure Tfxstj.SpeedButton4Click(Sender: TObject);
var sqlstr,wherestr:string;
begin

printtitle:=speedbutton4.Caption;
 sqlstr:='select c.姓名,sum(b.金额) as 销售金额 , sum(b.金额-b.成本金额) as 利润 from cr b ,ygb c where (b.类型=''零售'' or b.类型=''批发'' ) and b.开票人=c.ygid ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and 日期>='''+trim(fromdate.Text)+''' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  日期>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by c.姓名 ';
  dbgrideh1.Columns[0].FieldName:='姓名';
DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;


end;

procedure Tfxstj.SpeedButton3Click(Sender: TObject);
var sqlstr,wherestr:string;
begin
printtitle:=speedbutton3.Caption;
 sqlstr:='select 类型,sum(金额) as 销售金额 , sum(金额-成本金额) as 利润 from cr where (类型=''零售'' or 类型=''批发'' )  ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and 日期>='''+trim(fromdate.Text)+''' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  日期>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by 类型';
  dbgrideh1.Columns[0].FieldName:='类型';
 DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;


end;

procedure Tfxstj.SpeedButton1Click(Sender: TObject);
var sqlstr,wherestr:string;
begin

printtitle:=speedbutton1.Caption;
 sqlstr:='select c.名称,sum(b.金额) as 销售金额 , sum(b.金额-b.成本金额) as 利润, c.id as 商品标识号  from cr b ,ypzdk c where (b.类型=''零售'' or b.类型=''批发'' ) and b.ypid=c.id ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and 日期>='''+trim(fromdate.Text)+''' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  日期>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by  c.id, c.名称';

DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;

 dbgrideh1.Columns[0].FieldName:='名称';
end;

procedure Tfxstj.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfxstj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DMod.txstj.Close;
action:=cafree;
end;

procedure Tfxstj.FormShow(Sender: TObject);
begin
  DMod.txstj.Close;
  

end;

end.