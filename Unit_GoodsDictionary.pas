unit Unit_GoodsDictionary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Unit_DataModule, StdCtrls, Buttons, Grids, DBGridEh,Unit_GoodsDetail, PrnDbgeh, Mask,
  DBCtrlsEh, DBLookupEh, ComCtrls, GridsEh;

type
  Tfrm_GoodsDictionary = class(TForm)
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

procedure Tfrm_GoodsDictionary.BitBtn1Click(Sender: TObject);
begin
  dbshow.DataSource.DataSet.Append;
  frm_GoodsDetail.btadd.Show;
  frm_GoodsDetail.ShowModal;
end;

procedure Tfrm_GoodsDictionary.BitBtn6Click(Sender: TObject);
begin

  printdbgrideh1.AfterGridText.Text:=datetostr(date);
  printdbgrideh1.Preview;
end;

procedure Tfrm_GoodsDictionary.BitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_GoodsDictionary.BitBtn5Click(Sender: TObject);
begin
 if messagedlg('专家建议不要删除此数据，是否真要删除此条数据？',mtwarning,[mbyes,mbcancel],0)=mryes then
  try
  dbshow.DataSource.DataSet.Delete;
  except
  messagedlg('删除数据时出错！',mterror,[mbok],0);
  end;
end;

procedure Tfrm_GoodsDictionary.BitBtn4Click(Sender: TObject);
begin
 frm_GoodsDetail.btadd.Visible:=false;
 dbshow.DataSource.DataSet.edit;
 frm_GoodsDetail.pf.Enabled:=false;
 frm_GoodsDetail.ls.Enabled:=false;
 frm_GoodsDetail.look1.Visible:=true;
 frm_GoodsDetail.ShowModal;
 

end;

procedure Tfrm_GoodsDictionary.searchChange(Sender: TObject);
begin
if trim(search.Text)<>'' then
 begin
  DMod.typzdk.DisableControls;
  DMod.typzdk.filtered:=false;
  DMod.typzdk.Filter:=' 编号 like '''+trim(search.text)+'%'' or '+'简码 like '''+trim(search.text)+'%'' or '+'名称 like '''+trim(search.text)+'%''' ;
  //showmessage(DMod.typzdk.Filter);
  DMod.typzdk.Filtered:=true;
  DMod.typzdk.EnableControls;
 end
else
  DMod.typzdk.Filtered:=false;
end;

procedure Tfrm_GoodsDictionary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DMod.typzdk.Filtered:=false;
action:=cafree;
end;

procedure Tfrm_GoodsDictionary.searchExit(Sender: TObject);
begin
  if DMod.typzdk.Filtered then
  postmessage(search.Handle,wm_keydown,vk_down,0);
end;

end.
