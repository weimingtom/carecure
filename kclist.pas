unit kclist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls, ExtCtrls,udm,PrnDbgeh;

type
  Tkc = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kc: Tkc;

implementation

{$R *.dfm}

procedure Tkc.FormShow(Sender: TObject);
begin
  label3.Caption:=datetimetostr(date);
  bitbtn5.Click;
end;

procedure Tkc.BitBtn5Click(Sender: TObject);
var sqlstr:string;
begin
sqlstr:='select a.* ,b.* from ypzdk a,kc b where a.id=b.ypid '  ;
adodm.ttemp.Close;
adodm.ttemp.CommandText:= sqlstr;
adodm.ttemp.Open;

end;

procedure Tkc.printClick(Sender: TObject);
begin
  printdbgrideh1.Title.Text:=' ¿â ´æ ' ;
  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tkc.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
