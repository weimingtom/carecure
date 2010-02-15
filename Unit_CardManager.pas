unit Unit_CardManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids;

type
  Tfrm_cardmanager = class(TForm)
    PageControl1: TPageControl;
    sht_currency: TTabSheet;
    sht_password: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edt_CusNo1: TEdit;
    edt_CardNo1: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edt_CardType1: TEdit;
    edt_Curcurrency1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_LastCurrency1: TEdit;
    Label7: TLabel;
    edt_CurrencyAdded: TEdit;
    Label8: TLabel;
    dtp_ThisTime: TDateTimePicker;
    Label9: TLabel;
    edt_CostScore1: TEdit;
    Label10: TLabel;
    edt_StoreCurrency1: TEdit;
    RadioGroup1: TRadioGroup;
    Label11: TLabel;
    edt_WarningCurrency1: TEdit;
    Label12: TLabel;
    edt_Empno: TEdit;
    sbtn_Search1: TSpeedButton;
    sbtn_save2: TSpeedButton;
    sbtn_close2: TSpeedButton;
    Label15: TLabel;
    edt_OldPassword: TEdit;
    Label16: TLabel;
    edt_NewPassword1: TEdit;
    Label17: TLabel;
    edt_NewPassword2: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edt_CardNo2: TEdit;
    edt_CusNo2: TEdit;
    SpeedButton6: TSpeedButton;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edt_CardType2: TEdit;
    edt_Curcurrency2: TEdit;
    dtp_LastTime2: TDateTimePicker;
    edt_LastCurrency2: TEdit;
    edt_CostScore2: TEdit;
    edt_StoreCurrency2: TEdit;
    edt_WarningCurrency2: TEdit;
    dtp_LastTime1: TDateTimePicker;
    Panel1: TPanel;
    sbtn_save1: TSpeedButton;
    sbtn_close1: TSpeedButton;
    Label25: TLabel;
    edt_Score: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_close1Click(Sender: TObject);
    procedure sbtn_close2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure sbtn_Search1Click(Sender: TObject);
    procedure sbtn_save1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure edt_OldPasswordExit(Sender: TObject);
    procedure sbtn_save2Click(Sender: TObject);
    procedure edt_CurrencyAddedExit(Sender: TObject);
  private
    { Private declarations }
    IsChecked,IsSamePassword:boolean;
    
    procedure SearchCustomerCardInfo(isCurrency:boolean);
    function  SaveCustomerCardChangeInfo:boolean;
    function  SaveCustomerCardPasswordInfo:boolean;
    procedure ClearCustomerCardChangeInfo;
    procedure ClearCustomerCardPasswordInfo;
  public
    { Public declarations }
    procedure cardmanager_ref;
  end;

var
  frm_cardmanager: Tfrm_cardmanager;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{**********************************************}
procedure Tfrm_cardmanager.cardmanager_ref ;
begin
  pagecontrol1.ActivePage := sht_currency;
  sbtn_save1.Enabled := GetPower(SysUserId,'顾客卡管理','修改权');
  sbtn_save2.Enabled := sbtn_save1.Enabled;
  edt_Empno.Text := SysUserId;
end;

procedure Tfrm_cardmanager.SearchCustomerCardInfo(isCurrency:boolean) ;
var
  temp_str:string;
begin
  if isCurrency then
    if radiogroup1.ItemIndex =0 then
      temp_str:='select cus_no,card_no,type_name,cost_score,warning_currency,store_currency,last_time,last_currency,cur_currency '+
              ' from CustomerCard,MemberCardType where CustomerCard.card_type=MemberCardType.type_id and cus_no='+
              #39+trim(edt_CusNo1.Text)+#39
    else
      temp_str:='select cus_no,card_no,type_name,cost_score,warning_currency,store_currency,last_time,last_currency,cur_currency '+
              ' from CustomerCard,MemberCardType where CustomerCard.card_type=MemberCardType.type_id and card_no='+
              #39+trim(edt_CardNo2.Text)+#39
  else
    if radiogroup2.ItemIndex =0 then
      temp_str:='select cus_no,card_no,type_name,cost_score,warning_currency,store_currency,last_time,last_currency,cur_currency '+
              ' from CustomerCard,MemberCardType where CustomerCard.card_type=MemberCardType.type_id and cus_no='+
              #39+trim(edt_CusNo2.Text)+#39
    else
      temp_str:='select cus_no,card_no,type_name,cost_score,warning_currency,store_currency,last_time,last_currency,cur_currency '+
              ' from CustomerCard,MemberCardType where CustomerCard.card_type=MemberCardType.type_id and card_no='+
              #39+trim(edt_CardNo2.Text)+#39;
              
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := temp_str;
    Open;
    if not eof then
    begin
      if isCurrency then
      begin
        if radiogroup1.ItemIndex =0 then
           edt_cardno1.Text := FieldByName('card_no').AsString
        else
           edt_cusno1.Text  := FieldByName('cus_no').AsString ;

        edt_CardType1.Text := FieldByName('type_name').AsString ;
        edt_CostScore1.Text:= FieldByName('cost_score').AsString ;
        edt_WarningCurrency1.Text := FieldByName('warning_currency').AsString ;
        edt_StoreCurrency1.Text := FieldByName('store_currency').AsString ;
        dtp_LastTime1.Date  := FieldByName('last_time').AsDateTime ;
        edt_LastCurrency1.Text := FieldByName('last_currency').AsString ;
        edt_Curcurrency1.Text := FieldByName('cur_currency').AsString ;
      end else begin
        if radiogroup2.ItemIndex =0 then
           edt_cardno2.Text := FieldByName('card_no').AsString
        else
           edt_cusno2.Text  := FieldByName('cus_no').AsString ;

        edt_CardType2.Text := FieldByName('type_name').AsString ;
        edt_CostScore2.Text:= FieldByName('cost_score').AsString ;
        edt_WarningCurrency2.Text := FieldByName('warning_currency').AsString ;
        edt_StoreCurrency2.Text := FieldByName('store_currency').AsString ;
        dtp_LastTime2.Date  := FieldByName('last_time').AsDateTime ;
        edt_LastCurrency2.Text := FieldByName('last_currency').AsString ;
        edt_Curcurrency2.Text := FieldByName('cur_currency').AsString ;
      end;
   end else
      MessageBox(self.handle,'没有找到相符合的客户卡号记录，请重试!','提示',mb_ok+mb_iconinformation);
  end;
end;

function Tfrm_cardmanager.SaveCustomerCardChangeInfo:boolean ;
var
  temp_changeno:string;
begin
  result:=true;

  if edt_CardNo1.Text = '' then
  begin
    MessageBox(handle,'顾客卡号不能为空，请重试!','提示',mb_ok+mb_iconinformation);
    result:=false;
    exit;
  end;

  if edt_CurrencyAdded.text='' then
  begin
    MessageBox(handle,'请输入你要充值的金额!','提示',mb_ok+mb_iconinformation);
    result:=false;
    exit;
  end;

  temp_changeno:=GetDateString('DBMeirong');
  temp_changeno:=copy(temp_changeno,1,4)+copy(temp_changeno,6,2)+copy(temp_changeno,9,2);
  temp_changeno:=GetNo('DBMeirong','CustomerCardCurrencyChange','','','change_no',temp_changeno,2);
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text :='update CustomerCard set last_time='+#39+DateToStr(dtp_ThisTime.DateTime)+#39+
                ',last_currency='+#39+trim(edt_CurrencyAdded.Text)+#39+
                ',cur_currency=cur_currency+'+#39+trim(edt_CurrencyAdded.Text)+#39+
                ',cost_score=cost_score+'+#39+trim(edt_score.Text)+#39+
                ' where card_no='+#39+trim(edt_CardNo1.Text)+#39;
      ExecSQL;

      close;
      SQL.Text :='insert into CustomerCardCurrencyChange(change_no,card_no,cus_no,emp_no,change_date,last_currency,currency_added,total_currency,add_or_reduced) '+
                'values(:changeno,:cardno,:cusno,:empno,:changedate,:lastcurrency,:currencyadded,:totalcurrency,:addorreduced)';
      Parameters.ParamValues['changeno'] :=temp_changeno;
      Parameters.ParamValues['cardno'] := trim(edt_Cardno1.Text);
      Parameters.ParamValues['cusno']  := trim(edt_Cusno1.Text );
      Parameters.ParamValues['empno']  := trim(edt_Empno.Text );
      Parameters.ParamValues['changedate']:=dtp_ThisTime.Date ;
      Parameters.ParamValues['lastcurrency']:=StrToFloat(trim(edt_curcurrency1.Text));
      Parameters.ParamValues['currencyadded']:=StrToFloat(trim(edt_currencyadded.Text ));
      Parameters.ParamValues['totalcurrency']:=StrToFloat(trim(edt_curcurrency1.Text))+StrToFloat(trim(edt_currencyadded.Text) );
      Parameters.ParamValues['addorreduced']:='0';
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      MessageBox(handle,'顾客卡充值完成!','提示',mb_ok+mb_iconinformation);
    except
      dmod.ADOConn.RollbackTrans ;
      result:=false;
      Messagebox(handle,'顾客卡充值失败，请重试!','提示',mb_ok+mb_iconinformation);
    end;
  end;
end;

procedure Tfrm_cardmanager.ClearCustomerCardChangeInfo ;
begin
  edt_CusNo1.Text :='';
  edt_CardNo1.Text :='';
  edt_CardType1.Text :='';
  edt_CostScore1.Text :='';
  edt_WarningCurrency1.Text :='';
  edt_StoreCurrency1.Text :='';
  edt_LastCurrency1.Text :='';
  edt_Curcurrency1.Text :='';
  edt_CurrencyAdded.Text :='';
  edt_Score.Text :='';
end;

function Tfrm_cardmanager.SaveCustomerCardPasswordInfo ;
begin
  result:=true;
  
  IsSamePassword:=true;

  if Trim(edt_CardNo2.Text)='' then
  begin
    Messagebox(handle,'顾客卡号不能为空，请重试!','提示',mb_ok+mb_iconinformation);
    edt_CardNo2.SetFocus ;
    exit;
  end;

  if (edt_NewPassword1.Text <> '') or (edt_NewPassword2.Text <> '') then
  if edt_NewPassword2.Text <> edt_NewPassword1.Text then
  begin
    Messagebox(handle,'两次输入的新密码不一样，请重试!','提示',mb_ok+mb_iconinformation);
    edt_NewPassword1.SetFocus ;
    IsSamePassword:=false;
  end;

  if IsSamePassword and IsChecked then
  begin
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text :='update CustomerCard set password='+#39+trim(edt_NewPassword1.Text)+#39+
                 ' where card_no='+#39+trim(edt_CardNo2.Text)+#39;
      ExecSQL;
      MessageBox(self.handle,'密码更新成功!','提示',mb_ok+mb_iconinformation);
    end;
  end else
  begin
     MessageBox(handle,'密码更新时出错，请重试!','提示',mb_ok+mb_iconinformation);
     result:=false;
  end;
end;

procedure Tfrm_cardmanager.ClearCustomerCardPasswordInfo ;
begin
  edt_CusNo2.Text :='';
  edt_CardNo2.Text :='';
  edt_CardType2.Text :='';
  edt_CostScore2.Text :='';
  edt_WarningCurrency2.Text :='';
  edt_StoreCurrency2.Text :='';
  edt_LastCurrency2.Text :='';
  edt_Curcurrency2.Text :='';
  edt_OldPassword.Text  :='';
  edt_NewPassword1.Text :='';
  edt_NewPassword2.Text :='';
end;
{**********************************************}
procedure Tfrm_cardmanager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_cardmanager:=nil;
end;

procedure Tfrm_cardmanager.sbtn_close1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cardmanager.sbtn_close2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cardmanager.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex =0 then
  begin
    edt_CusNo1.Color := clWindow;
    edt_CusNo1.ReadOnly := false;
    edt_CardNo1.Color := $00D5F0F1;
    edt_CardNo1.ReadOnly :=true;
  end else begin
    edt_CardNo1.Color := clWindow;
    edt_CardNo1.ReadOnly :=false;
    edt_CusNo1.Color := $00D5F0F1;
    edt_CusNo1.ReadOnly := true;
  end;
end;

procedure Tfrm_cardmanager.sbtn_Search1Click(Sender: TObject);
begin
  SearchCustomerCardInfo(true);
end;

procedure Tfrm_cardmanager.sbtn_save1Click(Sender: TObject);
begin
  if SaveCustomerCardChangeInfo then
     ClearCustomerCardChangeInfo;
end;

procedure Tfrm_cardmanager.RadioGroup2Click(Sender: TObject);
begin
  if radiogroup2.ItemIndex =0 then
  begin
    edt_CusNo2.Color := clWindow;
    edt_CusNo2.ReadOnly := false;
    edt_CardNo2.Color := $00D5F0F1;
    edt_CardNo2.ReadOnly :=true;
  end else begin
    edt_CardNo2.Color := clWindow;
    edt_CardNo2.ReadOnly :=false;
    edt_CusNo2.Color := $00D5F0F1;
    edt_CusNo2.ReadOnly := true;
  end;
end;

procedure Tfrm_cardmanager.SpeedButton6Click(Sender: TObject);
begin
  SearchCustomerCardInfo(false);
end;

procedure Tfrm_cardmanager.edt_OldPasswordExit(Sender: TObject);
var
  temp_password:string;
begin
  isChecked:=true;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select password from customercard where card_no='+#39+trim(edt_CardNo2.Text)+#39;
    Open;
    if not eof then
       temp_password:=FieldByname('password').AsString ;
  end;
  if temp_password<>trim(edt_OldPassword.Text) then
  begin
    MessageBox(handle,'输入的密码错误，请重试!','提示',mb_ok+mb_iconinformation);
    edt_OldPassword.SetFocus ;
    isChecked:=false;
  end;
end;

procedure Tfrm_cardmanager.sbtn_save2Click(Sender: TObject);
begin
  if SaveCustomerCardPasswordInfo then
    ClearCustomerCardPasswordInfo;
end;

procedure Tfrm_cardmanager.edt_CurrencyAddedExit(Sender: TObject);
begin
  try
    edt_Score.Text := FloatToStr(StrToFloat(edt_CurrencyAdded.Text)*0.1);
  except
    MessageBox(handle,'输入的充值金额不合法，请重试!','提示',mb_ok+mb_iconinformation);
  end;
end;

end.
