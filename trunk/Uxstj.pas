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
printdbgrideh1.Title.Text:=' �� �� ͳ �� ' +'('+fromdate.Text+'-'+todate.Text +'  '+printtitle+')' ;
printdbgrideh1.AfterGridText.Text:=datetostr(date);
printdbgrideh1.Preview;
end;

procedure Tfxstj.SpeedButton2Click(Sender: TObject);
var sqlstr,wherestr:string;
begin
  
  printtitle:=speedbutton2.Caption;
 sqlstr:='select a.��������,sum(b.���) as ���۽�� , sum(b.���-b.�ɱ����) as ���� from partment a,cr b ,ygb c where (b.����=''����'' or b.����=''����'' ) and b.��Ʊ��=c.ygid and c.��������=a.���ű�� ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and ����>='''+trim(fromdate.Text)+''' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  ����>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by a.�������� ';
 dbgrideh1.Columns[0].FieldName:='��������';
 DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;



end;

procedure Tfxstj.SpeedButton4Click(Sender: TObject);
var sqlstr,wherestr:string;
begin

printtitle:=speedbutton4.Caption;
 sqlstr:='select c.����,sum(b.���) as ���۽�� , sum(b.���-b.�ɱ����) as ���� from cr b ,ygb c where (b.����=''����'' or b.����=''����'' ) and b.��Ʊ��=c.ygid ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and ����>='''+trim(fromdate.Text)+''' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  ����>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by c.���� ';
  dbgrideh1.Columns[0].FieldName:='����';
DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;


end;

procedure Tfxstj.SpeedButton3Click(Sender: TObject);
var sqlstr,wherestr:string;
begin
printtitle:=speedbutton3.Caption;
 sqlstr:='select ����,sum(���) as ���۽�� , sum(���-�ɱ����) as ���� from cr where (����=''����'' or ����=''����'' )  ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and ����>='''+trim(fromdate.Text)+''' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  ����>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by ����';
  dbgrideh1.Columns[0].FieldName:='����';
 DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;


end;

procedure Tfxstj.SpeedButton1Click(Sender: TObject);
var sqlstr,wherestr:string;
begin

printtitle:=speedbutton1.Caption;
 sqlstr:='select c.����,sum(b.���) as ���۽�� , sum(b.���-b.�ɱ����) as ����, c.id as ҩƷ��ʶ��  from cr b ,ypzdk c where (b.����=''����'' or b.����=''����'' ) and b.ypid=c.id ' ;
 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and ����>='''+trim(fromdate.Text)+''' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  ����>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr+'  group by  c.id, c.����';

DMod.txstj.Close;
 DMod.txstj.CommandText:= sqlstr;
 DMod.txstj.Open;

 dbgrideh1.Columns[0].FieldName:='����';
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