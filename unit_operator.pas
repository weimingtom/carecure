unit unit_operator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids;

type
  Tfrm_operator = class(TForm)
    sg1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    edt_UserID: TEdit;
    edt_UserName: TEdit;
    sbtn_append: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_cancel: TSpeedButton;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_power: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_UserNameKeyPress(Sender: TObject; var Key: Char);
    procedure edt_UserIDKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_cancelClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sg1DblClick(Sender: TObject);
    procedure sbtn_powerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_operator: Tfrm_operator;

implementation
  uses unit_DataModule,publicFunOrPro,unit_TotalPublic;
{$R *.DFM}

procedure Tfrm_operator.FormCreate(Sender: TObject);
var
  i:integer;
begin
  with sg1 do
  begin
    cells[0,0]:='用户帐号';
    cells[1,0]:='用户名';
  end;
  with dmod.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select UserId,UserName from OperatorTable');
    open;
  end;
  i:=1;
  while not dmod.ADOQuery1.Eof do
  begin
    with sg1 do
    begin
      cells[0,i] := dmod.ADOQuery1.FieldByName('UserId').asstring;
      cells[1,i] := dmod.ADOQuery1.FieldByName('UserName').asstring;
    end;
    inc(i);
    dmod.ADOQuery1.next;
  end;
  if i<>1 then sg1.rowcount:=i+1;
  sbtn_Cancel.Enabled := false;
  sbtn_Sure.Enabled := false;

  sbtn_append.Enabled := GetPower(SysUserId,'用户管理','修改权');
  sbtn_edit.Enabled := sbtn_append.Enabled;
  sbtn_delete.Enabled := sbtn_append.Enabled;

  sbtn_power.Enabled := GetPower(SysUserId,'权限管理','浏览权');
end;

procedure Tfrm_operator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frm_Operator:=nil;
end;

procedure Tfrm_operator.edt_UserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key=#13) and sbtn_sure.Enabled then sbtn_SureClick(nil);
end;

procedure Tfrm_operator.edt_UserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then  edt_username.SetFocus;
end;

procedure Tfrm_operator.sbtn_appendClick(Sender: TObject);
begin
  edt_UserId.SetFocus;
  sbtn_Edit.Enabled :=false;
  sbtn_Delete.Enabled :=false;
  sbtn_Cancel.Enabled :=false;
  sbtn_Sure.Enabled := true;
end;

procedure Tfrm_operator.sbtn_deleteClick(Sender: TObject);
var
  str:string;
begin
  str:=sg1.cells[0,sg1.Row];
  if str='' then exit;
  if str='superuser' then
  begin
    MessageBox(handle,'你不能删除超级用户!','信息',mb_ok+mb_iconinformation);
    exit;
  end;
  if messagebox(handle,'你确实要删除这条记录吗？','信息',mb_okcancel+mb_iconquestion)<>IDOK then exit;

  stringgriddelete(sg1,sg1.row);
  with dmod.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('delete from OperatorTable where UserId=:UserId');
    Parameters.ParamValues['UserId']:=str;
    execsql;

    close;
    sql.Text := 'delete from UserPower where UserId=:UserId';
    Parameters.ParamValues['UserId'] := str;
    execSQL;
  end;
  edt_UserId.Text := '';
  edt_UserName.Text := '';
end;

procedure Tfrm_operator.sbtn_editClick(Sender: TObject);
begin
  if sg1.cells[0,sg1.row]='' then exit;
  sbtn_Append.Enabled := false;
  sbtn_Delete.Enabled := false;
  sbtn_Edit.Enabled := false;
  sbtn_Cancel.Enabled := true;
  sbtn_Sure.Enabled := true;
  edt_UserId.Enabled:=false;
  edt_UserId.Text := sg1.cells[0,sg1.Row];
  edt_UserName.Text := sg1.cells[1,sg1.Row];
  edt_UserName.SetFocus;
end;

procedure Tfrm_operator.sbtn_cancelClick(Sender: TObject);
begin
  edt_UserId.Text :='';
  edt_UserName.Text :='';
  edt_UserId.Enabled := true;
  sbtn_Append.Enabled := true;
  sbtn_Delete.Enabled := true;
  sbtn_Edit.Enabled := true;
  sbtn_cancel.Enabled := false;
  sbtn_sure.Enabled := false;
end;

procedure Tfrm_operator.sbtn_sureClick(Sender: TObject);
var
  str:string;
begin
  if sbtn_Append.Enabled then
  begin
    with dmod.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from OperatorTable where UserId=:UserId '+
              ' or UserName=:UserName');
      Parameters.ParamValues['UserId']:=trim(edt_userid.text);
      Parameters.ParamValues['UserName']:=trim(edt_username.text);
      open;
    end;
    if not dmod.ADOQuery1.Eof then
    begin
      messageBox(handle,'对不起，编号或者名称有重复！','信息',mb_ok+mb_iconinformation);
      edt_UserId.SetFocus;
      exit;
    end;
    stringgridinsert(sg1);
    sg1.cells[0,1]:=trim(edt_UserID.text);
    sg1.cells[1,1]:=trim(edt_UserName.text);
    with dmod.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('insert into OperatorTable (UserId,UserName,password) '+
              'values (:UserId,:UserName,:password)');
      Parameters.ParamValues['UserId']:=Trim(edt_UserId.text);
      Parameters.ParamValues['UserName']:=Trim(edt_UserName.text);
      Parameters.ParamValues['password']:='';
      execsql;
    end;
    edt_UserId.Text :='';
    edt_UserName.Text :='';
    edt_UserId.SetFocus;
  end
  else begin
    with dmod.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from OperatorTable where username=:username');
      Parameters.ParamValues['username']:=trim(edt_username.text);
      open;
    end;
    if not dmod.ADOQuery1.Eof then
    if dmod.ADOQuery1.fieldbyname('userid').asstring<>edt_userid.text then
    begin
      messageBox(handle,'对不起，名称有重复！','信息',mb_ok+mb_iconinformation);
      edt_Username.SetFocus;
      exit;
    end;
    sg1.cells[1,sg1.row]:=trim(edt_UserName.Text);
    with dmod.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.Add('update OperatorTable set UserName=:UserName where UserId=:UserId');
      Parameters.ParamValues['UserName'] := trim(edt_UserName.text);
      Parameters.ParamValues['UserId'] := edt_UserId.Text;
      execsql;
    end;
    sbtn_Cancel.Enabled := false;
    sbtn_sure.Enabled := false;
    edt_UserId.Enabled := true;
    sbtn_Append.Enabled := true;
    sbtn_Delete.Enabled := true;
    sbtn_Edit.Enabled := true;
    edt_UserId.Text := '';
    edt_UserName.Text := '';
    edt_userid.SetFocus;
  end;
end;
procedure Tfrm_operator.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_operator.sg1DblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_operator.sbtn_powerClick(Sender: TObject);
begin
  DoPower(sg1);
end;

end.

