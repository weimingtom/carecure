unit Udj;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, 
  DBLookupEh,upreview,udm, DBSumLst, Mask, DBCtrlsEh,  DBCtrls;

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
adodm.tdjsearch.Close;
adodm.tdjsearch.Parameters.ParamByName('bh').Value:=bh.Text;
try
adodm.tdjsearch.Open;
except
end;
if adodm.tdjsearch.RecordCount<=0 then
showmessage('û���ҵ���Ӧ�ĵ���');


end;

procedure Tfdj.BitBtn6Click(Sender: TObject);
begin
if adodm.tdjsearch.active   then
if adodm.tdjsearch.RecordCount>0 then
begin
fpreview.frdj.FindObject('memo1').Memo.Text:='ҩƷ'+adodm.tdjsearch.FieldValues['����']+'��' ;
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
