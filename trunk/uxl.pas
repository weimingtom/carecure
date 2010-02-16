unit uxl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls, ExtCtrls,Unit_DataModule,
  PrnDbgeh;

type
  Tfxl = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    Label3: TLabel;
    TabControl2: TTabControl;
    print: TBitBtn;
    DBGridEh1: TDBGridEh;
    fw: TRadioGroup;
    BitBtn5: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    BitBtn3: TBitBtn;
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
  fxl: Tfxl;

implementation

{$R *.dfm}

procedure Tfxl.FormShow(Sender: TObject);
begin
  label3.Caption:=datetimetostr(date);
end;

procedure Tfxl.BitBtn5Click(Sender: TObject);
var sqlstr:string;
begin
case fw.ItemIndex of
0:sqlstr:='select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid and ((b.数量>a.最高限量 and a.最高限量>0) or b.数量<a.最低限量)'  ;
1:sqlstr:='select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid and (b.数量>a.最高限量 and a.最高限量>0)';
2:sqlstr:='select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid and  b.数量<a.最低限量';
end;
DMod.ttemp.Close;
DMod.ttemp.CommandText:= sqlstr;
DMod.ttemp.Open;

end;

procedure Tfxl.printClick(Sender: TObject);
begin
  printdbgrideh1.Title.Text:='库 存 限 量' ;
  printdbgrideh1.AfterGridText.Text:=fw.Items[fw.itemindex]+'   '+datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfxl.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfxl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.