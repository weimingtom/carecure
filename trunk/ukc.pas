unit ukc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  DBGridEh, ComCtrls, ExtCtrls,udm,PrnDbgeh,
  Grids;

type
  Tfkc = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    Label3: TLabel;
    TabControl2: TTabControl;
    print: TBitBtn;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure printClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fkc: Tfkc;

implementation

{$R *.dfm}

procedure Tfkc.FormShow(Sender: TObject);
begin
  label3.Caption:=datetimetostr(date);
  bitbtn5.Click;
end;

procedure Tfkc.BitBtn5Click(Sender: TObject);
var sqlstr:string;
begin
 sqlstr:='select a.* ,b.* from ypzdk a,kc b,company where a.id=b.ypid '  ;
 adodm.ttemp.Close;
 adodm.ttemp.CommandText:= sqlstr;
 adodm.ttemp.Open;
end;

procedure Tfkc.printClick(Sender: TObject);
begin
  printdbgrideh1.Title.Text:=' ø‚ ¥Ê “ª ¿¿ ±Ì' ;
  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfkc.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfkc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adodm.ttemp.Close;
action:=cafree;
end;

end.
