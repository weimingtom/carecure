unit ucr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls, ExtCtrls,udm,PrnDbgeh,
  Mask, DBCtrlsEh;

type
  Tfcr = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    Label3: TLabel;
    TabControl2: TTabControl;
    print: TBitBtn;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    fromdate: TDBDateTimeEditEh;
    todate: TDBDateTimeEditEh;
    Label2: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure printClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcr: Tfcr;

implementation

{$R *.dfm}

procedure Tfcr.FormShow(Sender: TObject);
begin
  label3.Caption:=datetimetostr(date);
  adodm.ttemp.Close;
end;

procedure Tfcr.BitBtn5Click(Sender: TObject);
var sqlstr,wherestr:string;
begin
 sqlstr:='select a.* ,b.* ,b.��� as ���۱��,c.���� ,d.���� as ��ҩ��λ from ypzdk a,cr b ,ygb c ,company d  where (b.����=''����'' or b.����=''����'') and a.id=b.ypid and b.��Ʊ��=c.ygid and b.��ⵥλ=d.clientid' ;

 if (fromdate.Text='    -  -  ') and (todate.Text<>'    -  -  ') then
   wherestr:=' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text<>'    -  -  ') then
  wherestr:=' and ����>='''+trim(fromdate.Text)+''' and ����<='''+trim(todate.Text)+'''' ;
  if (fromdate.Text<>'    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:=' and  ����>='''+trim(fromdate.Text)+'''' ;
  if (fromdate.Text='    -  -  ') and (todate.Text='    -  -  ') then
  wherestr:='  ';
  sqlstr:=sqlstr+wherestr;
 //showmessage(sqlstr);
 adodm.tcrlist.Close;
 adodm.tcrlist.CommandText:= sqlstr;
 adodm.tcrlist.Open;
 
end;

procedure Tfcr.printClick(Sender: TObject);
begin
  printdbgrideh1.Title.Text:=' ����һ����   ('+fromdate.Text+'-'+todate.Text +')' ;
  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfcr.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfcr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adodm.tcrlist.Close;
action:=cafree;
end;

end.
