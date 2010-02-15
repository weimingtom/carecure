unit Unit_FrontCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, ComCtrls, Buttons,DateUtils;

type
  Tfrm_frontcheck = class(TForm)
    Panel1: TPanel;
    sg_CostList: TStringGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    s: TGroupBox;
    PageControl1: TPageControl;
    sht_Item: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    edt_CusNo: TEdit;
    sbtn_Sure: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sbtn_Other: TSpeedButton;
    Label6: TLabel;
    edt_CusName: TEdit;
    Label7: TLabel;
    edt_CusType: TEdit;
    Label8: TLabel;
    edt_Curcurrency: TEdit;
    Label9: TLabel;
    edt_TotalCost: TEdit;
    Label10: TLabel;
    edt_CostScore: TEdit;
    sg_Item: TStringGrid;
    Panel4: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    sg_Meal: TStringGrid;
    Panel5: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label11: TLabel;
    edt_Discount: TEdit;
    Label12: TLabel;
    edt_CusNo1: TEdit;
    RadioGroup1: TRadioGroup;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    sbtn_Card: TSpeedButton;
    SpeedButton9: TSpeedButton;
    sbtn_Attend: TSpeedButton;
    Label1: TLabel;
    lbl_today: TLabel;
    lbl_dayofweek: TLabel;
    sbtn_print: TSpeedButton;
    sbtn_addEmp1: TSpeedButton;
    sbtn_addEmp2: TSpeedButton;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    sbtn_save: TSpeedButton;
    Label18: TLabel;
    edt_CostSum: TEdit;
    edt_DiscountSum: TEdit;
    pnlCard: TPanel;
    Label17: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_CardMoney: TEdit;
    edt_LatestMoney: TEdit;
    edt_Password: TEdit;
    edt_CostMoney: TEdit;
    pnlCash: TPanel;
    Label14: TLabel;
    Label16: TLabel;
    edt_Payment: TEdit;
    edt_change: TEdit;
    Label19: TLabel;
    edt_EmpNo: TEdit;
    edt_CardNo: TEdit;
    procedure sbtn_SureClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_CusNoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure edt_PaymentExit(Sender: TObject);
    procedure edt_PaymentKeyPress(Sender: TObject; var Key: Char);
    procedure edt_changeKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sbtn_addEmp1Click(Sender: TObject);
    procedure sbtn_addEmp2Click(Sender: TObject);
    procedure sbtn_OtherClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure sbtn_CardClick(Sender: TObject);
    procedure sbtn_AttendClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshCustomerCost;
    procedure ClearCustomerCost;
    procedure SearchCustomerCost;
  public
    { Public declarations }
    procedure frontcheck_ref;
    procedure ComputeCostsum;
  end;

var
  frm_frontcheck: Tfrm_frontcheck;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}


{***********************************************}
procedure Tfrm_frontcheck.frontcheck_ref ;
begin
  pagecontrol1.ActivePage := sht_Item;
  edt_Empno.Text := SysUserId;

  with sg_Item do
  begin
    cells[0,0]:='��Ŀ���';
    cells[1,0]:='��Ŀ����';
    cells[2,0]:='��Ŀ�۸�';
    cells[3,0]:='����Ա��';
  end;
  with sg_Meal do
  begin
    cells[0,0]:='�ײͱ��';
    cells[1,0]:='�ײ�����';
    cells[2,0]:='�ײͼ۸�';
    cells[3,0]:='����Ա��';
  end;

  with sg_CostList do
  begin
    cells[0,0]:='���ѱ��';
    cells[1,0]:='�˿ͱ��';
    cells[2,0]:='�˿�����';
    cells[3,0]:='�����ܼ�';
    cells[4,0]:='���ۺϼ�';
    cells[5,0]:='�ܼƹ���';
    cells[6,0]:='Ӧ������';
    cells[7,0]:='���㷽ʽ';
  end;

  lbl_today.Caption := DateToStr(Date);
  case DayOfTheWeek(Date) of
  1: lbl_dayofweek.Caption :='����һ';
  2: lbl_dayofweek.Caption :='���ڶ�';
  3: lbl_dayofweek.Caption :='������';
  4: lbl_dayofweek.Caption :='������';
  5: lbl_dayofweek.Caption :='������';
  6: lbl_dayofweek.Caption :='������';
  7: lbl_dayofweek.Caption :='������';
  end;

  SearchCustomerCost;
  RefreshCustomerCost;

  sbtn_save.Enabled := GetPower(SysUserId,'ǰ̨��Ӫ','�޸�Ȩ');
  sbtn_print.Enabled := GetPower(SysUserId,'ǰ̨��Ӫ','��ӡȨ');
  sbtn_card.Enabled  := GetPower(SysUserId,'�˿Ϳ�����','���Ȩ');
  sbtn_Attend.Enabled:= GetPower(SysUserId,'��������','���Ȩ');

end;

procedure Tfrm_frontcheck.ComputeCostsum ;
var
  i:integer;
  costsum:double;
begin
  if edt_Discount.text='' then
  begin
    MessageBox(handle,'�޷���ȡ�ͻ���Ϣ����������ͻ���Ż��ߵ��[ɢ������]','��ʾ',mb_ok+mb_iconinformation);
    StringGridClear(sg_Item);
    StringGridClear(sg_Meal);
    sbtn_addEmp1.Enabled :=false;
    sbtn_addEmp2.Enabled :=false;
    exit;
  end;

  costsum:=0.0;
  for i:=1 to sg_Item.RowCount-2 do
  begin
    costsum:=costsum+ StrToFloat(sg_Item.cells[2,i])
  end;
  for i:=1 to sg_Meal.RowCount-2 do
  begin
    costsum:=costsum+ StrToFloat(sg_Meal.Cells[2,i]);
  end;
  edt_CostSum.Text := FloatToStr(costsum);
  edt_DiscountSum.Text := FloatToStr( StrToFloat(edt_Discount.Text) * costsum * 0.01 );
end;

procedure Tfrm_frontcheck.RefreshCustomerCost ;
var
  i,totalconsumer,member,notmember:integer;
  totalsum:double;
begin
  totalconsumer:=sg_CostList.RowCount-2;
  member:=0;
  notmember:=0;
  totalsum:=0.0;
  for i:=1 to sg_CostList.RowCount-2 do
  begin
    if trim(sg_CostList.cells[2,i])<>'ɢ��' then
      member:=member+1
    else
      notmember:=notmember+1;

    totalsum:=totalsum+StrToFloat(sg_CostList.cells[4,i]);
  end;
  StatusBar1.Panels[0].Text :='����������:'+IntToStr(totalconsumer);
  StatusBar1.Panels[1].Text :='��Ա����:'+IntToStr(member);
  StatusBar1.Panels[2].Text :='ɢ������:'+IntToStr(notmember);
  StatusBar1.Panels[3].Text :='Ӫҵ�ܶ�:'+FloatToStr(totalsum);
end;

procedure Tfrm_frontcheck.ClearCustomerCost ;
begin
  edt_CusNo1.Text :='';
  edt_CardNo.Text :='';
  edt_CusName.Text :='';
  edt_CusType.Text :='';
  edt_Discount.Text :='';
  edt_Curcurrency.Text :='';
  edt_TotalCost.Text :='';
  edt_CostScore.Text :='';
  StringGridClear(sg_Item);
  StringGridClear(sg_Meal);
  edt_CostSum.Text :='';
  edt_DiscountSum.Text :='';
  edt_Payment.Text :='';
  edt_Change.Text :='';
  edt_CostMoney.Text :='';
  edt_LatestMoney.Text :='';
  edt_Password.Text :='';
  edt_CardMoney.Text :='';
  edt_CusNo.SetFocus ;
end;

procedure Tfrm_frontcheck.SearchCustomerCost;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
//    SQL.Text :='select cost_no,cc.cus_no,cus_name,cost_sum,discount_sum,payment,change,check_type from CustomerCost cc,Customer c '+
//               'where cc.cus_no=c.cus_no and cc.cost_date='+#39+DateToString(Date)+#39;
    SQL.Clear ;
    SQL.Add('SELECT cc.cost_no, cc.cus_no, c.Cus_name, cc.cost_sum, cc.discount_sum, cc.payment,');
    SQL.Add('cc.change, cc.check_type, cc.cost_date');
    SQL.Add('FROM CustomerCost cc INNER JOIN');
    SQL.Add('Customer c ON cc.cus_no = c.Cus_no');
    SQL.Add('WHERE (cc.cost_date = { fn CURDATE() })');
    Open;
    i:=1;
    while not eof do
    begin
      with sg_CostList do
      begin
        cells[0,i]:=FieldByName('cost_no').AsString ;
        cells[1,i]:=FieldByName('cus_no').AsString;
        cells[2,i]:=FieldByName('cus_name').AsString;
        cells[3,i]:=FloatToStr(FieldByName('cost_sum').AsFloat);
        cells[4,i]:=FloatToStr(FieldByName('discount_sum').AsFloat);
        cells[5,i]:=FloatToStr(FieldByName('payment').AsFloat);
        cells[6,i]:=FloatToStr(FieldByName('change').AsFloat);
        if FieldByName('check_type').AsString='0' then
          cells[7,i]:='�ֽ����'
        else
          cells[7,i]:='�˿Ϳ�����';
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_CostList.RowCount :=i+1;
end;
{***********************************************}
procedure Tfrm_frontcheck.sbtn_SureClick(Sender: TObject);
begin
  if trim(edt_CusNo.Text )='' then
  begin
    MessageBox(handle,'��ͻ���Ų���Ϊ�գ�������!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select cus_name,card_no,type_name,discount,cur_currency,total_cost,cost_score '+
               ' from customer c,customercard cc,membercardtype mct where c.cus_no=cc.cus_no'+
               ' and cc.card_type=mct.type_id and c.cus_no='+#39+trim(edt_CusNo.Text)+#39;
    Open;
    if not eof then
    begin
      edt_CusNo1.Text  :=trim(edt_CusNo.Text );
      edt_CardNo.Text  :=FieldByName('card_no').AsString ;
      edt_CusName.Text :=FieldByName('cus_name').AsString ;
      edt_CusType.Text :=FieldByname('type_name').AsString ;
      edt_Discount.Text:=FloatToStr(FieldByName('discount').AsFloat) ;
      edt_Curcurrency.Text :=FloatToStr(FieldByName('cur_currency').AsFloat) ;
      edt_TotalCost.Text :=FloatToStr(FieldByName('total_cost').AsFloat) ;
      edt_CostScore.Text :=FloatToStr(FieldByName('cost_score').AsFloat) ;

      edt_CusNo.Text :='';
    end else
    begin
      MessageBox(self.handle,'�ÿͻ���Ų����ڣ�������!','��ʾ',mb_ok+mb_iconinformation);
      edt_CusNo1.Text :='';
      edt_CardNo.Text :='';
      edt_CusName.Text :='';
      edt_CusType.Text :='';
      edt_Discount.Text :='';
      edt_Curcurrency.Text :='';
      edt_TotalCost.Text :='';
      edt_CostScore.Text :='';
      edt_CusNo.SetFocus ;
      exit;
    end;
  end;
end;

procedure Tfrm_frontcheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_frontcheck:=nil;
end;

procedure Tfrm_frontcheck.edt_CusNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    sbtn_SureClick(nil);
end;

procedure Tfrm_frontcheck.SpeedButton4Click(Sender: TObject);
begin
  DoServiceItem;
  if sg_Item.RowCount >=2 then sbtn_addEmp1.Enabled :=true;
end;

procedure Tfrm_frontcheck.SpeedButton5Click(Sender: TObject);
begin
  if sg_Item.Cells[0,sg_Item.Row ]='' then exit;

  if (MessageBox(handle,'��ȷ��ɾ���÷�����Ŀ��?','ѯ��',mb_yesno+mb_iconinformation))<>IDYes then exit;

  StringGridDelete(sg_Item,sg_Item.Row );

  if sg_Item.RowCount <=2 then sbtn_addEmp1.Enabled :=false;

  ComputeCostsum;
end;

procedure Tfrm_frontcheck.SpeedButton6Click(Sender: TObject);
begin
  DoServiceMeal;
  if sg_Meal.RowCount >=2 then sbtn_addEmp2.Enabled :=true;
end;

procedure Tfrm_frontcheck.SpeedButton7Click(Sender: TObject);
begin
  if sg_Meal.cells[0,sg_Meal.row]='' then exit;

  if (MessageBox(handle,'��ȷ��ɾ���÷����ײ���?','ѯ��',mb_yesno+mb_iconinformation))<>IDYes then exit;

  StringGridDelete(sg_Meal,sg_Meal.row);

  if sg_Meal.RowCount <=2 then sbtn_addEmp2.Enabled :=false;

  ComputeCostsum;
end;

procedure Tfrm_frontcheck.sbtn_saveClick(Sender: TObject);
var
  temp,temp_costno,temp_detailno,temp_changeno,temp_reminder,temp_typeid:string;
  i:integer;
  temp_mincost:double;
begin
  {************************************************************************************************}

  if (edt_CostSum.Text ='') or (edt_DiscountSum.Text ='') then
  begin
    MessageBox(handle,'�˿�û�н������ѻ������ѽ���ʽ���ԣ�������!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;

  if radiogroup1.itemindex=0 then
  if(edt_Payment.Text='') or (edt_change.Text='') then
  begin
    MessageBox(handle,'�Ѿ�������û�����룬������!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;

  for i:=1 to sg_Item.rowcount-2 do
  begin
    if (sg_Item.Cells[0,i]<>'') and (sg_Item.Cells[3,i]='') then
    begin
      MessageBox(handle,'��ѡ���ṩ�����Ա�����!','��ʾ',mb_ok+mb_iconinformation);
      exit;
    end;
  end;

  for i:=1 to sg_Meal.rowcount-2 do
  begin
    if (sg_Meal.Cells[0,i]<>'') and (sg_Meal.Cells[3,i]='') then
    begin
      MessageBox(handle,'��ѡ���ṩ�����Ա�����!','��ʾ',mb_ok+mb_iconinformation);
      exit;
    end;
  end;

  if radiogroup1.ItemIndex =1 then
  if StrToFloat(edt_CostMoney.Text)>StrToFloat(edt_Curcurrency.Text) then
  begin
    MessageBox(handle,'���ڽ�����֧���������ѣ����ȳ�ֵ!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;
  {************************************************************************************************}
  //�����û���֤
  if radiogroup1.ItemIndex =1 then
    begin
      if edt_Password.Text ='' then begin MessageBox(handle,'�������û����룬�����û���֤!','��ʾ',mb_ok+mb_iconinformation); edt_password.SetFocus ;exit; end;

      with dmod.ADOQuery1 do
      begin
        close;
        SQL.Text :='select password from CustomerCard where card_no='+#39+trim(edt_CardNo.Text)+#39;
        Open;
        if trim(edt_password.Text)<>trim(FieldByName('password').AsString) then
        begin
          MessageBox(self.handle,'�û�������֤ʧ�ܣ�������!','��ʾ',mb_ok+mb_iconinformation);
          edt_password.SetFocus ;
          exit;
        end;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      //�������Ѽ�¼��CustomerCost;
      temp := GetDateString('DBMeirong');
      temp := copy(temp,1,4) + copy(temp,6,2) + copy(temp,9,2);
      temp_costno := GetNo('DBMeirong','CustomerCost','','','cost_no',temp,2);

      Close;
//      SQL.Text :='insert into CustomerCost(cost_no,cus_no,emp_no,cost_sum,discount,discount_sum,payment,change,check_type,cost_date) '+
//                 ' values(:costno,:cusno,:empno,:costsum,:discount,:discountsum,:payment,:change,:checktype,:costdate)';
      SQL.Clear ;
      SQL.Add('insert into CustomerCost(cost_no,cus_no,emp_no,cost_sum,discount,discount_sum,payment,change,check_type,cost_date) ') ;
      SQL.Add(' values(:costno,:cusno,:empno,:costsum,:discount,:discountsum,:payment,:change,:checktype,') ;
      SQL.Add('''' + datetostr(Date) + ''')') ;
      Parameters.ParamValues['costno'] := temp_costno;
      if trim(edt_CusNo1.Text)<>'' then
         Parameters.ParamValues['cusno']  := trim(edt_CusNo1.Text)
      else
         Parameters.ParamValues['cusno']  := 'ɢ��';
      Parameters.ParamValues['empno'] := edt_Empno.Text ;
      Parameters.ParamValues['costsum'] := StrToFloat(trim(edt_CostSum.Text));
      Parameters.ParamValues['discount'] := StrToFloat(trim(edt_Discount.Text));
      Parameters.ParamValues['discountsum'] := StrToFloat(trim(edt_DiscountSum.Text));
      if radiogroup1.itemindex=0 then begin
        Parameters.ParamValues['payment'] := StrToFloat(trim(edt_Payment.text));
        Parameters.ParamValues['change'] := StrToFloat(trim(edt_Change.Text));
        Parameters.ParamValues['checktype']:='0';
      end else if radiogroup1.ItemIndex =1 then begin
        Parameters.ParamValues['payment'] := StrToFloat(trim(edt_CardMoney.text));
        Parameters.ParamValues['change'] := StrToFloat(trim(edt_LatestMoney.Text));
        Parameters.ParamValues['checktype']:='1';
      end;

//      Parameters.ParamValues['costdate'] := Date;
      ExecSQL;

      //������ֽ����ѣ����¹˿Ϳ��е������ܶ�����ѻ���,ɢ�������߲����и���
      if (trim(edt_CusNo1.Text)<>'0000000001') and (radiogroup1.itemindex=0) then
      begin
        Close;
        SQL.Text :='update CustomerCard set total_cost=total_cost+'+#39+trim(edt_DiscountSum.Text)+#39+
                   ',cost_score=cost_score+'+#39+trim(edt_DiscountSum.Text)+#39+
                   ' where cus_no='+#39+trim(edt_CusNo1.Text)+#39;
        ExecSQL;
      end;

      //����ù˿Ϳ����ѣ����¹˿Ϳ��е������ܶ���ѻ��ֺ�������ɢ�������߲����и���
      //���ҽ��˿Ϳ����ı䶯��¼����CustomerCardCurrencyChange
      if (trim(edt_CusNo1.Text)<>'0000000001') and (radiogroup1.itemindex=1) then
      begin
        Close;
        SQL.Text :='update CustomerCard set total_cost=total_cost+'+#39+trim(edt_DiscountSum.Text)+#39+
                   ',cost_score=cost_score+'+#39+trim(edt_DiscountSum.Text)+#39+
                   ',cur_currency=cur_currency-'+#39+trim(edt_CostMoney.text)+#39+
                   ' where cus_no='+#39+trim(edt_CusNo1.Text)+#39;
        ExecSQL;

        temp_changeno:= GetNo('DBMeirong','CustomerCardCurrencyChange','','','change_no',temp,2);

        Close;
//        SQL.text:='insert into CustomerCardCurrencyChange(change_no,card_no,cus_no,emp_no,change_date,last_currency,currency_reduced,total_currency,add_or_reduced) '+
//                  ' values(:changeno,:cardno,:cusno,:empno,:changedate,:lastcurrency,:currencyreduced,:totalcurrency,:addorreduced)';
        SQL.Clear;
        SQL.Add('insert into CustomerCardCurrencyChange(change_no,card_no,cus_no,emp_no,change_date,last_currency,currency_reduced,total_currency,add_or_reduced)');
        SQL.Add(' values(:changeno,:cardno,:cusno,:empno,');
        SQL.Add('''' + datetostr(date) + ''',');
        SQL.Add(':lastcurrency,:currencyreduced,:totalcurrency,:addorreduced)');
        Parameters.ParamValues['changeno']:=temp_changeno;
        Parameters.ParamValues['cardno']:=edt_CardNo.Text ;
        Parameters.ParamValues['cusno']:=edt_CusNo1.Text ;
        Parameters.ParamValues['empno']:=edt_EmpNo.Text ;
//        Parameters.ParamValues['changedate']:=Date;
        Parameters.ParamValues['lastcurrency']:=StrToFloat(edt_Curcurrency.text);
        Parameters.ParamValues['currencyreduced']:=StrToFloat(trim(edt_CostMoney.Text));
        Parameters.ParamValues['totalcurrency']:=StrToFloat(trim(edt_latestMoney.Text));
        Parameters.ParamValues['addorreduced']:='1';

        ExecSQL;
      end;


      //����������ϸ��¼��CustomerCostDetail
      for i:=1 to sg_Item.RowCount-2 do
      begin
        temp_detailno := GetNo('DBMeirong','CustomerCostDetail','','','detail_no',temp,2);

        Close;
        SQL.Text :='insert into CustomerCostDetail(detail_no,cost_no,item_id,type_id,itemortype,emp_no,price) '+
                   ' values(:detailno,:costno,:itemid,:typeid,:itemortype,:empno,:price)';

        Parameters.ParamValues['detailno']:=temp_detailno;
        Parameters.ParamValues['costno']  :=temp_costno;
        Parameters.ParamValues['itemid']  :=sg_Item.Cells[0,i];
        Parameters.ParamValues['typeid']  :='';
        Parameters.ParamValues['itemortype']  :='0';
        Parameters.ParamValues['empno']   :=sg_Item.cells[3,i];
        Parameters.ParamValues['price']    :=StrToFloat(sg_Item.Cells[2,i]);

        ExecSQL;
      end;

      for i:=1 to sg_Meal.RowCount-2 do
      begin
        temp_detailno := GetNo('DBMeirong','CustomerCostDetail','','','detail_no',temp,2);

        Close;
        SQL.Text :='insert into CustomerCostDetail(detail_no,cost_no,item_id,type_id,itemortype,emp_no,price) '+
                   ' values(:detailno,:costno,:itemid,:typeid,:itemortype,:empno,:price)';
        Parameters.ParamValues['detailno']:=temp_detailno;
        Parameters.ParamValues['costno']  :=temp_costno;
        Parameters.ParamValues['itemid']  :='';
        Parameters.ParamValues['typeid']  :=sg_Meal.Cells[0,i];
        Parameters.ParamValues['itemortype']  :='1';
        Parameters.ParamValues['empno']   :=sg_Meal.cells[3,i];
        Parameters.ParamValues['price']    :=StrToFloat(sg_Meal.Cells[2,i]);

        ExecSQL;
      end;
      //�ж��Ƿ��Զ������û��쿨����
      if trim(edt_CusNo1.Text)<>'0000000001' then
      begin
        Close;
        SQL.Text :='select total_cost,mincost from Customercard cc,membercardtype mct '+
                   ' where cc.card_type=mct.type_id and cus_no='+#39+trim(edt_CusNo1.Text)+#39;
        Open;
        if FieldByName('total_cost').AsFloat > FieldByName('mincost').AsFloat then
        begin
          temp_reminder:='�˿������Ѵ�'+FloatToStr(FieldByName('total_cost').AsFloat)+',�������ܸ�����Żݣ���Ҫϵͳ�Զ�������˿Ϳ�������';
          if MessageBox(self.handle,Pchar(temp_reminder),'ѯ��',mb_yesno+mb_iconquestion)=IDYES then
          begin
            temp_mincost:=FieldByName('mincost').AsFloat;
            Close;
            SQL.Text :='select type_id from membercardtype where mincost>'+#39+FloatToStr(temp_mincost)+#39+' order by orderby';
            Open;
            //���ǵõ�����mincost��¼������һ��
            if not eof then
            begin
               temp_typeid:=FieldByName('type_id').AsString;
               Close;
               SQL.Text :='update customercard set card_type='+#39+temp_typeid+#39;
               ExecSQL;
            end;
          end;
        end;
      end;
      
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;

      StringGridInsert(sg_CostList);
      with sg_CostList do
      begin
        cells[0,1]:=temp_costno;
        cells[1,1]:=edt_CusNo1.Text ;
        cells[2,1]:=edt_CusName.Text ;
        cells[3,1]:=edt_CostSum.Text ;
        cells[4,1]:=edt_DiscountSum.Text ;
        if radiogroup1.ItemIndex =0 then
        begin
          cells[5,1]:=edt_Payment.text;
          cells[6,1]:=edt_change.text;
        end else if radiogroup1.ItemIndex =1 then
        begin
          cells[5,1]:=edt_CardMoney.text;
          cells[6,1]:=edt_LatestMoney.text;
        end;
        cells[7,1]:=radiogroup1.Items[radiogroup1.ItemIndex];
      end;
      ClearCustomerCost;
      RefreshCustomerCost;
      if MessageBox(handle,'�Ƿ��ӡ�˿�����ƾ��?','ѯ��',mb_yesno+mb_iconquestion)=idyes then
        sbtn_printClick(nil);
    except
      dmod.ADOConn.RollbackTrans ;
    end;
  end;
end;

procedure Tfrm_frontcheck.edt_PaymentExit(Sender: TObject);
begin
  if edt_Payment.text='' then exit;
  edt_change.text:= FloatToStr(StrToFloat(edt_payment.text)-StrToFloat(edt_Discountsum.text));
end;

procedure Tfrm_frontcheck.edt_PaymentKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then edt_change.setfocus;
end;

procedure Tfrm_frontcheck.edt_changeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then sbtn_saveClick(nil);
end;

procedure Tfrm_frontcheck.SpeedButton9Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_frontcheck.sbtn_addEmp1Click(Sender: TObject);
begin
  DoChooseEmployee('0');
end;

procedure Tfrm_frontcheck.sbtn_addEmp2Click(Sender: TObject);
begin
  DoChooseEmployee('0');
end;

procedure Tfrm_frontcheck.sbtn_OtherClick(Sender: TObject);
begin
  //ɢ�����ù˿ͱ�� 
  edt_CusNo1.Text :='0000000001';
  edt_CusName.Text :='ɢ��';
  edt_CusType.Text :='��';
  edt_Discount.Text :='100';
end;

procedure Tfrm_frontcheck.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex =0 then
  begin
    pnlCash.Visible :=true;
    pnlCard.Visible :=false;
  end else begin
    if (edt_CusNo1.Text ='') then
    begin
      MessageBox(handle,'�޷�ѡ����������ͻ����','��ʾ',mb_ok+mb_iconinformation);
      radiogroup1.ItemIndex :=0;
      RadioGroup1Click(nil);
      exit;
    end;

    if (edt_CusNo1.Text ='0000000001') or (edt_CusName.Text ='ɢ��') then
    begin
      MessageBox(handle,'ɢ���޷��ù˿Ϳ���������','��ʾ',mb_ok+mb_iconinformation);
      radiogroup1.ItemIndex :=0;
      RadioGroup1Click(nil);
      exit;
    end;

    if edt_CostSum.Text ='' then
    begin
      MessageBox(handle,'��ǰû�з������ѣ��޷�����','��ʾ',mb_ok+mb_iconinformation);
      radiogroup1.ItemIndex :=0;
      RadioGroup1Click(nil);
      exit;
    end;
    
    pnlCash.Visible :=false;
    pnlCard.Visible :=true;
    
    edt_CardMoney.Text := edt_Curcurrency.Text ;
    edt_CostMoney.Text := edt_DiscountSum.Text ;
    edt_LatestMoney.Text := FloatToStr(StrToFloat(edt_Curcurrency.Text)-StrToFloat(edt_DiscountSum.Text));
  end;
end;

procedure Tfrm_frontcheck.sbtn_CardClick(Sender: TObject);
begin
  DoCardManager;
end;

procedure Tfrm_frontcheck.sbtn_AttendClick(Sender: TObject);
begin
  DoNormalAttend;
end;

procedure Tfrm_frontcheck.SpeedButton2Click(Sender: TObject);
begin
  DoChooseCustomer;
end;

procedure Tfrm_frontcheck.sbtn_printClick(Sender: TObject);
begin
  DoReportReceipt;
end;

end.
