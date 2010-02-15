unit Unit_DayStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, ExtCtrls, Buttons, StdCtrls;

type
  Tfrm_daystatistic = class(TForm)
    Panel1: TPanel;
    sg: TStringGrid;
    StatusBar1: TStatusBar;
    sbtn_close: TSpeedButton;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    Label1: TLabel;
    dtp_dayStatistic: TDateTimePicker;
    sbtn_daystatistic: TSpeedButton;
    sbtn_print: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_daystatisticClick(Sender: TObject);
    procedure sgSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchDayStatistic(temp:string);
    procedure ComputeStatisticNumber;
  public
    { Public declarations }
    procedure daystatistic_ref;
  end;

var
  frm_daystatistic: Tfrm_daystatistic;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*****************************************************}
procedure Tfrm_daystatistic.daystatistic_ref ;
begin
  with sg do
  begin
    cells[0,0]:='消费编号';
    cells[1,0]:='顾客编号';
    cells[2,0]:='顾客姓名';
    cells[3,0]:='消费总计';
    cells[4,0]:='打折合计';
    cells[5,0]:='总计共收';
    cells[6,0]:='应该找零';
    cells[7,0]:='结算方式';
  end;
  dtp_DayStatistic.Date := Date;
  sbtn_print.Enabled := GetPower(SysUserId,'日营业额统计','打印权');

end;

procedure Tfrm_daystatistic.SearchDayStatistic(temp:string) ;
var
  i:integer;
begin
  StringGridClear(sg);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select cost_no,cc.cus_no,cus_name,cost_sum,discount_sum,payment,change,check_type from CustomerCost cc,Customer c '+
               'where cc.cus_no=c.cus_no and cc.cost_date='+#39+temp+#39;
    Open;
    i:=1;
    while not eof do
    begin
      with sg do
      begin
        cells[0,i]:=FieldByName('cost_no').AsString ;
        cells[1,i]:=FieldByName('cus_no').AsString;
        cells[2,i]:=FieldByName('cus_name').AsString;
        cells[3,i]:=FloatToStr(FieldByName('cost_sum').AsFloat);
        cells[4,i]:=FloatToStr(FieldByName('discount_sum').AsFloat);
        cells[5,i]:=FloatToStr(FieldByName('payment').AsFloat);
        cells[6,i]:=FloatToStr(FieldByName('change').AsFloat);
        if FieldByName('check_type').AsString='0' then
          cells[7,i]:='现金结算'
        else
          cells[7,i]:='顾客卡结算';
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg.RowCount :=i+1;
end;

procedure Tfrm_daystatistic.ComputeStatisticNumber ;
var
  i,totalconsumer,member,notmember:integer;
  totalsum:double;
begin
  totalconsumer:=sg.RowCount-2;
  member:=0;
  notmember:=0;
  totalsum:=0.0;
  for i:=1 to sg.RowCount-2 do
  begin
    if trim(sg.cells[2,i])<>'散客' then
      member:=member+1
    else
      notmember:=notmember+1;

    totalsum:=totalsum+StrToFloat(sg.cells[4,i]);
  end;
  StatusBar1.Panels[0].Text :='消费总人数:'+IntToStr(totalconsumer);
  StatusBar1.Panels[1].Text :='会员人数:'+IntToStr(member);
  StatusBar1.Panels[2].Text :='散客人数:'+IntToStr(notmember);
  StatusBar1.Panels[3].Text :='营业总额:'+FloatToStr(totalsum);
end;
{*****************************************************}
procedure Tfrm_daystatistic.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_daystatistic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_daystatistic:=nil;
end;

procedure Tfrm_daystatistic.sbtn_daystatisticClick(Sender: TObject);
begin
  SearchDayStatistic(DateToString(dtp_daystatistic.Date));
  ComputeStatisticNumber;
end;

procedure Tfrm_daystatistic.sgSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_daystatistic.sbtn_backClick(Sender: TObject);
begin
  if sg.Row > sg.RowCount-2 then
  begin
     sbtn_back.Enabled := false;
     exit;
  end;
  sbtn_front.Enabled := true;
  sg.Row := sg.Row+1;
end;

procedure Tfrm_daystatistic.sbtn_frontClick(Sender: TObject);
begin
  if sg.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg.Row := sg.Row-1;
end;

procedure Tfrm_daystatistic.sbtn_printClick(Sender: TObject);
begin
  DoReportDayStatistic;
end;

end.
