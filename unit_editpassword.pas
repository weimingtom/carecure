unit unit_editpassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  Tfrm_editpassword = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    medt1: TMaskEdit;
    medt2: TMaskEdit;
    medt3: TMaskEdit;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure medt1KeyPress(Sender: TObject; var Key: Char);
    procedure medt2KeyPress(Sender: TObject; var Key: Char);
    procedure medt3KeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_sureClick(Sender: TObject);
    procedure sbtn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure password_ref;
  end;

var
  frm_editpassword: Tfrm_editpassword;

implementation
  uses unit_main,unit_TotalPublic, Unit_DataModule;
{$R *.DFM}

procedure Tfrm_editpassword.password_ref ;
begin
  sbtn_sure.Enabled := GetPower(SysUserId,'用户修改密码','修改权');
end;

procedure Tfrm_editpassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_editpassword:=nil;
end;

procedure Tfrm_editpassword.medt1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then medt2.SetFocus;
end;

procedure Tfrm_editpassword.medt2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then medt3.SetFocus;
end;

procedure Tfrm_editpassword.medt3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then sbtn_sureclick(nil);
end;

procedure Tfrm_editpassword.sbtn_sureClick(Sender: TObject);
begin
  with dmod.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select passwords from OperatorTable where UserId=:UserId');
    Parameters.ParamValues['UserId']:=SysUserId;
//    parambyname('UserId').asstring:=SysUserId;
    open;
  end;
  if uppercase(dmod.ADOQuery1.fieldbyname('passwords').asstring)<>uppercase(trim(medt1.text)) then
  begin
    messagebox(handle,'旧密码输入有误！','信息',mb_ok+mb_iconinformation);
    medt1.setfocus;
    exit;
  end;
  if uppercase(trim(medt2.text))<>uppercase(trim(medt3.text)) then
  begin
    messagebox(handle,'新密码和确认密码不同，请重新确认！','信息',mb_ok+mb_iconinformation);
    medt2.setfocus;
    exit;
  end;
  with dmod.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('update OperatorTable set passwords=:passwords where UserId=:UserId');
//    parambyname('UserId').asstring:=SysUserId;
//    parambyname('passwords').asstring:=trim(medt2.text);
    Parameters.ParamValues['UserId']:=SysUserId;
    Parameters.ParamValues['passwords']:=trim(medt2.text);
    execsql;
  end;
  messagebox(handle,'密码已经成功修改！','提示',mb_ok+mb_iconinformation);
  close;
end;

procedure Tfrm_editpassword.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

end.
