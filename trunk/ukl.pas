unit ukl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,udm;

type
  TFkl = class(TForm)
    old: TEdit;
    new: TEdit;
    new2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fkl: TFkl;

implementation
 uses umain;
{$R *.dfm}

procedure TFkl.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFkl.BitBtn1Click(Sender: TObject);

begin
if trim(old.Text)='' then
begin
showmessage('请录入旧密码');
old.SetFocus;
exit;
end;

if trim(new.Text)='' then
begin
showmessage('请录入新密码');
new.SetFocus;
exit;
end;
if trim(new2.Text)='' then
begin
showmessage('请验证新密码');
new2.SetFocus;
exit;
end;
if new.Text<>new2.Text then
begin
showmessage('请验证新密码');
new2.SetFocus;
exit;
end;

if adodm.tuser.Locate('userid',fmain.auser.id,[]) then
  begin
   if adodm.tuser.FieldByName('password').Asstring<>trim(old.Text) then
      begin
      showmessage('原密码不对！请重新录入');
      old.SetFocus;
      end
    else
      begin
      adodm.tuser.Open;
      adodm.tuser.Edit;
      adodm.tuser.FieldByName('password').Asstring:=new.Text;
      adodm.tuser.Post;
      end;
  end
  else showmessage('当前用户信息被破坏，请重新录入后再进行修改');
  close;



end;

procedure TFkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TFkl.FormActivate(Sender: TObject);
begin
top:=150;
end;

end.
