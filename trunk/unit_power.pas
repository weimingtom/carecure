unit unit_power;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_power = class(TForm)
    Label1: TLabel;
    sg1: TStringGrid;
    lbl_UserId: TLabel;
    lbl_UserName: TLabel;
    sbtn_PowerUp: TSpeedButton;
    sbtn_PowerDown: TSpeedButton;
    Label2: TLabel;
    cb_BrowseEnable: TCheckBox;
    cb_EditEnable: TCheckBox;
    cb_PrintEnable: TCheckBox;
    Panel1: TPanel;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_UserUp: TSpeedButton;
    sbtn_UserDown: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_PowerUpClick(Sender: TObject);
    procedure sbtn_PowerDownClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure sbtn_UserUpClick(Sender: TObject);
    procedure sbtn_UserDownClick(Sender: TObject);
    procedure cb_EditEnableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cb_BrowseEnableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cb_PrintEnableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    PowerArray,UserPowerArray:array of array of string;
    procedure GetUserPower;
    function SaveInfo:boolean;
    { Private declarations }
  public
    TempString:TStringGrid;
    procedure ref;
    { Public declarations }
  end;

var
  frm_power: Tfrm_power;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

procedure Tfrm_power.ref;
var
  i:integer;
  CanSelect:boolean;
begin
  sg1.Cells[0,0]:='权限项';
  with dmod.ADOQuery1 do
  begin
    close;
    sql.Text := 'select * from PowerTable order by PowerName';
    open;

    SetLength(PowerArray,RecordCount,4);
    SetLength(UserPowerArray,RecordCount,4);
    i:=0;
    while not eof do
    begin
      PowerArray[i,0]:= FieldByName('PowerName').AsString;
      UserPowerArray[i,0] := PowerArray[i,0];
      if FieldByName('EditEnable').AsBoolean then
        PowerArray[i,1] := '1'
      else
        PowerArray[i,1] := '0';

      if FieldByName('BrowseEnable').AsBoolean then
        PowerArray[i,2] := '1'
      else
        PowerArray[i,2] := '0';

      if FieldByName('PrintEnable').AsBoolean then
        PowerArray[i,3] := '1'
      else
        PowerArray[i,3] := '0';
      sg1.Cells[0,i+1]:=PowerArray[i,0];
      inc(i);
      next;
    end;
  end;
  if i<>0 then sg1.RowCount := i+2;
  GetUserPower;
  CanSelect:=true;
  sg1SelectCell(sg1,0,1,CanSelect);
  sbtn_sure.Enabled := GetPower(SysUserId,'权限管理','修改权');
end;

function Tfrm_power.SaveInfo:boolean;
var
  i:integer;
begin
  result := true;
  try
    dmod.ADOConn.BeginTrans;
    with dmod.ADOQuery1 do
    begin
      close;
      sql.text := 'delete from UserPower where UserId=:UserId';
      Parameters.ParamValues['UserId'] := TempString.cells[0,TempString.row];
      ExecSQL;

      for i:= 1 to sg1.rowcount - 2 do
      begin
        close;
        sql.text := 'insert into UserPower '+
                    '(UserId,PowerName,PowerString)'+
                    ' values '+
                    '(:UserId,:PowerName,:PowerString)';
        Parameters.ParamValues['UserId'] := TempString.cells[0,TempString.row];
        Parameters.ParamValues['PowerName'] := sg1.Cells[0,i];
        Parameters.ParamValues['PowerString'] := UserPowerArray[i-1,1]+
                                               UserPowerArray[i-1,2]+
                                               UserPowerArray[i-1,3];
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans;
    except
      dmod.ADOConn.RollbackTrans;
      MessageBox(handle,'数据保存失败,请重试!','信息',mb_ok+mb_iconinformation);
      result := false;
    end;
  end;  
end;

procedure Tfrm_power.GetUserPower;
var
  i:integer;
  TempStr:string;
  MySelect:boolean;
begin
  MySelect:=true;
  lbl_UserId.Caption := '用户帐号:'+TempString.Cells[0,TempString.Row];
  lbl_UserName.Caption := '用户名:'+TempString.Cells[1,TempString.Row];
  for i:= 0 to high(UserPowerArray) do
  begin
    UserPowerArray[i,1]:='0';
    UserPowerArray[i,2]:='0';
    UserPowerArray[i,3]:='0';
  end;
  for i:=0 to high(PowerArray) do
  with dmod.ADOQuery1 do
  begin
    close;
    sql.Text := 'select PowerString from UserPower where UserId=:UserId and '+
                'PowerName=:PowerName';
    Parameters.ParamValues['UserId'] := TempString.Cells[0,TempString.row];
    Parameters.ParamValues['PowerName'] := PowerArray[i,0];
    open;

    if not eof then
    begin
      TempStr := FieldByName('PowerString').AsString;
      UserPowerArray[i,1] := copy(TempStr,1,1);
      UserPowerArray[i,2] := copy(TempStr,2,1);
      UserPowerArray[i,3] := copy(TempStr,3,1);
    end;
  end;
  sg1SelectCell(nil,0,1,MySelect);
end;
 
procedure Tfrm_power.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_power.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  i:integer;
begin
  cb_EditEnable.State := cbUnChecked;
  cb_BrowseEnable.State := cbUnChecked;
  cb_PrintEnable.State := cbUnChecked;
  if ARow=sg1.RowCount - 1 then exit;
  if sg1.Cells[0,ARow-1]<>'' then
  begin
  
    cb_EditEnable.Enabled := PowerArray[ARow-1,1]='1';
    cb_BrowseEnable.Enabled := PowerArray[ARow-1,2]='1';
    cb_PrintEnable.Enabled := PowerArray[ARow-1,3]='1';


    if cb_EditEnable.Enabled then
    if UserPowerArray[ARow-1,1] = '1' then
      cb_EditEnable.State := cbChecked;

    if cb_BrowseEnable.Enabled then
    if UserPowerArray[ARow-1,2] = '1' then
      cb_BrowseEnable.State := cbChecked;

    if cb_PrintEnable.Enabled then
    if UserPowerArray[ARow-1,3] = '1' then
      cb_PrintEnable.State := cbChecked;

    if (PowerArray[ARow-1,0]='用户管理') or (PowerArray[ARow-1,0]='权限管理') then
    if TempString.Cells[0,TempString.Row]='superuser' then
    begin
      cb_EditEnable.Enabled := false;
      cb_BrowseEnable.Enabled := false;
      cb_PrintEnable.Enabled := false;
    end;
  end;
end;

procedure Tfrm_power.sbtn_PowerUpClick(Sender: TObject);
var
  MyResult:integer;
begin
  if sg1.RowCount = 2 then exit;
  if sg1.Row = 1 then
  begin
    MyResult:=MessageBox(handle,'已经到达第一个权限项,您要选择最后一个权限项吗?','询问',mb_yesno+mb_iconquestion);
    if MyResult=IdYes then sg1.Row := sg1.RowCount - 2;
  end else sg1.Row := sg1.Row - 1;
end;

procedure Tfrm_power.sbtn_PowerDownClick(Sender: TObject);
var
  MyResult:integer;
begin
  if sg1.RowCount = 2 then exit;
  if sg1.Row = sg1.RowCount -2 then
  begin
    MyResult:=MessageBox(handle,'已经到达最后一个权限项,您要选择第一个权限项?','询问',mb_yesno+mb_iconquestion);
    if MyResult=IdYes then sg1.Row := 1;
  end else sg1.Row := sg1.Row + 1;
end;

procedure Tfrm_power.sbtn_sureClick(Sender: TObject);
begin
  if SaveInfo then close;
end;

procedure Tfrm_power.sbtn_UserUpClick(Sender: TObject);
var
  MyResult:integer;
begin
  SaveInfo;
  if TempString.Row = 1 then
  begin
    MyResult:=MessageBox(handle,'已经到达第一个用户,您要选择最后一个用户吗?','询问',mb_yesno+mb_iconquestion);
    if MyResult=IdYes then TempString.Row := TempString.RowCount - 2;
  end else TempString.Row := TempString.Row - 1;
  sg1.Row := 1;
  GetUserPower;
end;

procedure Tfrm_power.sbtn_UserDownClick(Sender: TObject);
var
  MyResult:integer;
begin
  SaveInfo;
  if TempString.Row = TempString.RowCount - 2 then
  begin
    MyResult:=MessageBox(handle,'已经到达最后一个用户,您要选择第一个用户吗?','询问',mb_yesno+mb_iconquestion);
    if MyResult=IdYes then TempString.Row := 1;
  end else TempString.Row := TempString.Row + 1;
  sg1.Row := 1; 
  GetUserPower;
end;

procedure Tfrm_power.cb_EditEnableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cb_EditEnable.State=cbChecked then
    UserPowerArray[sg1.Row-1,1] := '1'
  else
    UserPowerArray[sg1.Row-1,1] := '0';
end;

procedure Tfrm_power.cb_BrowseEnableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cb_BrowseEnable.State =cbChecked then
    UserPowerArray[sg1.Row-1,2] := '1'
  else
    UserPowerArray[sg1.Row-1,2] := '0';
end;

procedure Tfrm_power.cb_PrintEnableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cb_PrintEnable.State = cbChecked then
    UserPowerArray[sg1.Row-1,3] := '1'
  else
    UserPowerArray[sg1.Row-1,3] := '0';  
end;

end.
