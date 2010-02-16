unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,udm, StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, Mask, DBCtrlsEh,
  DBLookupEh, DBGridEh,
  Unit_DataModule;

type
  TFlogin = class(TForm)
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btok: TBitBtn;
    btno: TBitBtn;
    yh: TDBLookupComboboxEh;
    procedure FormShow(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    check:boolean;
    Ftimes:integer;{ Private declarations }
  public
     apppath:string;
    procedure iniapp(qx:int64);

    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation
uses umain, Unit_Main;
{$R *.dfm}

procedure TFlogin.FormShow(Sender: TObject);
begin
 
  Ftimes:=0;
  check:=false;
  yh.SetFocus;
  edit2.text:='8888';
end;

procedure TFlogin.btokClick(Sender: TObject);
var mm:string;qx:int64;
begin
if yh.Text<>'' then
begin
   Ftimes:=Ftimes+1;
   mm:=trim(DMod.tuser.Fieldbyname('passwords').AsString);
   qx:=DMod.tuser.FieldValues['able'];
   if (mm=trim(edit2.text)) and  (qx>1000000000) then
      begin

      
      frm_main.auser.name:=DMod.tuser.FieldValues['userid'];
      frm_main.auser.qx:=qx;
      //frm_main.auser.id:=DMod.tuser.fieldvalues['userid'];

      DMod.toper.Open;
      DMod.toper.append;
      DMod.toper.FieldByName('登录时间').AsDateTime:=now;
      DMod.toper.FieldByName('userid').AsVariant:=frm_main.auser.id;
      DMod.toper.Post;

      DMod.toper.Last;
      frm_main.operid:=DMod.toper.FieldByName('userid').AsVariant ;
      iniapp(qx);
     // showmessage(inttostr(frm_main.operid));

      flogin.Close;
      end
   else
   if ftimes<3 then
   if mm<>trim(edit2.Text) then
   begin
      showmessage('密码不对,请重新录入!');
      edit2.SetFocus;
      exit;
   end else
   begin
       showmessage('你的权限数据被破坏!请与管理员联系重新分配!');
       yh.SetFocus;
       exit;
   end
   else
   begin
   showmessage('对不起,你没有通过口令认证!');
   application.Terminate;
   end;


end;
end;

procedure TFlogin.iniapp(qx: int64);
var i,j:integer;
begin
  for i:=0 to frm_main.MainMenu1.items.Count-1 do
   for j:=0 to frm_main.MainMenu1.Items[i].Count-1 do
   frm_main.MainMenu1.items[i].Items[j].Enabled:=false;
    qx:=qx xor 1234567890;
   qx:=qx shr 10;
   for i:=0 to 6 do //共有7 种权限
   if ((1 shl i) and qx)<>0 then
   case i of

     0:begin
        frm_main.mnuGoodsRetail.Enabled:=true;
        frm_main.mnuGoodsWholeSale.Enabled:=true;
        //frm_main.crlist1.Enabled:=true;
        end;
     1:begin
        frm_main.mnuGoodsCheckIn.Enabled:=true;
        frm_main.mnuGoodsBizReturn.Enabled:=true;
        frm_main.mnuGoodsLoss.Enabled:=true;
        frm_main.mnuStoreLimite.Enabled:=true;
        frm_main.mnuStoreCheck.Enabled:=true;
        frm_main.mnuStoreList.Enabled:=true;

       end;
     2:begin
        frm_main.mnuSalesStatistic.Enabled:=true;
        //frm_main.kctj.Enabled:=true;
        frm_main.mnuReceiptQuery.Enabled:=true;
        //frm_main.support.Enabled:=true;
       end;
     3:begin
        //frm_main.yplist1.Enabled:=true;
        //frm_main.ypadd.Enabled:=true;
        //frm_main.ypedit.Enabled:=true;
        //frm_main.ypprice.Enabled:=true;
       end;
     4:begin
        //frm_main.yg1.Enabled:=true;
        //frm_main.bm1.Enabled:=true;
        //frm_main.company1.Enabled:=true;
       end;
     5:begin
        //frm_main.user1.Enabled:=true;
       end;
     6:begin
        //frm_main.back1.Enabled:=true;
       end;

     end;
        frm_main.mnuPassword.Enabled:=true;
        frm_main.mnuReLogin.Enabled:=true;
        frm_main.mnuSysExit.Enabled:=true;
        frm_main.mnuHelp.Enabled:=true;
        frm_main.mnuAbout.Enabled:=true;
        
        check:=true;
        frm_main.Bar1.Panels[1].Text:='操作员:'+frm_main.auser.name;
        frm_main.Bar1.Panels[2].Text:='深度工作室 邮箱:server@deepcast.net';
end;

procedure TFlogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if not check then
 btno.Click
else canclose:=true;
end;

procedure TFlogin.btnoClick(Sender: TObject);
begin
  application.Terminate;

end;

procedure TFlogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  sendmessage(handle,wm_keydown,vk_tab,0);
end;

procedure TFlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
btok.Click;
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin
   apppath:=extractfilepath(application.ExeName);
end;

end.
