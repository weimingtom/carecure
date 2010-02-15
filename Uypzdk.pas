unit Uypzdk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,udm, StdCtrls, Buttons, Grids, DBGridEh,uypzdk2, PrnDbgeh, Mask,
  DBCtrlsEh, DBLookupEh, ComCtrls;

type
  Tfypzdk = class(TForm)
    Label1: TLabel;
    dbshow: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    search: TDBLookupComboboxEh;
    SpeedButton1: TSpeedButton;
    TabControl1: TTabControl;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure searchChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure searchExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure Tfypzdk.BitBtn1Click(Sender: TObject);
begin
  dbshow.DataSource.DataSet.Append;
  fypzdk2.btadd.Show;
  fypzdk2.ShowModal;
end;

procedure Tfypzdk.BitBtn6Click(Sender: TObject);
begin

  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfypzdk.BitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure Tfypzdk.BitBtn5Click(Sender: TObject);
begin
 if messagedlg('专家建议不要删除此数据，是否真要删除此条数据？',mtwarning,[mbyes,mbcancel],0)=mryes then
  try
  dbshow.DataSource.DataSet.Delete;
  except
  messagedlg('删除数据时出错！',mterror,[mbok],0);
  end;
end;

procedure Tfypzdk.BitBtn4Click(Sender: TObject);
begin
 fypzdk2.btadd.Visible:=false;
 dbshow.DataSource.DataSet.edit;
 fypzdk2.pf.Enabled:=false;
 fypzdk2.ls.Enabled:=false;
 fypzdk2.look1.Visible:=true;
 fypzdk2.ShowModal;
 

end;

procedure Tfypzdk.searchChange(Sender: TObject);
begin
if trim(search.Text)<>'' then
 begin
  adodm.typzdk.DisableControls;
  adodm.typzdk.filtered:=false;
  adodm.typzdk.Filter:=' 编号 like '''+trim(search.text)+'%'' or '+'简码 like '''+trim(search.text)+'%'' or '+'名称 like '''+trim(search.text)+'%''' ;
  //showmessage(adodm.typzdk.Filter);
  adodm.typzdk.Filtered:=true;
  adodm.typzdk.EnableControls;
 end
else
  adodm.typzdk.Filtered:=false;
end;

procedure Tfypzdk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adodm.typzdk.Filtered:=false;
action:=cafree;
end;

procedure Tfypzdk.searchExit(Sender: TObject);
begin
  if adodm.typzdk.Filtered then
  postmessage(search.Handle,wm_keydown,vk_down,0);
end;

end.
