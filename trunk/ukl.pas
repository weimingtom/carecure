unit ukl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,Unit_DataModule;

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
showmessage('��¼�������');
old.SetFocus;
exit;
end;

if trim(new.Text)='' then
begin
showmessage('��¼��������');
new.SetFocus;
exit;
end;
if trim(new2.Text)='' then
begin
showmessage('����֤������');
new2.SetFocus;
exit;
end;
if new.Text<>new2.Text then
begin
showmessage('����֤������');
new2.SetFocus;
exit;
end;

if DMod.tuser.Locate('userid',fmain.auser.id,[]) then
  begin
   if DMod.tuser.FieldByName('password').Asstring<>trim(old.Text) then
      begin
      showmessage('ԭ���벻�ԣ�������¼��');
      old.SetFocus;
      end
    else
      begin
      DMod.tuser.Open;
      DMod.tuser.Edit;
      DMod.tuser.FieldByName('password').Asstring:=new.Text;
      DMod.tuser.Post;
      end;
  end
  else showmessage('��ǰ�û���Ϣ���ƻ���������¼����ٽ����޸�');
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