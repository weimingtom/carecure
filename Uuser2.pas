unit Uuser2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TFuser2 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    Label5: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure checkstr(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fuser2: TFuser2;

implementation

uses udm;

{$R *.dfm}

procedure TFuser2.checkstr(Sender: TObject);
begin
if trim((sender as Tdbedit).Text)='' then
  begin
     showmessage('此栏必须填写信息!');
     (sender as tdbedit).SetFocus; 
  end;
end;

procedure TFuser2.Button2Click(Sender: TObject);
begin
  adodm.tuser.Cancel;
  close;
end;

procedure TFuser2.FormShow(Sender: TObject);
begin
  dbedit1.SetFocus;
end;

procedure TFuser2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adodm.tuser.cancel;
end;

procedure TFuser2.BitBtn1Click(Sender: TObject);
begin
  if trim(dbedit1.Text)='' then
  dbedit1.SetFocus else
  if trim(dbedit2.Text)='' then
  dbedit2.SetFocus else
  if trim(dbedit3.Text)='' then
  dbedit3.SetFocus else
  if trim(edit1.Text)='' then
  edit1.SetFocus else
  if dbedit3.Text<>edit1.Text then
  begin
  showmessage('两次录入的密码不同，请确认密码！');
  edit1.SetFocus;
  end
  else
  begin

  adodm.tuser.Post;
  fuser2.ModalResult:=mrok;
  end;
end;

procedure TFuser2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  sendmessage(handle,wm_keydown,vk_tab,0);

end;

procedure TFuser2.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
