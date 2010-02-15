unit Unit_SpecialAttend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, ComCtrls, Buttons, Mask;

type
  Tfrm_specialattend = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sg_Reason: TStringGrid;
    Panel2: TPanel;
    sbtn_save: TSpeedButton;
    sbtn_delete: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    cbb_Reason: TComboBox;
    edt_Empname: TEdit;
    edt_Empno: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtp_Timestart: TMaskEdit;
    dtp_Timeend: TMaskEdit;
    procedure edt_EmpnoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetReasonInfo();
    procedure GetSpecialAttendByEmpNo(Emp_no,current_date:string);
    function GetEmpNameByEmpNo(temp:string):string;
  public
    { Public declarations }
    procedure special_Ref;
  end;

var
  frm_specialattend: Tfrm_specialattend;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}


{**************************用户自定义过程*********************}
procedure Tfrm_specialattend.special_Ref;
begin

  with sg_Reason do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工姓名';
    cells[2,0]:='起始时间';
    cells[3,0]:='结束时间';
    cells[4,0]:='特殊理由';
    cells[5,0]:='理由序号';
  end;
  GetReasonInfo();
  dtp_timestart.Text := TimeToStr(Now);
  dtp_timeend.Text   := TimeToStr(Now);
  StatusBar1.Panels[0].Text :='特殊考勤日期:'+GetDateString('DBMeirong');
  sbtn_save.Enabled := GetPower(SysUserId,'特殊考勤','修改权');
  sbtn_delete.Enabled := sbtn_save.Enabled ;
end;

procedure Tfrm_specialattend.GetSpecialAttendByEmpNo(Emp_no,current_date:string);
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select emp_no,emp_name,time_start,time_end,reason_remark,specialattend.reason_id from specialattend ,specialreason ' +
               'where specialattend.reason_id=specialreason.reason_id and emp_no='+#39+Emp_no+#39+' and att_date='+#39+current_date+#39;
    Open;
    i:=1;
    while not eof do
    begin
      with sg_reason do
      begin
        cells[0,i]:= FieldByName('Emp_no').AsString ;
        cells[1,i]:= FieldByName('Emp_name').AsString;
        cells[2,i]:= DateTimeToStr(FieldByName('time_start').AsDateTime);
        cells[3,i]:= DateTimeToStr(FieldByName('time_end').AsDateTime);
        cells[4,i]:= FieldByName('reason_remark').AsString;
        cells[5,i]:= FieldByName('reason_id').AsString;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_reason.Rowcount := i+1;
end;

procedure Tfrm_specialattend.GetReasonInfo ;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select reason_id,reason_remark from specialreason';
    open;
    while not eof do
    begin
      cbb_reason.Items.Add(FieldByName('reason_id').AsString + '-' + FieldByName('reason_remark').AsString ) ;
      next;
    end;
  end;
end;

function Tfrm_specialattend.GetEmpNameByEmpNo(temp:string):string;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select emp_name from employee where emp_no='+#39+temp+#39;
    Open;
    if not eof then
      result := FieldByName('emp_name').AsString
    else
      result :='';
  end;
end;
{**************************用户自定义过程*********************}
procedure Tfrm_specialattend.edt_EmpnoExit(Sender: TObject);
begin
  if trim(edt_empno.Text)='' then exit;
  if GetEmpNameByEmpNo(trim(edt_empno.Text))='' then
  begin
    MessageBox(handle,'该员工编号不存在，请重试!','提示',mb_ok+mb_iconinformation);
    edt_Empno.SetFocus ;
    exit;
  end else edt_Empname.text:=GetEmpNameByEmpNo(trim(edt_empno.Text));
  GetSpecialAttendByEmpNo(trim(edt_Empno.Text),GetDateString('DBMeirong'));
end;

procedure Tfrm_specialattend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_specialattend := nil;
end;

procedure Tfrm_specialattend.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_specialattend.sbtn_deleteClick(Sender: TObject);
begin
  if sg_reason.Cells[0,sg_Reason.Row]='' then exit;
  if MessageBox(handle,'你确定要删除这条特殊考勤记录吗？','提示',mb_Yesno+mb_iconquestion)=IDYes then
  begin
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'delete from specialattend where emp_no='+#39+sg_reason.cells[0,sg_reason.row]+#39+
                  ' and att_date='+#39+GetDateString('DBMeirong')+#39+' and reason_id='+#39+sg_reason.cells[5,sg_reason.row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_reason,sg_reason.Row);
  end;
end;

procedure Tfrm_specialattend.sbtn_saveClick(Sender: TObject);
var
  reason,reason_id:string;
begin
  if trim(edt_Empno.Text)='' then
  begin
    MessageBox(handle,'请先输入员工编号!','提示',mb_ok+mb_iconinformation);
    edt_Empno.SetFocus ;
    exit;
  end;
  if trim(cbb_Reason.Text)='' then
  begin
    MessageBox(handle,'请先选择特殊考勤理由!','提示',mb_ok+mb_iconinformation);
    cbb_Reason.SetFocus ;
    exit;
  end;
  reason:=trim(cbb_reason.Text );
  reason_id:=StringGetChar(reason,'-');

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select count(*) as count from SpecialAttend where emp_no='+#39+trim(edt_Empno.Text)+#39+
               ' and att_date='+#39+GetDateString('DBMeirong')+#39+
               ' and reason_id='+#39+reason_id+#39;
    Open;
    if FieldByName('count').asinteger>0 then
    begin
      MessageBox(self.handle,'你已经添加过该考勤理由了!','提示',mb_ok+mb_iconinformation);
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    Close;
//    SQL.Text :='insert into SpecialAttend(emp_no,emp_name,att_date,time_start,time_end,reason_id) values('+
//               ':empno,:empname,:attdate,:timestart,:timeend,:reasonid)';
    SQL.Clear;
    SQL.Add('insert into SpecialAttend(emp_no,emp_name,att_date,time_start,time_end,reason_id) values(');
    SQL.Add(':empno,:empname,');
    SQL.Add( '''' + GetDateString('DBMeirong') + ''',' );
    SQL.Add('''' + dtp_timestart.Text + ''',' );
    SQL.Add('''' + dtp_timeend.Text + ''',' );
    SQL.Add(':reasonid)');
    Parameters.ParamValues['empno']:=trim(edt_Empno.Text);
    Parameters.ParamValues['empname']:=trim(edt_Empname.Text);
//    Parameters.ParamValues['attdate']:= StrToDate(GetDateString('DBMeirong'));
//    Parameters.ParamValues['timestart'] := StrToTime(dtp_timestart.Text) ;
//    Parameters.ParamValues['timeend'] := StrToTime(dtp_timeend.Text) ;
    Parameters.ParamValues['reasonid']:=reason_id;
    ExecSQL;
  end;
  GetSpecialAttendByEmpNo(trim(edt_Empno.Text),GetDateString('DBMeirong'));
  edt_Empno.Text :='';
  edt_Empname.Text :='';
  cbb_Reason.Text :='';
end;

end.
