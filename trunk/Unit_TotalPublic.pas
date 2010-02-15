unit Unit_TotalPublic;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, Grids;

   var
    SysUserId,SysUserName:string;

   procedure InitializePrj;  //登录后初始化
   function GetPower(UserId,PowerName,OperationName:string):boolean;
   procedure DoPower(MyGrid:TStringGrid); //权限窗口
   //procedure used for showing the windows
   procedure DoAbout;            //显示关于窗口
   procedure DoUnit;             //显示单位窗口
   procedure DoOperator;         //显示用户管理窗口
   procedure DoRelogin;          //重新显示登录窗口
   procedure DoEditPassword;     //显示修改密码窗口
   procedure DoEmployee;         //显示员工窗口
   procedure DoCustomer;         //显示客户窗口
   procedure DoDictionary;       //显示用户字典
   procedure DoAttendConfig;     //显示员工设置窗口
   procedure DoNormalAttend;     //显示正常用户考勤窗口
   procedure DoSpecialAttend;    //显示特殊用户考勤窗口
   procedure DoAttendStatistic;  //显示考勤统计信息
   procedure DoAttendManager;    //显示考勤管理窗口
   procedure DoSelectReason;     //显示原因选择窗口
   procedure DoCreateCard;       //显示客户办卡窗口
   procedure DoCardManager;      //显示顾客卡管理
   procedure DoCardTrack;        //显示窗口追踪
   procedure DoServiceBooking;   //顾客服务预约
   procedure DoFrontCheck;       //前台收营窗口
   procedure DoServiceItem;      //显示服务项目选择窗口
   procedure DoServiceMeal;      //显示服务套餐选择窗口
   procedure DoChooseEmployee(isattend:string);   //显示选择员工窗口
   procedure DoChooseCustomer;   //显示选择客户窗口
   procedure DoBasicSalary;      //显示基本工资窗口
   procedure DoSalaryItem;       //显示工资项目窗口
   procedure DoServiceItemExtra; //显示单项服务提成设置
   procedure DoServiceMealextra; //显示服务套餐提成设置
   procedure DoDayStatistic;     //显示日营业额统计
   procedure DoMonthStatistic;   //显示月营业额统计
   procedure DoSysInitial;       //显示系统初始化窗口
   procedure DoSalaryManager;    //显示员工工资信息
   procedure DoCustomerRegister; //显示顾客到来窗体

   //procedure used for showing report
   procedure DoReportCustomer;   //显示客户报表信息
   procedure DoReportEmployee;   //显示员工报表信息
   procedure DoReportBasicSalary;//显示基本工资信息
   procedure DoReportAttendStatistic;//显示员工统计信息
   procedure DoReportCustomerCard;//显示顾客办卡列表
   procedure DoReportServiceBooking;//显示顾客服务预约
   procedure DoReportDayStatistic;//显示日营业额统计
   procedure DoReportMonthStatistic;//显示月营业额统计
   procedure DoReportReceipt;       //打印收营小票
   procedure DoReportSalary;        //打印员工工资

implementation

uses
   PublicFunOrPro,unit_Main,unit_about,unit_Employee,unit_Login,unit_Customer,unit_DataModule,
   unit_dictionary,Unit_AttendConfig,unit_Empattendance,unit_specialAttend,unit_attenstat,
   unit_attendmanager,unit_selectreason,unit_createcard,unit_cardmanager,unit_cardtrack,
   unit_servicebooking,unit_frontcheck,unit_ServiceItem,unit_ServiceMeal,unit_ChooseEmployee,
   unit_power,unit_unit,unit_operator,unit_editpassword,unit_basicSalary,unit_Salaryitem,
   unit_serviceitemextra,unit_DayStatistic,unit_MonthStatistic,unit_SysInitial,unit_salarymanager,
   unit_ServiceMealExtra,unit_ChooseCustomer,unit_reportcustomer,unit_reportEmployee,
   unit_ReportBasicSalary,unit_reportAttendStatistic,unit_reportCustomerCard,unit_ReportServiceBooking,
   unit_ReportDayStatistic,unit_ReportMonthStatistic,unit_reportreceipt,unit_ReportSalary,
   unit_CustomerRegister;


procedure InitializePrj;
begin
  if frm_main=nil then exit;

  frm_main.mnuPassword.Enabled    := true;
  frm_main.mnuUserManager.Enabled := true;
  frm_main.mnuUserDictionary.Enabled := true;
  frm_main.mnuSysInitial.Enabled :=true;

  frm_main.mnuCustomerRegister.Enabled :=true;
  frm_main.mnuFrontCheck.Enabled := true;
  frm_main.mnuDayStatistic.Enabled :=true;
  frm_main.mnuMonthStatistic.Enabled :=true;

  frm_main.mnuSalaryManager.Enabled :=true;
  frm_main.mnuBasicSalary.Enabled :=true;
  frm_main.mnuSalaryItem.Enabled :=true;
  frm_main.mnuServiceItem.Enabled :=true;
  frm_main.mnuServiceMeal.Enabled :=true;

  frm_main.mnuBasicCustomer.Enabled := true;
  frm_main.mnuCustomerCard.Enabled := true;
  frm_main.mnuCardManager.Enabled := true;
  frm_main.mnuCardTrack.Enabled := true;
  frm_main.mnuServiceBooking.Enabled := true;

  frm_main.mnuNormalAttend.Enabled := true;
  frm_main.mnuSpecialAttend.Enabled := true;
  frm_main.mnuAttendManager.Enabled := true;
  frm_main.mnuAttendStat.Enabled := true;
  frm_main.mnuAttendConfig.Enabled := true;

  frm_main.mnuBasicEmployee.Enabled := true;

  frm_main.mnuPassword.Enabled    := GetPower(SysUserId,'修改密码','浏览权');
  frm_main.mnuUserManager.Enabled := GetPower(SysUserId,'用户管理','浏览权');
  frm_main.mnuUserDictionary.Enabled := GetPower(SysUserId,'用户字典','浏览权');
  frm_main.mnuSysInitial.Enabled := GetPower(SysUserId,'系统初始化','浏览权');

  frm_main.mnuCustomerRegister.Enabled  := GetPower(SysUserId,'顾客登记','浏览权');
  frm_main.mnuFrontCheck.Enabled := GetPower(SysUserId,'前台收营','浏览权');
  frm_main.mnuDayStatistic.Enabled := GetPower(SysUserId,'日营业额统计','浏览权');
  frm_main.mnuMonthStatistic.Enabled := GetPower(SysUserId,'月营业额统计','浏览权');

  frm_main.mnuSalaryManager.Enabled := GetPower(SysUserId,'工资管理','浏览权');
  frm_main.mnuBasicSalary.Enabled := GetPower(SysUserId,'基本工资','浏览权');
  frm_main.mnuSalaryItem.Enabled := GetPower(SysUserId,'工资项目','浏览权');
  frm_main.mnuServiceItem.Enabled := GetPower(SysUserId,'服务提成','浏览权');
  frm_main.mnuServiceMeal.Enabled := GetPower(SysUserId,'套餐提成','浏览权');

  frm_main.mnuBasicCustomer.Enabled := GetPower(SysUserId,'客户信息','浏览权');
  frm_main.mnuCustomerCard.Enabled  := GetPower(SysUserId,'顾客办卡','浏览权');
  frm_main.mnuCardManager.Enabled   := GetPower(SysUserId,'顾客卡管理','浏览权');
  frm_main.mnuCardTrack.Enabled     := GetPower(SysUserId,'顾客卡追踪','浏览权');
  frm_main.mnuServiceBooking.Enabled:= GetPower(SysUserId,'顾客预约服务','浏览权');

  frm_main.mnuNormalAttend.Enabled  := GetPower(SysUserId,'正常考勤','浏览权');
  frm_main.mnuSpecialAttend.Enabled := GetPower(SysUserId,'特殊考勤','浏览权');
  frm_main.mnuAttendManager.Enabled := GetPower(SysUserId,'考勤管理','浏览权');
  frm_main.mnuAttendStat.Enabled    := GetPower(SysUserId,'考勤统计','浏览权');
  frm_main.mnuAttendConfig.Enabled  := GetPower(SysUserId,'考勤设置','浏览权');
  
  frm_main.mnuBasicEmployee.Enabled := GetPower(SysUserId,'员工信息','浏览权');
end;

function GetPower(UserId,PowerName,OperationName:string):boolean;
var
  i:integer;
  TempStr:string;
begin
  result := true;
  if OperationName='修改权' then i:=1;
  if OperationName='浏览权' then i:=2;
  if OperationName='打印权' then i:=3;
  with dmod.ADOQuery1  do
  begin
    close;
    sql.Text := 'select PowerString from UserPower where UserId=:UserId and '+
                'PowerName=:PowerName';
    Parameters.ParamValues['UserId'] := UserId;
    Parameters.ParamValues['PowerName'] := PowerName;
    open;

    if eof then result := false
    else
    begin
      TempStr := FieldByName('PowerString').AsString;
      result := copy(TempStr,i,1)='1';
    end;
  end;
end;

procedure DoPower(MyGrid:TStringGrid);
begin
  try
    frm_Power := Tfrm_Power.Create(nil);
    frm_Power.TempString := MyGrid;
    frm_Power.ref;
    frm_Power.ShowModal;
  finally
    frm_Power.free;
    frm_Power:=nil;
  end;    
end;

procedure DoAbout;
begin
  frm_about := Tfrm_about.Create(nil);
  frm_about.ShowModal ;
end;

procedure DoEmployee;
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

procedure DoCustomer;
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

procedure DoDictionary;
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

procedure DoAttendConfig;
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

procedure DoNormalAttend;
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

procedure DoSpecialAttend;
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

procedure DoAttendStatistic;
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

procedure DoAttendManager;
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

procedure DoSelectReason;
begin
  if frm_selectreason = nil then
  begin
    frm_selectreason := Tfrm_selectreason.Create(nil);
    frm_selectreason.Left :=0;
    frm_selectreason.Top  :=0;
    frm_selectreason.selectreason_ref ;
    frm_selectreason.Show ;
  end else frm_selectreason.BringToFront ;
end;

procedure DoCreateCard;
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

procedure DoCardManager;
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

procedure DoCardTrack;
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

procedure DoServiceBooking;
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

procedure DoFrontCheck;
begin
  if frm_frontcheck = nil then
  begin
    frm_frontcheck := Tfrm_frontcheck.Create(nil);
    frm_frontcheck.Left :=0;
    frm_frontcheck.Top  :=0;
    frm_frontcheck.frontcheck_ref ;
    frm_frontcheck.Show ;
  end else frm_frontcheck.BringToFront ;
end;

procedure DoServiceItem;
begin
  if frm_serviceitem = nil then
  begin
    frm_serviceitem := Tfrm_serviceitem.Create(nil);
    frm_serviceitem.Left :=0;
    frm_serviceitem.Top  :=0;
    frm_serviceitem.serviceitem_ref ;
    frm_serviceitem.Show ;
  end else frm_serviceitem.BringToFront ;
end;

procedure DoServiceMeal;
begin
  if frm_servicemeal = nil then
  begin
    frm_servicemeal := Tfrm_servicemeal.Create(nil);
    frm_servicemeal.Left :=0;
    frm_servicemeal.Top  :=0;
    frm_servicemeal.servicemeal_ref ;
    frm_servicemeal.Show ;
  end else frm_servicemeal.BringToFront ;
end;

procedure DoChooseEmployee(isattend:String);
begin
  if frm_chooseemployee = nil then
  begin
    frm_chooseemployee := Tfrm_chooseemployee.Create(nil);
    frm_chooseemployee.Left :=0;
    frm_chooseemployee.Top  :=0;
    frm_chooseemployee.chooseemployee_ref ;
    frm_chooseemployee.isattend := isattend;
    frm_chooseemployee.Show ;
  end else frm_chooseemployee.BringToFront ;
end;

procedure DoChooseCustomer;
begin
  if frm_chooseCustomer = nil then
  begin
    frm_chooseCustomer := Tfrm_chooseCustomer.Create(nil);
    frm_chooseCustomer.Left :=0;
    frm_chooseCustomer.Top  :=0;
    frm_chooseCustomer.choosecustomer_ref ;
    frm_chooseCustomer.Show ;
  end else frm_chooseCustomer.BringToFront ;
end;

procedure DoUnit;
begin
  if frm_unit=nil then
  begin
    frm_unit:=Tfrm_unit.create(nil);
    frm_unit.ref;
    frm_unit.show;
  end else frm_unit.BringToFront;
end;

procedure DoOperator;
begin
  if frm_operator=nil then
  begin
    frm_operator:=Tfrm_operator.create(nil);
    frm_operator.Left:= frm_main.Width div 2 - frm_operator.Width div 2 ;
    frm_operator.Top:= frm_main.Height div 2 - frm_operator.Height div 2 ;
    frm_operator.show;
  end else frm_operator.BringToFront;
end;

procedure DoRelogin;
begin
  try
    frm_login := Tfrm_login.Create(nil);
    frm_login.Left:=0;
    frm_login.Top:=0;
    frm_Login.ShowModal;
  finally
    frm_login.Free;
    frm_login:=nil;
  end;
end;

procedure DoEditPassword;
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

procedure DoBasicSalary;
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

procedure DoSalaryItem;
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

procedure DoServiceItemExtra;
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

procedure DoServiceMealExtra;
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

procedure DoDayStatistic;
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

procedure DoMonthStatistic;
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

procedure DoSysInitial;
begin
  if frm_SysInitial=nil then
  begin
    frm_SysInitial:=Tfrm_SysInitial.create(nil);
    frm_SysInitial.Left:=0;
    frm_SysInitial.Top:=0;
    frm_SysInitial.ref;
    frm_SysInitial.Show;
  end else  frm_SysInitial.BringToFront ;
end;

procedure DoSalaryManager;
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

procedure DoCustomerRegister;
begin
  if frm_CustomerRegister=nil then
  begin
    frm_CustomerRegister:=Tfrm_CustomerRegister.create(nil);
    frm_CustomerRegister.Left:=0;
    frm_CustomerRegister.Top:=0;
    frm_CustomerRegister.CustomerRegister_ref;
    frm_CustomerRegister.Show;
  end else  frm_CustomerRegister.BringToFront ;
end;

procedure DoReportCustomer;
begin
  frm_ReportCustomer:=Tfrm_ReportCustomer.Create(nil);
  frm_ReportCustomer.ref;
  frm_ReportCustomer.QuickRep1.Preview;
end;

procedure DoReportEmployee;
begin
  frm_ReportEmployee:=Tfrm_ReportEmployee.Create(nil);
  frm_ReportEmployee.ref;
  frm_ReportEmployee.QuickRep1.Preview;
end;

procedure DoReportBasicSalary;
begin
  frm_reportbasicsalary:=Tfrm_reportbasicsalary.Create(nil);
  frm_reportbasicsalary.Ref;
  frm_reportbasicsalary.QuickRep1.Preview ;
end;

procedure DoReportAttendStatistic;
begin
  frm_ReportAttendStatistic:=Tfrm_ReportAttendStatistic.Create(nil);
  frm_ReportAttendStatistic.Ref;
  frm_ReportAttendStatistic.QuickRep1.Preview ;
end;

procedure DoReportCustomerCard;
begin
  frm_ReportCustomerCard:=Tfrm_ReportCustomerCard.Create(nil);
  frm_ReportCustomerCard.Ref;
  frm_ReportCustomerCard.QuickRep1.Preview ;
end;

procedure DoReportServiceBooking;
begin
  frm_ReportServiceBooking:=Tfrm_ReportServiceBooking.Create(nil);
  frm_ReportServiceBooking.Ref;
  frm_ReportServiceBooking.QuickRep1.Preview ;
end;

procedure DoReportDayStatistic;
begin
  frm_ReportDayStatistic:=Tfrm_ReportDayStatistic.Create(nil);
  frm_ReportDayStatistic.Ref;
  frm_ReportDayStatistic.QuickRep1.Preview ;
end;

procedure DoReportMonthStatistic;
begin
  frm_ReportMonthStatistic:=Tfrm_ReportMonthStatistic.Create(nil);
  frm_ReportMonthStatistic.Ref;
  frm_ReportMonthStatistic.QuickRep1.Preview ;
end;

procedure DoReportReceipt;
begin
  frm_ReportReceipt:=Tfrm_ReportReceipt.Create(nil);
  frm_ReportReceipt.Ref;
  frm_ReportReceipt.QuickRep1.Preview ;
end;

procedure DoReportSalary;
begin
  frm_ReportSalary:=Tfrm_ReportSalary.Create(nil);
  frm_ReportSalary.Ref;
  frm_ReportSalary.QuickRep1.Preview ;
end;
end.

