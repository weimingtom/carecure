unit Unit_MainFunPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

var
  SysUserId, SysUserName: string;
  DefaultStyleSkin:Integer;
  CustomStyleSkin:string;

procedure initialUserLogin(UserPower: int64); //登录后初始化
//function GetPower(UserId, PowerName, OperationName: string): boolean;
//procedure DoPower(MyGrid: TStringGrid); //权限窗口

//procedure used for showing the windows

//procedure DoFrontManage;	//前台管理
//procedure DoCustomerRegister; //顾客登记
procedure DoFrontCheck; //前台收银

procedure DoDayStatistic; //日营业额统计
procedure DoMonthStatistic; //月营业额统计

procedure DoGoodsRetail; //商品零售
procedure DoGoodsWholeSale; //商品批发
procedure DoSalesStatistic; //销售统计
procedure DoAdjustSaleStat; //调价销售统计

procedure DoReceiptQuery; //单据查询
procedure DoWholeSaleSummary; //批发汇总

procedure DoMemberBuyQuery; //会员商品消费查询
//procedure DoStoreManage;	//库存管理
procedure DoGoodsDictionary; //商品字典维护

procedure DoGoodsCheckIn; //商品入库
procedure DoGoodsBizReturn; //商品退货（商家）
procedure DoGoodsManReturn; //商品退货（顾客）
procedure DoStoreCheck; //库存盘点
procedure DoGoodsMaintain; //商品养护
procedure DoGoodsLoss; //商品报损

procedure DoStoreLimite; //库存限量
procedure DoStoreList; //存货浏览
procedure DoExpireQuery; //过期查询
procedure DoStoreInQuery; //入库记录查询修改

procedure DoStoreInStat; //入库统计
procedure DoStoreCostStat; //入库进价统计
//procedure DoCustomerManage;	//顾客管理
procedure DoBasicCustomer; //顾客基本信息
procedure DoCustomerCard; //顾客办卡

procedure DoCardManager; //顾客卡管理
procedure DoCardTrack; //顾客卡追踪

procedure DoServiceBooking; //顾客预约服务
//procedure DoEmployeemanage; //员工管理
procedure DoBasicEmployee; //员工基本信息

procedure DoNormalAtt; //正常考勤
procedure DoSpecialAtt; //特殊考勤

procedure DoAttManager; //考勤管理
procedure DoAttStat; //考勤统计

procedure DoAttConfig; //考勤设置

procedure DoSalaryManager; //员工工资管理

procedure DoBasicSalary; //基本工资设置
procedure DoSalaryItem; //工资项目设置
procedure DoServiceItem; //服务提成设置
procedure DoServiceMeal; //套餐提成设置
//procedure DoSysMaintain;	//系统维护
procedure DoBizDictionary; //基本商业信息
procedure DoUserManager; //用户管理
procedure DoUserDictionary; //基础用户数据

procedure DoDataBackUp; //数据备份
procedure DoDataRecovery; //数据恢复
procedure DoDataOptimize; //数据优化
procedure DoDataInitial; //数据库初始化
procedure DoDatabaseSetup;//数据库连接设置

procedure DoUnit; //理疗保健单位基本信息
procedure DoBizInfo; //商家基本信息
procedure DoUserInfo; //用户登录信息
procedure DoStyle; //界面方案
//procedure DoAbout;	//关于
procedure DoTour; //快速上手指南

procedure DoHelp; //系统帮助

procedure DoDeveloper; //关于本软件
procedure DoQuit; //退出系统
procedure DoReLogin; //重新登陆
procedure DoPassword; //修改密码

procedure DoSysExit; //退出系统
//procedure DoBossQuery;	//老板查询
procedure DoBossMoney; //每天收了多少钱

procedure DoBossSalary; //每月要发工资是多少

procedure DoBossIncoming; //总收入是多少

procedure DoBossProfit; //实际收入增加了吗

procedure DoBossGoods; //哪些产品最好卖
procedure DoBossItems; //哪些项目最好卖
procedure DoBossEmployee; //哪些员工业绩最好

procedure DoBossMember; //哪些会员最忠诚
procedure DoBossMemberLoss; //哪些会员就要跑了
procedure DoBossMemberBirth; //近期哪些会员要过生日

procedure DoBossGoodsOut; //哪些产品要没货了
procedure DoBossGoodsExpire; //哪些产品要过期了
procedure DoBossStore; //还有多少产品在仓库

procedure DoBossMaterial; //今天用了多少材料
procedure DoBossGuest; //今天来了多少客人

procedure DoBossWeek; //周统计表
procedure DoBossMonth; //月份统计表
procedure DoBossReport; //恶意修改时间报表

procedure DoBossMemberThere; //本店会员在其他分店的消费情况
procedure DoBossMemberHere; //其他分店会员在本店的消费情况

implementation

uses
  unit_Main, unit_about, unit_Employee, unit_Login,
    unit_Customer, unit_DataModule,
  unit_dictionary, Unit_AttendConfig, unit_Empattendance, unit_specialAttend,
    unit_attenstat,
  unit_attendmanager, unit_createcard, unit_cardmanager,
    unit_cardtrack,
  unit_servicebooking, unit_frontcheck, 
    
  unit_editpassword, unit_basicSalary, unit_Salaryitem,
  unit_serviceitemextra, unit_DayStatistic, unit_MonthStatistic,
    unit_salarymanager,
  unit_ServiceMealExtra, 

  
    Variants,Menus, ExtCtrls, 
  Unit_GoodsDictionary, Unit_ReceiptQuery,
  Unit_BizDictionary, Unit_GoodsCheckIn, 
  
  Unit_GoodsBizReturn, Unit_GoodsLoss, Unit_StoreCheck,
  Unit_StoreList, Unit_GoodsWholeSale, Unit_GoodsRetail,
  Unit_SalesStatistic, Unit_AdjustSaleStat, Unit_WholeSaleSummary,
  Unit_UserLogin, Unit_DBini,
  unit_UserManage, Unit_MdbManager, Unit_DataInitial, Unit_StyleSet,
  Unit_Bizinfo;


procedure initialUserLogin(UserPower: int64); //登录后初始化
var
  i, j: integer;
begin

  //if frm_main.skindata1.Active then
  //frm_main.skindata1.Active := false;

  for i := 0 to frm_main.MainMenu1.items.Count - 1 do
    for j := 0 to frm_main.MainMenu1.Items[i].Count - 1 do
    begin
      if (frm_main.MainMenu1.items[i].Items[j].Caption <> '-') then
      begin
        frm_main.MainMenu1.items[i].Items[j].Enabled := false;
        frm_main.MainMenu1.items[i].Items[j].Visible := false;
      end;
    end;

  UserPower := UserPower xor 1234567890;
  UserPower := UserPower shr 10;
  for i := 0 to 18 do //最多支持64种权限,目前分为19种权限

    if ((1 shl i) and UserPower) <> 0 then
      case i of
        0:           //前台收银  权限
          begin
            //frm_main.mnuCustomerRegister.Enabled := true;
            frm_main.mnuFrontCheck.Enabled := true;
            frm_main.mnuGoodsRetail.Enabled := true;
            frm_main.mnuGoodsWholeSale.Enabled := true;
            //frm_main.mnuCustomerRegister.Visible := true;
            frm_main.mnuFrontCheck.Visible := true;
            frm_main.mnuGoodsRetail.Visible := true;
            frm_main.mnuGoodsWholeSale.Visible := true;
          end;
        1:          //销售统计  权限
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
        2:             //单据查询  权限
          begin
            frm_main.mnuReceiptQuery.Enabled := true;
            frm_main.mnuWholeSaleSummary.Enabled := true;
            frm_main.mnuReceiptQuery.Visible := true;
            frm_main.mnuWholeSaleSummary.Visible := true;
          end;
        3:              //会员消费查询 权限
          begin
            frm_main.mnuMemberBuyQuery.Enabled := true;
            frm_main.mnuMemberBuyQuery.Visible := true;
          end;
        4:                 //商品字典维护 权限
          begin
            frm_main.mnuGoodsDictionary.Enabled := true;
            frm_main.mnuGoodsDictionary.Visible := true;
          end;
        5:                  //商品入库  权限
          begin
            frm_main.mnuGoodsCheckIn.Enabled := true;
            frm_main.mnuGoodsCheckIn.Visible := true;
          end;
        6:                  //商品退货(商家) 权限
          begin
            frm_main.mnuGoodsBizReturn.Enabled := true;
            frm_main.mnuGoodsBizReturn.Visible := true;
          end;
        7:                 //商品退货(顾客) 权限
          begin
            frm_main.mnuGoodsManReturn.Enabled := true;
            frm_main.mnuGoodsManReturn.Visible := true;
          end;
        8:                  //库存盘点 权限
          begin
            frm_main.mnuStoreCheck.Enabled := true;
            frm_main.mnuStoreCheck.Visible := true;
          end;
        9:                  //商品养护  权限
          begin
            frm_main.mnuGoodsMaintain.Enabled := true;
            frm_main.mnuGoodsMaintain.Visible := true;
          end;
        10:                 //库存查询 权限
          begin
            frm_main.mnuGoodsLoss.Enabled := true;
            frm_main.mnuGoodsLoss.Visible := true;
            frm_main.mnuStoreLimite.Enabled := true;
            frm_main.mnuStoreList.Enabled := true;
            frm_main.mnuStoreLimite.Visible := true;
            frm_main.mnuStoreList.Visible := true;
          end;
        11:                   //过期查询 权限
          begin
            frm_main.mnuExpireQuery.Enabled := true;
            frm_main.mnuExpireQuery.Visible := true;
          end;
        12:                    //入库查询  权限
          begin
            frm_main.mnuStoreInQuery.Enabled := true;
            frm_main.mnuStoreInStat.Enabled := true;
            frm_main.mnuStoreCostStat.Enabled := true;
            frm_main.mnuStoreInQuery.Visible := true;
            frm_main.mnuStoreInStat.Visible := true;
            frm_main.mnuStoreCostStat.Visible := true;
          end;                   
        13:                     //顾客管理  权限
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
        14:                  //员工管理  权限
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
        15:                //基础数据维护 权限
          begin
            frm_main.mnuUserDictionary.Enabled := true;
            frm_main.mnuBizDictionary.Enabled := true;
            frm_main.mnuUserDictionary.Visible := true;
            frm_main.mnuBizDictionary.Visible := true;
          end;
        16:             //用户管理  权限
          begin
            frm_main.mnuUserManager.Enabled := true;
            frm_main.mnuUserManager.Visible := true;
          end;
        17:              //系统维护  权限
          begin
            frm_main.mnuSysMaintain.Enabled := true;
            frm_main.mnuDataBackUp.Enabled := true;
            frm_main.mnuDataRecovery.Enabled := true;
            frm_main.mnuDataOptimize.Enabled := true;
            frm_main.mnuDataInitial.Enabled := true;
            frm_main.mnuUnit.Enabled := true;
            frm_main.mnuBizInfo.Enabled := true;
            frm_main.mnuUserInfo.Enabled := true;
            frm_main.mnuStyle.Enabled := true;
            frm_main.mnuDatabaseSetup.Enabled := true;
            frm_main.mnuSysMaintain.Visible := true;
            frm_main.mnuDataBackUp.Visible := true;
            frm_main.mnuDataRecovery.Visible := true;
            frm_main.mnuDataOptimize.Visible := true;
            frm_main.mnuDataInitial.Visible := true;
            frm_main.mnuUnit.Visible := true;
            frm_main.mnuBizInfo.Visible := true;
            frm_main.mnuUserInfo.Visible := true;
            frm_main.mnuStyle.Visible := true;
            frm_main.mnuDatabaseSetup.Visible := true;
          end;
        18:                //老板查询  权限
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
            frm_main.mnuBossStore.Enabled := true;
            frm_main.mnuBossMaterial.Enabled := true;
            frm_main.mnuBossGuest.Enabled := true;
            frm_main.mnuBossWeek.Enabled := true;
            frm_main.mnuBossMonth.Enabled := true;
            frm_main.mnuBossReport.Enabled := true;
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
            frm_main.mnuBossStore.Visible := true;
            frm_main.mnuBossMaterial.Visible := true;
            frm_main.mnuBossGuest.Visible := true;
            frm_main.mnuBossWeek.Visible := true;
            frm_main.mnuBossMonth.Visible := true;
            frm_main.mnuBossReport.Visible := true;
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

   case DefaultStyleSkin of
    0..10:
    begin
     frm_Main.skindata1.skinfile := extractfilepath(application.ExeName)+'skin\'+ IntToStr(DefaultStyleSkin) +'.skn';
    end;
  else
    begin
      frm_Main.skindata1.skinfile := CustomStyleSkin;
    end;
  end;


  if not frm_main.skindata1.Active then
    frm_main.skindata1.Active := True;   

  SysUserId := frm_main.auser.id;
  SysUserName := frm_main.auser.name;
  frm_main.Bar1.Panels[1].Text := '操作员:' + frm_main.auser.name;
  frm_main.Bar1.Panels[2].Text := '深度工作室 邮箱:server@deepcast.net';
end;

//procedure DoFrontManage;	//前台管理

//procedure DoCustomerRegister; //顾客登记

procedure DoFrontCheck; //前台收银
begin
  if frm_frontcheck = nil then
  begin
    frm_frontcheck := Tfrm_frontcheck.Create(nil);
    frm_frontcheck.Left := 0;
    frm_frontcheck.Top := 0;
    frm_frontcheck.frontcheck_ref;
    frm_frontcheck.Show;
  end
  else
    frm_frontcheck.BringToFront;
end;

procedure DoDayStatistic; //日营业额统计
begin
  if frm_DayStatistic=nil then
  begin
    frm_DayStatistic:=Tfrm_DayStatistic.create(nil);
    frm_DayStatistic.Left:=0;
    frm_DayStatistic.Top:=0;
    frm_DayStatistic.DayStatistic_ref;
    frm_DayStatistic.Show;
  end else  frm_DayStatistic.BringToFront ;
end;

procedure DoMonthStatistic; //月营业额统计
begin
  if frm_MonthStatistic=nil then
  begin
    frm_MonthStatistic:=Tfrm_MonthStatistic.create(nil);
    frm_MonthStatistic.Left:=0;
    frm_MonthStatistic.Top:=0;
    frm_MonthStatistic.MonthStatistic_ref;
    frm_MonthStatistic.Show;
  end else  frm_MonthStatistic.BringToFront ;
end;

procedure DoGoodsRetail; //商品零售
begin
    if application.FindComponent('frm_GoodsRetail') = nil then
  begin
    ls := tfrm_GoodsRetail.create(application);
    ls.Show;
  end
  else if not ls.Showing then
    ls.Show;
  ls.Edit1.Text := frm_main.operid;
end;

procedure DoGoodsWholeSale; //商品批发
begin
    if application.FindComponent('frm_GoodsWholeSale') = nil then
  begin
    pf := tfrm_GoodsWholeSale.create(application);
    pf.Show;
  end
  else if not pf.Showing then
    pf.Show;
  pf.Edit1.Text := frm_main.operid;
end;

procedure DoSalesStatistic; //销售统计
begin
    if application.FindComponent('frm_SalesStatistic') = nil then
  begin
    SalesStatistic := tfrm_SalesStatistic.create(application);
    SalesStatistic.Show;
  end
  else if not SalesStatistic.Showing then
    SalesStatistic.Show;
end;

procedure DoAdjustSaleStat; //调价销售统计
begin
    if application.FindComponent('frm_AdjustSaleStat') = nil then
  begin
    AdjustSaleStat := tfrm_AdjustSaleStat.create(application);
    AdjustSaleStat.Show;
  end
  else if not AdjustSaleStat.Showing then
    AdjustSaleStat.Show;
end;

procedure DoReceiptQuery; //单据查询
begin
    if application.FindComponent('frm_ReceiptQuery') = nil then
  begin
    ReceiptQuery := tfrm_ReceiptQuery.create(application);
    ReceiptQuery.Show;
  end
  else if not ReceiptQuery.Showing then
    ReceiptQuery.Show;
end;

procedure DoWholeSaleSummary; //批发汇总
begin
    if application.FindComponent('frm_WholeSaleSummary') = nil then
  begin
    WholeSaleSummary := tfrm_WholeSaleSummary.create(application);
    WholeSaleSummary.Show;
  end
  else if not WholeSaleSummary.Showing then
    WholeSaleSummary.Show;
end;

procedure DoMemberBuyQuery; //会员商品消费查询
begin

end;

//procedure DoStoreManage;	//库存管理

procedure DoGoodsDictionary; //商品字典维护
begin
    if application.FindComponent('frm_GoodsDictionary') = nil then
  begin
    GoodsDictionary := tfrm_GoodsDictionary.create(application);
    GoodsDictionary.Show;
  end
  else if not GoodsDictionary.Showing then
    GoodsDictionary.Show;
end;

procedure DoGoodsCheckIn; //商品入库
begin
    if application.FindComponent('frm_GoodsCheckIn') = nil then
  begin
    GoodsCheckIn := tfrm_GoodsCheckIn.create(application);
    GoodsCheckIn.Show;
  end
  else if not GoodsCheckIn.Showing then
    GoodsCheckIn.Show;
  GoodsCheckIn.Edit1.Text := frm_main.operid;
end;

procedure DoGoodsBizReturn; //商品退货（商家）
begin
    if application.FindComponent('frm_GoodsBizReturn') = nil then
  begin
    GoodsBizReturn := tfrm_GoodsBizReturn.create(application);
    GoodsBizReturn.Show;
  end
  else if not GoodsBizReturn.Showing then
    GoodsBizReturn.Show;
  GoodsBizReturn.Edit1.Text := frm_main.operid;
end;

procedure DoGoodsManReturn; //商品退货（顾客）
begin

end;

procedure DoStoreCheck; //库存盘点
begin
   if application.FindComponent('frm_StoreCheck') = nil then
  begin
    StoreCheck := tfrm_StoreCheck.create(application);
    StoreCheck.Show;
  end
  else if not StoreCheck.Showing then
    StoreCheck.Show;
  StoreCheck.Edit1.Text := frm_main.operid;
end;

procedure DoGoodsMaintain; //商品养护
begin

end;

procedure DoGoodsLoss; //商品报损
begin
   if application.FindComponent('frm_GoodsLoss') = nil then
  begin
    GoodsLoss := tfrm_GoodsLoss.create(application);
    GoodsLoss.Show;
  end
  else if not GoodsLoss.Showing then
    GoodsLoss.Show;
  GoodsLoss.Edit1.Text := frm_main.operid;
end;

procedure DoStoreLimite; //库存限量
begin

end;

procedure DoStoreList; //存货浏览
begin
   if application.FindComponent('frm_StoreList') = nil then
  begin
    StoreList := tfrm_StoreList.create(application);
    StoreList.Show;
  end
  else if not StoreList.Showing then
    StoreList.Show;
end;

procedure DoExpireQuery; //过期查询
begin

end;

procedure DoStoreInQuery; //入库记录查询修改
begin

end;

procedure DoStoreInStat; //入库统计
begin

end;

procedure DoStoreCostStat; //入库进价统计
begin

end;

//procedure DoCustomerManage;	//顾客管理

procedure DoBasicCustomer; //顾客基本信息
begin
if frm_customer = nil then
  begin
    frm_customer := Tfrm_customer.Create(nil);
    frm_customer.Left := 0;
    frm_customer.Top := 0;
    frm_customer.Ref;
    frm_customer.show ;
  end else frm_customer.BringToFront ;
end;

procedure DoCustomerCard; //顾客办卡
begin
   if frm_createcard = nil then
  begin
    frm_createcard := Tfrm_createcard.Create(nil);
    frm_createcard.Left :=0;
    frm_createcard.Top  :=0;
    frm_createcard.createcard_ref ;
    frm_createcard.Show ;
  end else frm_createcard.BringToFront ;
end;

procedure DoCardManager; //顾客卡管理
begin
   if frm_cardmanager = nil then
  begin
    frm_cardmanager := Tfrm_cardmanager.Create(nil);
    frm_cardmanager.Left :=0;
    frm_cardmanager.Top  :=0;
    frm_cardmanager.cardmanager_ref ;
    frm_cardmanager.Show ;
  end else frm_cardmanager.BringToFront ;
end;

procedure DoCardTrack; //顾客卡追踪
begin
   if frm_cardtrack = nil then
  begin
    frm_cardtrack := Tfrm_cardtrack.Create(nil);
    frm_cardtrack.Left :=0;
    frm_cardtrack.Top  :=0;
    frm_cardtrack.cardtrack_ref ;
    frm_cardtrack.Show ;
  end else frm_cardtrack.BringToFront ;
end;

procedure DoServiceBooking; //顾客预约服务
begin
   if frm_ServiceBooking = nil then
  begin
    frm_ServiceBooking := Tfrm_ServiceBooking.Create(nil);
    frm_ServiceBooking.Left :=0;
    frm_ServiceBooking.Top  :=0;
    frm_ServiceBooking.ServiceBooking_ref ;
    frm_ServiceBooking.Show ;
  end else frm_ServiceBooking.BringToFront ;
end;

//procedure DoEmployeemanage; //员工管理

procedure DoBasicEmployee; //员工基本信息
begin
    if frm_employee = nil then
  begin
     frm_employee := Tfrm_employee.Create(nil);
     frm_employee.Left := 0;
     frm_employee.Top  := 0;
     frm_employee.ref;
     frm_employee.Show ;
  end else frm_employee.BringToFront ;
end;

procedure DoNormalAtt; //正常考勤
begin
    if frm_empattend = nil then
  begin
    frm_empattend := Tfrm_empattend.Create(nil);
    frm_empattend.Left :=0;
    frm_empattend.Top :=0;
    frm_empattend.attend_ref ;
    frm_empattend.Show;
  end else frm_empattend.BringToFront ;
end;

procedure DoSpecialAtt; //特殊考勤
begin
    if frm_specialattend = nil then
  begin
    frm_specialattend := Tfrm_specialattend.Create(nil);
    frm_specialattend.Left :=0;
    frm_specialattend.Top :=0;
    frm_specialattend.special_Ref;
    frm_specialattend.show; 
  end else frm_specialattend.BringToFront ;
end;

procedure DoAttManager; //考勤管理
begin
   if frm_attendmanager = nil then
  begin
    frm_attendmanager := Tfrm_attendmanager.Create(nil);
    frm_attendmanager.Left :=0;
    frm_attendmanager.Top  :=0;
    frm_attendmanager.attendmanager_ref ;
    frm_attendmanager.Show ;
  end else frm_attendmanager.BringToFront ;
end;

procedure DoAttStat; //考勤统计
begin
   if frm_attendStat = nil then
  begin
    frm_attendStat := Tfrm_attendStat.Create(nil);
    frm_attendStat.Left :=0;
    frm_attendStat.Top  :=0;
    frm_attendStat.attendstat_ref ;
    frm_attendStat.Show ; 
  end else frm_attendstat.BringToFront ;
end;

procedure DoAttConfig; //考勤设置
begin
   if frm_attendConfig = nil then
  begin
    frm_attendConfig := Tfrm_attendConfig.Create(nil);
    frm_attendConfig.Left :=0;
    frm_attendConfig.Top  :=0;
    frm_attendConfig.Time_ref ;
    frm_attendConfig.Reason_ref ;
    frm_attendConfig.Show ;
  end else frm_attendConfig.BringToFront ;
end;

procedure DoSalaryManager; //员工工资管理
begin
  if frm_SalaryManager=nil then
  begin
    frm_SalaryManager:=Tfrm_SalaryManager.create(nil);
    frm_SalaryManager.Left:=0;
    frm_SalaryManager.Top:=0;
    frm_SalaryManager.SalaryManager_ref;
    frm_SalaryManager.Show;
  end else  frm_SalaryManager.BringToFront ;
end;

procedure DoBasicSalary; //基本工资设置
begin
  if frm_basicSalary=nil then
  begin
    frm_basicSalary:=Tfrm_basicSalary.create(nil);
    frm_basicSalary.Left:=0;
    frm_basicSalary.Top:=0;
    frm_basicSalary.basicSalary_ref;
    frm_basicSalary.Show;
  end else  frm_basicSalary.BringToFront ;
end;

procedure DoSalaryItem; //工资项目设置
begin
  if frm_SalaryItem=nil then
  begin
    frm_SalaryItem:=Tfrm_SalaryItem.create(nil);
    frm_SalaryItem.Left:=0;
    frm_SalaryItem.Top:=0;
    frm_SalaryItem.SalaryItem_ref;
    frm_SalaryItem.Show;
  end else  frm_SalaryItem.BringToFront ;

end;

procedure DoServiceItem; //服务提成设置
begin
  if frm_ServiceItemExtra=nil then
  begin
    frm_ServiceItemExtra:=Tfrm_ServiceItemExtra.create(nil);
    frm_ServiceItemExtra.Left:=0;
    frm_ServiceItemExtra.Top:=0;
    frm_ServiceItemExtra.ServiceItemExtra_ref;
    frm_ServiceItemExtra.Show;
  end else  frm_ServiceItemExtra.BringToFront ;
end;

procedure DoServiceMeal; //套餐提成设置
begin
   if frm_ServiceMealExtra=nil then
  begin
    frm_ServiceMealExtra:=Tfrm_ServiceMealExtra.create(nil);
    frm_ServiceMealExtra.Left:=0;
    frm_ServiceMealExtra.Top:=0;
    frm_ServiceMealExtra.ServiceMealExtra_ref;
    frm_ServiceMealExtra.Show;
  end else  frm_ServiceMealExtra.BringToFront ;
end;

//procedure DoSysMaintain;	//系统维护

procedure DoBizDictionary; //基本商业信息
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

procedure DoUserManager; //用户管理
begin
   if application.FindComponent('frm_UserManage') = nil then
  begin
    UserManage := Tfrm_UserManage.create(application);
    UserManage.Show;
  end
  else if not UserManage.Showing then
    UserManage.Show;
end;

procedure DoUserDictionary; //基础用户数据
begin
  if frm_dictionary = nil then
  begin
    frm_dictionary := Tfrm_dictionary.Create(nil);
//    frm_dictionary.Left := 0;
//    frm_dictionary.Top  := 0;
    frm_dictionary.dic_ref;
    frm_dictionary.cus_ref;
    frm_dictionary.emp_ref;
    frm_dictionary.ServiceItemType_ref ;
    frm_dictionary.ServiceItem_ref;
    frm_dictionary.MemberCardType_ref ;
    frm_dictionary.ServiceMealType_ref ;
    frm_dictionary.ServiceMeal_ref ;
    frm_dictionary.Show ;
  end else frm_dictionary.BringToFront ;
end;

procedure DoDataBackUp; //数据备份
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

procedure DoDataRecovery; //数据恢复
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

procedure DoDataOptimize; //数据优化
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

procedure DoDataInitial; //数据库初始化
begin
  if application.FindComponent('frm_DataInitial') = nil then
  begin
    DataInitial := tfrm_DataInitial.create(application);
    DataInitial.Show;
  end
  else if not DataInitial.Showing then
    DataInitial.Show;
end;

procedure DoDatabaseSetup;//数据库连接设置
begin  
  if application.FindComponent('frm_DBini') = nil then
  begin
    frm_DBini := tfrm_DBini.create(application);
    frm_DBini.Show;
  end
  else if not frm_DBini.Showing then
    frm_DBini.Show;
end;

procedure DoUnit; //理疗保健单位基本信息
begin

end;

procedure DoBizInfo; //商家基本信息
begin
  if application.FindComponent('frm_BizInfo') = nil then
  begin
    BizInfo := tfrm_BizInfo.create(application);
    BizInfo.Show;
  end
  else if not BizInfo.Showing then
    BizInfo.Show;
end;

procedure DoUserInfo; //用户登录信息
begin

end;

procedure DoStyle; //界面方案
begin
   if application.FindComponent('frm_StyleSet') = nil then
  begin
    StyleSet := tfrm_StyleSet.create(application);
    StyleSet.Show;
  end
  else if not StyleSet.Showing then
    StyleSet.Show;
end;

//procedure DoAbout;	//关于

procedure DoTour; //快速上手指南
begin

end;

procedure DoHelp; //系统帮助
begin

end;

procedure DoDeveloper; //关于本软件
begin
  frm_about := Tfrm_about.Create(nil);
  frm_about.ShowModal ;
end;

procedure DoQuit; //退出系统
begin
   if messagebox(frm_main.handle, '您确实要退出系统吗?', '信息', mb_okcancel +
    mb_iconquestion) = IDOK then
    application.Terminate;
end;

procedure DoReLogin; //重新登陆
begin
    if frm_main.skindata1.Active then
    frm_main.skindata1.Active := false;
  DMod.toper.Open;
  if DMod.toper.Locate('userid', frm_main.operid, []) then
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

procedure DoPassword; //修改密码
begin
  try
    frm_EditPassword:=Tfrm_EditPassword.create(nil);
    frm_EditPassword.Left:=0;
    frm_EditPassword.Top:=0;
    frm_EditPassword.password_ref;
    frm_EditPassword.ShowModal;
  finally
    frm_EditPassword.Free;
    frm_EditPassword:=nil;
  end;
end;

procedure DoSysExit; //退出系统
begin

end;

//procedure DoBossQuery;	//老板查询

procedure DoBossMoney; //每天收了多少钱
begin

end;

procedure DoBossSalary; //每月要发工资是多少
begin

end;

procedure DoBossIncoming; //总收入是多少

begin

end;

procedure DoBossProfit; //实际收入增加了吗
begin

end;

procedure DoBossGoods; //哪些产品最好卖
begin

end;

procedure DoBossItems; //哪些项目最好卖
begin

end;

procedure DoBossEmployee; //哪些员工业绩最好
begin

end;

procedure DoBossMember; //哪些会员最忠诚
begin

end;

procedure DoBossMemberLoss; //哪些会员就要跑了
begin

end;

procedure DoBossMemberBirth; //近期哪些会员要过生日
begin

end;

procedure DoBossGoodsOut; //哪些产品要没货了
begin

end;

procedure DoBossGoodsExpire; //哪些产品要过期了
begin

end;

procedure DoBossStore; //还有多少产品在仓库
begin

end;

procedure DoBossMaterial; //今天用了多少材料
begin

end;

procedure DoBossGuest; //今天来了多少客人

begin

end;

procedure DoBossWeek; //周统计表
begin

end;

procedure DoBossMonth; //月份统计表
begin

end;

procedure DoBossReport; //恶意修改时间报表

begin

end;

procedure DoBossMemberThere; //本店会员在其他分店的消费情况
begin

end;

procedure DoBossMemberHere; //其他分店会员在本店的消费情况
begin

end;

end.
