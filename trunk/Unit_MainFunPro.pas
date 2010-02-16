unit Unit_MainFunPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

var
  SysUserId, SysUserName: string;

//procedure InitializePrj; //��¼���ʼ��
//function GetPower(UserId, PowerName, OperationName: string): boolean;
//procedure DoPower(MyGrid: TStringGrid); //Ȩ�޴���

//procedure used for showing the windows

//procedure DoFrontManage;	//ǰ̨����
//procedure DoCustomerRegister; //�˿͵Ǽ�
procedure DoFrontCheck; //ǰ̨����

procedure DoDayStatistic; //��Ӫҵ��ͳ��
procedure DoMonthStatistic; //��Ӫҵ��ͳ��

procedure DoGoodsRetail; //��Ʒ����
procedure DoGoodsWholeSale; //��Ʒ����
procedure DoSalesStatistic; //����ͳ��
procedure DoAdjustSaleStat; //��������ͳ��

procedure DoReceiptQuery; //���ݲ�ѯ
procedure DoWholeSaleSummary; //��������

procedure DoMemberBuyQuery; //��Ա��Ʒ���Ѳ�ѯ
//procedure DoStoreManage;	//������
procedure DoGoodsDictionary; //��Ʒ�ֵ�ά��

procedure DoGoodsCheckIn; //��Ʒ���
procedure DoGoodsBizReturn; //��Ʒ�˻����̼ң�
procedure DoGoodsManReturn; //��Ʒ�˻����˿ͣ�
procedure DoStoreCheck; //����̵�
procedure DoGoodsMaintain; //��Ʒ����
procedure DoGoodsLoss; //��Ʒ����

procedure DoStoreLimite; //�������
procedure DoStoreList; //������
procedure DoExpireQuery; //���ڲ�ѯ
procedure DoStoreInQuery; //����¼��ѯ�޸�

procedure DoStoreInStat; //���ͳ��
procedure DoStoreCostStat; //������ͳ��
//procedure DoCustomerManage;	//�˿͹���
procedure DoBasicCustomer; //�˿ͻ�����Ϣ
procedure DoCustomerCard; //�˿Ͱ쿨

procedure DoCardManager; //�˿Ϳ�����
procedure DoCardTrack; //�˿Ϳ�׷��

procedure DoServiceBooking; //�˿�ԤԼ����
//procedure DoEmployeemanage; //Ա������
procedure DoBasicEmployee; //Ա��������Ϣ

procedure DoNormalAtt; //��������
procedure DoSpecialAtt; //���⿼��

procedure DoAttManager; //���ڹ���
procedure DoAttStat; //����ͳ��

procedure DoAttConfig; //��������

procedure DoSalaryManager; //Ա�����ʹ���

procedure DoBasicSalary; //������������
procedure DoSalaryItem; //������Ŀ����
procedure DoServiceItem; //�����������
procedure DoServiceMeal; //�ײ��������
//procedure DoSysMaintain;	//ϵͳά��
procedure DoBizDictionary; //������ҵ��Ϣ
procedure DoUserManager; //�û�����
procedure DoUserDictionary; //�����û�����

procedure DoDataBackUp; //���ݱ���
procedure DoDataRecovery; //���ݻָ�
procedure DoDataOptimize; //�����Ż�
procedure DoDataInitial; //���ݿ��ʼ��

procedure DoUnit; //���Ʊ�����λ������Ϣ
procedure DoBizInfo; //�̼һ�����Ϣ
procedure DoUserInfo; //�û���¼��Ϣ
procedure DoStyle; //���淽��
//procedure DoAbout;	//����
procedure DoTour; //��������ָ��

procedure DoHelp; //ϵͳ����

procedure DoDeveloper; //���ڱ����
procedure DoQuit; //�˳�ϵͳ
procedure DoReLogin; //���µ�½
procedure DoPassword; //�޸�����

procedure DoSysExit; //�˳�ϵͳ
//procedure DoBossQuery;	//�ϰ��ѯ
procedure DoBossMoney; //ÿ�����˶���Ǯ

procedure DoBossSalary; //ÿ��Ҫ�������Ƕ���

procedure DoBossIncoming; //�������Ƕ���

procedure DoBossProfit; //ʵ��������������

procedure DoBossGoods; //��Щ��Ʒ�����
procedure DoBossItems; //��Щ��Ŀ�����
procedure DoBossEmployee; //��ЩԱ��ҵ�����

procedure DoBossMember; //��Щ��Ա���ҳ�
procedure DoBossMemberLoss; //��Щ��Ա��Ҫ����
procedure DoBossMemberBirth; //������Щ��ԱҪ������

procedure DoBossGoodsOut; //��Щ��ƷҪû����
procedure DoBossGoodsExpire; //��Щ��ƷҪ������
procedure DoBossStore; //���ж��ٲ�Ʒ�ڲֿ�

procedure DoBossMaterial; //�������˶��ٲ���
procedure DoBossGuest; //�������˶��ٿ���

procedure DoBossWeek; //��ͳ�Ʊ�
procedure DoBossMonth; //�·�ͳ�Ʊ�
procedure DoBossReport; //�����޸�ʱ�䱨��

procedure DoBossMemberThere; //�����Ա�������ֵ���������
procedure DoBossMemberHere; //�����ֵ��Ա�ڱ�����������

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
  Unit_UserLogin,
  unit_UserManage, Unit_MdbManager, Unit_DataInitial, Unit_StyleSet,
  Unit_Bizinfo;

//procedure DoFrontManage;	//ǰ̨����

//procedure DoCustomerRegister; //�˿͵Ǽ�

procedure DoFrontCheck; //ǰ̨����
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

procedure DoDayStatistic; //��Ӫҵ��ͳ��
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

procedure DoMonthStatistic; //��Ӫҵ��ͳ��
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

procedure DoGoodsRetail; //��Ʒ����
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

procedure DoGoodsWholeSale; //��Ʒ����
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

procedure DoSalesStatistic; //����ͳ��
begin
    if application.FindComponent('frm_SalesStatistic') = nil then
  begin
    SalesStatistic := tfrm_SalesStatistic.create(application);
    SalesStatistic.Show;
  end
  else if not SalesStatistic.Showing then
    SalesStatistic.Show;
end;

procedure DoAdjustSaleStat; //��������ͳ��
begin
    if application.FindComponent('frm_AdjustSaleStat') = nil then
  begin
    AdjustSaleStat := tfrm_AdjustSaleStat.create(application);
    AdjustSaleStat.Show;
  end
  else if not AdjustSaleStat.Showing then
    AdjustSaleStat.Show;
end;

procedure DoReceiptQuery; //���ݲ�ѯ
begin
    if application.FindComponent('frm_ReceiptQuery') = nil then
  begin
    ReceiptQuery := tfrm_ReceiptQuery.create(application);
    ReceiptQuery.Show;
  end
  else if not ReceiptQuery.Showing then
    ReceiptQuery.Show;
end;

procedure DoWholeSaleSummary; //��������
begin
    if application.FindComponent('frm_WholeSaleSummary') = nil then
  begin
    WholeSaleSummary := tfrm_WholeSaleSummary.create(application);
    WholeSaleSummary.Show;
  end
  else if not WholeSaleSummary.Showing then
    WholeSaleSummary.Show;
end;

procedure DoMemberBuyQuery; //��Ա��Ʒ���Ѳ�ѯ
begin

end;

//procedure DoStoreManage;	//������

procedure DoGoodsDictionary; //��Ʒ�ֵ�ά��
begin
    if application.FindComponent('frm_GoodsDictionary') = nil then
  begin
    GoodsDictionary := tfrm_GoodsDictionary.create(application);
    GoodsDictionary.Show;
  end
  else if not GoodsDictionary.Showing then
    GoodsDictionary.Show;
end;

procedure DoGoodsCheckIn; //��Ʒ���
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

procedure DoGoodsBizReturn; //��Ʒ�˻����̼ң�
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

procedure DoGoodsManReturn; //��Ʒ�˻����˿ͣ�
begin

end;

procedure DoStoreCheck; //����̵�
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

procedure DoGoodsMaintain; //��Ʒ����
begin

end;

procedure DoGoodsLoss; //��Ʒ����
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

procedure DoStoreLimite; //�������
begin

end;

procedure DoStoreList; //������
begin
   if application.FindComponent('frm_StoreList') = nil then
  begin
    StoreList := tfrm_StoreList.create(application);
    StoreList.Show;
  end
  else if not StoreList.Showing then
    StoreList.Show;
end;

procedure DoExpireQuery; //���ڲ�ѯ
begin

end;

procedure DoStoreInQuery; //����¼��ѯ�޸�
begin

end;

procedure DoStoreInStat; //���ͳ��
begin

end;

procedure DoStoreCostStat; //������ͳ��
begin

end;

//procedure DoCustomerManage;	//�˿͹���

procedure DoBasicCustomer; //�˿ͻ�����Ϣ
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

procedure DoCustomerCard; //�˿Ͱ쿨
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

procedure DoCardManager; //�˿Ϳ�����
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

procedure DoCardTrack; //�˿Ϳ�׷��
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

procedure DoServiceBooking; //�˿�ԤԼ����
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

//procedure DoEmployeemanage; //Ա������

procedure DoBasicEmployee; //Ա��������Ϣ
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

procedure DoNormalAtt; //��������
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

procedure DoSpecialAtt; //���⿼��
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

procedure DoAttManager; //���ڹ���
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

procedure DoAttStat; //����ͳ��
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

procedure DoAttConfig; //��������
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

procedure DoSalaryManager; //Ա�����ʹ���
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

procedure DoBasicSalary; //������������
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

procedure DoSalaryItem; //������Ŀ����
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

procedure DoServiceItem; //�����������
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

procedure DoServiceMeal; //�ײ��������
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

//procedure DoSysMaintain;	//ϵͳά��

procedure DoBizDictionary; //������ҵ��Ϣ
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

procedure DoUserManager; //�û�����
begin
   if application.FindComponent('frm_UserManage') = nil then
  begin
    UserManage := Tfrm_UserManage.create(application);
    UserManage.Show;
  end
  else if not UserManage.Showing then
    UserManage.Show;
end;

procedure DoUserDictionary; //�����û�����
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

procedure DoDataBackUp; //���ݱ���
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

procedure DoDataRecovery; //���ݻָ�
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

procedure DoDataOptimize; //�����Ż�
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

procedure DoDataInitial; //���ݿ��ʼ��
begin  
  if application.FindComponent('frm_DataInitial') = nil then
  begin
    DataInitial := tfrm_DataInitial.create(application);
    DataInitial.Show;
  end
  else if not DataInitial.Showing then
    DataInitial.Show;
end;

procedure DoUnit; //���Ʊ�����λ������Ϣ
begin

end;

procedure DoBizInfo; //�̼һ�����Ϣ
begin
  if application.FindComponent('frm_BizInfo') = nil then
  begin
    BizInfo := tfrm_BizInfo.create(application);
    BizInfo.Show;
  end
  else if not BizInfo.Showing then
    BizInfo.Show;
end;

procedure DoUserInfo; //�û���¼��Ϣ
begin

end;

procedure DoStyle; //���淽��
begin
   if application.FindComponent('frm_StyleSet') = nil then
  begin
    StyleSet := tfrm_StyleSet.create(application);
    StyleSet.Show;
  end
  else if not StyleSet.Showing then
    StyleSet.Show;
end;

//procedure DoAbout;	//����

procedure DoTour; //��������ָ��
begin

end;

procedure DoHelp; //ϵͳ����
begin

end;

procedure DoDeveloper; //���ڱ����
begin
  frm_about := Tfrm_about.Create(nil);
  frm_about.ShowModal ;
end;

procedure DoQuit; //�˳�ϵͳ
begin
   if messagebox(frm_main.handle, '��ȷʵҪ�˳�ϵͳ��?', '��Ϣ', mb_okcancel +
    mb_iconquestion) = IDOK then
    application.Terminate;
end;

procedure DoReLogin; //���µ�½
begin
    if frm_main.skindata1.Active then
    frm_main.skindata1.Active := false;
  DMod.toper.Open;
  if DMod.toper.Locate('userid', frm_main.operid, []) then
  begin
    DMod.toper.edit;
    DMod.toper.FieldByName('�˳�ʱ��').AsDateTime := now;
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

procedure DoPassword; //�޸�����
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

procedure DoSysExit; //�˳�ϵͳ
begin

end;

//procedure DoBossQuery;	//�ϰ��ѯ

procedure DoBossMoney; //ÿ�����˶���Ǯ
begin

end;

procedure DoBossSalary; //ÿ��Ҫ�������Ƕ���
begin

end;

procedure DoBossIncoming; //�������Ƕ���

begin

end;

procedure DoBossProfit; //ʵ��������������
begin

end;

procedure DoBossGoods; //��Щ��Ʒ�����
begin

end;

procedure DoBossItems; //��Щ��Ŀ�����
begin

end;

procedure DoBossEmployee; //��ЩԱ��ҵ�����
begin

end;

procedure DoBossMember; //��Щ��Ա���ҳ�
begin

end;

procedure DoBossMemberLoss; //��Щ��Ա��Ҫ����
begin

end;

procedure DoBossMemberBirth; //������Щ��ԱҪ������
begin

end;

procedure DoBossGoodsOut; //��Щ��ƷҪû����
begin

end;

procedure DoBossGoodsExpire; //��Щ��ƷҪ������
begin

end;

procedure DoBossStore; //���ж��ٲ�Ʒ�ڲֿ�
begin

end;

procedure DoBossMaterial; //�������˶��ٲ���
begin

end;

procedure DoBossGuest; //�������˶��ٿ���

begin

end;

procedure DoBossWeek; //��ͳ�Ʊ�
begin

end;

procedure DoBossMonth; //�·�ͳ�Ʊ�
begin

end;

procedure DoBossReport; //�����޸�ʱ�䱨��

begin

end;

procedure DoBossMemberThere; //�����Ա�������ֵ���������
begin

end;

procedure DoBossMemberHere; //�����ֵ��Ա�ڱ�����������
begin

end;

end.

