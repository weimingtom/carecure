unit Unit_CardTrack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, ExtCtrls, Buttons;

type
  Tfrm_cardtrack = class(TForm)
    PageControl1: TPageControl;
    sht_Card: TTabSheet;
    sht_Currency: TTabSheet;
    sg_Card: TStringGrid;
    Panel1: TPanel;
    sht_Cost: TTabSheet;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_clear: TSpeedButton;
    sg_currency: TStringGrid;
    sg_Cost: TStringGrid;
    sht_change: TTabSheet;
    sg_change: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sg_CardSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_currencySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_clearClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sg_changeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_CostSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

  private
    { Private declarations }
    procedure SearchCustomerCardChangeInfo;
    procedure SearchCustomerCardCurrencyChangeInfo ;
    procedure SearchCustomerCardCurrencyAddInfo ;
    procedure SearchCustomerCardCurrencyCostInfo;

    procedure DeleteCustomerCardChangeInfo(isClear:boolean);
    procedure DeleteCustomerCardCurrencyChangeInfo(isClear:boolean);
    procedure DeleteCustomerCardCurrencyAddInfo(isClear:boolean);
    procedure DeleteCustomerCardCurrencyCostInfo(isClear:boolean);
  public
    { Public declarations }
    procedure cardtrack_ref;
  end;

var
  frm_cardtrack: Tfrm_cardtrack;

implementation
  uses  unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*************************************************}
procedure Tfrm_cardtrack.cardtrack_ref ;
begin
  pagecontrol1.ActivePage := sht_card;
  
  with sg_Card do
  begin
    cells[0,0]:='变动编号';
    cells[1,0]:='客户卡号';
    cells[2,0]:='客户编号';
    cells[3,0]:='客户姓名';
    cells[4,0]:='员工编号';
    cells[5,0]:='员工姓名';
    cells[6,0]:='变动日期';
    cells[7,0]:='变动描述';
  end;
  SearchCustomerCardChangeInfo;

  with sg_Change do
  begin
    cells[0,0]:='变动编号';
    cells[1,0]:='客户卡号';
    cells[2,0]:='客户编号';
    cells[3,0]:='客户姓名';
    cells[4,0]:='员工编号';
    cells[5,0]:='员工姓名';
    cells[6,0]:='变动日期';
    cells[7,0]:='上次金额';
    cells[8,0]:='变动金额';
    cells[9,0]:='变动方式';
    cells[10,0]:='最新金额';
  end;
  SearchCustomerCardCurrencyChangeInfo;

  with sg_Currency do
  begin
    cells[0,0]:='变动编号';
    cells[1,0]:='客户卡号';
    cells[2,0]:='客户编号';
    cells[3,0]:='客户姓名';
    cells[4,0]:='员工编号';
    cells[5,0]:='员工姓名';
    cells[6,0]:='变动日期';
    cells[7,0]:='上次金额';
    cells[8,0]:='充值金额';
    cells[9,0]:='最新金额';
  end;
  SearchCustomerCardCurrencyAddInfo;

  with sg_Cost do
  begin
    cells[0,0]:='变动编号';
    cells[1,0]:='客户卡号';
    cells[2,0]:='客户编号';
    cells[3,0]:='客户姓名';
    cells[4,0]:='员工编号';
    cells[5,0]:='员工姓名';
    cells[6,0]:='变动日期';
    cells[7,0]:='上次金额';
    cells[8,0]:='消费金额';
    cells[9,0]:='最新金额';
  end;
  SearchCustomerCardCurrencyCostInfo;

  sbtn_clear.Enabled := GetPower(SysUserId,'顾客卡追踪','修改权');
  sbtn_delete.Enabled := sbtn_clear.Enabled ;
  
end;

procedure Tfrm_cardtrack.SearchCustomerCardChangeInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select change_no,card_no,g.cus_no,cus_name,g.emp_no,emp_name,change_date,change_remark '+
               ' from CustomerCardChange g,Customer c,Employee e where g.cus_no=c.cus_no and g.emp_no=e.emp_no order by g.cus_no,change_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Card do
      begin
        cells[0,i]:=FieldByName('change_no').AsString ;
        cells[1,i]:=FieldByName('card_no').AsString ;
        cells[2,i]:=FieldByName('cus_no').AsString ;
        cells[3,i]:=FieldByName('cus_name').AsString ;
        cells[4,i]:=FieldByName('emp_no').AsString ;
        cells[5,i]:=FieldByName('emp_name').AsString ;
        cells[6,i]:=FieldByName('change_date').AsString ;
        cells[7,i]:=FieldByName('change_remark').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Card.RowCount :=i+1;
end;

procedure Tfrm_cardtrack.SearchCustomerCardCurrencyChangeInfo;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select change_no,card_no,g.cus_no,cus_name,g.emp_no,emp_name,change_date,last_currency,currency_added,currency_reduced,total_currency,add_or_reduced '+
               ' from CustomerCardCurrencyChange g,Customer c,Employee e where g.cus_no=c.cus_no and g.emp_no=e.emp_no '+
               ' order by g.cus_no,change_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Change do
      begin
        cells[0,i]:=FieldByName('change_no').AsString ;
        cells[1,i]:=FieldByName('card_no').AsString ;
        cells[2,i]:=FieldByName('cus_no').AsString ;
        cells[3,i]:=FieldByName('cus_name').AsString ;
        cells[4,i]:=FieldByName('emp_no').AsString ;
        cells[5,i]:=FieldByName('emp_name').AsString ;
        cells[6,i]:=FieldByName('change_date').AsString ;
        cells[7,i]:=FieldByName('last_currency').AsString ;
        if FieldByName('add_or_reduced').AsString ='0' then
        begin
          cells[8,i]:=FieldByName('currency_added').AsString ;
          cells[9,i]:='充值';
        end else begin
          cells[8,i]:=FieldByName('currency_reduced').AsString ;
          cells[9,i]:='消费';
        end;
        cells[10,i]:=FieldByName('total_currency').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Change.RowCount :=i+1;
end;

procedure Tfrm_cardtrack.SearchCustomerCardCurrencyAddInfo;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select change_no,card_no,g.cus_no,cus_name,g.emp_no,emp_name,change_date,last_currency,currency_added,total_currency '+
               ' from CustomerCardCurrencyChange g,Customer c,Employee e where g.cus_no=c.cus_no and g.emp_no=e.emp_no and add_or_reduced=''0'' '+
               ' order by g.cus_no,change_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Currency do
      begin
        cells[0,i]:=FieldByName('change_no').AsString ;
        cells[1,i]:=FieldByName('card_no').AsString ;
        cells[2,i]:=FieldByName('cus_no').AsString ;
        cells[3,i]:=FieldByName('cus_name').AsString ;
        cells[4,i]:=FieldByName('emp_no').AsString ;
        cells[5,i]:=FieldByName('emp_name').AsString ;
        cells[6,i]:=FieldByName('change_date').AsString ;
        cells[7,i]:=FieldByName('last_currency').AsString ;
        cells[8,i]:=FieldByName('currency_added').AsString ;
        cells[9,i]:=FieldByName('total_currency').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Currency.RowCount :=i+1;
end;

procedure Tfrm_cardtrack.SearchCustomerCardCurrencyCostInfo;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select change_no,card_no,g.cus_no,cus_name,g.emp_no,emp_name,change_date,last_currency,currency_reduced,total_currency '+
               ' from CustomerCardCurrencyChange g,Customer c,Employee e where g.cus_no=c.cus_no and g.emp_no=e.emp_no and add_or_reduced=''1'' '+
               ' order by g.cus_no,change_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Cost do
      begin
        cells[0,i]:=FieldByName('change_no').AsString ;
        cells[1,i]:=FieldByName('card_no').AsString ;
        cells[2,i]:=FieldByName('cus_no').AsString ;
        cells[3,i]:=FieldByName('cus_name').AsString ;
        cells[4,i]:=FieldByName('emp_no').AsString ;
        cells[5,i]:=FieldByName('emp_name').AsString ;
        cells[6,i]:=FieldByName('change_date').AsString ;
        cells[7,i]:=FieldByName('last_currency').AsString ;
        cells[8,i]:=FieldByName('currency_reduced').AsString ;
        cells[9,i]:=FieldByName('total_currency').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Cost.RowCount :=i+1;
end;

procedure Tfrm_cardtrack.DeleteCustomerCardChangeInfo(isClear:boolean) ;
var
  temp_sql:string;
begin
  if sg_Card.Cells [0,sg_Card.Row ]='' then exit;

  if isClear then
    temp_sql:='delete from CustomerCardChange'
  else
    temp_sql:='delete from CustomerCardChange where change_no='+#39+sg_Card.Cells [0,sg_Card.Row ]+#39;

  if IsClear then
  begin
    if MessageBox(handle,'你确定要清空顾客办卡记录吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;
  end else
    if MessageBox(handle,'删除单条顾客办卡记录将使办卡日志不完整，确定继续吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;
        
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :=temp_sql;
    ExecSQL;
  end;

  if isClear then
  begin
    StringGridClear(sg_Card);
    sbtn_front.Enabled :=false;
    sbtn_back.Enabled := false;
  end else begin
    StringGridDelete(sg_Card,sg_Card.Row);
    if sg_Card.Row = sg_Card.RowCount - 1 then
    begin
      if sg_Card.RowCount > 2 then
        sg_Card.Row := sg_Card.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_Card.Row = 1 then sbtn_front.Enabled := false;
    if sg_Card.Row = sg_Card.RowCount - 2 then sbtn_back.Enabled := false;
  end;

end;

procedure Tfrm_cardtrack.DeleteCustomerCardCurrencyChangeInfo(isClear:boolean) ;
var
  temp_sql:string;
begin
  if sg_change.Cells [0,sg_change.Row ]='' then exit;

  if isClear then
    temp_sql:='delete from CustomerCardCurrencyChange '
  else
    temp_sql:='delete from CustomerCardCurrencyChange where change_no='+#39+sg_change.Cells [0,sg_change.Row ]+#39;

  if IsClear then
  begin
    if MessageBox(handle,'你确定要清空顾客卡金额变化记录吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;
  end else
    if MessageBox(handle,'删除单条顾客卡金额变化记录将使金额变化日志混乱，确定继续吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :=temp_sql;
    ExecSQL;
  end;

  if isClear then
  begin
    StringGridClear(sg_change);
    sbtn_front.Enabled :=false;
    sbtn_back.Enabled := false;
  end else begin
    StringGridDelete(sg_change,sg_change.Row);
    if sg_change.Row = sg_change.RowCount - 1 then
    begin
      if sg_change.RowCount > 2 then
        sg_change.Row := sg_change.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_change.Row = 1 then sbtn_front.Enabled := false;
    if sg_change.Row = sg_change.RowCount - 2 then sbtn_back.Enabled := false;
  end;
end;

procedure Tfrm_cardtrack.DeleteCustomerCardCurrencyAddInfo(isClear:boolean) ;
var
  temp_sql:string;
begin
  if sg_Currency.Cells [0,sg_Currency.Row ]='' then exit;

  if isClear then
    temp_sql:='delete from CustomerCardCurrencyChange where add_or_reduced=''0'''
  else
    temp_sql:='delete from CustomerCardCurrencyChange where add_or_reduced=''0'' and change_no='+#39+sg_Currency.Cells [0,sg_Currency.Row ]+#39;

  if IsClear then
  begin
    if MessageBox(handle,'你确定要清空顾客卡充值金额变化记录吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;
  end else
    if MessageBox(handle,'删除单条顾客卡充值金额变化记录将使金额变化日志混乱，确定继续吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :=temp_sql;
    ExecSQL;
  end;

  if isClear then
  begin
    StringGridClear(sg_Currency);
    sbtn_front.Enabled :=false;
    sbtn_back.Enabled := false;
  end else begin
    StringGridDelete(sg_Currency,sg_Currency.Row);
    if sg_Currency.Row = sg_Currency.RowCount - 1 then
    begin
      if sg_Currency.RowCount > 2 then
        sg_Currency.Row := sg_Currency.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_Currency.Row = 1 then sbtn_front.Enabled := false;
    if sg_Currency.Row = sg_Currency.RowCount - 2 then sbtn_back.Enabled := false;
  end;
end;

procedure Tfrm_cardtrack.DeleteCustomerCardCurrencyCostInfo(isClear:boolean) ;
var
  temp_sql:string;
begin
  if sg_cost.Cells [0,sg_cost.Row ]='' then exit;

  if isClear then
    temp_sql:='delete from CustomerCardCurrencyChange where add_or_reduced=''1'''
  else
    temp_sql:='delete from CustomerCardCurrencyChange where add_or_reduced=''1'' and change_no='+#39+sg_cost.Cells [0,sg_cost.Row ]+#39;

  if IsClear then
  begin
    if MessageBox(handle,'你确定要清空顾客卡消费金额变化记录吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;
  end else
    if MessageBox(handle,'删除单条顾客卡消费金额变化记录将使金额变化日志混乱，确定继续吗？','提示',mb_Yesno+mb_iconquestion)<>IDYES then
      exit;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :=temp_sql;
    ExecSQL;
  end;

  if isClear then
  begin
    StringGridClear(sg_cost);
    sbtn_front.Enabled :=false;
    sbtn_back.Enabled := false;
  end else begin
    StringGridDelete(sg_cost,sg_cost.Row);
    if sg_cost.Row = sg_cost.RowCount - 1 then
    begin
      if sg_cost.RowCount > 2 then
        sg_cost.Row := sg_cost.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_cost.Row = 1 then sbtn_front.Enabled := false;
    if sg_cost.Row = sg_cost.RowCount - 2 then sbtn_back.Enabled := false;
  end;
end;

{*************************************************}
procedure Tfrm_cardtrack.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_cardtrack:=nil;
end;

procedure Tfrm_cardtrack.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cardtrack.sg_CardSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Card.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Card.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_cardtrack.sbtn_backClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_card then
  begin
    if sg_card.Row > sg_card.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_card.Row := sg_card.Row+1 ;
  end else if pagecontrol1.ActivePage = sht_change then
  begin
    if sg_change.Row > sg_change.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_change.Row := sg_change.Row+1;
  end else if pagecontrol1.ActivePage = sht_currency then
  begin
    if sg_currency.Row > sg_currency.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_currency.Row := sg_currency.Row+1;
  end else if pagecontrol1.ActivePage = sht_cost then
  begin
    if sg_cost.Row > sg_cost.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_cost.Row := sg_cost.Row+1;
  end;

end;

procedure Tfrm_cardtrack.sbtn_frontClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_card then
  begin
    if sg_card.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_card.Row := sg_card.Row-1;
  end else if pagecontrol1.ActivePage = sht_change then
  begin
    if sg_change.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_change.Row := sg_change.Row-1;
  end else if pagecontrol1.ActivePage = sht_currency then
  begin
    if sg_currency.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_currency.Row := sg_currency.Row-1;
  end else if pagecontrol1.ActivePage = sht_cost then
  begin
    if sg_cost.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_cost.Row := sg_cost.Row-1;
  end;
end;

procedure Tfrm_cardtrack.sg_currencySelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Currency.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Currency.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_cardtrack.sbtn_clearClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Card then
    DeleteCustomerCardChangeInfo(true)
  else if pagecontrol1.ActivePage = sht_change then
    DeleteCustomerCardCurrencyChangeInfo(true)
  else if pagecontrol1.ActivePage = sht_Currency then
    DeleteCustomerCardCurrencyAddInfo(true)
  else if pagecontrol1.ActivePage = sht_cost then
    DeleteCustomerCardCurrencyCostInfo(true)
end;

procedure Tfrm_cardtrack.sbtn_deleteClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Card then
    DeleteCustomerCardChangeInfo(false)
  else if pagecontrol1.ActivePage = sht_change then
    DeleteCustomerCardCurrencyChangeInfo(false)
  else if pagecontrol1.ActivePage = sht_Currency then
    DeleteCustomerCardCurrencyAddInfo(false)
  else if pagecontrol1.ActivePage = sht_cost then
    DeleteCustomerCardCurrencyCostInfo(false)
end;

procedure Tfrm_cardtrack.sg_changeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Change.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Change.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_cardtrack.sg_CostSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Cost.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Cost.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

end.
