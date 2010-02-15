unit Urk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh, Menus,upreview;

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
uses udm, Ulogin;
{$R *.dfm}

procedure Tfrk.FormShow(Sender: TObject);
begin
  adodm.tcr.Close;
  adodm.tcr.Open;
  label3.caption:=datetimetostr(date());
  adodm.tdw.Filter:=' 出入<> 0 ' ;
  adodm.tdw.Filtered:=true;
end;

procedure Tfrk.DBGridEh1ColExit(Sender: TObject);
begin

  adodm.tcr.Edit;
  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='数量'     then
  try
   adodm.tcr.FieldByName('金额').AsFloat:=adodm.tcr.FieldByName('数量').Asinteger*adodm.tcr.FieldByName('单价').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='单价'    then
  try
   adodm.tcr.FieldByName('金额').AsFloat:=adodm.tcr.FieldByName('数量').Asinteger*adodm.tcr.FieldByName('单价').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='金额'    then
  try
   adodm.tcr.FieldByName('单价').AsFloat:=adodm.tcr.FieldByName('金额').Asfloat/adodm.tcr.FieldByName('数量').Asinteger ;
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
 if adodm.tcr.RecordCount<=0 then
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
  adodm.ctemp.Parameters.ParamValues['@lx']:='rk';
  adodm.ctemp.Execute;
  edit2.Text:=adodm.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  adodm.tcr.First;
  while not adodm.tcr.Eof do
  begin
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('编号').AsString:=trim(edit2.Text);

    adodm.tcr.FieldByName('出库单位').AsInteger:=adodm.tdw.fieldbyname('clientid').AsInteger;
    if trim(ren.Text)<>'' then
    adodm.tcr.FieldByName('开票人').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('操作人').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('类型').Asstring:='入库';
    adodm.tcr.fieldbyname('出入').asboolean:=true;
    adodm.tcr.FieldByName('日期').Asdatetime:=date;
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('数量').AsInteger:=adodm.tkc.FieldByName('数量').AsInteger+adodm.tcr.FieldByName('数量').AsInteger;
      adodm.tkc.FieldByName('购进金额').Asfloat:=adodm.tkc.FieldByName('购进金额').Asfloat+adodm.tcr.FieldByName('金额').Asfloat;
      adodm.tkc.FieldByName('购进单价').Asfloat:=adodm.tkc.FieldByName('购进金额').Asfloat/adodm.tkc.FieldByName('数量').AsInteger;
      adodm.tkc.Post;
    end
    else
    begin
      adodm.tkc.Append;
      adodm.tkc.FieldByName('ypid').Asinteger:=adodm.tcr.fieldbyname('ypid').AsInteger;
      adodm.tkc.FieldByName('数量').AsInteger:=adodm.tcr.FieldByName('数量').AsInteger;
      adodm.tkc.FieldByName('购进金额').Asfloat:=adodm.tcr.FieldByName('购进金额').Asfloat;
      adodm.tkc.FieldByName('购进单价').Asfloat:=adodm.tcr.FieldByName('购进金额').Asfloat;
      adodm.tkc.Post;
    end;
    adodm.tcr.Next;
   end;
   adodm.tcr.UpdateBatch();
   dbgrideh1.Enabled:=false;
   if print.Checked then
   begin
   fpreview.frrk.LoadFromFile(flogin.apppath+'\print\yprk.frf');
   fpreview.frrk.FindObject('memo1').Memo.Text:=label1.Caption;
   fpreview.frrk.ShowReport;
   end;
   save.Enabled:=false;




end;

procedure Tfrk.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 adodm.tcr.close;
 adodm.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfrk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
adodm.tcr.CancelUpdates;
adodm.tcr.Close;
except
end;


action:=cafree;
end;

procedure Tfrk.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tcr.Eof   then
begin
 sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
 adodm.tcr.Append;
 dbgrideh1.Col:=1;
end;
end;

procedure Tfrk.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
