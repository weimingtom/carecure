unit unit_login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  Tfrm_login = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    medt_password: TMaskEdit;
    Label3: TLabel;
    edt_UserId: TEdit;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure edt_UserIdKeyPress(Sender: TObject; var Key: Char);
    procedure medt_passwordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    logined,relogin:boolean;
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation
  uses unit_data,unit_main ,PublicFunOrPro, unit_TotalPublic,
  Unit_DataModule;
{$R *.DFM}

procedure Tfrm_login.sbtn_closeClick(Sender: TObject);
begin
  logined:=false;
  close;
end;

procedure Tfrm_login.sbtn_sureClick(Sender: TObject);
var
  str,str1:string;
begin
//  with dmod.qrydata do
  with dmod.ADOQuery1 do
  begin
    close;
    sql.Text := 'select UserId,UserName,password from OperatorTable where UserId=:UserId';
//    ParamByName('UserId').asstring:=trim(edt_UserId.Text);
    Parameters.ParamValues['UserId']:=trim(edt_UserId.Text);
    open;
    if eof then
    begin
      messagebox(self.handle,'用户帐号错误!','信息',mb_ok+mb_iconinformation);
      exit;
    end;
//    close;
//    sql.Text :='select UserName,password from OperatorTable where UserId=:UserId';
//    ParamByName('UserId').asstring := trim(edt_UserId.Text);
//    open;


//    if fieldbyname('password').asstring<>medt_password.text then
    if fieldbyname('password').asstring<>medt_password.text then
    begin
      messagebox(self.handle,'密码错误!','信息',mb_ok+mb_iconinformation);
      medt_password.SetFocus;
      exit;
    end;
    str:=fieldbyname('UserName').asstring;

    close;
    sql.Text := 'select unitname from unit';
    open;
    str1:=fieldbyname('unitname').asstring;
  end;
  frm_main.bar1.Panels[0].Text := '登录用户：'+str;
  frm_main.bar1.Panels[1].Text := '使用单位：'+str1;
  str:=datetostring(Date);
  frm_main.bar1.Panels[2].Text :=
    '当前日期：'+copy(str,1,4)+'年'+copy(str,6,2)+'月'+copy(str,9,2)+'日';
  SysUserId := trim(edt_UserId.Text);
  SysUserName := str;
  logined:=true;
  InitializePrj;
  close;
end;

procedure Tfrm_login.edt_UserIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then medt_password.SetFocus;
end;

procedure Tfrm_login.medt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then sbtn_sureClick(nil);
end;

end.
