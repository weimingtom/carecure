unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls;

type
  Tfrm_main = class(TForm)
    MainMenu1: TMainMenu;
    mnuSysMaintain: TMenuItem;
    mnuReLogin: TMenuItem;
    mnuPassword: TMenuItem;
    N4: TMenuItem;
    mnuUserManager: TMenuItem;
    N6: TMenuItem;
    mnuSysInitial: TMenuItem;
    N8: TMenuItem;
    mnuSysExit: TMenuItem;
    mnuBasicEmployee: TMenuItem;
    N3: TMenuItem;
    mnuNormalAttend: TMenuItem;
    mnuAttendStat: TMenuItem;
    N10: TMenuItem;
    mnuDeveloper: TMenuItem;
    N12: TMenuItem;
    mnuServiceBooking: TMenuItem;
    mnuBasicCustomer: TMenuItem;
    mnuUserDictionary: TMenuItem;
    mnuCustomerCard: TMenuItem;
    N16: TMenuItem;
    mnuAttendConfig: TMenuItem;
    mnuSpecialAttend: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mnuAttendManager: TMenuItem;
    N22: TMenuItem;
    mnuCardManager: TMenuItem;
    mnuCardTrack: TMenuItem;
    N1: TMenuItem;
    mnuFrontCheck: TMenuItem;
    Image1: TImage;
    Bar1: TStatusBar;
    mnuUnit: TMenuItem;
    N9: TMenuItem;
    mnuBasicSalary: TMenuItem;
    mnuSalaryItem: TMenuItem;
    mnuServiceItem: TMenuItem;
    N15: TMenuItem;
    mnuDayStatistic: TMenuItem;
    mnuMonthStatistic: TMenuItem;
    mnuSalaryManager: TMenuItem;
    N24: TMenuItem;
    mnuServiceMeal: TMenuItem;
    mnuCustomerRegister: TMenuItem;
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
    procedure mnuSysInitialClick(Sender: TObject);
    procedure mnuSalaryManagerClick(Sender: TObject);
    procedure mnuServiceMealClick(Sender: TObject);
    procedure mnuCustomerRegisterClick(Sender: TObject);
  private
    { Private declarations }
    FClientInstance,FPrevClientProc:TfarProc;
    procedure ClientWndProc(var Message: TMessage);
    procedure dorw(var MyDC : hDC);
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses Unit_PublicFunction, Unit_TotalPublic;

{$R *.dfm}

procedure Tfrm_main.ClientWndProc(var Message: TMessage);
VAR
  MyDC : hDC;
  Ro, Co : Word;
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
      Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam, lParam);
    end;
end;

procedure Tfrm_main.dorw(var MyDC : hDC);
var
  ro,co:word;
begin
  FOR Ro := 0 TO ClientHeight DIV Image1.Picture.Height DO
  FOR Co := 0 TO ClientWIDTH DIV Image1.Picture.Width DO
  begin
    BitBlt(MyDC, co*Image1.Picture.Width, ro*Image1.Picture.Height,
      Image1.Picture.Width, Image1.Picture.Height,
      Image1.Picture.bitmap.canvas.Handle,0,0, SRCCOPY);
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
   if messagebox(handle,'��ȷʵҪ�˳�ϵͳ��?','��Ϣ',mb_okcancel+mb_iconquestion)=IDOK then
    application.Terminate;
end;

procedure Tfrm_main.mnuUnitClick(Sender: TObject);
begin
  DoUnit;
end;

procedure Tfrm_main.mnuUserManagerClick(Sender: TObject);
begin
  DoOperator;
end;

procedure Tfrm_main.mnuReLoginClick(Sender: TObject);
begin
  DoReLogin;
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

procedure Tfrm_main.mnuSysInitialClick(Sender: TObject);
begin
  DoSysInitial;
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

end.
