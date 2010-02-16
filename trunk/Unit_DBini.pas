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
    edtDataSource: TEdit;
    dlgOpenDataSource: TOpenDialog;
    btnSearchBegin: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure edt_UserIdKeyPress(Sender: TObject; var Key: Char);
    procedure medt_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataSourceKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchBeginClick(Sender: TObject);
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
  if trim(edtDataSource.Text) = '' then
  begin
    messagebox(application.Handle,'数据源不能为空!','提示',mb_ok+mb_iconinformation);
    edtDataSource.SetFocus;
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
  DBFile := tinifile.Create(extractfilepath(application.ExeName)+ 'CareCure.ini');
  DBFile.writestring('caredata','DB_Source',trim(edtDataSource.Text));
  DBFile.writestring('caredata','DB_User',trim(edt_userid.Text));
  DBFile.writestring('caredata','DB_Password',trim(medt_password.Text));
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

procedure Tfrm_DBini.edtDataSourceKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then edt_UserId.SetFocus;
end;

procedure Tfrm_DBini.FormCreate(Sender: TObject);
var
  DBFile : Tinifile ;
begin
  DBFile := tinifile.Create(extractfilepath(application.ExeName)+ 'CareCure.ini');
  edtDataSource.Text := DBFile.ReadString('caredata','DB_Source','data/caremdb.mdb');
  edt_userid.Text := DBFile.ReadString('caredata','DB_User','admin');
  medt_password.Text := DBFile.ReadString('caredata','DB_Password','caredata');
  DBFile.Free;
end;

procedure Tfrm_DBini.btnSearchBeginClick(Sender: TObject);
begin
  dlgOpenDataSource.filter := 'ACCESS数据库文件 (*.mdb)|*.mdb';
  dlgOpenDataSource.initialdir := extractfilepath(application.ExeName) + 'data';
  if dlgOpenDataSource.execute then
    edtDataSource.Text := dlgOpenDataSource.filename;
    dlgOpenDataSource.HistoryList.Insert(0,dlgOpenDataSource.FileName);//实现自动历史文件名加载
end;

end.
