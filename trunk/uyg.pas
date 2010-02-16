unit uyg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, DBCtrlsEh, DBLookupEh,
  DBGridEh, Buttons, Grids, XPMenu, PrnDbgeh, GridsEh;

type
  Tfyg = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn7Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses Udm;

{$R *.dfm}





procedure Tfyg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfyg.BitBtn7Click(Sender: TObject);
begin
close;
end;

procedure Tfyg.TabSheet1Show(Sender: TObject);
begin
 adodm.tyg.Filtered:=false;
end;

procedure Tfyg.TabSheet2Show(Sender: TObject);
begin
adodm.tbm.Filtered:=false;

end;

procedure Tfyg.TabSheet3Show(Sender: TObject);
begin
adodm.tdw.Filter:='clientid >0';
adodm.tdw.Filtered:=true;
end;

procedure Tfyg.BitBtn6Click(Sender: TObject);
begin
 printdbgrideh1.DBGridEh:=( pagecontrol1.ActivePage.Controls[0]) as tdbgrideh ;
  printdbgrideh1.BeforeGridText.Text:=pagecontrol1.ActivePage.Caption+'һ����';
  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfyg.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tyg.Eof   then
begin
adodm.tyg.Append;
dbgrideh1.Col:=1;
end;
end;

procedure Tfyg.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tbm.Eof   then
begin
adodm.tbm.Append;
dbgrideh2.Col:=1;
end;
end;

procedure Tfyg.DBGridEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tdw.Eof   then
begin
adodm.tdw.Append;
dbgrideh3.Col:=1;
end;
end;

end.
