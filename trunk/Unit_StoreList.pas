unit Unit_StoreList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  DBGridEh, ComCtrls, ExtCtrls,Unit_DataModule,PrnDbgeh,
  Grids, GridsEh;

type
  Tfrm_StoreList = class(TForm)
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
  frm_StoreList: Tfrm_StoreList;

implementation

{$R *.dfm}

procedure Tfrm_StoreList.FormShow(Sender: TObject);
begin
  label3.Caption:=datetimetostr(date);
  bitbtn5.Click;
end;

procedure Tfrm_StoreList.BitBtn5Click(Sender: TObject);
var sqlstr:string;
begin
 sqlstr:='select a.* ,b.* from ypzdk a,kc b,company where a.id=b.ypid '  ;
 DMod.ttemp.Close;
 DMod.ttemp.CommandText:= sqlstr;
 DMod.ttemp.Open;
end;

procedure Tfrm_StoreList.printClick(Sender: TObject);
begin
  printdbgrideh1.Title.Text:=' ø‚ ¥Ê “ª ¿¿ ±Ì' ;
  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfrm_StoreList.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_StoreList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DMod.ttemp.Close;
action:=cafree;
end;

end.