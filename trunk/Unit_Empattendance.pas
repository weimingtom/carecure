unit Unit_Empattendance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls;

type
  Tfrm_empattend = class(TForm)
    pnlContent: TPanel;
    Splitter1: TSplitter;
    pnlRight: TPanel;
    sg_attend: TStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Empno: TEdit;
    cbb_TimeSet: TComboBox;
    GroupBox3: TGroupBox;
    dtp_Search: TDateTimePicker;
    Label2: TLabel;
    cbb_OrderBy: TComboBox;
    BitBtn3: TBitBtn;
    sbtn_save: TSpeedButton;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sbtn_special: TSpeedButton;
    sbtn_Search: TSpeedButton;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_specialClick(Sender: TObject);
    procedure sbtn_SearchClick(Sender: TObject);
  private
    { Private declarations }
    function  SearchAttendInfo(current_date,order_by:string):boolean; //查找员工当日考勤信息
    procedure InsertInitialEmpInfo(current_date:string);              //进行员工基本信息插入
    function  GetOrderByItemIndex(ItemIndex:integer):string;          //得到排序字段
    function  GetFieldSetByItemIndex(ItemIndex:integer):string;       //得到更新字段
    function  CheckAttendExistOrNot(emp_no,field:string):boolean;     //判断员工是否已经考勤
  public
    { Public declarations }
    procedure attend_ref;
  end;

var
  frm_empattend: Tfrm_empattend;

implementation
    uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*********************用户过程定义**********************}
procedure Tfrm_empattend.attend_ref ;
begin
   with sg_attend do
   begin
     cells[0,0] := '员工编号';
     cells[1,0] := '员工姓名';
     cells[2,0] := '考勤日期';
     cells[3,0] := '上午上班';
     cells[4,0] := '上午下班';
     cells[5,0] := '下午上班';
     cells[6,0] := '下午下班';
     cells[7,0] := '晚上上班';
     cells[8,0] := '晚上上班';
   end;
   dtp_Search.DateTime := date;
   StatusBar1.Panels[0].Text :='考勤日期:'+GetDateString('DBMeirong');
   if not SearchAttendInfo(GetDateString('DBMeirong'),'Emp_no') then
   begin
      InsertInitialEmpInfo(GetDateString('DBMeirong'));
      SearchAttendInfo(GetDateString('DBMeirong'),'Emp_no');
   end;
   //sbtn_save.Enabled := GetPower(SysUserId,'正常考勤','修改权');
   //sbtn_special.Enabled := GetPower(SysUserId,'特殊考勤','浏览权');
   
end;
function Tfrm_empattend.SearchAttendInfo(current_date,order_by:string):boolean ;
var
  i:integer;
begin
  result:=true;
  
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select Emp_no,Emp_name,att_date,pre_morning,aft_morning,pre_afternoon,aft_afternoon,pre_evening,aft_evening ' +
               'from NormalAttend where att_date='+#35+current_date+#35+' order by '+#39+order_by+#39;
    Open;
    if not eof then
    begin
      i:=1;
      while not eof do
      begin
        with sg_attend do
        begin
          cells[0,i] := FieldByName('Emp_no').AsString ;
          cells[1,i] := FieldByName('Emp_name').AsString;
          cells[2,i] := DateToStr(FieldByName('att_date').AsDateTime);
          if FieldByName('pre_morning').AsString<>'' then
            cells[3,i] := TimeToStr(StrToDateTime(FieldByName('pre_morning').AsString))
          else
            cells[3,i] := '';
          if FieldByName('aft_morning').AsString<>'' then
            cells[4,i] := TimeToStr(StrToDateTime(FieldByName('aft_morning').AsString))
          else
            cells[4,i] := '';
          if FieldByName('pre_afternoon').AsString<>'' then
            cells[5,i] := TimeToStr(StrToDateTime(FieldByName('pre_afternoon').AsString))
          else
            cells[5,i] := '';
          if FieldByName('aft_afternoon').AsString<>'' then
            cells[6,i] := TimeToStr(StrToDateTime(FieldByName('aft_afternoon').AsString))
          else
            cells[6,i] :='';
          if FieldByName('pre_evening').AsString<>'' then
            cells[7,i] := TimeToStr(StrToDateTime(FieldByName('pre_evening').AsString))
          else
            cells[7,i] := '';
          if FieldByName('aft_evening').AsString<>'' then
            cells[8,i] := TimeToStr(StrToDateTime(FieldByName('aft_evening').AsString))
          else
            cells[8,i] := '';
        end;
        inc(i);
        next;
      end;
    end else result:=false;
  end;
  if i<>1 then sg_attend.RowCount :=i+1;
end;

procedure Tfrm_empattend.InsertInitialEmpInfo (current_date:string);
begin
  with dmod.ADOQuery1 do
  begin
    Close;
      SQL.Text :='select emp_no,emp_name from Employee order by emp_no';
      Open;
      while not eof do
      begin
        //将记录插入到正常考勤表
        with dmod.ADOQuery2 do
        begin
          Close;
          dmod.ADOQuery2.SQL.Clear;
          dmod.ADOQuery2.SQL.Add('insert into NormalAttend (emp_no,emp_name,att_date) values(');
          dmod.ADOQuery2.SQL.Add(dmod.ADOQuery1.fieldByName('emp_no').AsString ) ;
          dmod.ADOQuery2.SQL.Add(',''' + dmod.ADOQuery1.fieldByName('emp_name').AsString + '''') ;
          dmod.ADOQuery2.SQL.Add(',''' + current_date + ''')');
//          SQL.Text := 'insert into NormalAttend (emp_no,emp_name,att_date) values(:empno,:empname,:attdate)';
//          SQL.Text := 'insert into NormalAttend (emp_no,emp_name,att_date) values(1,''xjc'',:attdate)';
//          Parameters.ParamValues['empno'] := dmod.ADOQuery1.fieldByName('emp_no').AsString ;
//          Parameters.ParamValues['empname'] := dmod.ADOQuery1.fieldByName('emp_name').AsString ;
//          Parameters.ParamValues['attdate'] := strtodate(current_date);
          dmod.ADOQuery2.ExecSQL;
        end;
        dmod.ADOQuery1.Next;
      end;
  end;
end;

function Tfrm_empattend.CheckAttendExistOrNot(emp_no,field:string):boolean;
begin
  result:=false;
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select '+field+' from NormalAttend where emp_no='+#39+emp_no+#39+
               ' and att_date='+#35+GetDateString('DBMeirong')+#35;
    Open;
    if not eof then
    begin
      if FieldByName(field).AsString ='' then
         result:=false
      else
         result:=true;
    end;
  end;
end;
function Tfrm_empattend.GetFieldSetByItemIndex(ItemIndex:integer):string;
begin
  case ItemIndex of
    0:result:='pre_morning';
    1:result:='aft_morning';
    2:result:='pre_afternoon';
    3:result:='aft_morning';
    4:result:='pre_evening';
    5:result:='aft_evening';
  end;
end;

function Tfrm_empattend.GetOrderByItemIndex(ItemIndex:integer):string;
begin
  case ItemIndex of
  0:result:='emo_no';
  1:result:='emp_name';
  end;
end;
{*********************用户过程定义**********************}
procedure Tfrm_empattend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_empattend := nil;
end;                              

procedure Tfrm_empattend.BitBtn3Click(Sender: TObject);
begin
  if not SearchAttendInfo(DateToStr(dtp_Search.Date),GetOrderByItemIndex(cbb_OrderBy.itemindex)) then
  begin
     InsertInitialEmpInfo(DateToStr(dtp_Search.Date));
     SearchAttendInfo(DateToStr(dtp_Search.Date),GetOrderByItemIndex(cbb_OrderBy.itemindex));
  end;
end;

procedure Tfrm_empattend.sbtn_saveClick(Sender: TObject);
var
  temp:string;
begin
  if edt_Empno.Text ='' then
  begin
    MessageBox(handle,'请先输入员工编号，再考勤!','提示',mb_ok+mb_iconinformation);
    exit;
  end;

  if CheckAttendExistOrNot(trim(edt_empno.Text),GetFieldSetByItemIndex(cbb_TimeSet.ItemIndex)) then
  begin
    MessageBox(handle,'你已经进行过该考勤，不用再次考勤!','提示',mb_ok+mb_iconinformation);
    edt_Empno.Text :='';
    edt_Empno.Setfocus; 
    exit;
  end;
  
  try
    with dmod.ADOQuery1 do
    begin
      Close;
      temp:='update NormalAttend set is_attend=''1'','+GetFieldSetByItemIndex(cbb_TimeSet.ItemIndex)+'='+#39+GetDateTimeString('DBMeirong')+#39+
               ' where emp_no='+#39+trim(edt_Empno.Text)+#39+' and att_date='+#35+GetDateString('DBMeirong')+#35;
      SQL.Text := temp;
      ExecSQL;
      SearchAttendInfo(GetDateString('DBMeirong'),'emp_no');
      edt_Empno.text:='';
      edt_Empno.setfocus;
    end;
  except
    MessageBox(handle,'操作失败，请稍候再试!','提示',mb_ok+mb_iconinformation);
  end;
end;

procedure Tfrm_empattend.sbtn_specialClick(Sender: TObject);
begin
  DoSpecialAttend;
end;

procedure Tfrm_empattend.sbtn_SearchClick(Sender: TObject);
begin
  DoChooseEmployee('1');
end;

end.
