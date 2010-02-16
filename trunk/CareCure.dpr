program CareCure;

uses
  Forms,
  windows,
  inifiles, Messages, Dialogs, Graphics, Controls,
  StdCtrls, Mask, Buttons, SysUtils,

  PublicFunOrPro in 'PublicFunOrPro.pas',
  unit_about in 'unit_about.pas' {frm_about},
  Unit_AttendConfig in 'Unit_AttendConfig.pas' {frm_attendconfig},
  Unit_AttendManager in 'Unit_AttendManager.pas' {frm_attendmanager},
  Unit_Attenstat in 'Unit_Attenstat.pas' {frm_attendstat},
  Unit_CardManager in 'Unit_CardManager.pas' {frm_cardmanager},
  Unit_CardTrack in 'Unit_CardTrack.pas' {frm_cardtrack},
  Unit_ChooseEmployee in 'Unit_ChooseEmployee.pas' {frm_chooseemployee},
  Unit_CreateCard in 'Unit_CreateCard.pas' {frm_createcard},
  Unit_Customer in 'Unit_Customer.pas' {frm_customer},
  Unit_DataModule in 'Unit_DataModule.pas' {DMod: TDataModule},
  Unit_Dictionary in 'Unit_Dictionary.pas' {frm_dictionary},
  Unit_Empattendance in 'Unit_Empattendance.pas' {frm_empattend},
  Unit_FrontCheck in 'Unit_FrontCheck.pas' {frm_frontcheck},
  unit_login in 'Unit_Login.pas' {frm_login},
  Unit_Main in 'Unit_Main.pas' {frm_main},
  unit_operator in 'unit_operator.pas' {frm_operator},
  unit_power in 'unit_power.pas' {frm_power},
  Unit_PublicFunction in 'Unit_PublicFunction.pas',
  Unit_SelectReason in 'Unit_SelectReason.pas' {frm_selectreason},
  Unit_ServiceBooking in 'Unit_ServiceBooking.pas' {frm_servicebooking},
  Unit_ServiceItem in 'Unit_ServiceItem.pas' {frm_ServiceItem},
  Unit_ServiceMeal in 'Unit_ServiceMeal.pas' {frm_servicemeal},
  Unit_SpecialAttend in 'Unit_SpecialAttend.pas' {frm_specialattend},
  Unit_TotalPublic in 'Unit_TotalPublic.pas',
  unit_unit in 'unit_unit.pas' {frm_unit},
  unit_editpassword in 'unit_editpassword.pas' {frm_editpassword},
  Unit_BasicSalary in 'Unit_BasicSalary.pas' {frm_basicsalary},
  Unit_SalaryItem in 'Unit_SalaryItem.pas' {frm_salaryitem},
  Unit_ServiceItemExtra in 'Unit_ServiceItemExtra.pas' {frm_serviceitemextra},
  Unit_DayStatistic in 'Unit_DayStatistic.pas' {frm_daystatistic},
  Unit_MonthStatistic in 'Unit_MonthStatistic.pas' {frm_monthstatistic},
  Unit_SysInitial in 'Unit_SysInitial.pas' {frm_SysInitial},
  Unit_SalaryManager in 'Unit_SalaryManager.pas' {frm_salarymanager},
  Unit_ServiceMealExtra in 'Unit_ServiceMealExtra.pas' {frm_servicemealextra},
  Unit_ChooseCustomer in 'Unit_ChooseCustomer.pas' {frm_choosecustomer},
  preview in 'PREVIEW.PAS' {myprevform},
  Unit_ReportCustomer in 'Unit_ReportCustomer.pas' {frm_ReportCustomer},
  Unit_ReportEmployee in 'Unit_ReportEmployee.pas' {frm_reportemployee},
  Unit_Employee in 'Unit_Employee.pas' {frm_employee},
  Unit_ReportBasicSalary in 'Unit_ReportBasicSalary.pas'
  {frm_reportbasicsalary},
  Unit_ReportAttendStatistic in 'Unit_ReportAttendStatistic.pas'
  {frm_reportattendstatistic},
  Unit_ReportCustomerCard in 'Unit_ReportCustomerCard.pas'
  {frm_reportCustomerCard},
  Unit_ReportServiceBooking in 'Unit_ReportServiceBooking.pas'
  {frm_ReportServiceBooking},
  Unit_ReportDayStatistic in 'Unit_ReportDayStatistic.pas'
  {frm_ReportDayStatistic},
  Unit_ReportMonthStatistic in 'Unit_ReportMonthStatistic.pas'
  {frm_ReportMonthStatistic},
  Unit_ReportReceipt in 'Unit_ReportReceipt.pas' {frm_ReportReceipt},
  Unit_ReportSalary in 'Unit_ReportSalary.pas' {frm_ReportSalary},
  Unit_CustomerRegister in 'Unit_CustomerRegister.pas' {frm_CustomerRegister},
  Unit_DBini in 'Unit_DBini.pas' {frm_DBini},
  Uac in 'Uac.pas' {fac},
  Uback in 'Uback.pas' {fback},
  ubs in 'ubs.pas' {fbs},
  ucr in 'ucr.pas' {fcr},
  Udj in 'Udj.pas' {fdj},
  Udm in 'Udm.pas' {adodm: TDataModule},
  ukc in 'ukc.pas' {fkc},
  Ukctj in 'Ukctj.pas' {fkctj},
  ukl in 'ukl.pas' {Fkl},
  Ulogin in 'Ulogin.pas' {Flogin},
  Uls in 'Uls.pas' {fls},
  Umain in 'Umain.pas' {fmain},
  Upd in 'upd.pas' {fpd},
  Upf in 'Upf.pas' {fpf},
  upreview in 'upreview.pas' {fpreview},
  Urk in 'Urk.pas' {frk},
  uty in 'uty.pas' {fty},
  uuser in 'uuser.pas' {Fuser},
  Uuser2 in 'Uuser2.pas' {Fuser2},
  uxl in 'uxl.pas' {fxl},
  Uxstj in 'Uxstj.pas' {fxstj},
  uyg in 'uyg.pas' {fyg},
  Uypzdk in 'Uypzdk.pas' {fypzdk},
  Uypzdk2 in 'Uypzdk2.pas' {fypzdk2};

{$R *.res}
var
  DBFile: Tinifile;
  DB_Source, DB_User, DB_Password : string;
  Frm_Dbini: Tfrm_DBini;
  flash: tfac;
  conn: boolean;
begin
  //  try
    //Application.Initialize;
   // Application.Title :='美容院管理系统1.0';
    //Application.CreateForm(TDMod, DMod);
    //Application.CreateForm(Tfrm_main, frm_main);
    //Application.CreateForm(Tfrm_login, frm_login);

  Application.Initialize;
  flash := tfac.Create(application);

  //flash.BitBtn1.Visible := false;
  //flash.Label4.Visible := true;
  //flash.Show;
  //flash.Update;
  //sleep(1000);

  Application.Title := '理疗保健智能管理系统';
  Application.CreateForm(TDMod, DMod);

  DBFile := tinifile.Create(extractfilepath(application.ExeName) +
    'DBConn.ini');
  DB_Source := DBFile.ReadString('CareCure', 'DB_Source',
    'data/caremdb.mdb');
  DB_User := DBFile.ReadString('CareCure', 'DB_User', 'admin');
  DB_Password := DBFile.ReadString('CareCure', 'DB_Password', 'carecure');
  DBFile.Free;

  DB_CONNString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Password="";' +
    'User ID=' + DB_User + ';Data Source=' + DB_Source + ';' +
    'Mode=Share Deny None;Extended Properties="";' +
    'Locale Identifier=1028;Jet OLEDB:System database="";' +
    'Jet OLEDB:Registry Path="";Jet OLEDB:' +
    'Database Password=' + DB_Password + ';Jet OLEDB:Engine Type=5;' +
    'Jet OLEDB:Database Locking Mode=1;' +
    'Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;' +
    'Jet OLEDB:New Database Password="";' +
    'Jet OLEDB:Create System Database=False;' +
    'Jet OLEDB:Encrypt Database=False;' +
    'Jet OLEDB:' +
    'Don' + '''t Copy Locale on Compact=False;' +
    'Jet OLEDB:Compact Without Replica Repair=False;' +
    'Jet OLEDB:SFP=False;';
  DMod.Adocon.ConnectionString := DB_CONNString;
  conn := true; //连接成功已否标志
  try
    DMod.Adocon.Connected := true;
  except
    conn := false;
  end;

  while not conn do
  begin
    if MessageBox(Application.Handle, '联接数据库服务器失败,是否重新配置连接?',
      '提示', MB_YESNO + mb_iconinformation) = 7 then
      break
    else
    begin
      Frm_DBini := TFrm_DBini.Create(nil);
      //nil表示该对象的创建和销毁都由自己完成
      Frm_DBini.ShowModal;
      Frm_DBini.Free;
      DBFile := tinifile.Create(extractfilepath(application.ExeName) +
        'DBConn.ini');
      DB_Source := DBFile.ReadString('CareCure', 'DB_Source', 'caremdb.mdb');
      DB_User := DBFile.ReadString('CareCure', 'DB_User', 'admin');
      DB_Password := DBFile.ReadString('CareCure', 'DB_Password', '123456');
      DBFile.Free;
      DB_CONNString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;Password="";' +
        'User ID=' + DB_User + ';Data Source=' + DB_Source + ';' +
        'Mode=Share Deny None;Extended Properties="";' +
        'Locale Identifier=1028;Jet OLEDB:System database="";' +
        'Jet OLEDB:Registry Path="";Jet OLEDB:' +
        'Database Password=' + DB_Password + ';Jet OLEDB:Engine Type=5;' +
        'Jet OLEDB:Database Locking Mode=1;' +
        'Jet OLEDB:Global Partial Bulk Ops=2;' +
        'Jet OLEDB:Global Bulk Transactions=1;' +
        'Jet OLEDB:New Database Password="";' +
        'Jet OLEDB:Create System Database=False;' +
        'Jet OLEDB:Encrypt Database=False;' +
        'Jet OLEDB:' +
        'Don' + '''t Copy Locale on Compact=False;' +
        'Jet OLEDB:Compact Without Replica Repair=False;' +
        'Jet OLEDB:SFP=False;';
      DMod.Adocon.ConnectionString := DB_CONNString;
      conn := true;
      try
        DMod.Adocon.Connected := true;
      except
        conn := false;
        flash.Label4.Caption := '联接失败，请检验后台数据库状态！';
        flash.Update;
        sleep(500);
      end;
    end;
  end;

  if conn then
  begin
    DMod.toper.Open;
    DMod.tuser.Open;
    DMod.typzdk.Open;
    DMod.tkc.Open;
    //DMod.tyg.Open;
    DMod.tbm.Open;
    DMod.tdw.Open;
    flash.Label4.Caption := '联接成功！请继续操作';
    flash.Close;
    flash.Free;
    Application.CreateForm(Tfrm_main, frm_main);
    flogin := tflogin.Create(application);
    flogin.ShowModal;
    flogin.Update;

    Application.Run;
  end
  else
    application.Terminate;
end.

