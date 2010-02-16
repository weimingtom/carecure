unit unit_UserLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_DataModule, StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, Mask,
  DBCtrlsEh,
  DBLookupEh, DBGridEh,
  WinSkinData, ComCtrls,
  shellapi;

type
  Tfrm_UserLogin = class(TForm)
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btok: TBitBtn;
    btno: TBitBtn;
    cbbUsername: TDBLookupComboboxEh;
    lblLoginTitle: TLabel;
    lblLoginSlogan: TLabel;
    lblTimeNow: TLabel;
    tmrSysTime: TTimer;
    lblSetTime: TLabel;
    imgLogo: TImage;
    skindata2: TSkinData;
    procedure FormShow(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure tmrSysTimeTimer(Sender: TObject);
    procedure lblSetTimeClick(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
  private
    check: boolean;
    Ftimes: integer; { Private declarations }
  public
    apppath: string;
    logined, relogin: boolean;
    { Public declarations }
  end;

var
  frm_UserLogin: Tfrm_UserLogin;

implementation
uses Unit_Main, PublicFunOrPro, Unit_MainFunPro;
{$R *.dfm}

procedure Tfrm_UserLogin.FormShow(Sender: TObject);
var
  s: string;
begin
  DateTimeToString(s, 'yyyy-mm-dd hh:mm:ss', now);
  lblTimeNow.Caption := s;
  Ftimes := 0;
  check := false;
  cbbUsername.SetFocus;
  edtPassword.text := '8888';
  cbbUsername.Text := 'superuser';
  btok.SetFocus;
  //btok.Click();
  keybd_event(VK_RETURN, $a ,0,0);
end;

procedure Tfrm_UserLogin.btokClick(Sender: TObject);
var
  UserPassword: string;
  UserPower: int64;
begin
  if cbbUsername.Text <> '' then
  begin
    Ftimes := Ftimes + 1;
    UserPassword := trim(DMod.tuser.Fieldbyname('passwords').AsString);
    UserPower := DMod.tuser.FieldValues['able'];
    if (UserPassword = trim(edtPassword.text)) and (UserPower > 1000000000) then
    begin

      frm_main.auser.name := DMod.tuser.FieldValues['username'];
      frm_main.auser.UserPower := UserPower;
      frm_main.auser.id := DMod.tuser.fieldvalues['userid'];

      DMod.toper.Open;
      DMod.toper.append;
      DMod.toper.FieldByName('登录时间').AsDateTime := now;
      DMod.toper.FieldByName('userid').AsVariant := frm_main.auser.id;
      DMod.toper.Post;

      DMod.toper.Last;
      frm_main.operid := DMod.toper.FieldByName('userid').AsVariant;
      initialUserLogin(UserPower);
      //showmessage(inttostr(frm_main.operid));
     check := true;
     logined := true;
      frm_UserLogin.Close;
    end
    else if ftimes < 3 then
      if UserPassword <> trim(edtPassword.Text) then
      begin
        showmessage('密码不对,请重新录入!');
        edtPassword.SetFocus;
        exit;
      end
      else
      begin
        showmessage('你的权限数据被破坏!请与管理员联系重新分配!');
        cbbUsername.SetFocus;
        exit;
      end
    else
    begin
      showmessage('对不起,你没有通过口令认证!');
      application.Terminate;
    end;

  end;
end;


procedure Tfrm_UserLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not check then
    btno.Click
  else
    canclose := true;
end;

procedure Tfrm_UserLogin.btnoClick(Sender: TObject);
begin
  application.Terminate;

end;

procedure Tfrm_UserLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    sendmessage(handle, wm_keydown, vk_tab, 0);
end;

procedure Tfrm_UserLogin.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btok.Click;
end;

procedure Tfrm_UserLogin.FormCreate(Sender: TObject);
begin
  apppath := extractfilepath(application.ExeName);
end;

procedure Tfrm_UserLogin.tmrSysTimeTimer(Sender: TObject);
var
  s: string;
begin
  DateTimeToString(s, 'yyyy-mm-dd hh:mm:ss', now);
  lblTimeNow.Caption := s;

end;

procedure Tfrm_UserLogin.lblSetTimeClick(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL timedate.cpl,,0',
    SW_SHOWNORMAL);
end;

procedure Tfrm_UserLogin.imgLogoClick(Sender: TObject);
begin
  shellexecute(handle, 'open', pchar('http://www.deepcast.net/?fromcarecure'),
    nil, nil, sw_show)
end;

end.
