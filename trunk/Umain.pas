unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMenu, ComCtrls, ToolWin, ExtCtrls,   ImgList,  Buttons,
  jpeg,udm,uypzdk,uxl,udj, Uypzdk2,uyg,urk,uxstj, ukctj,ulogin, StdCtrls,uty,ubs,upd,ukl,ukc,upf,uls,uac,ucr,uback,uuser;


type userinfo=record
       name:string;
       qx:int64;
       id:int64;
       end;
type
  Tfmain = class(TForm)
    MainMenu1: TMainMenu;
    yp: TMenuItem;
    ch: TMenuItem;
    dm: TMenuItem;
    exit: TMenuItem;
    tj: TMenuItem;
    pd1: TMenuItem;
    N18: TMenuItem;
    kclist1: TMenuItem;
    yplist1: TMenuItem;
    ypprice: TMenuItem;
    ypadd: TMenuItem;
    N24: TMenuItem;
    bm1: TMenuItem;
    xstj: TMenuItem;
    xs: TMenuItem;
    pf1: TMenuItem;
    ls1: TMenuItem;
    bs1: TMenuItem;
    rk1: TMenuItem;
    ty1: TMenuItem;
    N12: TMenuItem;
    crlist1: TMenuItem;
    N14: TMenuItem;
    djsearch: TMenuItem;
    support: TMenuItem;
    company1: TMenuItem;
    xl1: TMenuItem;
    N29: TMenuItem;
    mm: TMenuItem;
    user1: TMenuItem;
    relogin: TMenuItem;
    quit: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    back1: TMenuItem;
    yg1: TMenuItem;
    XPMenu1: TXPMenu;
    ypedit: TMenuItem;
    help: TMenuItem;
    about: TMenuItem;
    CoolBar1: TCoolBar;
    scroll1: TPageScroller;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    StatusBar1: TStatusBar;
    kctj: TMenuItem;
    systemhelp: TMenuItem;
    N41: TMenuItem;
    Image1: TImage;
    Timer1: TTimer;
    GSP1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure quitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure yplist1Click(Sender: TObject);
    procedure ypaddClick(Sender: TObject);
    procedure ypeditClick(Sender: TObject);
    procedure yppriceClick(Sender: TObject);
    procedure yg1Click(Sender: TObject);
    procedure bm1Click(Sender: TObject);
    procedure company1Click(Sender: TObject);
    procedure rk1Click(Sender: TObject);
    procedure ty1Click(Sender: TObject);
    procedure bs1Click(Sender: TObject);
    procedure pd1Click(Sender: TObject);
    procedure kclist1Click(Sender: TObject);
    procedure pf1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aboutClick(Sender: TObject);
    procedure systemhelpClick(Sender: TObject);
    procedure supportClick(Sender: TObject);
    procedure ls1Click(Sender: TObject);
    procedure crlist1Click(Sender: TObject);
    procedure back1Click(Sender: TObject);
    procedure user1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure xl1Click(Sender: TObject);
    procedure reloginClick(Sender: TObject);
    procedure mmClick(Sender: TObject);
    procedure xstjClick(Sender: TObject);
    procedure djsearchClick(Sender: TObject);
    procedure kctjClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
   FClientInstance,
   FPrevClientProc : TFarProc;

   PROCEDURE ClientWndProc(VAR Message: TMessage);

  public
    auser:userinfo;{ Public declarations }
    operid:string;
   end;

var

  fmain: Tfmain;
  ypzdk:tfypzdk;
  ypzdk2:tfypzdk2;
  yg:tfyg;
  rk:tfrk;
  ty:tfty;
  bs:tfbs ;
  pd:tfpd;
  kc:tfkc;
  pf:tfpf ;
  ls:tfls;
  ac:tfac;
  cr:tfcr;
  back:tfback;
  user:tfuser;
  xl:tfxl;
  kl:tfkl;
  xstj1:tfxstj ;
  dj:tfdj;
  kctj1:tfkctj;
implementation

uses upreview;



{$R *.dfm}
PROCEDURE TFmain.ClientWndProc(VAR Message: TMessage); 
VAR 
  MyDC : hDC; 
  Ro, Co : Word; 
begin 
   with Message do
    case Msg of
      WM_ERASEBKGND:
        begin
          MyDC := TWMEraseBkGnd(Message).DC;
          FOR Ro := 0 TO ClientHeight DIV Image1.Picture.Height DO
            FOR Co := 0 TO ClientWIDTH DIV Image1.Picture.Width DO
              BitBlt(MyDC, Co*Image1.Picture.Width, Ro*Image1.Picture.Height,
                Image1.Picture.Width, Image1.Picture.Height,
                Image1.Picture.Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
          Result := 1;
        end;
    else
       Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam, lParam);
    end;
end; 

    


procedure Tfmain.quitClick(Sender: TObject);
begin
close;
end;

procedure Tfmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=application.MessageBox('你真的要退出吗？','退出',mb_yesno)=idyes ;
if canclose then
begin
  try
  adodm.tcr.close;
  adodm.tdw.close;
  adodm.tbm.close;
  adodm.tyg.close;
  adodm.tuser.Close;
  adodm.tkc.Close;
  adodm.ydconn.Close;
  except
  end;
end;
end;

procedure Tfmain.yplist1Click(Sender: TObject);

begin
if application.FindComponent('fypzdk')=nil then
begin
ypzdk:=tfypzdk.create(application) ;
ypzdk.Show;
end
else
if not ypzdk.Showing then
ypzdk.Show;
end;
procedure Tfmain.ypaddClick(Sender: TObject);
begin
yplist1.Click;
ypzdk.BitBtn2.Click;
end;

procedure Tfmain.ypeditClick(Sender: TObject);
begin
yplist1.Click;
ypzdk.search.SetFocus;
end;

procedure Tfmain.yppriceClick(Sender: TObject);
begin

if not fypzdk2.Showing then
fypzdk2.Show;
fypzdk2.sp1.Show;
fypzdk2.look1.Show;
fypzdk2.btadd.Visible:=false;
fypzdk2.ls.Enabled:=true;
fypzdk2.pf.Enabled:=true;

end;

procedure Tfmain.yg1Click(Sender: TObject);
begin
if application.FindComponent('fyg')=nil then
begin
yg:=tfyg.create(application) ;
yg.Show;
end
else
if not yg.Showing then
yg.Show;
yg.TabSheet1.Show;

end;

procedure Tfmain.bm1Click(Sender: TObject);
begin
if application.FindComponent('fyg')=nil then
begin
yg:=tfyg.create(application) ;
yg.Show;
end
else
if not yg.Showing then
yg.Show;
yg.TabSheet2.Show;

end;

procedure Tfmain.company1Click(Sender: TObject);
begin
if application.FindComponent('fyg')=nil then
begin
yg:=tfyg.create(application) ;
yg.Show;
end
else
if not yg.Showing then
yg.Show;
yg.TabSheet3.Show;
end;

procedure Tfmain.rk1Click(Sender: TObject);
begin
if application.FindComponent('frk')=nil then
begin
rk:=tfrk.create(application) ;
rk.Show;
end
else
if not rk.Showing then
rk.Show;
rk.Edit1.Text:=auser.name;


end;

procedure Tfmain.ty1Click(Sender: TObject);
begin
 if application.FindComponent('fty')=nil then
begin
ty:=tfty.create(application) ;
ty.Show;
end
else
if not ty.Showing then
ty.Show;
ty.Edit1.Text:=auser.name;
end;

procedure Tfmain.bs1Click(Sender: TObject);
begin
if application.FindComponent('fbs')=nil then
begin
bs:=tfbs.create(application) ;
bs.Show;
end
else
if not bs.Showing then
bs.Show;
bs.Edit1.Text:=auser.name;
end;

procedure Tfmain.pd1Click(Sender: TObject);
begin
if application.FindComponent('fpd')=nil then
begin
pd:=tfpd.create(application) ;
pd.Show;
end
else
if not pd.Showing then
pd.Show;
pd.Edit1.Text:=auser.name;
end;

procedure Tfmain.kclist1Click(Sender: TObject);
begin
if application.FindComponent('fkc')=nil then
begin
kc:=tfkc.create(application) ;
kc.Show;
end
else
if not kc.Showing then
kc.Show;

end;


procedure Tfmain.pf1Click(Sender: TObject);
begin
if application.FindComponent('fpf')=nil then
begin
pf:=tfpf.create(application) ;
pf.Show;
end
else
if not pf.Showing then
pf.Show;
pf.Edit1.Text:=auser.name;
end;

procedure Tfmain.FormCreate(Sender: TObject);
begin
   FClientInstance := MakeObjectInstance(ClientWndProc);
   FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC)); 
   SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));
   end;

procedure Tfmain.aboutClick(Sender: TObject);
begin
 if application.FindComponent('fac')=nil then
begin
ac:=tfac.create(application) ;
ac.Label4.Caption:='欢迎使用会达公司软件产品！' ;
ac.ShowModal;

end
else
if not ac.Showing then
ac.Show;
end;

procedure Tfmain.systemhelpClick(Sender: TObject);
begin
//showmessage('本软件是测试版本，不包括此项功能！');
end;

procedure Tfmain.supportClick(Sender: TObject);
begin
{showmessage('本软件是测试版本，不包括此项功能！');}
end;

procedure Tfmain.ls1Click(Sender: TObject);
begin
if application.FindComponent('fls')=nil then
begin
ls:=tfls.create(application) ;
ls.Show;

end
else
if not ls.Showing then
ls.Show;

ls.Edit1.Text:=auser.name;
end;



procedure Tfmain.crlist1Click(Sender: TObject);
begin
if application.FindComponent('fcr')=nil then
begin
cr:=tfcr.create(application) ;
cr.Show;
end
else
if not cr.Showing then
cr.Show;

end;

procedure Tfmain.back1Click(Sender: TObject);
begin
if application.FindComponent('fback')=nil then
begin
back:=tfback.create(application) ;
back.Show;
end
else
if not back.Showing then
back.Show;
end;

procedure Tfmain.user1Click(Sender: TObject);
begin
if application.FindComponent('fuser')=nil then
begin
user:=tfuser.create(application) ;
user.Show;
end
else
if not user.Showing then
user.Show;
end;

procedure Tfmain.FormShow(Sender: TObject);
begin
//flogin.Edit2.Text:='';

//flogin.Show;
end;

procedure Tfmain.Timer1Timer(Sender: TObject);
begin
statusbar1.Panels[0].Text:='当前时间：'+datetimetostr(now);
end;

procedure Tfmain.xl1Click(Sender: TObject);
begin
if application.FindComponent('fxl')=nil then
begin
xl:=tfxl.create(application) ;
xl.Show;
end
else
if not xl.Showing then
xl.Show;

end;

procedure Tfmain.reloginClick(Sender: TObject);
begin
adodm.toper.Open;
if adodm.toper.Locate('operid',operid,[]) then
    begin
          adodm.toper.edit;
          adodm.toper.FieldByName('退出时间').AsDateTime:=now;
          adodm.toper.Post;
    end;
flogin.ShowModal;
end;

procedure Tfmain.mmClick(Sender: TObject);
begin
if application.FindComponent('fkl')=nil then
begin
kl:=tfkl.create(application) ;
kl.Show;
end
else
if not kl.Showing then
kl.Show;

end;

procedure Tfmain.xstjClick(Sender: TObject);
begin
if application.FindComponent('fxstj')=nil then
begin
xstj1:=tfxstj.create(application) ;
xstj1.Show;
end
else
if not xstj1.Showing then
xstj1.Show;
end;

procedure Tfmain.djsearchClick(Sender: TObject);
begin
if application.FindComponent('fdj')=nil then
begin
dj:=tfdj.create(application) ;
dj.Show;
end
else
if not dj.Showing then
dj.Show;
end;


procedure Tfmain.kctjClick(Sender: TObject);
begin
 if application.FindComponent('fkctj')=nil then
begin
kctj1:=tfkctj.create(application) ;
kctj1.Show;
end
else
if not kctj1.Showing then
kctj1.Show;
end;

procedure Tfmain.N2Click(Sender: TObject);
begin
fpreview.frrk.DesignReport;
end;

end.
