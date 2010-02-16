unit Urk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh, Menus,upreview, GridsEh;

type
  Tfrk = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    Label2: TLabel;
    Label3: TLabel;
    dw: TDBLookupComboboxEh;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ren: TDBLookupComboboxEh;
    Edit2: TEdit;
    print: TCheckBox;
    save: TBitBtn;
    ret: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1ColExit(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure retClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    function  check():boolean;

    { Private declarations }
  public
    { Public declarations }
  end;



implementation
uses Unit_DataModule, Unit_UserLogin;
{$R *.dfm}

procedure Tfrk.FormShow(Sender: TObject);
begin
  DMod.tcr.Close;
  DMod.tcr.Open;
  label3.caption:=datetimetostr(date());
  DMod.tdw.Filter:=' 出入<> 0 ' ;
  DMod.tdw.Filtered:=true;
end;

procedure Tfrk.DBGridEh1ColExit(Sender: TObject);
begin

  DMod.tcr.Edit;
  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='数量'     then
  try
   DMod.tcr.FieldByName('金额').AsFloat:=DMod.tcr.FieldByName('数量').Asinteger*DMod.tcr.FieldByName('单价').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='单价'    then
  try
   DMod.tcr.FieldByName('金额').AsFloat:=DMod.tcr.FieldByName('数量').Asinteger*DMod.tcr.FieldByName('单价').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='金额'    then
  try
   DMod.tcr.FieldByName('单价').AsFloat:=DMod.tcr.FieldByName('金额').Asfloat/DMod.tcr.FieldByName('数量').Asinteger ;
  except
  end;

end;




function Tfrk.check: boolean;
begin
  result:=true;
 if trim(dw.Text)='' then
   begin
    showmessage('请选择一个购药单位，如果没有出现在列表中，请添加！');
    result:=false;
    exit;
    end;
 if DMod.tcr.RecordCount<=0 then
   begin
    showmessage('请录入购入的药品信息！');
    result:=false;
    exit;
   end;
end;

procedure Tfrk.saveClick(Sender: TObject);
begin

  if not check then
  exit;
  DMod.ctemp.Parameters.ParamValues['@lx']:='rk';
  DMod.ctemp.Execute;
  edit2.Text:=DMod.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  DMod.tcr.First;
  while not DMod.tcr.Eof do
  begin
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('编号').AsString:=trim(edit2.Text);

    DMod.tcr.FieldByName('出库单位').AsInteger:=DMod.tdw.fieldbyname('clientid').AsInteger;
    if trim(ren.Text)<>'' then
    DMod.tcr.FieldByName('开票人').Asinteger:=DMod.tyg.fieldbyname('ygid').Asinteger;
    DMod.tcr.FieldByName('操作人').Asstring:=trim(edit1.Text);
    DMod.tcr.FieldByName('类型').Asstring:='入库';
    DMod.tcr.fieldbyname('出入').asboolean:=true;
    DMod.tcr.FieldByName('日期').Asdatetime:=date;
    if DMod.tkc.Locate('ypid',DMod.tcr.FieldValues['ypid'],[]) then
    begin
      DMod.tkc.Edit;
      DMod.tkc.FieldByName('数量').AsInteger:=DMod.tkc.FieldByName('数量').AsInteger+DMod.tcr.FieldByName('数量').AsInteger;
      DMod.tkc.FieldByName('购进金额').Asfloat:=DMod.tkc.FieldByName('购进金额').Asfloat+DMod.tcr.FieldByName('金额').Asfloat;
      DMod.tkc.FieldByName('购进单价').Asfloat:=DMod.tkc.FieldByName('购进金额').Asfloat/DMod.tkc.FieldByName('数量').AsInteger;
      DMod.tkc.Post;
    end
    else
    begin
      DMod.tkc.Append;
      DMod.tkc.FieldByName('ypid').Asinteger:=DMod.tcr.fieldbyname('ypid').AsInteger;
      DMod.tkc.FieldByName('数量').AsInteger:=DMod.tcr.FieldByName('数量').AsInteger;
      DMod.tkc.FieldByName('购进金额').Asfloat:=DMod.tcr.FieldByName('购进金额').Asfloat;
      DMod.tkc.FieldByName('购进单价').Asfloat:=DMod.tcr.FieldByName('购进金额').Asfloat;
      DMod.tkc.Post;
    end;
    DMod.tcr.Next;
   end;
   DMod.tcr.UpdateBatch();
   dbgrideh1.Enabled:=false;
   if print.Checked then
   begin
   fpreview.frrk.LoadFromFile(frm_UserLogin.apppath+'\print\yprk.frf');
   fpreview.frrk.FindObject('memo1').Memo.Text:=label1.Caption;
   fpreview.frrk.ShowReport;
   end;
   save.Enabled:=false;




end;

procedure Tfrk.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 DMod.tcr.close;
 DMod.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfrk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
DMod.tcr.CancelUpdates;
DMod.tcr.Close;
except
end;


action:=cafree;
end;

procedure Tfrk.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and DMod.tcr.Eof   then
begin
 sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
 DMod.tcr.Append;
 dbgrideh1.Col:=1;
end;
end;

procedure Tfrk.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.