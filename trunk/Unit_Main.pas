unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, ToolWin, ImgList,
  Unit_DataModule, Unit_GoodsDictionary, Unit_StoreLimite, Unit_ReceiptQuery,
  Unit_GoodsDetail, Unit_BizDictionary, Unit_GoodsCheckIn, Unit_SalesProfit,
  Unit_StoreChanges,
  StdCtrls, Unit_GoodsBizReturn, Unit_GoodsLoss, Unit_StoreCheck,
  Unit_StoreList, Unit_GoodsWholeSale, Unit_GoodsRetail, Unit_splash,
  Unit_SalesStatistic, Unit_AdjustSaleStat, Unit_WholeSaleSummary,
  Unit_MemberBuyQuery,
  unit_UserManage, Unit_MdbManager, Unit_DataInitial, Unit_StyleSet,
  Unit_Bizinfo,
  WinSkinData;
type
  userinfo = record
    name: string;
    qx: int64;
    id: string; //int64;-->String
  end;
type
  Tfrm_main = class(TForm)
    MainMenu1: TMainMenu;
    mnuSysMaintain: TMenuItem;
    mnuReLogin: TMenuItem;
    mnuPassword: TMenuItem;
    N4: TMenuItem;
    mnuUserManager: TMenuItem;
    N6: TMenuItem;
    mnuUserInfo: TMenuItem;
    mnuSysExit: TMenuItem;
    mnuBasicEmployee: TMenuItem;
    mnuStoreManage: TMenuItem;
    mnuNormalAttend: TMenuItem;
    mnuAttendStat: TMenuItem;
    mnuAbout: TMenuItem;
    mnuDeveloper: TMenuItem;
    mnuCustomerManage: TMenuItem;
    mnuServiceBooking: TMenuItem;
    mnuBasicCustomer: TMenuItem;
    mnuUserDictionary: TMenuItem;
    mnuCustomerCard: TMenuItem;
    N808: TMenuItem;
    mnuAttendConfig: TMenuItem;
    mnuSpecialAttend: TMenuItem;
    mnuQuit: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mnuAttendManager: TMenuItem;
    N22: TMenuItem;
    mnuCardManager: TMenuItem;
    mnuCardTrack: TMenuItem;
    mnuFrontManage: TMenuItem;
    mnuFrontCheck: TMenuItem;
    Image1: TImage;
    Bar1: TStatusBar;
    mnuUnit: TMenuItem;
    mnuEmployeemanage: TMenuItem;
    mnuBasicSalary: TMenuItem;
    mnuSalaryItem: TMenuItem;
    mnuServiceItem: TMenuItem;
    N801: TMenuItem;
    mnuDayStatistic: TMenuItem;
    mnuMonthStatistic: TMenuItem;
    mnuSalaryManager: TMenuItem;
    N24: TMenuItem;
    mnuServiceMeal: TMenuItem;
    N802: TMenuItem;
    mnuGoodsRetail: TMenuItem;
    mnuGoodsWholeSale: TMenuItem;
    mnuSalesStatistic: TMenuItem;
    mnuAdjustSaleStat: TMenuItem;
    N803: TMenuItem;
    mnuReceiptQuery: TMenuItem;
    mnuWholeSaleSummary: TMenuItem;
    N804: TMenuItem;
    mnuMemberBuyQuery: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    mnuGoodsDictionary: TMenuItem;
    N805: TMenuItem;
    mnuGoodsCheckIn: TMenuItem;
    mnuGoodsBizReturn: TMenuItem;
    mnuGoodsManReturn: TMenuItem;
    mnuStoreCheck: TMenuItem;
    mnuGoodsMaintain: TMenuItem;
    mnuGoodsLoss: TMenuItem;
    N806: TMenuItem;
    mnuStoreLimite: TMenuItem;
    mnuStoreList: TMenuItem;
    mnuExpireQuery: TMenuItem;
    mnuStoreInQuery: TMenuItem;
    N807: TMenuItem;
    mnuStoreInStat: TMenuItem;
    mnuStoreCostStat: TMenuItem;
    mnuBizDictionary: TMenuItem;
    mnuDataBackUp: TMenuItem;
    N23: TMenuItem;
    mnuDataRecovery: TMenuItem;
    mnuDataOptimize: TMenuItem;
    mnuBizInfo: TMenuItem;
    mnuStyle: TMenuItem;
    mnuTour: TMenuItem;
    N8: TMenuItem;
    mnuHelp: TMenuItem;
    N21: TMenuItem;
    ImageList1: TImageList;
    CoolBar1: TCoolBar;
    scroll1: TPageScroller;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton10: TToolButton;
    ToolButton15: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    ToolButton18: TToolButton;
    ToolButton13: TToolButton;
    mnuBossQuery: TMenuItem;
    mnuBossMoney: TMenuItem;
    N25: TMenuItem;
    mnuBossSalary: TMenuItem;
    N27: TMenuItem;
    mnuBossIncoming: TMenuItem;
    N29: TMenuItem;
    mnuBossProfit: TMenuItem;
    N31: TMenuItem;
    mnuBossGoods: TMenuItem;
    mnuBossItems: TMenuItem;
    mnuBossEmployee: TMenuItem;
    N35: TMenuItem;
    mnuBossMember: TMenuItem;
    mnuBossMemberLoss: TMenuItem;
    mnuBossMemberBirth: TMenuItem;
    N39: TMenuItem;
    mnuBossGoodsOut: TMenuItem;
    mnuBossGoodsExpire: TMenuItem;
    mnuBossStore: TMenuItem;
    N43: TMenuItem;
    mnuBossMaterial: TMenuItem;
    mnuBossGuest: TMenuItem;
    N46: TMenuItem;
    mnuBossWeek: TMenuItem;
    mnuBossMonth: TMenuItem;
    mnuBossReport: TMenuItem;
    N50: TMenuItem;
    mnuBossMemberThere: TMenuItem;
    mnuBossMemberHere: TMenuItem;
    ToolButton5: TToolButton;
    ImageList2: TImageList;
    mnuDataInitial: TMenuItem;
    skindata1: TSkinData;
    procedure mnuBasicEmployeeClick(Sender: TObject);
    procedure mnuDeveloperClick(Sender: TObject);
    procedure mnuBasicCustomerClick(Sender: TObject);
    procedure mnuUserDictionaryClick(Sender: TObject);
    procedure mnuAttendConfigClick(Sender: TObject);
    procedure mnuNormalAttendClick(Sender: TObject);
    procedure mnuSpecialAttendClick(Sender: TObject);
    procedure mnuAttendStatClick(Sender: TObject);
    procedure mnuAttendManagerClick(Sender: TObject);
    procedure mnuCustomerCardClick(Sender: TObject);
    procedure mnuCardTrackClick(Sender: TObject);
    procedure mnuCardManagerClick(Sender: TObject);
    procedure mnuServiceBookingClick(Sender: TObject);
    procedure mnuFrontCheckClick(Sender: TObject);
    procedure mnuSysExitClick(Sender: TObject);
    procedure mnuUnitClick(Sender: TObject);
    procedure mnuUserManagerClick(Sender: TObject);
    procedure mnuReLoginClick(Sender: TObject);
    procedure mnuPasswordClick(Sender: TObject);
    procedure mnuBasicSalaryClick(Sender: TObject);
    procedure mnuSalaryItemClick(Sender: TObject);
    procedure mnuServiceItemClick(Sender: TObject);
    procedure mnuDayStatisticClick(Sender: TObject);
    procedure mnuMonthStatisticClick(Sender: TObject);
    procedure mnuDataInitialClick(Sender: TObject);
    procedure mnuSalaryManagerClick(Sender: TObject);
    procedure mnuServiceMealClick(Sender: TObject);
    procedure mnuCustomerRegisterClick(Sender: TObject);
    procedure mnuGoodsRetailClick(Sender: TObject);
    procedure mnuGoodsWholeSaleClick(Sender: TObject);
    procedure mnuSalesStatisticClick(Sender: TObject);
    procedure mnuAdjustSaleStatClick(Sender: TObject);
    procedure mnuReceiptQueryClick(Sender: TObject);
    procedure mnuWholeSaleSummaryClick(Sender: TObject);
    procedure mnuMemberBuyQueryClick(Sender: TObject);
    procedure mnuGoodsDictionaryClick(Sender: TObject);
    procedure mnuGoodsCheckInClick(Sender: TObject);
    procedure mnuGoodsBizReturnClick(Sender: TObject);
    procedure mnuStoreCheckClick(Sender: TObject);
    procedure mnuGoodsLossClick(Sender: TObject);
    procedure mnuStoreLimiteClick(Sender: TObject);
    procedure mnuStoreListClick(Sender: TObject);
    procedure mnuBizDictionaryClick(Sender: TObject);
    procedure mnuDataBackUpClick(Sender: TObject);
    procedure mnuDataRecoveryClick(Sender: TObject);
    procedure mnuDataOptimizeClick(Sender: TObject);
    procedure mnuStyleClick(Sender: TObject);
    procedure mnuBizInfoClick(Sender: TObject);
  private
    { Private declarations }
    FClientInstance, FPrevClientProc: TfarProc;
    procedure ClientWndProc(var Message: TMessage);
    procedure dorw(var MyDC: hDC);
  public
    auser: userinfo; { Public declarations }
    operid: string;
  end;

var
  frm_main: Tfrm_main;
  GoodsDictionary: tfrm_GoodsDictionary;
  GoodsDetail: tfrm_GoodsDetail;
  BizDictionary: tfrm_BizDictionary;
  GoodsCheckIn: tfrm_GoodsCheckIn;
  GoodsBizReturn: tfrm_GoodsBizReturn;
  GoodsLoss: tfrm_GoodsLoss;
  StoreCheck: tfrm_StoreCheck;
  StoreList: tfrm_StoreList;
  pf: tfrm_GoodsWholeSale;
  ls: tfrm_GoodsRetail;
  splash: tfrm_splash;
  SalesStatistic: tfrm_SalesStatistic;
  AdjustSaleStat: tfrm_AdjustSaleStat;
  WholeSaleSummary: Tfrm_WholeSaleSummary;
  MemberBuyQuery: Tfrm_MemberBuyQuery;
  UserManage: tFrm_UserManage;
  StoreLimite: tfrm_StoreLimite;
  xstj1: tfrm_SalesProfit;
  ReceiptQuery: tfrm_ReceiptQuery;
  kctj1: tfrm_StoreChanges;
  MdbManager: Tfrm_MdbManager;
  DataInitial: Tfrm_DataInitial;
  StyleSet: Tfrm_StyleSet;
  BizInfo: Tfrm_BizInfo;
implementation

uses Unit_PublicFunction, Unit_TotalPublic, upreview, Unit_UserLogin;

{$R *.dfm}

procedure Tfrm_main.ClientWndProc(var Message: TMessage);
var
  MyDC: hDC;
  Ro, Co: Word;
begin
  with Message do
    case Msg of
      WM_ERASEBKGND:
        begin
          MyDC := TWMEraseBkGnd(Message).DC;
          dorw(mydc);
          Result := 1;
        end;
    else
      Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam,
        lParam);
    end;
end;

procedure Tfrm_main.dorw(var MyDC: hDC);
var
  ro, co: word;
begin
  for Ro := 0 to ClientHeight div Image1.Picture.Height do
    for Co := 0 to ClientWIDTH div Image1.Picture.Width do
    begin
      BitBlt(MyDC, co * Image1.Picture.Width, ro * Image1.Picture.Height,
        Image1.Picture.Width, Image1.Picture.Height,
        Image1.Picture.bitmap.canvas.Handle, 0, 0, SRCCOPY);
    end;
end;

procedure Tfrm_main.mnuBasicEmployeeClick(Sender: TObject);
begin
  DoEmployee;
end;

procedure Tfrm_main.mnuDeveloperClick(Sender: TObject);
begin
  DoAbout;
end;

procedure Tfrm_main.mnuBasicCustomerClick(Sender: TObject);
begin
  DoCustomer;
end;

procedure Tfrm_main.mnuUserDictionaryClick(Sender: TObject);
begin
  DoDictionary;
end;

procedure Tfrm_main.mnuAttendConfigClick(Sender: TObject);
begin
  DoAttendConfig;
end;

procedure Tfrm_main.mnuNormalAttendClick(Sender: TObject);
begin
  DoNormalAttend;
end;

procedure Tfrm_main.mnuSpecialAttendClick(Sender: TObject);
begin
  DoSpecialAttend;
end;

procedure Tfrm_main.mnuAttendStatClick(Sender: TObject);
begin
  DoAttendStatistic;
end;

procedure Tfrm_main.mnuAttendManagerClick(Sender: TObject);
begin
  DoAttendManager;
end;

procedure Tfrm_main.mnuCustomerCardClick(Sender: TObject);
begin
  DoCreateCard;
end;

procedure Tfrm_main.mnuCardTrackClick(Sender: TObject);
begin
  DoCardTrack;
end;

procedure Tfrm_main.mnuCardManagerClick(Sender: TObject);
begin
  DoCardManager;
end;

procedure Tfrm_main.mnuServiceBookingClick(Sender: TObject);
begin
  DoServiceBooking;
end;

procedure Tfrm_main.mnuFrontCheckClick(Sender: TObject);
begin
  DoFrontCheck;
end;

procedure Tfrm_main.mnuSysExitClick(Sender: TObject);
begin
  if messagebox(handle, '您确实要退出系统吗?', '信息', mb_okcancel +
    mb_iconquestion) = IDOK then
    application.Terminate;
end;

procedure Tfrm_main.mnuUnitClick(Sender: TObject);
begin
  DoUnit;
end;

procedure Tfrm_main.mnuUserManagerClick(Sender: TObject);
begin
  if application.FindComponent('frm_UserManage') = nil then
  begin
    UserManage := Tfrm_UserManage.create(application);
    UserManage.Show;
  end
  else if not UserManage.Showing then
    UserManage.Show;
end;

procedure Tfrm_main.mnuReLoginClick(Sender: TObject);
begin
  if skindata1.Active then
    skindata1.Active := false;
  DMod.toper.Open;
  if DMod.toper.Locate('userid', operid, []) then
  begin
    DMod.toper.edit;
    DMod.toper.FieldByName('退出时间').AsDateTime := now;
    DMod.toper.Post;
  end;

  try
    frm_UserLogin := Tfrm_UserLogin.Create(nil);
    frm_UserLogin.Left := 0;
    frm_UserLogin.Top := 0;
    frm_UserLogin.ShowModal;
  finally
    frm_UserLogin.Free;
    frm_UserLogin := nil;
  end;
end;

procedure Tfrm_main.mnuPasswordClick(Sender: TObject);
begin
  DoEditPassword;
end;

procedure Tfrm_main.mnuBasicSalaryClick(Sender: TObject);
begin
  DoBasicSalary;
end;

procedure Tfrm_main.mnuSalaryItemClick(Sender: TObject);
begin
  DoSalaryItem;
end;

procedure Tfrm_main.mnuServiceItemClick(Sender: TObject);
begin
  DoServiceItemExtra;
end;

procedure Tfrm_main.mnuDayStatisticClick(Sender: TObject);
begin
  DoDayStatistic;
end;

procedure Tfrm_main.mnuMonthStatisticClick(Sender: TObject);
begin
  DoMonthStatistic;
end;

procedure Tfrm_main.mnuSalaryManagerClick(Sender: TObject);
begin
  DoSalaryManager;
end;

procedure Tfrm_main.mnuServiceMealClick(Sender: TObject);
begin
  DoServiceMealExtra;
end;

procedure Tfrm_main.mnuCustomerRegisterClick(Sender: TObject);
begin
  DoCustomerRegister;
end;

procedure Tfrm_main.mnuGoodsRetailClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsRetail') = nil then
  begin
    ls := tfrm_GoodsRetail.create(application);
    ls.Show;
  end
  else if not ls.Showing then
    ls.Show;
  ls.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuGoodsWholeSaleClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsWholeSale') = nil then
  begin
    pf := tfrm_GoodsWholeSale.create(application);
    pf.Show;
  end
  else if not pf.Showing then
    pf.Show;
  pf.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuSalesStatisticClick(Sender: TObject);
begin
  if application.FindComponent('frm_SalesStatistic') = nil then
  begin
    SalesStatistic := tfrm_SalesStatistic.create(application);
    SalesStatistic.Show;
  end
  else if not SalesStatistic.Showing then
    SalesStatistic.Show;
end;

procedure Tfrm_main.mnuAdjustSaleStatClick(Sender: TObject);
begin
  if application.FindComponent('frm_AdjustSaleStat') = nil then
  begin
    AdjustSaleStat := tfrm_AdjustSaleStat.create(application);
    AdjustSaleStat.Show;
  end
  else if not AdjustSaleStat.Showing then
    AdjustSaleStat.Show;
end;

procedure Tfrm_main.mnuReceiptQueryClick(Sender: TObject);
begin
  if application.FindComponent('frm_ReceiptQuery') = nil then
  begin
    ReceiptQuery := tfrm_ReceiptQuery.create(application);
    ReceiptQuery.Show;
  end
  else if not ReceiptQuery.Showing then
    ReceiptQuery.Show;
end;

procedure Tfrm_main.mnuWholeSaleSummaryClick(Sender: TObject);
begin
  if application.FindComponent('frm_WholeSaleSummary') = nil then
  begin
    WholeSaleSummary := tfrm_WholeSaleSummary.create(application);
    WholeSaleSummary.Show;
  end
  else if not WholeSaleSummary.Showing then
    WholeSaleSummary.Show;
end;

procedure Tfrm_main.mnuMemberBuyQueryClick(Sender: TObject);
begin
  if application.FindComponent('frm_MemberBuyQuery') = nil then
  begin
    MemberBuyQuery := tfrm_MemberBuyQuery.create(application);
    MemberBuyQuery.Show;
  end
  else if not MemberBuyQuery.Showing then
    MemberBuyQuery.Show;
end;

procedure Tfrm_main.mnuGoodsDictionaryClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsDictionary') = nil then
  begin
    GoodsDictionary := tfrm_GoodsDictionary.create(application);
    GoodsDictionary.Show;
  end
  else if not GoodsDictionary.Showing then
    GoodsDictionary.Show;
end;

procedure Tfrm_main.mnuGoodsCheckInClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsCheckIn') = nil then
  begin
    GoodsCheckIn := tfrm_GoodsCheckIn.create(application);
    GoodsCheckIn.Show;
  end
  else if not GoodsCheckIn.Showing then
    GoodsCheckIn.Show;
  GoodsCheckIn.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuGoodsBizReturnClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsBizReturn') = nil then
  begin
    GoodsBizReturn := tfrm_GoodsBizReturn.create(application);
    GoodsBizReturn.Show;
  end
  else if not GoodsBizReturn.Showing then
    GoodsBizReturn.Show;
  GoodsBizReturn.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuStoreCheckClick(Sender: TObject);
begin
  if application.FindComponent('frm_StoreCheck') = nil then
  begin
    StoreCheck := tfrm_StoreCheck.create(application);
    StoreCheck.Show;
  end
  else if not StoreCheck.Showing then
    StoreCheck.Show;
  StoreCheck.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuGoodsLossClick(Sender: TObject);
begin
  if application.FindComponent('frm_GoodsLoss') = nil then
  begin
    GoodsLoss := tfrm_GoodsLoss.create(application);
    GoodsLoss.Show;
  end
  else if not GoodsLoss.Showing then
    GoodsLoss.Show;
  GoodsLoss.Edit1.Text := auser.name;
end;

procedure Tfrm_main.mnuStoreLimiteClick(Sender: TObject);
begin
  if application.FindComponent('frm_StoreLimite') = nil then
  begin
    StoreLimite := tfrm_StoreLimite.create(application);
    StoreLimite.Show;
  end
  else if not StoreLimite.Showing then
    StoreLimite.Show;
end;

procedure Tfrm_main.mnuStoreListClick(Sender: TObject);
begin
  if application.FindComponent('frm_StoreList') = nil then
  begin
    StoreList := tfrm_StoreList.create(application);
    StoreList.Show;
  end
  else if not StoreList.Showing then
    StoreList.Show;
end;

procedure Tfrm_main.mnuBizDictionaryClick(Sender: TObject);
begin
  if application.FindComponent('frm_BizDictionary') = nil then
  begin
    BizDictionary := tfrm_BizDictionary.create(application);
    BizDictionary.Show;
  end
  else if not BizDictionary.Showing then
    BizDictionary.Show;
  BizDictionary.TabSheet1.Show;
end;

procedure Tfrm_main.mnuDataBackUpClick(Sender: TObject);
begin
  if application.FindComponent('frm_MdbManager') = nil then
  begin
    MdbManager := tfrm_MdbManager.create(application);
    MdbManager.Show;
  end
  else if not MdbManager.Showing then
    MdbManager.Show;
  MdbManager.tsMdbBack.Show;
end;

procedure Tfrm_main.mnuDataRecoveryClick(Sender: TObject);
begin
  if application.FindComponent('frm_MdbManager') = nil then
  begin
    MdbManager := tfrm_MdbManager.create(application);
    MdbManager.Show;
  end
  else if not MdbManager.Showing then
    MdbManager.Show;
  MdbManager.tsMdbRestore.Show;
end;

procedure Tfrm_main.mnuDataOptimizeClick(Sender: TObject);
begin
  if application.FindComponent('frm_MdbManager') = nil then
  begin
    MdbManager := tfrm_MdbManager.create(application);
    MdbManager.Show;
  end
  else if not MdbManager.Showing then
    MdbManager.Show;
  MdbManager.tsMdbCompact.Show;
end;

procedure Tfrm_main.mnuDataInitialClick(Sender: TObject);
begin
  //DoSysInitial;
  if application.FindComponent('frm_DataInitial') = nil then
  begin
    DataInitial := tfrm_DataInitial.create(application);
    DataInitial.Show;
  end
  else if not DataInitial.Showing then
    DataInitial.Show;

end;

procedure Tfrm_main.mnuStyleClick(Sender: TObject);
begin
  if application.FindComponent('frm_StyleSet') = nil then
  begin
    StyleSet := tfrm_StyleSet.create(application);
    StyleSet.Show;
  end
  else if not StyleSet.Showing then
    StyleSet.Show;

end;

procedure Tfrm_main.mnuBizInfoClick(Sender: TObject);
begin
  if application.FindComponent('frm_BizInfo') = nil then
  begin
    BizInfo := tfrm_BizInfo.create(application);
    BizInfo.Show;
  end
  else if not BizInfo.Showing then
    BizInfo.Show;
end;

end.

