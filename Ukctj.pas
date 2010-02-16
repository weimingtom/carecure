unit Ukctj;

interface

uses
  Windows, Messages, SysUtils,Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,  DBCtrlsEh, Grids, DBGridEh,
  ExtCtrls, PrnDbgeh,Unit_DataModule, Mask;

type
  Tfkctj = class(TForm)
    TabControl1: TTabControl;
    Label2: TLabel;
    fromdate: TDBDateTimeEditEh;
    Label4: TLabel;
    todate: TDBDateTimeEditEh;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    rk: TEdit;
    py: TEdit;
    ty: TEdit;
    xs: TEdit;
    pk: TEdit;
    bs: TEdit;
    pf: TEdit;
    ls: TEdit;
    zj: TEdit;
    js: TEdit;
    ce: TEdit;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fkctj: Tfkctj;

implementation

{$R *.dfm}

procedure Tfkctj.BitBtn5Click(Sender: TObject);

var sqlstr,wherestr:string;
begin
 sqlstr:='select a.* , 购进金额=case   when (b.类型=''批发'') or (b.类型= ''零售'' ) then b.成本金额 else  b.金额 end   '
 +',b.* ,b.编号 as 销售编号,c.姓名 ,d.名称 as 购药单位 from ypzdk a,cr b ,ygb c ,company d where  a.id=b.ypid and b.开票人=c.ygid and b.入库单位=d.clientid  ';


 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and 日期>='''+trim(fromdate.Text)+''' and 日期<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  日期>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  ';
 //showmessage(sqlstr);
 DMod.tcrlist.Close;
 DMod.tcrlist.CommandText:= sqlstr;
 DMod.tcrlist.Open;

 DMod.ttemp.Close;
 sqlstr:='select   金额=case when (类型=''批发'') or (类型=''零售'' ) then SUM(成本金额)'
              +'else  SUM(金额) end   ,类型 from cr ' ;
 sqlstr:=sqlstr+' where 1<2 '+wherestr+'  group by 类型 ';
 DMod.ttemp.commandtext:=sqlstr;
 DMod.ttemp.Open;
 if DMod.ttemp.Locate('类型','批发',[]) then
    pf.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else pf.Text:='0';
  if DMod.ttemp.Locate('类型','零售',[]) then
    ls.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else ls.Text:='0';
 if DMod.ttemp.Locate('类型','盘盈',[]) then
    py.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else py.Text:='0';
 if DMod.ttemp.Locate('类型','盘亏',[]) then
    pk.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else pk.Text:='0';
 if DMod.ttemp.Locate('类型','入库',[]) then
    rk.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else rk.Text:='0';
 if DMod.ttemp.Locate('类型','退药',[]) then
    ty.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else ty.Text:='0';
 if DMod.ttemp.Locate('类型','报损',[]) then
    bs.Text:=floattostr(DMod.ttemp.fieldbyname('金额').AsFloat)
    else bs.Text:='0';
  xs.Text:=floattostr(strtofloat(pf.Text)+strtofloat(ls.Text))   ;
  zj.Text:=floattostr(strtofloat(rk.Text)+strtofloat(py.Text)) ;
 js.Text:=floattostr(strtofloat(ty.Text)+strtofloat(pk.Text)+strtofloat(xs.Text)+strtofloat(bs.Text)) ;
  ce.Text:=floattostr(strtofloat(zj.Text)-strtofloat(js.Text))   ;
end;

procedure Tfkctj.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfkctj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMod.ttemp.Close;
  DMod.tcrlist.Close;
  action:=cafree;
end;

procedure Tfkctj.FormShow(Sender: TObject);
begin
DMod.ttemp.Close;
  DMod.tcrlist.Close;
end;

procedure Tfkctj.BitBtn1Click(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
begin

 printdbgrideh1.Title.Text:=' 库存变动一览表   ('+fromdate.Text+'-'+todate.Text +')' ;
 printdbgrideh1.AfterGridText.Text:=datetostr(date);
 printdbgrideh1.Preview;

end else
begin
showmessage('本软件是测试版，请手工抄写，给您带来不便，请购买正式版！');

end
end;

end.