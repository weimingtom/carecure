unit Udj;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, 
  DBLookupEh,upreview,Unit_DataModule, DBSumLst, Mask, DBCtrlsEh,  DBCtrls,
  GridsEh;

type
  Tfdj = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    bh: TMaskEdit;
    search: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    procedure BitBtn3Click(Sender: TObject);
    procedure searchClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bhExit(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}


procedure Tfdj.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfdj.searchClick(Sender: TObject);

begin
DMod.tdjsearch.Close;
DMod.tdjsearch.Parameters.ParamByName('bh').Value:=bh.Text;
try
DMod.tdjsearch.Open;
except
end;
if DMod.tdjsearch.RecordCount<=0 then
showmessage('没有找到相应的单据');


end;

procedure Tfdj.BitBtn6Click(Sender: TObject);
begin
if DMod.tdjsearch.active   then
if DMod.tdjsearch.RecordCount>0 then
begin
fpreview.frdj.FindObject('memo1').Memo.Text:='商品'+DMod.tdjsearch.FieldValues['类型']+'单' ;
 fpreview.frdj.ShowReport;
 fpreview.ShowModal;
end;
end;

procedure Tfdj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfdj.bhExit(Sender: TObject);
begin
try
search.Click;
except
end;
end;

end.