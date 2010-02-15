unit Unit_BasicSalary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Buttons;

type
  Tfrm_basicsalary = class(TForm)
    sg_Salary: TStringGrid;
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_print: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_edit: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_SalarySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sg_SalaryDblClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchBasicSalaryInfo;
  public
    { Public declarations }
    procedure basicSalary_ref;
  end;

var
  frm_basicsalary: Tfrm_basicsalary;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

procedure Tfrm_basicSalary.basicSalary_ref ;
begin
  with sg_Salary do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工姓名';
    cells[2,0]:='性别';
    cells[3,0]:='职务';
    cells[4,0]:='基本工资';
  end;

  SearchBasicSalaryInfo;

  sbtn_edit.Enabled := GetPower(SysUserId,'基本工资','修改权');
  sbtn_save.Enabled := sbtn_edit.Enabled ;
  sbtn_print.Enabled:= GetPower(SysUserId,'基本工资','打印权');
  
end;

procedure Tfrm_basicSalary.SearchBasicSalaryInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
//    SQL.Text :='select emp_no,emp_name,emp_sex,type_name from Employee e,EmployeeType et '+
//               ' where e.emp_type=et.type_id order by emp_no';
    SQL.Text :='select emp_no,emp_name,emp_sex,emp_type from Employee e '+
               ' order by emp_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Salary do
      begin
        cells[0,i]:=FieldByName('emp_no').asString;
        cells[1,i]:=FieldByName('emp_name').asString;
        cells[2,i]:=FieldByName('emp_sex').asString;
        cells[3,i]:=FieldByName('emp_type').asString;
        with dmod.ADOQuery2 do
        begin
          Close;
          SQL.Text :='select b_salary from EmployeeBasicSalary where emp_no='+#39+cells[0,i]+#39;
          Open;
          if not eof then
             cells[4,i]:=FloatToStr(FieldByName('b_salary').asFloat)
          else
             cells[4,i]:='0.0';
        end;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Salary.RowCount :=i+1;
end;
procedure Tfrm_basicsalary.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_basicsalary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_basicsalary:=nil;
end;

procedure Tfrm_basicsalary.sbtn_backClick(Sender: TObject);
begin
  if sg_Salary.Row > sg_Salary.RowCount-2 then
  begin
     sbtn_back.Enabled := false;
     exit;
  end;
  sbtn_front.Enabled := true;
  sg_Salary.Row := sg_Salary.Row+1;
end;

procedure Tfrm_basicsalary.sbtn_frontClick(Sender: TObject);
begin
  if sg_Salary.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg_Salary.Row := sg_Salary.Row-1;
end;

procedure Tfrm_basicsalary.sg_SalarySelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Salary.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Salary.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_basicsalary.sbtn_editClick(Sender: TObject);
begin
  sg_Salary.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
  sg_salary.FixedCols := 4 ;
  sbtn_edit.Enabled :=false;
  sbtn_save.Enabled :=true;
end;

procedure Tfrm_basicsalary.sbtn_saveClick(Sender: TObject);
var
  i:integer;
begin
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='delete from EmployeeBasicSalary';
      ExecSQL;

      for i:=1 to sg_Salary.RowCount-2 do
      begin
        Close;
        SQL.Text:='insert into EmployeeBasicSalary(emp_no,b_salary) '+
                'values(:empno,:bsalary)';
        Parameters.ParamValues['empno'] := sg_Salary.Cells[0,i];
        Parameters.ParamValues['bsalary'] := StrToFloat(sg_Salary.Cells[4,i]);
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      MessageBox(handle,'员工基本工资设置完成!','提示',mb_ok+mb_iconinformation);
      sbtn_save.Enabled :=false;
      sbtn_edit.Enabled :=true;
      sg_Salary.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goRowSelect];
    except
      dmod.ADOConn.RollbackTrans  ;
      MessageBox(handle,'员工基本工资设置出错，请重试!','提示',mb_ok+mb_iconinformation);
    end;
    sg_salary.FixedCols := 0 ;
  end;
end;

procedure Tfrm_basicsalary.sg_SalaryDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_basicsalary.sbtn_printClick(Sender: TObject);
begin
  DoReportBasicSalary;
end;

end.
