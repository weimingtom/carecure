unit Utj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh, Buttons,
  PrnDbgeh;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    PrintDBGridEh1: TPrintDBGridEh;
    TabControl2: TTabControl;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    fromdate: TDBDateTimeEditEh;
    todate: TDBDateTimeEditEh;
    BitBtn5: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
