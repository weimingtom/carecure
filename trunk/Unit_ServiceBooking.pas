unit Unit_ServiceBooking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids;

type
  Tfrm_servicebooking = class(TForm)
    PageControl1: TPageControl;
    sht_List: TTabSheet;
    sht_Content: TTabSheet;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_append: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_print: TSpeedButton;
    sbtn_close: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_CusNo: TEdit;
    dtp_BookingDate: TDateTimePicker;
    cbb_StartTime: TComboBox;
    edt_EmpName: TEdit;
    Label8: TLabel;
    mm_BookingContent: TMemo;
    Label7: TLabel;
    mm_BookingRemark: TMemo;
    sg_Booking: TStringGrid;
    Label11: TLabel;
    edt_BookingNo: TEdit;
    Label17: TLabel;
    edt_Contact: TEdit;
    cbb_EmpNo: TComboBox;
    cbb_CusName: TComboBox;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbb_EmpNoExit(Sender: TObject);
    procedure edt_CusNoExit(Sender: TObject);
    procedure sg_BookingSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sht_ContentShow(Sender: TObject);
    procedure sht_ListShow(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    PageIndex:integer;
    AppendOrEdit,DoChange : boolean;
    BookingNo : string;

    procedure GetBookingInfo;
    procedure SearchBookingInfo;
    function  SaveBookingInfo:boolean;
    procedure ClearBookingInfo;
    procedure MakeEnabled(temp:boolean);
    procedure GetEmpNoList;
    procedure GetCusNameList;
  public
    { Public declarations }
    procedure ServiceBooking_ref;
  end;

var
  frm_servicebooking: Tfrm_servicebooking;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;

{$R *.dfm}

{********************************************}
procedure Tfrm_servicebooking.ServiceBooking_ref ;
begin
  pagecontrol1.ActivePage := sht_List ;
  
  with sg_Booking do
  begin
    cells[0,0]:='预约编号';
    cells[1,0]:='客户姓名';
    cells[2,0]:='预约日期';
    cells[3,0]:='员工编号';
    cells[4,0]:='员工姓名';
    cells[5,0]:='预约内容';
  end;
  
  SearchBookingInfo;
  GetEmpNoList;
  GetCusNameList;
  formresize(nil);

  sbtn_append.Enabled := GetPower(SysUserId,'顾客预约服务','修改权');
  sbtn_edit.Enabled := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled ;
  sbtn_print.Enabled := GetPower(SysUserId,'顾客预约服务','打印权');
end;
procedure Tfrm_servicebooking.GetBookingInfo ;
begin
  if sg_booking.Cells[0,sg_booking.Row]='' then exit;
  BookingNo:=sg_booking.cells[0,sg_booking.row];

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select booking_no,cus_name,booking_date,start_time,contact,emp_no,emp_name,booking_content,'+
                'booking_remark from customerservicebooking where booking_no='+#39+BookingNo+#39;
    Open;
    if not eof then
    begin
      edt_bookingno.Text := FieldbyName('booking_no').AsString ;
      //edt_CusNo.Text     := FieldbyName('cus_no').AsString ;
      cbb_CusName.Text := FieldbyName('cus_name').AsString ;
      dtp_bookingdate.date := FieldbyName('booking_date').AsDateTime ;
      cbb_starttime.Text := FieldbyName('start_time').AsString ;
      edt_contact.Text   := FieldbyName('contact').AsString ;
      cbb_empno.Text     := FieldbyName('emp_no').AsString ;
      edt_empname.Text := FieldbyName('emp_name').AsString ;
      mm_bookingcontent.Text := FieldByName('booking_content').AsString ;
      mm_bookingremark.Text  := FieldByname('booking_remark').AsString ;
      //edt_CusType.Text := FieldByName('ctypename').AsString ;
      //edt_TotalCost.Text := FloatToStr(FieldByName('total_cost').AsFloat );
      //edt_CostScore.Text := FloatToStr(FieldByName('cost_score').AsFloat );
      //edt_EmpType.Text   := FieldByName('etypename').AsString ;
      //edt_EmpSex.Text    := FieldBYname('emp_sex').AsString ;
      //mm_EmpRemark.Text  := FieldByName('emp_remark').AsString ;
    end;

  end;
end;

procedure Tfrm_servicebooking.ClearBookingInfo ();
begin
  edt_BookingNo.Text := '';
  //edt_CusNo.Text    := '';
  cbb_CusName.Text  := '';
  dtp_BookingDate.Date := Date;
  cbb_StartTime.text:= '';
  edt_Contact.Text  := '';
  cbb_Empno.Text    := '';
  edt_Empname.Text  := '';
  mm_BookingContent.Text :='';
  mm_BookingRemark.Text  :='';
  //edt_Custype.Text  := '';
  //edt_TotalCost.Text:= '';
  //edt_Costscore.Text:= '';
  //edt_EmpSex.Text   := '';
  //edt_EmpType.Text  := '';
  //mm_EmpRemark.Text := '';

  edt_Bookingno.SetFocus ;
end;

procedure Tfrm_servicebooking.MakeEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
      sbtn_save.Enabled := temp
   else
      sbtn_save.Enabled := false;
   sbtn_delete.Enabled := false;

   edt_BookingNo.Enabled := temp;
   //edt_CusNo.Enabled    := temp;
   cbb_CusName.Enabled  := temp;
   dtp_BookingDate.Enabled := temp;
   cbb_StartTime.Enabled:= temp;
   edt_Contact.Enabled  := temp;
   cbb_Empno.Enabled    := temp;
   edt_Empname.Enabled  := temp;
   mm_BookingContent.Enabled :=temp;
   mm_BookingRemark.Enabled  :=temp;
   //edt_Custype.Enabled  := temp;
   //edt_TotalCost.Enabled:= temp;
   //edt_Costscore.Enabled:= temp;
   //edt_EmpSex.Enabled   := temp;
   //edt_EmpType.Enabled  := temp;
   //mm_EmpRemark.Enabled := temp;
end;

procedure Tfrm_servicebooking.SearchBookingInfo;
var
  i:integer;
begin
  StringGridClear(sg_Booking);

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select booking_no,cus_name,booking_date,emp_no,emp_name,booking_content from CustomerServiceBooking order by booking_date desc';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Booking do
      begin
        Cells[0,i] := FieldByName('booking_no').AsString ;
        //Cells[1,i] := FieldByName('cus_no').AsString ;
        Cells[1,i] := FieldByName('cus_name').AsString ;
        Cells[2,i] := FieldByName('booking_date').AsString ;
        Cells[3,i] := FieldByName('emp_no').AsString ;
        Cells[4,i] := FieldByName('emp_name').AsString ;
        Cells[5,i] := FieldByName('booking_content').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Booking.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled := false;
  if sg_Booking.RowCount > 3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_servicebooking.GetEmpNoList ;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select emp_no from Employee order by emp_no';
    Open;
    while not eof do
    begin
      cbb_EmpNo.Items.Add(FieldByName('emp_no').AsString );
      next;
    end;
  end;
end;

procedure Tfrm_servicebooking.GetCusNameList ;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    Sql.Text :='select cus_name from customer order by cus_no';
    open;
    while not eof do
    begin
      cbb_cusName.Items.Add(fieldbyname('cus_name').AsString);
      next;
    end;
  end;
end;

function Tfrm_servicebooking.SaveBookingInfo :boolean;
begin
  result := true;
  DoChange := true;
  
  if trim(edt_BookingNo.Text)='' then
  begin
    MessageBox(handle,'请输入本次预约的编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_BookingNo.SetFocus ;
    exit;
  end;
  
  {if trim(edt_Cusno.Text)='' then
  begin
    MessageBox(handle,'请输入预约的客户编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Cusno.SetFocus ;
    exit;
  end; }
  
  {if trim(cbb_EmpNo.Text)='' then
  begin
    MessageBox(handle,'请指定客户选择的服务员工编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    cbb_EmpNo.SetFocus ;
    exit;
  end; }

  if mm_bookingcontent.Text ='' then
  begin
    MessageBox(handle,'请指输入客户预约的服务内容!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    mm_bookingcontent.SetFocus ;
    exit;
  end;

  BookingNo := trim(edt_BookingNo.Text );
  if AppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select booking_no from CustomerServiceBooking where Booking_no=:no';
    Parameters.ParamValues['no'] := BookingNo;
    open;
    if not eof then
    begin
      MessageBox(self.Handle ,'该客户预约编号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_Bookingno.SetFocus ;
      result := false;
      exit;
    end;
  end;

  //try to save the information
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from CustomerServiceBooking where booking_no='+#39+BookingNo+#39;
      ExecSQL;

      close;
      SQL.Clear ;
//      SQL.Text := 'insert into CustomerServiceBooking(booking_no,cus_name,emp_no,emp_name,booking_date,start_time' +
//                  ',contact,booking_content,booking_remark) values (:bookingno,:cusname,:empno,:empname'+
//                  ',:bookingdate,:starttime,:contact,:bookingcontent,:bookingremark)';
      SQL.Add('insert into CustomerServiceBooking(booking_no,cus_name,emp_no,emp_name,booking_date,start_time') ;
      SQL.Add(',contact,booking_content,booking_remark) values (:bookingno,:cusname,:empno,:empname,') ;
      SQL.Add('''' + datetostr(dtp_BookingDate.Date) + ''',') ;
      SQL.Add('''' + trim(cbb_starttime.Text) + ''',') ;
      SQL.Add(':contact,:bookingcontent,:bookingremark)') ;
      Parameters.ParamValues['bookingno']   := trim(edt_BookingNo.Text);
      Parameters.ParamValues['cusname'] := trim(cbb_CusName.Text );
      Parameters.ParamValues['empno']  := trim(cbb_Empno.Text );
      Parameters.ParamValues['empname']:= trim(edt_EmpName.Text);

//      Parameters.ParamValues['bookingdate']  := dtp_BookingDate.Date ;
//      Parameters.ParamValues['starttime'] := trim(cbb_starttime.Text);

      Parameters.ParamValues['contact'] := trim(edt_contact.Text );
      Parameters.ParamValues['bookingcontent'] := mm_bookingcontent.Text;
      Parameters.ParamValues['bookingremark'] := mm_bookingremark.Text ;
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
{********************************************}
procedure Tfrm_servicebooking.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_servicebooking.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if sbtn_append.Enabled then
  begin
    if edt_Bookingno.Enabled then
    begin
      i := MessageBox(handle,'在窗口关闭的同时，你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      begin
        if SaveBookingInfo then i:=7 else i:=2;
      end;
      if i=2 then
      begin
        action := canone;
        exit;
      end;
    end;
  end;
  action := cafree;
  frm_servicebooking:=nil;
end;

procedure Tfrm_servicebooking.cbb_EmpNoExit(Sender: TObject);
begin
  if cbb_EmpNo.Text ='' then exit;
  
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select emp_name from employee where emp_no='+#39+trim(cbb_EmpNo.Text)+#39;
    Open;
    if not eof then
    begin
      edt_EmpName.Text := FieldByname('emp_name').AsString ;
    end;
  end;
end;

procedure Tfrm_servicebooking.edt_CusNoExit(Sender: TObject);
begin
  {if edt_CusNo.Text ='' then exit;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select * from customercard where cus_no='+#39+trim(edt_CusNo.Text)+#39;
    Open;
    if eof then
    begin
      MessageBox(self.handle,'该顾客还未办理任何顾客卡，请先予以办理!','提示',mb_ok+mb_iconinformation);
      edt_CusNo.SetFocus ;
      exit;
    end;

    close;
    SQL.Text :='select cus_name,type_name,total_cost,cost_score from customer,customertype,customercard '+
               ' where customer.cus_no=customercard.cus_no and customer.cus_type=customertype.type_id and Customer.cus_no='+#39+trim(edt_CusNo.Text)+#39;
    Open;
    if not eof then
    begin
      edt_CusName.Text := FieldByname('cus_name').AsString ;
      edt_CusType.Text  := FieldByname('type_name').AsString ;
      edt_TotalCost.Text := FieldByName('total_cost').AsString ;
      edt_CostScore.Text:= FieldByName('cost_score').AsString ;
    end else
    begin
      MessageBox(self.handle,'该客户编号不存在，请重试!','提示',mb_ok+mb_iconinformation);
      edt_CusNo.SetFocus ;
    end;
  end; }
end;

procedure Tfrm_servicebooking.sg_BookingSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Booking.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Booking.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_servicebooking.sht_ContentShow(Sender: TObject);
begin
  PageIndex := 1;
  if not AppendOrEdit then
  begin
    if sg_Booking.Cells[0,sg_Booking.Row]<>'' then GetBookingInfo;
    MakeEnabled(false);
  end;
end;

procedure Tfrm_servicebooking.sht_ListShow(Sender: TObject);
begin
  PageIndex:=0;
  if not sbtn_append.Enabled then exit;
  sbtn_delete.Enabled := true;
  sbtn_save.Enabled := false;
end;

procedure Tfrm_servicebooking.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  i:integer;
begin
  AllowChange := true;
  if not sbtn_append.Enabled then exit;
  if PageIndex=1 then
  begin
    if edt_BookingNo.Enabled then
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
  end else if (sg_Booking.Cells [0,sg_Booking.Row]='') and not AppendOrEdit then AllowChange:=true;
end;

procedure Tfrm_servicebooking.sbtn_appendClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if pagecontrol1.ActivePage = sht_content then  //to determine whethter sht_content is shown
  if (not AppendOrEdit) and edt_Bookingno.Enabled then  //to determine status of Edit and Components' Enabled
  begin
    i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
    if i=6 then //select yes
    if not SaveBookingInfo then i:=2;
    if i=2 then exit;
  end;

  AppendOrEdit := true;
  pagecontrol1.ActivePage := sht_content;
  MakeEnabled(true);
  ClearBookingInfo;
  temp:=GetDateString('DBMeirong');
  temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
  edt_Bookingno.Text :=GetNo('DBMeirong','CustomerServiceBooking','','','booking_no',temp,2); 
end;

procedure Tfrm_servicebooking.sbtn_editClick(Sender: TObject);
var
   i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
   if AppendOrEdit and edt_BookingNo.Enabled then
   begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveBookingInfo then i:=2;
     if i=2 then exit;
   end;
   if sg_Booking.Cells[0,sg_Booking.Row]='' then exit;
   if pagecontrol1.ActivePage <> sht_content then pagecontrol1.ActivePage := sht_content;
   if AppendOrEdit then GetBookingInfo;
   AppendOrEdit := false;
   MakeEnabled(true);
   edt_Bookingno.Enabled := false;
end;

procedure Tfrm_servicebooking.sbtn_saveClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if not SaveBookingInfo then exit;

  if AppendOrEdit then
  begin
    StringGridInsert(sg_Booking);
    i:=1;
  end else i:=sg_Booking.Row ;
   
  with sg_Booking do
  begin
    Cells[0,i] := trim(edt_BookingNo.Text );
    //Cells[1,i] := trim(edt_CusNo.Text );
    Cells[1,i] := trim(cbb_CusName.Text );
    Cells[2,i] := DateToString(dtp_BookingDate.Date);
    Cells[3,i] := trim(cbb_Empno.Text );
    cells[4,i] := trim(edt_EmpName.Text );
    cells[5,i] := mm_BookingContent.Text ;
  end;

  if AppendOrEdit then
  begin
    ClearBookingInfo;
    temp := GetDateString('DBMeirong');
    temp := copy(temp,1,4) + copy(temp,6,2) + copy(temp,9,2);
    edt_Bookingno.Text := GetNo('DBMeirong','CustomerServiceBooking','','','booking_no',temp,2);
    if sg_Booking.RowCount > 3 then sbtn_back.Enabled := true;
  end else MakeEnabled(false);
end;

procedure Tfrm_servicebooking.sbtn_deleteClick(Sender: TObject);
begin
  if sg_Booking.cells[0,sg_Booking.Row]='' then exit;
  if MessageBox(handle,'你确定要删除该客户预约信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'delete from CustomerServiceBooking where booking_no='+#39+sg_Booking.Cells[0,sg_Booking.Row]+#39;
    ExecSQL;
  end;
  StringGridDelete(sg_Booking,sg_Booking.Row);
  if sg_Booking.Row = sg_Booking.RowCount - 1 then
  begin
    if sg_Booking.RowCount > 2 then
      sg_Booking.Row := sg_Booking.Row - 1
    else
      sbtn_back.Enabled := false;
  end;
  if sg_Booking.Row = 1 then sbtn_front.Enabled := false;
  if sg_Booking.Row = sg_Booking.RowCount - 2 then sbtn_back.Enabled := false;
end;

procedure Tfrm_servicebooking.sbtn_backClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_Bookingno.Enabled  then
  if sbtn_append.Enabled  then
  begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then  //select yes
     if not SaveBookingInfo then i:=2; //if save error
     if i=2 then exit;
  end;
  if sg_Booking.Row > sg_Booking.RowCount-2 then
  begin
     sbtn_back.Enabled := false;
     exit;
  end;
  sbtn_front.Enabled := true;
  sg_Booking.Row := sg_Booking.Row+1;
  if pagecontrol1.ActivePage = sht_content then
  begin
     GetBookingInfo();
     MakeEnabled(false);
  end;
end;

procedure Tfrm_servicebooking.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_Bookingno.Enabled then
  if sbtn_append.Enabled then
  begin
     i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
     if i=6 then
     if not SaveBookingInfo then i:=2;
     if i=2 then exit;
  end;

  if sg_Booking.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg_Booking.Row := sg_Booking.Row-1;

  if pagecontrol1.ActivePage = sht_content then
  begin
    GetBookingInfo();
    MakeEnabled(false);
  end;
end;

procedure Tfrm_servicebooking.FormResize(Sender: TObject);
begin
  StringGridAutoSize(sg_Booking);
end;

procedure Tfrm_servicebooking.FormKeyPress(Sender: TObject; var Key: Char);
var
   temp,temp1:boolean;
begin
   temp := false;
   temp1:= true;

   if (key=#13) and sbtn_save.Enabled then
   begin
     temp := true;
     if (ActiveControl is TMemo) then
     if TMemo(ActiveControl).Name = 'mm_BookingRemark' then temp1:=false;
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

procedure Tfrm_servicebooking.sbtn_printClick(Sender: TObject);
begin
  DoreportServiceBooking;
end;

end.
