unit Unit_Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids;

type
  Tfrm_customer = class(TForm)
    pnlTop: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_append: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_print: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_delete: TSpeedButton;
    PageControl1: TPageControl;
    sht_main: TTabSheet;
    sht_content: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edt_Cusno: TEdit;
    edt_Cusname: TEdit;
    edt_Phone: TEdit;
    edt_Mobile: TEdit;
    mm_Remark: TMemo;
    cbb_Sex: TComboBox;
    Label4: TLabel;
    edt_zipcode: TEdit;
    Label5: TLabel;
    cbb_Type: TComboBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    edt_Address: TEdit;
    edt_Email: TEdit;
    edt_Oicq: TEdit;
    edt_Homepage: TEdit;
    edt_Msn: TEdit;
    RadioGroup1: TRadioGroup;
    sbtn_AddCusType: TSpeedButton;
    Label3: TLabel;
    dtp_Register: TDateTimePicker;
    sg: TStringGrid;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure cbb_TypeEnter(Sender: TObject);
    procedure sbtn_AddCusTypeClick(Sender: TObject);
    procedure sgSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sht_contentShow(Sender: TObject);
    procedure sht_mainShow(Sender: TObject);
    procedure sgDblClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    PageIndex : integer;
    AppendOrEdit,DoChange : boolean;
    Cusno : string;
    
    procedure ClearInfo();
    procedure SearchInfo();
    function  SaveInfo():boolean;
    procedure GetInfo();
    procedure MakeEnabled(temp:boolean);
  public
    { Public declarations }
    procedure ref();
  end;

var
  frm_customer: Tfrm_customer;

implementation
   uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;

{$R *.dfm}
{********************************客户操作过程****************************}
procedure Tfrm_customer.ref ();
begin
  pagecontrol1.ActivePage := sht_main;
  with sg do
  begin
    sg.Cells[0,0] := '顾客编号';
    sg.Cells[1,0] := '顾客名称';
    sg.Cells[2,0] := '性别';
    sg.Cells[3,0] := '顾客类别';
    sg.Cells[4,0] := '注册日期';
  end;
  formresize(nil);
  SearchInfo;   

  sbtn_append.Enabled := GetPower(SysUserId,'客户信息','修改权');
  sbtn_edit.Enabled := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled;
  sbtn_print.Enabled := GetPower(SysUserId,'客户信息','打印权');
  
end;

procedure Tfrm_customer.SearchInfo();
var
  i : integer;
begin
  StringGridClear(sg);
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select cus_no,cus_name,cus_sex,cus_type,cus_register from customer ' +
                'order by cus_register desc,cus_no';
    Open;
    i:=1;
    while not eof do
    begin
      sg.Cells[0,i] := FieldByName('cus_no').AsString ;
      sg.Cells[1,i] := FieldByName('cus_name').AsString ;
      sg.Cells[2,i] := FieldByName('cus_sex').AsString ;
      sg.Cells[3,i] := FieldByName('cus_type').AsString ;
      sg.Cells[4,i] := DateToString(FieldByName('cus_register').AsDateTime) ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_customer.GetInfo ();
begin
  if sg.Cells[0,sg.row]='' then exit;
  Cusno := sg.Cells[0,sg.Row];
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select * from Customer where cus_no='+#39+Cusno+#39;
    open;

    edt_Cusno.Text    := Cusno;
    edt_Cusname.Text  := FieldByName('Cus_name').AsString ;
    cbb_Sex.Text      := FieldByName('Cus_sex').AsString ;
    cbb_type.Text     := FieldByName('Cus_type').AsString ;
    edt_Phone.Text    := FieldByName('Cus_phone').AsString ;
    edt_Mobile.Text   := FieldByName('Cus_mobile').AsString ;
    edt_Email.Text    := FieldByName('Cus_email').AsString ;
    edt_HomePage.Text := FieldByName('Cus_homepage').AsString ;
    edt_Oicq.Text     := FieldByName('Cus_oicq').AsString ;
    edt_Msn.Text      := FieldByName('Cus_msn').AsString ;
    edt_Address.Text  := FieldByName('Cus_address').AsString ;
    edt_Zipcode.Text  := FieldByName('Cus_zipcode').AsString ;
    dtp_Register.Date := FieldByname('cus_register').AsDateTime ;
    mm_Remark.Text    := FieldByName('Cus_remark').AsString ;
    RadioGroup1.ItemIndex := StrToInt(FieldByName('cus_security').AsString);
  end;
end;

function Tfrm_customer.SaveInfo ():boolean;
var
  temp_type:string;
begin
  result := true;
  DoChange := true;
  //to determine if the following two fields are filled or not
  if trim(edt_Cusno.Text)='' then
  begin
    MessageBox(handle,'请输入客户编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Cusno.SetFocus ;
    exit;
  end;
  if trim(edt_Cusname.Text)='' then
  begin
    MessageBox(handle,'请输入客户姓名!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Cusname.SetFocus ;
    exit;
  end;
  //to determine whether the employee has existed or not
  Cusno := trim(edt_Cusno.Text );
  if AppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select cus_no from customer where Cus_no=:no';
    Parameters.ParamValues['no'] := Cusno;
    open;
    if not eof then
    begin
      MessageBox(self.Handle ,'该客户编号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_Cusno.SetFocus ;
      result := false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select Cus_no from Customer where Cus_name=:name';
    Parameters.ParamValues['name'] := trim(edt_Cusname.Text);
    open;
    if not eof then
    if FieldByName('Cus_no').AsString <> Cusno then
    begin
      MessageBox(self.Handle ,'该客户姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_Cusname.SetFocus ;
      result := false;
      exit;
    end;
  end;
  //try to save the information
  temp_type:=trim(cbb_type.Text);
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from Customer where Cus_no='+#39+Cusno+#39;
      ExecSQL;

      close;
//      SQL.Text := 'insert into Customer(cus_no,cus_name,cus_sex,cus_type,cus_phone,cus_mobile,cus_email,cus_homepage' +
//                  ',cus_oicq,cus_msn,cus_register,cus_address,cus_zipcode,cus_remark,cus_security) '+
//                  'values (:no,:name,:sex,:type,:phone,:mobile,:email,:homepage' +
//                  ',:oicq,:msn,:register,:address,:zipcode,:remark,:security)';
        SQL.Clear ;
        SQL.Add('insert into Customer(cus_no,cus_name,cus_sex,cus_type,cus_phone,cus_mobile,cus_email,cus_homepage') ;
        SQL.Add(',cus_oicq,cus_msn,cus_register,cus_address,cus_zipcode,cus_remark,cus_security) ') ;
        SQL.Add('values (:no,:name,:sex,:type,:phone,:mobile,:email,:homepage') ;
        SQL.Add(',:oicq,:msn,') ;
        SQL.Add( '''' + datetostr(dtp_register.Date) + ''',' ) ;
        SQL.Add( ':address,:zipcode,:remark,:security)') ;
      Parameters.ParamValues['no']   := trim(edt_Cusno.Text);
      Parameters.ParamValues['name'] := trim(edt_Cusname.Text );
      Parameters.ParamValues['sex']  := trim(cbb_Sex.Text );
      Parameters.ParamValues['type']  :=  StringGetChar(temp_type,'-') ;
      Parameters.ParamValues['phone']:= trim(edt_Phone.Text );
      Parameters.ParamValues['mobile'] := trim(edt_mobile.Text );
      Parameters.ParamValues['email']:= trim(edt_Email.Text );
      Parameters.ParamValues['Homepage'] := trim(edt_Homepage.Text );
      Parameters.ParamValues['oicq']:= trim(edt_Oicq.Text );
      Parameters.ParamValues['msn'] := trim(edt_Msn.Text );
//      Parameters.ParamValues['register']  := dtp_register.Date  ;
      Parameters.ParamValues['address'] := trim(edt_Address.Text );
      Parameters.ParamValues['zipcode'] := trim(edt_Zipcode.Text );
      Parameters.ParamValues['remark'] :=  mm_remark.Text ;
      Parameters.ParamValues['security']  :=  RadioGroup1.ItemIndex ;
      ExecSQL;
    end;
  finally
    try
       dmod.ADOConn.CommitTrans ;
    except
       dmod.ADOConn.RollbackTrans ;
       MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
       result := false;
    end;
  end;
end;

//to clear information
procedure Tfrm_customer.ClearInfo();
begin
  edt_Cusno.Text := '';
  edt_Cusname.Text := '';
  cbb_sex.Text := '';
  cbb_type.Text := '';
  edt_phone.Text := '';
  edt_mobile.Text := '';
  edt_email.Text := '';
  edt_homepage.Text := '';
  edt_oicq.Text := '';
  edt_msn.Text := '';
  edt_address.Text := '';
  edt_zipcode.Text := '';
  dtp_register.Date := Date;

  edt_cusno.SetFocus ;
end;

procedure Tfrm_customer.MakeEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
      sbtn_save.Enabled := temp
   else
      sbtn_save.Enabled := false;
   sbtn_delete.Enabled := false;

   edt_Cusno.Enabled   := temp;
   edt_Cusname.Enabled := temp;
   cbb_Sex.Enabled     := temp;
   cbb_Type.Enabled    := temp;
   edt_Phone.Enabled   := temp;
   edt_Mobile.Enabled  := temp;
   edt_Email.Enabled   := temp;
   edt_Homepage.Enabled:= temp;
   edt_Oicq.Enabled    := temp;
   edt_Msn.Enabled     := temp;
   dtp_Register.Enabled:= temp;
   edt_Address.Enabled := temp;
   edt_Zipcode.Enabled := temp;
   mm_Remark.Enabled   := temp;
   if temp then edt_Cusno.SetFocus;

end;
{********************************客户操作过程****************************}

procedure Tfrm_customer.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_customer.FormResize(Sender: TObject);
begin
  StringGridAutoSize(sg);
end;

procedure Tfrm_customer.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  if PageControl1.ActivePage = sht_content then
  if sbtn_append.Enabled then
  begin
    if edt_CusNo.enabled then
    begin
      i:=MessageBox(handle,'在窗口关闭的同时,您要保存操作的数据吗?','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then    //点击是
      begin
        if SaveInfo then i:=7 else i:=2;
      end;
      if i=2 then          //点击取消
      begin
        action:=canone;   
        exit;
      end;
    end;
  end;
  action:= cafree;
  frm_customer := nil;
end;

procedure Tfrm_customer.sbtn_appendClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if pagecontrol1.ActivePage = sht_content then  //to determine whethter sht_content is shown
  if (not AppendOrEdit) and edt_Cusno.Enabled then  //to determine status of Edit and Components' Enabled
  begin
    i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
    if i=6 then //select yes
    if not SaveInfo then i:=2;
    if i=2 then exit;
  end;

  AppendOrEdit := true;   //to set AppendOrEdit to status of Append
  pagecontrol1.ActivePage := sht_content; //to change page to content
  MakeEnabled(true);      //to determine button's status
  ClearInfo;              //to clear information of components
  temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
  temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
  edt_Cusno.Text :=GetNo('DBMeirong','Customer','','','Cus_no',temp,2); //to set value of Empno like '2003101301'
end;

procedure Tfrm_customer.sbtn_editClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
   if AppendOrEdit and edt_Cusno.Enabled then
   begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveInfo then i:=2;
     if i=2 then exit;
   end;
   if sg.Cells[0,sg.Row]='' then exit;
   if pagecontrol1.ActivePage <> sht_content then pagecontrol1.ActivePage := sht_content;
   if AppendOrEdit then GetInfo;
   AppendOrEdit := false;
   MakeEnabled(true);
   edt_Cusno.Enabled := false;
end;

procedure Tfrm_customer.sbtn_saveClick(Sender: TObject);
var
  i:integer;
  temp:string;
begin
  if not SaveInfo then exit;

  if AppendOrEdit then
  begin
    StringGridInsert(sg);
    i:=1;
  end else i:=sg.Row ;

  with sg do
  begin
    sg.Cells[0,i] := trim(edt_Cusno.Text );
    sg.Cells[1,i] := trim(edt_Cusname.Text );
    sg.Cells[2,i] := trim(cbb_Sex.Text );
    sg.Cells[3,i] := trim(cbb_type.Text);
    sg.Cells[4,i] := DateToStr(dtp_register.Date);
  end;

  if AppendOrEdit then
  begin
    ClearInfo;
    temp := GetDateString('DBMeirong');
    temp := copy(temp,1,4) + copy(temp,6,2) + copy(temp,9,2);
    edt_Cusno.Text := GetNo('DBMeirong','Customer','','','Cus_no',temp,2);
    if sg.RowCount > 3 then sbtn_back.Enabled := true;
  end else MakeEnabled(false);
end;

procedure Tfrm_customer.sbtn_deleteClick(Sender: TObject);
begin
  if sg.cells[0,sg.Row]='' then exit;
  if MessageBox(handle,'你确定要删除该员工信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'delete from Customer where cus_no='+#39+sg.Cells[0,sg.Row]+#39;
    ExecSQL;
  end;
  StringGridDelete(sg,sg.Row);
  if sg.Row = sg.RowCount - 1 then
  begin
    if sg.RowCount > 2 then
      sg.Row := sg.Row - 1
    else
      sbtn_back.Enabled := false;
  end;
  if sg.Row = 1 then sbtn_front.Enabled := false;
  if sg.Row = sg.RowCount - 2 then sbtn_back.Enabled := false;
end;

procedure Tfrm_customer.sbtn_backClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_Cusno.Enabled  then
  if sbtn_append.Enabled  then
  begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then  //select yes
     if not SaveInfo then i:=2; //if save error
     if i=2 then exit;
  end;
  if sg.Row > sg.RowCount-2 then
  begin
     sbtn_back.Enabled := false;
     exit;
  end;
  sbtn_front.Enabled := true;
  sg.Row := sg.Row+1;
  if pagecontrol1.ActivePage = sht_content then
  begin
     GetInfo();
     MakeEnabled(false);
  end;
end;

procedure Tfrm_customer.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_Cusno.Enabled then
  if sbtn_append.Enabled then
  begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveInfo then i:=2;
     if i=2 then exit;
  end;

  if sg.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg.Row := sg.Row-1;

  if pagecontrol1.ActivePage = sht_content then
  begin
    GetInfo();
    MakeEnabled(false);
  end;
end;

procedure Tfrm_customer.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
   i:integer;
begin
  AllowChange := true;
  if not sbtn_append.Enabled then exit;
  if PageIndex=1 then
  begin
    if edt_Cusno.Enabled then
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
  end else if (sg.Cells [0,sg.Row]='') and not AppendOrEdit then AllowChange:=true;
end;

procedure Tfrm_customer.cbb_TypeEnter(Sender: TObject);
begin
  cbb_type.Clear ;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select type_id,type_name from CustomerType order by type_id';
    Open;
    while not eof do
    begin
      cbb_type.Items.Add(FieldByName('type_id').AsString+'-'+FieldByName('type_name').AsString ); 
      next;
    end;
  end;
end;

procedure Tfrm_customer.sbtn_AddCusTypeClick(Sender: TObject);
begin
  DoDictionary;
end;

procedure Tfrm_customer.sgSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
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

procedure Tfrm_customer.FormKeyPress(Sender: TObject; var Key: Char);
var
   temp,temp1:boolean;
begin
   temp := false;
   temp1:= true;

   if (key=#13) and sbtn_save.Enabled then
   begin
     temp := true;
     if (ActiveControl is TMemo) then
     if TMemo(ActiveControl).Name = 'mm_Remark' then temp1:=false;
   end;

   if temp then
   begin
     if temp1 then
     begin
       key:=#0;
       perform(WM_NEXTDLGCTL,0,0)
     end else if sbtn_save.Enabled then sbtn_saveClick(nil);
   end;
end;

procedure Tfrm_customer.sht_contentShow(Sender: TObject);
begin
  PageIndex := 1;
  if not AppendOrEdit then
  begin
    if sg.Cells[0,sg.Row]<>'' then GetInfo;
    MakeEnabled(false);
  end;
end;

procedure Tfrm_customer.sht_mainShow(Sender: TObject);
begin
  PageIndex:=0;
  if not sbtn_append.Enabled then exit;
  sbtn_delete.Enabled := true;
  sbtn_save.Enabled := false;
end;

procedure Tfrm_customer.sgDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_customer.sbtn_printClick(Sender: TObject);
begin
  DoReportCustomer;
end;

end.
