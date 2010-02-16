unit unit_UserLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_DataModule, StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, Mask,
  DBCtrlsEh,
  DBLookupEh, DBGridEh,
  WinSkinData, ComCtrls;

type
  Tfrm_UserLogin = class(TForm)
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btok: TBitBtn;
    btno: TBitBtn;
    yh: TDBLookupComboboxEh;
    mmoLoginPrompt: TMemo;
    lblLoginTitle: TLabel;
    lblLoginSlogan: TLabel;
    lblTimeNow: TLabel;
    lblTimeTitle: TLabel;
    tmrSysTime: TTimer;
    btnTimeSet: TButton;
    skindata2: TSkinData;
    procedure FormShow(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure tmrSysTimeTimer(Sender: TObject);
    procedure btnTimeSetClick(Sender: TObject);
  private
    check: boolean;
    Ftimes: integer; { Private declarations }
  public
    apppath: string;
    procedure iniapp(qx: int64);

    { Public declarations }
  end;

var
  frm_UserLogin: Tfrm_UserLogin;

implementation
uses umain, Unit_Main;
{$R *.dfm}

procedure Tfrm_UserLogin.FormShow(Sender: TObject);
begin

  Ftimes := 0;
  check := false;
  yh.SetFocus;
  edit2.text := '8888';
end;

procedure Tfrm_UserLogin.btokClick(Sender: TObject);
var
  mm: string;
  qx: int64;
begin
  if yh.Text <> '' then
  begin
    Ftimes := Ftimes + 1;
    mm := trim(DMod.tuser.Fieldbyname('passwords').AsString);
    qx := DMod.tuser.FieldValues['able'];
    if (mm = trim(edit2.text)) and (qx > 1000000000) then
    begin

      frm_main.auser.name := DMod.tuser.FieldValues['userid'];
      frm_main.auser.qx := qx;
      //frm_main.auser.id:=DMod.tuser.fieldvalues['userid'];

      DMod.toper.Open;
      DMod.toper.append;
      DMod.toper.FieldByName('登录时间').AsDateTime := now;
      DMod.toper.FieldByName('userid').AsVariant := frm_main.auser.id;
      DMod.toper.Post;

      DMod.toper.Last;
      frm_main.operid := DMod.toper.FieldByName('userid').AsVariant;
      iniapp(qx);
      // showmessage(inttostr(frm_main.operid));

      frm_UserLogin.Close;
    end
    else if ftimes < 3 then
      if mm <> trim(edit2.Text) then
      begin
        showmessage('密码不对,请重新录入!');
        edit2.SetFocus;
        exit;
      end
      else
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

procedure Tfrm_UserLogin.iniapp(qx: int64);
var
  i, j: integer;
begin
  for i := 0 to frm_main.MainMenu1.items.Count - 1 do
    for j := 0 to frm_main.MainMenu1.Items[i].Count - 1 do
    begin
      frm_main.MainMenu1.items[i].Items[j].Enabled := false;
      frm_main.MainMenu1.items[i].Items[j].Visible := false;
    end;

  qx := qx xor 1234567890;
  qx := qx shr 10;
  for i := 0 to 18 do //最多支持64种权限,目前分为19种权限
    if ((1 shl i) and qx) <> 0 then
      case i of
        0:
          begin
            frm_main.mnuCustomerRegister.Enabled := true;
            frm_main.mnuFrontCheck.Enabled := true;
            frm_main.mnuGoodsRetail.Enabled := true;
            frm_main.mnuGoodsWholeSale.Enabled := true;
            frm_main.mnuCustomerRegister.Visible := true;
            frm_main.mnuFrontCheck.Visible := true;
            frm_main.mnuGoodsRetail.Visible := true;
            frm_main.mnuGoodsWholeSale.Visible := true;
          end;
        1:
          begin
            frm_main.mnuDayStatistic.Enabled := true;
            frm_main.mnuMonthStatistic.Enabled := true;
            frm_main.mnuSalesStatistic.Enabled := true;
            frm_main.mnuAdjustSaleStat.Enabled := true;
            frm_main.mnuDayStatistic.Visible := true;
            frm_main.mnuMonthStatistic.Visible := true;
            frm_main.mnuSalesStatistic.Visible := true;
            frm_main.mnuAdjustSaleStat.Visible := true;
          end;
        2:
          begin
            frm_main.mnuReceiptQuery.Enabled := true;
            frm_main.mnuWholeSaleSummary.Enabled := true;
            frm_main.mnuReceiptQuery.Visible := true;
            frm_main.mnuWholeSaleSummary.Visible := true;
          end;
        3:
          begin
            frm_main.mnuMemberBuyQuery.Enabled := true;
            frm_main.mnuMemberBuyQuery.Visible := true;
          end;
        4:
          begin
            frm_main.mnuGoodsDictionary.Enabled := true;
            frm_main.mnuGoodsDictionary.Visible := true;
          end;
        5:
          begin
            frm_main.mnuGoodsCheckIn.Enabled := true;
            frm_main.mnuGoodsCheckIn.Visible := true;
          end;
        6:
          begin
            frm_main.mnuGoodsBizReturn.Enabled := true;
            frm_main.mnuGoodsBizReturn.Visible := true;
          end;
        7:
          begin
            frm_main.mnuGoodsManReturn.Enabled := true;
            frm_main.mnuGoodsManReturn.Visible := true;
          end;
        8:
          begin
            frm_main.mnuStoreCheck.Enabled := true;
            frm_main.mnuStoreCheck.Visible := true;
          end;
        9:
          begin
            frm_main.mnuGoodsMaintain.Enabled := true;
            frm_main.mnuGoodsMaintain.Visible := true;
          end;
        10:
          begin
            frm_main.mnuGoodsLoss.Enabled := true;
            frm_main.mnuGoodsLoss.Visible := true;
            frm_main.mnuStoreLimite.Enabled := true;
            frm_main.mnuStoreList.Enabled := true;
            frm_main.mnuStoreLimite.Visible := true;
            frm_main.mnuStoreList.Visible := true;
          end;
        11:
          begin
            frm_main.mnuExpireQuery.Enabled := true;
            frm_main.mnuExpireQuery.Visible := true;
          end;
        12:
          begin
            frm_main.mnuStoreInQuery.Enabled := true;
            frm_main.mnuStoreInStat.Enabled := true;
            frm_main.mnuStoreCostStat.Enabled := true;
            frm_main.mnuStoreInQuery.Visible := true;
            frm_main.mnuStoreInStat.Visible := true;
            frm_main.mnuStoreCostStat.Visible := true;
          end;
        13:
          begin
            frm_main.mnuCustomerManage.Enabled := true;
            frm_main.mnuBasicCustomer.Enabled := true;
            frm_main.mnuCustomerCard.Enabled := true;
            frm_main.mnuCardManager.Enabled := true;
            frm_main.mnuCardTrack.Enabled := true;
            frm_main.mnuServiceBooking.Enabled := true;
            frm_main.mnuCustomerManage.Visible := true;
            frm_main.mnuBasicCustomer.Visible := true;
            frm_main.mnuCustomerCard.Visible := true;
            frm_main.mnuCardManager.Visible := true;
            frm_main.mnuCardTrack.Visible := true;
            frm_main.mnuServiceBooking.Visible := true;
          end;
        14:
          begin
            frm_main.mnuEmployeemanage.Enabled := true;
            frm_main.mnuBasicEmployee.Enabled := true;
            frm_main.mnuNormalAttend.Enabled := true;
            frm_main.mnuSpecialAttend.Enabled := true;
            frm_main.mnuAttendManager.Enabled := true;
            frm_main.mnuAttendStat.Enabled := true;
            frm_main.mnuAttendConfig.Enabled := true;
            frm_main.mnuSalaryManager.Enabled := true;
            frm_main.mnuBasicSalary.Enabled := true;
            frm_main.mnuSalaryItem.Enabled := true;
            frm_main.mnuServiceItem.Enabled := true;
            frm_main.mnuServiceMeal.Enabled := true;
            frm_main.mnuEmployeemanage.Visible := true;
            frm_main.mnuBasicEmployee.Visible := true;
            frm_main.mnuNormalAttend.Visible := true;
            frm_main.mnuSpecialAttend.Visible := true;
            frm_main.mnuAttendManager.Visible := true;
            frm_main.mnuAttendStat.Visible := true;
            frm_main.mnuAttendConfig.Visible := true;
            frm_main.mnuSalaryManager.Visible := true;
            frm_main.mnuBasicSalary.Visible := true;
            frm_main.mnuSalaryItem.Visible := true;
            frm_main.mnuServiceItem.Visible := true;
            frm_main.mnuServiceMeal.Visible := true;
          end;
        15:
          begin
            frm_main.mnuUserDictionary.Enabled := true;
            frm_main.mnuBizDictionary.Enabled := true;
            frm_main.mnuUserDictionary.Visible := true;
            frm_main.mnuBizDictionary.Visible := true;
          end;
        16:
          begin
            frm_main.mnuUserManager.Enabled := true;
            frm_main.mnuUserManager.Visible := true;
          end;
        17:
          begin
            frm_main.mnuSysMaintain.Enabled := true;
            frm_main.mnuDataBackUp.Enabled := true;
            frm_main.mnuDataRecovery.Enabled := true;
            frm_main.mnuDataOptimize.Enabled := true;
            frm_main.mnuSysInitial.Enabled := true;
            frm_main.mnuUnit.Enabled := true;
            frm_main.mnuBizInfo.Enabled := true;
            frm_main.mnuUserInfo.Enabled := true;
            frm_main.mnuStyle.Enabled := true;
            frm_main.mnuSysMaintain.Visible := true;
            frm_main.mnuDataBackUp.Visible := true;
            frm_main.mnuDataRecovery.Visible := true;
            frm_main.mnuDataOptimize.Visible := true;
            frm_main.mnuSysInitial.Visible := true;
            frm_main.mnuUnit.Visible := true;
            frm_main.mnuBizInfo.Visible := true;
            frm_main.mnuUserInfo.Visible := true;
            frm_main.mnuStyle.Visible := true;
          end;
        18:
          begin
            frm_main.mnuBossQuery.Enabled := true;
            frm_main.mnuBossMoney.Enabled := true;
            frm_main.mnuBossSalary.Enabled := true;
            frm_main.mnuBossIncoming.Enabled := true;
            frm_main.mnuBossProfit.Enabled := true;
            frm_main.mnuBossGoods.Enabled := true;
            frm_main.mnuBossItems.Enabled := true;
            frm_main.mnuBossEmployee.Enabled := true;
            frm_main.mnuBossMember.Enabled := true;
            frm_main.mnuBossMemberLoss.Enabled := true;
            frm_main.mnuBossMemberBirth.Enabled := true;
            frm_main.mnuBossGoodsOut.Enabled := true;
            frm_main.mnuBossGoodsExpire.Enabled := true;
            frm_main.munBossStore.Enabled := true;
            frm_main.mnuBossMaterial.Enabled := true;
            frm_main.mnuBossGuest.Enabled := true;
            frm_main.mnuBossWeek.Enabled := true;
            frm_main.mnuBossMonth.Enabled := true;
            frm_main.munBossReport.Enabled := true;
            frm_main.mnuBossMemberThere.Enabled := true;
            frm_main.mnuBossMemberHere.Enabled := true;
            frm_main.mnuBossQuery.Visible := true;
            frm_main.mnuBossMoney.Visible := true;
            frm_main.mnuBossSalary.Visible := true;
            frm_main.mnuBossIncoming.Visible := true;
            frm_main.mnuBossProfit.Visible := true;
            frm_main.mnuBossGoods.Visible := true;
            frm_main.mnuBossItems.Visible := true;
            frm_main.mnuBossEmployee.Visible := true;
            frm_main.mnuBossMember.Visible := true;
            frm_main.mnuBossMemberLoss.Visible := true;
            frm_main.mnuBossMemberBirth.Visible := true;
            frm_main.mnuBossGoodsOut.Visible := true;
            frm_main.mnuBossGoodsExpire.Visible := true;
            frm_main.munBossStore.Visible := true;
            frm_main.mnuBossMaterial.Visible := true;
            frm_main.mnuBossGuest.Visible := true;
            frm_main.mnuBossWeek.Visible := true;
            frm_main.mnuBossMonth.Visible := true;
            frm_main.munBossReport.Visible := true;
            frm_main.mnuBossMemberThere.Visible := true;
            frm_main.mnuBossMemberHere.Visible := true;
          end;
      end;
  frm_main.mnuAbout.Enabled := true;
  frm_main.mnuTour.Enabled := true;
  frm_main.mnuHelp.Enabled := true;
  frm_main.mnuDeveloper.Enabled := true;
  frm_main.mnuQuit.Enabled := true;
  frm_main.mnuReLogin.Enabled := true;
  frm_main.mnuPassword.Enabled := true;
  frm_main.mnuSysExit.Enabled := true;
  frm_main.mnuAbout.Visible := true;
  frm_main.mnuTour.Visible := true;
  frm_main.mnuHelp.Visible := true;
  frm_main.mnuDeveloper.Visible := true;
  frm_main.mnuQuit.Visible := true;
  frm_main.mnuReLogin.Visible := true;
  frm_main.mnuPassword.Visible := true;
  frm_main.mnuSysExit.Visible := true;

  check := true;
  frm_main.Bar1.Panels[1].Text := '操作员:' + frm_main.auser.name;
  frm_main.Bar1.Panels[2].Text := '深度工作室 邮箱:server@deepcast.net';
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

procedure Tfrm_UserLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btok.Click;
end;

procedure Tfrm_UserLogin.FormCreate(Sender: TObject);
var
  s: string;
begin
  apppath := extractfilepath(application.ExeName);
  DateTimeToString(s, 'yyyy-mm-dd hh:mm:ss', now);
  lblTimeNow.Caption := s;
end;

procedure Tfrm_UserLogin.tmrSysTimeTimer(Sender: TObject);
var
  s: string;
begin
  DateTimeToString(s, 'yyyy-mm-dd hh:mm:ss', now);
  lblTimeNow.Caption := s;

end;

procedure Tfrm_UserLogin.btnTimeSetClick(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL timedate.cpl,,0',
    SW_SHOWNORMAL);
end;

end.

