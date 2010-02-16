unit Unit_CreateCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, Grids, StdCtrls;

type
  Tfrm_createcard = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    sht_Customer: TTabSheet;
    sht_Card: TTabSheet;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_append: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_print: TSpeedButton;
    sbtn_close: TSpeedButton;
    sg_Customer: TStringGrid;
    Label1: TLabel;
    edt_CardNo: TEdit;
    Label2: TLabel;
    edt_CusNo: TEdit;
    Label3: TLabel;
    edt_CusName: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edt_MinCost: TEdit;
    Label6: TLabel;
    edt_Discount: TEdit;
    Label7: TLabel;
    edt_curcurrency: TEdit;
    Label8: TLabel;
    edt_Storecurrency: TEdit;
    Label9: TLabel;
    edt_Warningcurrency: TEdit;
    Label10: TLabel;
    edt_Costscore: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edt_Password1: TEdit;
    Label13: TLabel;
    edt_Password2: TEdit;
    mm_remark: TMemo;
    Label14: TLabel;
    dtp_CreateDate: TDateTimePicker;
    Label15: TLabel;
    edt_Empno: TEdit;
    SpeedButton1: TSpeedButton;
    cbb_CardType: TComboBox;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sg_CustomerSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbb_CardTypeEnter(Sender: TObject);
    procedure cbb_CardTypeExit(Sender: TObject);
    procedure edt_CusNoExit(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sht_CardShow(Sender: TObject);
    procedure sht_CustomerShow(Sender: TObject);
    procedure edt_Password2Exit(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    PageIndex : integer;
    AppendOrEdit,DoChange:boolean;
    CardNo:String;
    
    procedure SearchCustomerCardInfo;
    procedure ClearCustomerCardInfo;
    function  SaveCustomerCardInfo:boolean;
    procedure MakeEnabled(temp:boolean);
    procedure GetCustomerCardInfo;
  public
    { Public declarations }
    procedure createcard_ref;
  end;

var
  frm_createcard: Tfrm_createcard;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*****************用户定义过程***********************}
procedure Tfrm_createcard.createcard_ref ;
begin
  pagecontrol1.ActivePage := sht_Customer;
  dtp_CreateDate.Date  := Date;
  StatusBar1.Panels[0].Text :='当前操作员工:'+SysUserId;
  edt_Empno.Text := SysUserId;
  edt_curcurrency.Text :='0.00';
  edt_storecurrency.Text :='0.00';
  edt_warningcurrency.Text :='0.00';
  edt_costscore.Text :='0';
  
  with sg_Customer do
  begin
    cells[0,0]:='客户卡号';
    cells[1,0]:='客户编号';
    cells[2,0]:='客户姓名';
    cells[3,0]:='办卡日期';
    cells[4,0]:='办卡类型';
    cells[5,0]:='办卡员工';
    cells[6,0]:='备注';
  end;
  formresize(nil);
  SearchCustomerCardInfo();

  sbtn_append.Enabled := GetPower(SysUserId,'顾客办卡','修改权');
  sbtn_edit.Enabled   := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled ;
  sbtn_print.Enabled  := GetPower(SysUserId,'顾客办卡','打印权');
end;

procedure Tfrm_createcard.SearchCustomerCardInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text:='select card_no,customercard.cus_no,cus_name,create_date,card_type,type_name,emp_no,card_remark from customercard,membercardtype,customer '+
              ' where customercard.card_type=membercardtype.type_id and customer.cus_no=customercard.cus_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Customer do
      begin
        cells[0,i]:=FieldByName('card_no').asstring;
        cells[1,i]:=FieldByName('cus_no').asstring;
        cells[2,i]:=FieldByName('cus_name').asstring;
        cells[3,i]:=FieldByName('create_date').AsString ;
        cells[4,i]:=FieldByName('card_type').asstring+'-'+FieldByName('type_name').AsString;
        cells[5,i]:=FieldByName('emp_no').AsString ;
        cells[6,i]:=FieldByName('card_remark').asstring;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Customer.RowCount :=i+1;
end;

function Tfrm_createcard.SaveCustomerCardInfo :boolean;
var
  temp_cardtype,temp_changeno:string;
begin
  result := true;
  DoChange := true;
  //to determine if the following two fields are filled or not
  if trim(edt_Cardno.Text)='' then
  begin
    MessageBox(handle,'请输入客户卡号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Cardno.SetFocus ;
    exit;
  end;
  if trim(edt_Cusno.Text)='' then
  begin
    MessageBox(handle,'请输入客户编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Cusno.SetFocus ;
    exit;
  end;
  //to determine whether the Card no has existed or not
  Cardno := trim(edt_Cardno.Text );
  if AppendOrEdit then
  begin
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'select Card_no from Customercard where Card_no=:no';
      Parameters.ParamValues['no'] := Cardno;
      open;
      if not eof then
      begin
        MessageBox(self.Handle ,'该客户卡号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
        edt_Cardno.SetFocus ;
        result := false;
        exit;
      end;
      Close;
      SQL.Text :='select cus_no from CustomerCard where cus_no=:no';
      Parameters.ParamValues['no'] := trim(edt_Cusno.Text);
      Open;
      if not eof then
      begin
        MessageBox(self.Handle ,'该客户编号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
        edt_Cusno.SetFocus ;
        result := false;
        exit;
      end;
    end;
  end
  else
  begin
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select cus_no from CustomerCard where cus_no=:cus_no and Card_no!=:no ';
      Parameters.ParamValues['cus_no'] := trim(edt_Cusno.Text);
      Parameters.ParamValues['no'] := Cardno;
      Open;
      if not eof then
      begin
        MessageBox(self.Handle ,'该客户编号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
        edt_Cusno.SetFocus ;
        result := false;
        exit;
      end;
    end;
  end ;

  try
    datetostr(dtp_createDate.Date) ;
  except
    MessageBox(self.Handle ,'请输入正确的时间！','提示',mb_ok+mb_iconinformation);
    dtp_createDate.SetFocus ;
    result := false;
    exit;
  end ;
  //try to save the information
  temp_cardtype:=trim(cbb_cardtype.Text);
  temp_changeno:=GetDateString('DBMeirong');
  temp_changeno:=copy(temp_changeno,1,4)+copy(temp_changeno,6,2)+copy(temp_changeno,9,2);
  temp_changeno:=GetNo('DBMeirong','CustomerCardChange','','','change_no',temp_changeno,2);
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from CustomerCard where card_no='+#39+Cardno+#39;
      ExecSQL;

      close;
//      SQL.Text := 'insert into CustomerCard(Card_no,Cus_no,passwords,card_type,create_date' +
//                  ',emp_no,cur_currency,store_currency,warning_currency,cost_score,card_remark,last_time,last_currency)'+
//                  ' values (:cardno,:cusno,:passwords,:cardtype,:createdate,:empno' +
//                  ',:curcurrency,:storecurrency,:warningcurrency,:costscore,:cardremark,:lasttime,:lastcurrency)';
      SQL.Clear ;
      SQL.Add('insert into CustomerCard(Card_no,Cus_no,passwords,card_type,create_date') ;
      SQL.Add(',emp_no,cur_currency,store_currency,warning_currency,cost_score,card_remark,last_time,last_currency)') ;
      SQL.Add(' values (:cardno,:cusno,:passwords,:cardtype,') ;
      SQL.Add( '''' + datetostr(dtp_createDate.Date) + ''',' ) ;
      SQL.Add(':empno,:curcurrency,:storecurrency,:warningcurrency,:costscore,:cardremark,') ;
      SQL.Add( '''' + datetostr(dtp_createdate.Date) + ''',' ) ;
      SQL.Add(':lastcurrency)') ;
      Parameters.ParamValues['cardno']   := trim(edt_Cardno.Text);
      Parameters.ParamValues['cusno']    := trim(edt_Cusno.Text );
      Parameters.ParamValues['passwords'] := trim(edt_Password1.Text) ;
      Parameters.ParamValues['cardtype'] := StringGetChar(temp_cardtype,'-');
//      Parameters.ParamValues['createdate']:= dtp_createDate.Date ;
      Parameters.ParamValues['empno']    := trim(edt_Empno.Text );
      Parameters.ParamValues['curcurrency'] := StrToFloat(trim(edt_Curcurrency.Text ));
      Parameters.ParamValues['storecurrency']:=StrToFloat(trim(edt_StoreCurrency.Text) );
      Parameters.ParamValues['warningcurrency'] := StrToFloat(trim(edt_WarningCurrency.Text) );
      Parameters.ParamValues['costscore'] := StrToFloat(trim(edt_CostScore.Text));
      Parameters.ParamValues['cardremark'] := mm_remark.Text ;
//      Parameters.ParamValues['lasttime'] := dtp_createdate.Date  ;
      Parameters.ParamValues['lastcurrency'] := StrToFloat(trim(edt_StoreCurrency.Text) );
      ExecSQL;

      Close;
      SQL.Clear ;
      SQL.Add('insert into CustomerCardChange(change_no,card_no,cus_no,emp_no,change_remark,change_date) ') ;
      SQL.Add('values(:changeno,:cardno,:cusno,:empno,:changeremark ,') ;
      SQL.Add('''' + datetimetostr(dtp_createDate.DateTime) + ''')' ) ;
      Parameters.ParamValues['changeno']:=temp_changeno;
      Parameters.ParamValues['cardno']:=trim(edt_Cardno.Text);
      Parameters.ParamValues['cusno']:=trim(edt_cusno.Text);
      Parameters.ParamValues['empno']:=trim(edt_empno.Text);
//      Parameters.ParamValues['changedate'] :=dtp_createDate.DateTime  ;
      if AppendOrEdit then
        Parameters.ParamValues['changeremark']:='新建办卡，并且保存'
      else
        Parameters.ParamValues['changeremark']:='修改记录，并且保存';
      ExecSQL;
      dmod.ADOConn.CommitTrans ;
    end;
  except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result := false;
  end;
end;

procedure Tfrm_createcard.GetCustomerCardInfo ;
var
  temp_cardtype:string;
begin
  if sg_Customer.Cells[0,sg_Customer.row]='' then exit;
  Cardno := sg_Customer.Cells[0,sg_Customer.Row];
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select CustomerCard.cus_no,cus_name,passwords,card_type,type_name,create_date,emp_no,cur_currency,store_currency,warning_currency,cost_score,card_remark'+
                ' from CustomerCard,MemberCardType,Customer where CustomerCard.card_type=MemberCardType.type_id and CustomerCard.cus_no=Customer.cus_no and card_no='+#39+cardno+#39;
    open;

    edt_CardNo.Text   := Cardno;
    edt_cusno.Text    := fieldByname('cus_no').AsString ;
    edt_cusname.Text  := FieldByName('cus_name').AsString ;
    edt_password1.Text:= FieldByName('passwords').AsString ;
    edt_password2.Text:= FieldByName('passwords').AsString ;
    cbb_cardtype.Text := FieldByName('card_type').AsString+'-'+FieldByName('type_name').AsString  ;
    dtp_createdate.Date  :=FieldByName('create_Date').AsDateTime ;
    edt_empno.text       := FieldByName('Emp_no').Asstring ;
    edt_Curcurrency.Text := FloatToStr(FieldByName('cur_currency').AsFloat) ;
    edt_Storecurrency.Text  := FloatToStr(FieldByName('store_currency').AsFloat);
    edt_Warningcurrency.Text:= FloatToStr(FieldByName('warning_currency').AsFloat) ;
    edt_CostScore.Text      := FloatToStr(FieldByName('cost_score').AsFloat) ;
    mm_remark.Text    := FieldByName('card_remark').AsString ;
    temp_cardtype:=FieldByName('card_type').AsString;
  end;

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select mincost,discount from MemberCardType where type_id='+#39+temp_cardtype+#39;
    Open;
    if not eof then
    begin
      edt_MinCost.Text :=FieldByName('mincost').AsString ;
      edt_Discount.Text :=FieldByName('discount').AsString ;
    end;
  end;

  //设置密码为不可修改
  edt_password1.ReadOnly :=true;
  edt_password2.ReadOnly :=true;
end;

procedure Tfrm_createcard.ClearCustomerCardInfo ;
begin
  edt_Cardno.Text :='';
  edt_Cusno.Text  :='';
  edt_Password1.Text :='';
  edt_Password2.Text :='';
  edt_Cusname.Text :='';
  cbb_CardType.Text :='';
  edt_MinCost.Text :='';
  edt_Discount.Text :='';
  edt_Curcurrency.Text :='';
  edt_StoreCurrency.Text :='';
  edt_WarningCurrency.Text :='';
  edt_CostScore.Text :='';
  dtp_CreateDate.Date:=Date;
  mm_remark.Text :='';
end;

procedure Tfrm_createcard.MakeEnabled(temp:boolean);
begin
   if sbtn_append.Enabled then
      sbtn_save.Enabled := temp
   else
      sbtn_save.Enabled := false;
   sbtn_delete.Enabled := false;

   edt_Cardno.Enabled   := temp;
   edt_Cusno.Enabled    := temp;
   edt_Cusname.Enabled  := temp;
   edt_Password1.Enabled:= temp;
   edt_Password2.Enabled:= temp;
   cbb_CardType.Enabled := temp;
   dtp_CreateDate.Enabled:= temp;
   edt_Empno.Enabled    := temp;
   edt_MinCost.Enabled  := temp;
   edt_Discount.Enabled := temp;
   edt_Curcurrency.Enabled:= temp;
   edt_Storecurrency.Enabled:= temp;
   edt_WarningCurrency.Enabled:= temp;
   edt_CostScore.Enabled :=temp;
   mm_remark.Enabled :=temp;
   if temp then edt_Cardno.SetFocus;
end;

{*****************用户定义过程***********************}
procedure Tfrm_createcard.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_Card then
  if sbtn_append.Enabled then
  begin
    if edt_cardno.Enabled then
    begin
      i := MessageBox(handle,'在窗口关闭的同时，你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      begin
        if SaveCustomerCardInfo then i:=7 else i:=2;
      end;
      if i=2 then
      begin
        action := canone;
        exit;
      end;
    end;
  end;
  action:=cafree;
  frm_createcard:=nil;
end;

procedure Tfrm_createcard.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_createcard.FormResize(Sender: TObject);
begin
  StringGridAutoSize(sg_Customer);
end;

procedure Tfrm_createcard.sbtn_appendClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if pagecontrol1.ActivePage = sht_Card then  //to determine whethter sht_content is shown
  if (not AppendOrEdit) and edt_Cardno.Enabled then  //to determine status of Edit and Components' Enabled
  begin
    i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
    if i=6 then //select yes
    if not SaveCustomerCardInfo then i:=2;
    if i=2 then exit;
  end;

  AppendOrEdit := true;
  pagecontrol1.ActivePage := sht_card;
  MakeEnabled(true);
  ClearCustomerCardInfo;
  //设置密码为可修改
  edt_password1.ReadOnly :=false;
  edt_password2.ReadOnly :=false;
  //设置原始数据
  temp:=GetDateString('DBMeirong');
  temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
  edt_Cardno.Text :=GetNo('DBMeirong','CustomerCard','','','Card_no',temp,2);
end;

procedure Tfrm_createcard.sg_CustomerSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Customer.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Customer.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_createcard.sbtn_editClick(Sender: TObject);
var
   i:integer;
begin
   if pagecontrol1.ActivePage = sht_Card then
   if AppendOrEdit and edt_Cardno.Enabled then
   begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveCustomerCardInfo then i:=2;
     if i=2 then exit;
   end;
   if sg_Customer.Cells[0,sg_Customer.Row]='' then exit;
   if pagecontrol1.ActivePage <> sht_Card then pagecontrol1.ActivePage := sht_Card;
   if AppendOrEdit then begin GetCustomerCardInfo; edt_password1.ReadOnly :=true; edt_password2.ReadOnly :=false; end;
   AppendOrEdit := false;
   MakeEnabled(true);

   edt_Cardno.Enabled := false;
end;

procedure Tfrm_createcard.sbtn_saveClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if not SaveCustomerCardInfo then exit;

  if AppendOrEdit then
  begin
    StringGridInsert(sg_Customer);
    i:=1;
  end else i:=sg_Customer.Row ;

  with sg_Customer do
  begin
    Cells[0,i] := trim(edt_Cardno.Text );
    Cells[1,i] := trim(edt_cusno.Text );
    Cells[2,i] := trim(edt_cusname.Text );
    Cells[3,i] := trim(DateToString(dtp_createdate.Date));
    Cells[4,i] := trim(cbb_cardtype.Text );
    Cells[5,i] := trim(edt_Empno.Text );
    Cells[6,i] := trim(mm_remark.Text );
  end;

  if AppendOrEdit then
  begin
    ClearCustomerCardInfo;
    temp := GetDateString('DBMeirong');
    temp := copy(temp,1,4) + copy(temp,6,2) + copy(temp,9,2);
    edt_Cardno.Text := GetNo('DBMeirong','CustomerCard','','','Card_no',temp,2);
    if sg_Customer.RowCount > 3 then sbtn_back.Enabled := true;
  end else MakeEnabled(false);
end;

procedure Tfrm_createcard.sbtn_deleteClick(Sender: TObject);
begin
  if sg_Customer.cells[0,sg_Customer.Row]='' then exit;
  if MessageBox(handle,'你确定要删除该客户卡号信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'delete from CustomerCard where card_no='+#39+sg_Customer.Cells[0,sg_Customer.Row]+#39;
    ExecSQL;
  end;
  StringGridDelete(sg_Customer,sg_Customer.Row);
  if sg_Customer.Row = sg_Customer.RowCount - 1 then
  begin
    if sg_Customer.RowCount > 2 then
      sg_Customer.Row := sg_Customer.Row - 1
    else
      sbtn_back.Enabled := false;
  end;
  if sg_Customer.Row = 1 then sbtn_front.Enabled := false;
  if sg_Customer.Row = sg_Customer.RowCount - 2 then sbtn_back.Enabled := false;
end;

procedure Tfrm_createcard.sbtn_backClick(Sender: TObject);
var
   i: integer;
begin
   if pagecontrol1.ActivePage = sht_Card then
   if edt_empno.Enabled  then
   if sbtn_append.Enabled  then
   begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then  //select yes
     if not SaveCustomerCardInfo then i:=2; //if save error
     if i=2 then exit;
   end;
   if sg_Customer.Row > sg_Customer.RowCount-2 then
   begin
     sbtn_back.Enabled := false;
     exit;
   end;
   sbtn_front.Enabled := true;
   sg_Customer.Row := sg_Customer.Row+1;
   if pagecontrol1.ActivePage = sht_Card then
   begin
     GetCustomerCardInfo();
     MakeEnabled(false);
   end;
end;

procedure Tfrm_createcard.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_card then
  if edt_Empno.Enabled then
  if sbtn_append.Enabled then
  begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveCustomerCardInfo then i:=2;
     if i=2 then exit;
  end;

  if sg_Customer.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg_Customer.Row := sg_Customer.Row-1;

  if pagecontrol1.ActivePage = sht_card then
  begin
    GetCustomerCardInfo();
    MakeEnabled(false);
  end;
end;

procedure Tfrm_createcard.SpeedButton1Click(Sender: TObject);
begin
  DoDictionary;
end;

procedure Tfrm_createcard.cbb_CardTypeEnter(Sender: TObject);
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select type_id,type_name from MemberCardType';
    Open;
    while not eof do
    begin
      cbb_cardtype.Items.Add(FieldByName('type_id').AsString + '-' + FieldByName('type_name').AsString); 
      next;
    end;
  end;
end;

procedure Tfrm_createcard.cbb_CardTypeExit(Sender: TObject);
var
  temp_typeid:string;
begin
  if cbb_Cardtype.Text ='' then exit;
  temp_typeid:=cbb_Cardtype.Text ;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select mincost,discount from MemberCardType where type_id='+#39+StringGetChar(temp_typeid,'-')+#39;
    Open;
    if not eof then
    begin
      edt_MinCost.Text := FieldByname('mincost').AsString ;
      edt_Discount.Text := FieldByName('discount').AsString ;
    end;
  end;
end;

procedure Tfrm_createcard.edt_CusNoExit(Sender: TObject);
begin
  if edt_CusNo.Text ='' then exit;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select cus_name from customer where cus_no='+#39+trim(edt_Cusno.Text)+#39;
    Open;
    if not eof then
      edt_cusname.Text :=FieldByName('cus_name').AsString 
    else begin
      MessageBox(self.handle,'该客户编号不存在，请重试!','提示',mb_ok+mb_iconinformation);
      edt_cusname.SetFocus ;
    end;
  end;
end;

procedure Tfrm_createcard.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  i:integer;
begin
  AllowChange := true;
  if not sbtn_append.Enabled then exit;
  if PageIndex=1 then
  begin
    if edt_Cardno.Enabled then
    begin
      AppendOrEdit := false;
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then //
      begin
        sbtn_saveClick(nil);
        if not DoChange then i:=2;
      end;
      if i=7 then MakeEnabled(true);
      if i=2 then AllowChange:=true;
    end;
  end else if (sg_Customer.Cells [0,sg_Customer.Row]='') and not AppendOrEdit then AllowChange:=true;
end;

procedure Tfrm_createcard.sht_CardShow(Sender: TObject);
begin
  PageIndex := 1;
  if not AppendOrEdit then
  begin
    if sg_Customer.Cells[0,sg_Customer.Row]<>'' then GetCustomerCardInfo;
    MakeEnabled(false);
  end;
end;

procedure Tfrm_createcard.sht_CustomerShow(Sender: TObject);
begin
  PageIndex:=0;
  if not sbtn_append.Enabled then exit;
  sbtn_delete.Enabled := true;
  sbtn_save.Enabled := false;
end;

procedure Tfrm_createcard.edt_Password2Exit(Sender: TObject);
begin
  if trim(edt_password2.Text)<>trim(edt_password1.Text) then
  begin
    MessageBox(handle,'两次输入的密码不一样，请重试!','提示',mb_ok+mb_iconinformation);
    edt_password1.SetFocus ;
  end;
end;

procedure Tfrm_createcard.sbtn_printClick(Sender: TObject);
begin
  DoReportCustomerCard;
end;

end.
