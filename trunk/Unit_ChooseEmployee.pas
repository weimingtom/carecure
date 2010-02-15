unit Unit_ChooseEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Buttons;

type
  Tfrm_chooseemployee = class(TForm)
    sg_Employee: TStringGrid;
    Panel1: TPanel;
    sbtn_ok: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_okClick(Sender: TObject);
    procedure sg_EmployeeDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchEmployeeInfo;

  public
    { Public declarations }
    isattend:string;
    
    procedure ChooseEmployee_ref;

  end;

var
  frm_chooseemployee: Tfrm_chooseemployee;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_FrontCheck,unit_Empattendance;
{$R *.dfm}

procedure Tfrm_chooseemployee.ChooseEmployee_ref ;
begin
  with sg_Employee do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工姓名';
    cells[2,0]:='性别';
    cells[3,0]:='备注';
  end;

  SearchEmployeeInfo;
end;

procedure Tfrm_chooseemployee.SearchEmployeeInfo;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select emp_no,emp_name,emp_sex,emp_remark from employee order by emp_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Employee do
      begin
        cells[0,i]:=FieldByname('emp_no').asstring;
        cells[1,i]:=FieldByname('emp_name').asstring;
        cells[2,i]:=FieldByname('emp_sex').asstring;
        cells[3,i]:=FieldByname('emp_remark').asstring;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Employee.rowcount:=i+1;
end;
procedure Tfrm_chooseemployee.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_chooseemployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_chooseemployee:=nil;
end;

procedure Tfrm_chooseemployee.sbtn_okClick(Sender: TObject);
begin
  if sg_Employee.Cells[0,sg_Employee.Row ]='' then exit;

  if isattend='1' then
  begin
    frm_empattend.edt_Empno.Text := sg_Employee.Cells[0,sg_Employee.Row ];
  end else begin
    if frm_frontcheck.PageControl1.ActivePageIndex = 0 then
      frm_frontcheck.sg_Item.Cells[3,frm_frontcheck.sg_Item.Row]:=sg_Employee.Cells[0,sg_Employee.Row ]
    else
      frm_frontcheck.sg_Meal.Cells[3,frm_frontcheck.sg_Meal.Row]:=sg_Employee.Cells[0,sg_Employee.Row ];
  end;
  close;
end;

procedure Tfrm_chooseemployee.sg_EmployeeDblClick(Sender: TObject);
begin
  sbtn_okClick(nil);
end;

end.
