unit unit_Dbini;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons,inifiles;

type
  Tfrm_DBini = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    medt_password: TMaskEdit;
    Label3: TLabel;
    edt_UserId: TEdit;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    Label4: TLabel;
    Edit_Dns: TEdit;
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure edt_UserIdKeyPress(Sender: TObject; var Key: Char);
    procedure medt_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_DnsKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    logined,relogin:boolean;
    { Public declarations }
  end;

var
  frm_DBini: Tfrm_DBini;

implementation
{$R *.DFM}

procedure Tfrm_DBini.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_DBini.sbtn_sureClick(Sender: TObject);
var
  DBFile : Tinifile ;
begin
  if trim(edit_dns.Text) = '' then
  begin
    messagebox(application.Handle,'数据源不能为空!','提示',mb_ok+mb_iconinformation);
    edit_dns.SetFocus;
    exit ;
  end ;
  if trim(edt_userid.Text) = '' then
  begin
    messagebox(application.Handle,'用户名不能为空!','提示',mb_ok+mb_iconinformation);
    edt_userid.SetFocus;
    exit ;
  end ;
  if trim(medt_password.Text) = '' then
  begin
    messagebox(application.Handle,'密码不能为空!','提示',mb_ok+mb_iconinformation);
    medt_password.SetFocus;
    exit ;
  end ;
  DBFile := tinifile.Create(extractfilepath(application.ExeName)+ 'DBConn.ini');
  DBFile.writestring('CareCure','DB_Source',trim(edit_dns.Text));
  DBFile.writestring('CareCure','DB_User',trim(edt_userid.Text));
  DBFile.writestring('CareCure','DB_Password',trim(medt_password.Text));
  DBFile.Free;
  close;
end;

procedure Tfrm_DBini.edt_UserIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then medt_password.SetFocus;
end;

procedure Tfrm_DBini.medt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then sbtn_sureClick(nil);
end;

procedure Tfrm_DBini.Edit_DnsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then edt_UserId.SetFocus;
end;

procedure Tfrm_DBini.FormCreate(Sender: TObject);
var
  DBFile : Tinifile ;
begin
  DBFile := tinifile.Create(extractfilepath(application.ExeName)+ 'DBConn.ini');
  edit_dns.Text := DBFile.ReadString('CareCure','DB_Source','data/caremdb.mdb');
  edt_userid.Text := DBFile.ReadString('CareCure','DB_User','admin');
  medt_password.Text := DBFile.ReadString('CareCure','DB_Password','carecure');
  DBFile.Free;
end;

end.
