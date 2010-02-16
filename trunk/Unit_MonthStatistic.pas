unit Unit_MonthStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids;

type
  Tfrm_monthstatistic = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    sht_List: TTabSheet;
    sht_Detail: TTabSheet;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    Label1: TLabel;
    sbtn_monthstatistic: TSpeedButton;
    sbtn_close: TSpeedButton;
    sg_List: TStringGrid;
    sg_Detail: TStringGrid;
    edt_monthstatistic: TEdit;
    sbtn_print: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_ListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_DetailSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sbtn_monthstatisticClick(Sender: TObject);
    procedure edt_monthstatisticEnter(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sht_DetailShow(Sender: TObject);
    procedure sg_ListDblClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);

  private
    { Private declarations }

    procedure SearchMonthStatisticList(temp:string);
    procedure SearchMonthStatisticDetail(temp:string);
    procedure RefreshStatusBar;
    procedure SaveMonthStatistic;
  public
    { Public declarations }
    procedure monthstatistic_ref;
  end;

var
  frm_monthstatistic: Tfrm_monthstatistic;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*****************************************************}
procedure Tfrm_monthstatistic.monthstatistic_ref ;
begin

  pagecontrol1.ActivePage := sht_List;

  with sg_list do
  begin
    cells[0,0]:='统计日期';
    cells[1,0]:='消费人数';
    cells[2,0]:='会员人数';
    cells[3,0]:='散客人数';
    cells[4,0]:='现金消费';
    cells[5,0]:='刷卡消费';
    cells[6,0]:='营业总额';
  end;

  with sg_detail do
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

  sbtn_print.Enabled := GetPower(SysUserId,'月营业额统计','打印权');
end;

procedure Tfrm_monthstatistic.SearchMonthStatisticList(temp:string);
var
  temp_month,temp_mindate,temp_maxdate:string;
  i:integer;
begin
  pagecontrol1.ActivePage := sht_List;
  StringGridClear(sg_List);

  temp_mindate:=temp+'-01';
  temp_month:=StringGetChar(temp,'-');
  temp_maxdate:=GetMaxDate(StrToInt(temp_month),StrToInt(copy(temp,2,length(temp))));
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select count(*) as [count] ,sum(discount_sum) as [sum],cost_date from customercost '+
               'where cost_date between '+#35+temp_mindate+#35+' and '+#35+temp_maxdate+#35+
               ' group by cost_date order by cost_date'; //#39-->35
    Open;
    i:=1;
    while not eof do
    begin
      sg_List.Cells[0,i]:=FieldByName('cost_date').AsString;
      sg_List.Cells[1,i]:=IntToStr(FieldByName('count').AsInteger);
      sg_List.Cells[6,i]:=FloatToStr(FieldByName('sum').AsFloat);
      dmod.ADOQuery2.Close ;
      dmod.ADOQuery2.SQL.Text :='select count(*) as member from customercost where cost_date='+
                               #35+FieldByName('cost_date').AsString+#35+' and cus_no<>''0000000001''';
      dmod.ADOQuery2.Open ;
      sg_List.Cells[2,i]:=IntToStr(dmod.ADOQuery2.fieldbyname('member').asinteger);
      sg_List.Cells[3,i]:=IntToStr(FieldByName('count').AsInteger-dmod.ADOQuery2.fieldbyname('member').asinteger);

      dmod.ADOQuery2.Close ;
      dmod.ADOQuery2.SQL.Text :='select count(*) as cash from customercost where cost_date='+
                               #35+FieldByName('cost_date').AsString+#35+' and check_type<>''1''';
      dmod.ADOQuery2.Open ;
      sg_List.Cells[4,i]:=IntToStr(dmod.ADOQuery2.fieldbyname('cash').asinteger);
      sg_List.Cells[5,i]:=IntToStr(FieldByName('count').AsInteger-dmod.ADOQuery2.fieldbyname('cash').asinteger);
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_List.RowCount :=i+1;
end;

procedure Tfrm_monthstatistic.SearchMonthStatisticDetail(temp:string);
var
  i:integer;
begin
  StringGridClear(sg_Detail);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select cost_no,cc.cus_no,cus_name,cost_sum,discount_sum,payment,change,check_type from CustomerCost cc,Customer c '+
               'where cc.cus_no=c.cus_no and cc.cost_date='+#35+temp+#35;
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Detail do
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
  if i<>1 then sg_Detail.RowCount :=i+1;
end;

procedure Tfrm_monthstatistic.RefreshStatusBar ;
begin
  StatusBar1.Panels[0].Text :='统计日期:'+sg_List.Cells[0,sg_List.Row];
  StatusBar1.Panels[1].Text :='消费人数:'+sg_List.Cells[1,sg_List.Row];
  StatusBar1.Panels[2].Text :='会员人数:'+sg_List.Cells[2,sg_List.Row];
  StatusBar1.Panels[3].Text :='散客人数:'+sg_List.Cells[3,sg_List.Row];
  StatusBar1.Panels[4].Text :='现金消费:'+sg_List.Cells[4,sg_List.Row];
  StatusBar1.Panels[5].Text :='刷卡消费:'+sg_List.Cells[5,sg_List.Row];
  StatusBar1.Panels[6].Text :='营业总额:'+sg_List.Cells[6,sg_List.Row];
end;

procedure Tfrm_monthstatistic.SaveMonthStatistic ;
var
  i:integer;
begin
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select count(*) as [count] from CostMonthStatistic where year_month='+#35+trim(edt_monthstatistic.Text)+#35;
      Open;
      if fieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from CostMonthStatistic where year_month='+#35+trim(edt_monthstatistic.Text)+#35;
        ExecSQL;
      end;

      for i:=1 to sg_List.RowCount-2 do
      begin
        Close;
//        SQL.Text :='insert into CostMonthStatistic(year_month,that_day,consumer,member,others,cash,card,total) '+
//                   'values(:yearmonth,:thatday,:consumer,:member,:others,:cash,:card,:total)';
        SQL.Clear;
        SQL.Add('insert into CostMonthStatistic(year_month,that_day,consumer,member,others,cash,card,total)');
        SQL.Add('values(:yearmonth,');
        SQL.Add('''' + sg_List.Cells[0,i] + ''',');
        SQL.Add(':consumer,:member,:others,:cash,:card,:total)');
        Parameters.ParamValues['yearmonth']:= trim(edt_monthstatistic.Text);

//        Parameters.ParamValues['thatday']  := sg_List.Cells[0,i];

        Parameters.ParamValues['consumer']:= StrToInt(sg_List.Cells[1,i]);
        Parameters.ParamValues['member']  := StrToInt(sg_List.Cells[2,i]);
        Parameters.ParamValues['others']  := StrToInt(sg_List.Cells[3,i]);
        Parameters.ParamValues['cash']      := StrToFloat(sg_List.Cells[4,i]);
        Parameters.ParamValues['card']      := StrToFloat(sg_List.Cells[5,i]);
        Parameters.ParamValues['total']     := StrToFloat(sg_List.Cells[6,i]);
        ExecSQL;
      end;
    end;
    dmod.ADOConn.CommitTrans ;
  except
    dmod.ADOConn.RollbackTrans ;
  end;
end;
{*****************************************************}
procedure Tfrm_monthstatistic.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_monthstatistic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_monthstatistic:=nil;
end;

procedure Tfrm_monthstatistic.sg_ListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_List.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_List.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_monthstatistic.sg_DetailSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Detail.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Detail.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_monthstatistic.sbtn_backClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_List then
  begin
    if sg_List.Row > sg_List.RowCount-2 then
    begin
      sbtn_back.Enabled := false;
      exit;
    end;
    sbtn_front.Enabled := true;
    sg_List.Row := sg_List.Row+1;
  end else if pagecontrol1.ActivePage = sht_Detail then
  begin
    if sg_Detail.Row > sg_Detail.RowCount-2 then
    begin
      sbtn_back.Enabled := false;
      exit;
    end;
    sbtn_front.Enabled := true;
    sg_Detail.Row := sg_Detail.Row+1;
  end;
end;

procedure Tfrm_monthstatistic.sbtn_frontClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_list then
  begin
    if sg_List.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;

    sbtn_back.Enabled := true;
    sg_List.Row := sg_List.Row-1;
  end else if pagecontrol1.ActivePage = sht_Detail then
  begin
    if sg_Detail.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;

    sbtn_back.Enabled := true;
    sg_Detail.Row := sg_Detail.Row-1;
  end;
end;

procedure Tfrm_monthstatistic.sbtn_monthstatisticClick(Sender: TObject);
var
  i:integer;
begin
  if strtodatedef(((edt_monthstatistic.text)+ '-01'),0)=0 then
  begin
  showmessage('所输入年月日期格式不对,请按 YYYY-MM 格式即 年-月 格式输入.');
  Exit;
  end;
  SearchMonthStatisticList(trim(edt_monthstatistic.Text));
  SaveMonthStatistic;
  for i:=0 to 6 do
  begin
    StatusBar1.Panels[i].Text :='';
  end;
  StatusBar1.Panels[0].Text :='统计年月:'+edt_monthstatistic.Text;
end;

procedure Tfrm_monthstatistic.edt_monthstatisticEnter(Sender: TObject);
begin
  edt_monthstatistic.Text :='';
end;

procedure Tfrm_monthstatistic.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if sg_List.Cells[0,sg_List.Row]='' then AllowChange:=false;
end;

procedure Tfrm_monthstatistic.sht_DetailShow(Sender: TObject);
begin
  SearchMonthStatisticDetail(sg_List.Cells[0,sg_List.row]);
  RefreshStatusBar;
end;

procedure Tfrm_monthstatistic.sg_ListDblClick(Sender: TObject);
begin
  Pagecontrol1.ActivePage := sht_Detail;
end;

procedure Tfrm_monthstatistic.sbtn_printClick(Sender: TObject);
begin
  DoReportMonthStatistic;
end;


end.
