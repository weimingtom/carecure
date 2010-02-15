unit Unit_Employee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids,DB, ExtDlgs;

type
  Tfrm_employee = class(TForm)
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
    sg: TStringGrid;
    sht_content: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Img_Photo: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    sbtn_AddEmpType: TSpeedButton;
    Label17: TLabel;
    edt_Empno: TEdit;
    edt_Empname: TEdit;
    dtp_Birthday: TDateTimePicker;
    edt_Idcard: TEdit;
    edt_Address: TEdit;
    edt_Phone: TEdit;
    edt_Mobile: TEdit;
    mm_Remark: TMemo;
    bbSelect: TBitBtn;
    cbb_Sex: TComboBox;
    edt_Zipcode: TEdit;
    cbb_Type: TComboBox;
    dtp_Indate: TDateTimePicker;
    bbCancel: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure sbtn_frontClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sgDblClick(Sender: TObject);
    procedure sgSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sht_contentShow(Sender: TObject);
    procedure sht_mainShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbSelectClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
    PageIndex : integer;
    AppendOrEdit,DoChange : boolean;
    Empno : string;

    procedure ClearInfo();
    procedure GetInfo();
    procedure SearchInfo();
    function  SaveInfo():boolean;
    procedure MakeEnabled(temp:boolean);
  public
    { Public declarations }
    procedure ref();
  end;

var
  frm_employee: Tfrm_employee;

implementation

uses Unit_DataModule,unit_TotalPublic,PublicFunOrPro, Unit_Customer;

{$R *.dfm}

{************************************************}
procedure Tfrm_employee.ref ();
begin
  pagecontrol1.ActivePage := sht_main;
  with sg do
  begin
    Cells[0,0] := '员工编号';
    Cells[1,0] := '员工姓名';
    Cells[2,0] := '性别';
    Cells[3,0] := '生日';
    Cells[4,0] := '职务';
  end;
  formresize(nil);
  SearchInfo();

  sbtn_append.Enabled := GetPower(SysUserId,'员工信息','修改权');
  sbtn_edit.Enabled := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled;
  sbtn_print.Enabled := GetPower(SysUserId,'员工信息','打印权');

end;

{**** procedure used to clear information ****}
procedure Tfrm_employee.ClearInfo ();
begin
  edt_Empno.Text    := '';
  edt_Empname.Text  := '';
  cbb_Sex.Text      := '';
  dtp_Birthday.Date := Date;
  dtp_Indate.Date   := Date;
  edt_Idcard.Text   := '';
  edt_Address.Text  := '';
  edt_Zipcode.Text  := '';
  edt_Phone.Text    := '';
  edt_Mobile.Text   := '';
  cbb_Type.Text     := '';
  mm_Remark.Text    := '';
  Img_photo.Picture := nil;

  edt_Empno.SetFocus ;
end;

procedure Tfrm_employee.SearchInfo();
var
  i :integer;
begin
  StringGridClear(sg);
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select emp_no,emp_name,emp_sex,emp_birthday,emp_type from employee ' +
                'order by emp_indate desc,emp_no';
    Open;
    i:=1;
    while not eof do
    begin
      sg.Cells[0,i] := FieldByName('emp_no').AsString ;
      sg.Cells[1,i] := FieldByName('emp_name').AsString ;
      sg.Cells[2,i] := FieldByName('emp_sex').AsString ;
      sg.Cells[3,i] := FieldByName('emp_birthday').AsString ;
      sg.Cells[4,i] := FieldByName('emp_type').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled := false;
  if sg.RowCount > 3 then sbtn_back.Enabled := true;
end;

{**** procedure used to set status of button ****}
procedure Tfrm_employee.MakeEnabled(temp:boolean);
begin
   if sbtn_append.Enabled then
      sbtn_save.Enabled := temp
   else
      sbtn_save.Enabled := false;
   sbtn_delete.Enabled := false;

   edt_Empno.Enabled   := temp;
   edt_Empname.Enabled := temp;
   cbb_Sex.Enabled     := temp;
   dtp_Birthday.Enabled:= temp;
   dtp_Indate.Enabled  := temp;
   edt_Idcard.Enabled  := temp;
   edt_Address.Enabled := temp;
   edt_Zipcode.Enabled := temp;
   edt_Phone.Enabled   := temp;
   edt_Mobile.Enabled  := temp;
   cbb_Type.Enabled    := temp;
   mm_Remark.Enabled   := temp;
   bbSelect.Enabled    := temp;
   bbCancel.Enabled    := temp;
   sbtn_AddEmpType.Enabled:=temp;
   if temp then edt_Empno.SetFocus;

end;

{**** procedure used to retrieve data from db according to empno ****}
procedure Tfrm_employee.GetInfo();
var
  fileStream :TFileStream;
  //blobStream:TBlobStream;
begin
  //to select employee information in detail;
  if sg.Cells[0,sg.row]='' then exit;
  Empno := sg.Cells[0,sg.Row];
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select * from employee where emp_no='+#39+Empno+#39;
    open;

    edt_Empno.Text    := Empno;
    edt_Empname.Text  := FieldByName('Emp_name').AsString ;
    cbb_Sex.Text      := FieldByName('Emp_sex').AsString ;
    dtp_Birthday.Date := FieldByName('Emp_birthday').AsDateTime ;
    dtp_Indate.Date   := FieldByName('Emp_indate').AsDateTime ;
    edt_Idcard.Text   := FieldByName('Emp_idcard').AsString ;
    edt_Address.Text  := FieldByName('Emp_address').AsString ;
    edt_Zipcode.Text  := FieldByName('Emp_zipcode').AsString ;
    edt_Phone.Text    := FieldByName('Emp_phone').AsString ;
    edt_Mobile.Text   := FieldByName('Emp_mobile').AsString ;
    cbb_Type.Text     := FieldByName('Emp_type').AsString ;
    //showmessage(inttostr(TBlobField(FieldByName('Emp_photo')).BlobSize));
    if TBlobField(FieldByName('Emp_photo')).BlobSize > 1 then
    begin
       fileStream := TFileStream.Create('temp.jpg',fmCreate);
       TBlobField(FieldByName('Emp_photo')).SaveToStream(fileStream);
       fileStream.Free;
       Img_Photo.Picture.RegisterFileFormat('*'+'jpg','',TGraphic);
       Img_Photo.Height := 145;
       Img_Photo.Width  := 129;
       LoadImage(Img_Photo,'temp.jpg');
    end else Img_photo.Picture.Graphic :=nil;
    
    DeleteFile('temp.jpg');
    mm_Remark.Text    := FieldByName('Emp_remark').AsString ;
  end;

end;

{**** function used to determine employee information is saved or not ****}
function Tfrm_employee.SaveInfo ():boolean;
var
  MemStream : TMemoryStream;
  temp_type : string;
begin
  result := true;
  DoChange := true;
  //to determine if the following two fields are filled or not
  if trim(edt_Empno.Text)='' then
  begin
    MessageBox(handle,'请输入员工编号!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Empno.SetFocus ;
    exit;
  end;
  if trim(edt_Empname.Text)='' then
  begin
    MessageBox(handle,'请输入员工姓名!','提示',mb_ok+mb_iconinformation);
    result := false;
    DoChange := false;
    edt_Empname.SetFocus ;
    exit;
  end;
  //to determine whether the employee has existed or not
  Empno := trim(edt_Empno.Text );
  if AppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select Emp_no from employee where Emp_no=:no';
    Parameters.ParamValues['no'] := Empno;
    open;
    if not eof then
    begin
      MessageBox(self.Handle ,'该员工编号已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_Empno.SetFocus ;
      result := false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select Emp_no from employee where Emp_name=:name';
    Parameters.ParamValues['name'] := trim(edt_Empname.Text);
    open;
    if not eof then
    if FieldByName('Emp_no').AsString <> Empno then
    begin
      MessageBox(self.Handle ,'该员工姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_Empname.SetFocus ;
      result := false;
      exit;
    end;
  end;
  //try to save the information
  temp_type:=trim(cbb_Type.Text);
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from employee where emp_no='+#39+Empno+#39;
      ExecSQL;

      close;
      SQL.Clear;
      SQL.Add('insert into employee(emp_no,emp_name,emp_sex,emp_birthday');
      SQL.Add(',emp_indate,emp_idcard,emp_address,emp_zipcode,emp_phone,emp_mobile,emp_type,emp_photo');
      SQL.Add(',emp_remark) values (:no,:name,:sex,');
      SQL.Add('''' + datetostr(dtp_Birthday.Date) + ''',');
      SQL.Add('''' +  datetostr(dtp_Indate.Date) + '''');
      SQL.Add(',:idcard,:address');
      SQL.Add(',:zipcode,:phone,:mobile,:type,:photo,:remark)');
//      SQL.Text := 'insert into employee(emp_no,emp_name,emp_sex,emp_birthday' +
//                  ',emp_indate,emp_idcard,emp_address,emp_zipcode,emp_phone,emp_mobile,emp_type,emp_photo'+
//                  ',emp_remark) values (:no,:name,:sex,:birthday,:indate,:idcard,:address' +
//                  ',:zipcode,:phone,:mobile,:type,:photo,:remark)';
      Parameters.ParamValues['no']   := trim(edt_Empno.Text);
      Parameters.ParamValues['name'] := trim(edt_Empname.Text );
      Parameters.ParamValues['sex']  := trim(cbb_Sex.Text );
//      Parameters.ParamValues['birthday']  := dtp_Birthday.Date ;
//      Parameters.ParamValues['indate'] := dtp_Indate.Date ;
      Parameters.ParamValues['idcard'] := trim(edt_Idcard.Text );
      Parameters.ParamValues['address'] := trim(edt_Address.Text );
      Parameters.ParamValues['zipcode'] := trim(edt_Zipcode.Text );
      Parameters.ParamValues['phone']:= trim(edt_Phone.Text );
      Parameters.ParamValues['mobile'] := trim(edt_mobile.Text );
      Parameters.ParamValues['type'] := StringGetChar(temp_type,'-') ;
      if img_photo.Picture.Graphic <>nil then
      begin
        try
          MemStream := TMemoryStream.Create ;
          Img_photo.Picture.Graphic.SaveToStream(MemStream);
//          Parameters.ParamValues['photo'].LoadFromStream(MemStream,FtGraphic);
          Parameters.ParamByName('photo').LoadFromStream(MemStream,FtGraphic);
        finally
          MemStream := nil;
          MemStream.Free ;
        end;
      end else Parameters.ParamValues['photo'] :='';

      Parameters.ParamValues['remark'] := mm_remark.Text ;
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

{************************************************}
procedure Tfrm_employee.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_Empno.Enabled then
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

procedure Tfrm_employee.sbtn_backClick(Sender: TObject);
var
  i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
  if edt_empno.Enabled  then
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

procedure Tfrm_employee.sbtn_appendClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if pagecontrol1.ActivePage = sht_content then  //to determine whethter sht_content is shown
  if (not AppendOrEdit) and edt_Empno.Enabled then  //to determine status of Edit and Components' Enabled
  begin
    i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
    if i=6 then //select yes
    if not SaveInfo then i:=2;
    if i=2 then exit;
  end;

  AppendOrEdit := true;
  pagecontrol1.ActivePage := sht_content;
  MakeEnabled(true);
  ClearInfo;
  temp:=GetDateString('DBMeirong');
  temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
  edt_Empno.Text :=GetNo('DBMeirong','Employee','','','Emp_no',temp,2);
end;

procedure Tfrm_employee.sbtn_editClick(Sender: TObject);
var
   i:integer;
begin
  if pagecontrol1.ActivePage = sht_content then
   if AppendOrEdit and edt_Empno.Enabled then
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
   edt_Empno.Enabled := false;
end;

procedure Tfrm_employee.sbtn_saveClick(Sender: TObject);
var
  i : integer;
  temp : string;
begin
  if not SaveInfo then exit;

  if AppendOrEdit then
  begin
    StringGridInsert(sg);
    i:=1;
  end else i:=sg.Row ;

  with sg do
  begin
    Cells[0,i] := trim(edt_Empno.Text );
    Cells[1,i] := trim(edt_Empname.Text );
    Cells[2,i] := trim(cbb_Sex.Text );
    Cells[3,i] := trim(DateToString(dtp_Birthday.Date));
    Cells[4,i] := trim(cbb_type.Text );
  end;

  if AppendOrEdit then
  begin
    ClearInfo;
    temp := GetDateString('DBMeirong');
    temp := copy(temp,1,4) + copy(temp,6,2) + copy(temp,9,2);
    edt_Empno.Text := GetNo('DBMeirong','Employee','','','Emp_no',temp,2);
    if sg.RowCount > 3 then sbtn_back.Enabled := true;
  end else MakeEnabled(false);
end;

procedure Tfrm_employee.sbtn_deleteClick(Sender: TObject);
begin
  if sg.cells[0,sg.Row]='' then exit;
  if MessageBox(handle,'你确定要删除该员工信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'delete from employee where emp_no='+#39+sg.Cells[0,sg.Row]+#39;
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

procedure Tfrm_employee.sbtn_printClick(Sender: TObject);
begin
  DoReportEmployee;
end;

procedure Tfrm_employee.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_employee.sgDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_employee.sgSelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure Tfrm_employee.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  i:integer;
begin
  AllowChange := true;
  if not sbtn_append.Enabled then exit;
  if PageIndex=1 then
  begin
    if edt_Empno.Enabled then
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

procedure Tfrm_employee.sht_contentShow(Sender: TObject);
begin
  PageIndex := 1;
  if not AppendOrEdit then
  begin
    if sg.Cells[0,sg.Row]<>'' then GetInfo;
    MakeEnabled(false);
  end;
end;

procedure Tfrm_employee.sht_mainShow(Sender: TObject);
begin
  PageIndex:=0;
  if not sbtn_append.Enabled then exit;
  sbtn_delete.Enabled := true;
  sbtn_save.Enabled := false;
end;

procedure Tfrm_employee.FormResize(Sender: TObject);
begin
  StringGridAutoSize(sg);
end;

procedure Tfrm_employee.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_employee.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  if PageControl1.ActivePage = sht_content then
  if sbtn_append.Enabled then
  begin
    if edt_EmpNo.enabled then
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
  frm_employee := nil;
end;

procedure Tfrm_employee.bbSelectClick(Sender: TObject);
var
  FileName:String;
begin
  if openpicturedialog1.Execute then
     FileName:=Openpicturedialog1.FileName ;
  if filename='' then exit;
  img_photo.Picture.LoadFromFile(filename); 
end;

procedure Tfrm_employee.bbCancelClick(Sender: TObject);
begin
  img_photo.Picture.Graphic := nil;
end;

end.
