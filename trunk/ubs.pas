unit ubs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh, Menus,upreview,udm;

type
  Tfbs = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    Label2: TLabel;
    Label3: TLabel;
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

{$R *.dfm}

procedure Tfbs.FormShow(Sender: TObject);
begin
  adodm.tcr.Close;
  adodm.tcr.Open;
  label3.caption:=datetimetostr(date());
  adodm.tdw.Filter:=' 出入<> 0 ' ;
  adodm.tdw.Filtered:=true;
end;

procedure Tfbs.DBGridEh1ColExit(Sender: TObject);
begin
  if (trim(adodm.tcr.FieldByName('ypid').AsString)<>'') and (trim(adodm.tcr.FieldByName('数量').AsString)<>'')  then

   if  adodm.tkc.Locate('ypid',adodm.tcr.Fieldvalues['ypid'],[])  then
        if adodm.tkc.FieldByName('数量').AsInteger<adodm.tcr.FieldByName('数量').AsInteger then
        begin
          showmessage('库存数量:'+adodm.tkc.FieldByName('数量').Asstring+'    不足以支付');
          adodm.tcr.Edit;
          adodm.tcr.FieldByName('数量').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        adodm.tcr.edit;
        adodm.tcr.FieldByName('单价').Asfloat:=adodm.tkc.fieldbyname('购进单价').asfloat;

        end
  else
   begin
    showmessage('该药品没有库存');
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('药品简码').AsString:='';
    dbgrideh1.col:=1;
   end;

  if (adodm.tcr.FieldByName('单价').AsString<>'') and (adodm.tcr.FieldByName('数量').Asstring<>'') then
    begin
    adodm.tcr.edit;
    adodm.tcr.FieldByName('金额').AsFloat:=adodm.tcr.FieldByName('数量').Asinteger*adodm.tcr.FieldByName('单价').Asfloat ;
    end ;



end;




function Tfbs.check: boolean;
begin
  result:=true;

 if adodm.tcr.RecordCount<=0 then
   begin
    showmessage('请录入退出的药品信息！');
    result:=false;
    exit;
   end;
end;

procedure Tfbs.saveClick(Sender: TObject);
begin
 
  if not check then
  exit;
  adodm.ctemp.Parameters.ParamValues['@lx']:='bs';
  adodm.ctemp.Execute;
  edit2.Text:=adodm.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  adodm.tcr.First;
  while not adodm.tcr.Eof do
  begin
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('编号').AsString:=trim(edit2.Text);
    adodm.tcr.FieldByName('入库单位').AsInteger:=-2;
    if trim(ren.Text)<>'' then
    adodm.tcr.FieldByName('开票人').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('操作人').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('类型').Asstring:='报损';
    adodm.tcr.fieldbyname('出入').asboolean:=false;
    adodm.tcr.FieldByName('日期').Asdatetime:=date;
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('数量').AsInteger:=adodm.tkc.FieldByName('数量').AsInteger-adodm.tcr.FieldByName('数量').AsInteger;
      adodm.tkc.FieldByName('购进金额').Asfloat:=adodm.tkc.FieldByName('购进单价').Asfloat*adodm.tkc.FieldByName('数量').AsInteger;
      adodm.tkc.Post;
    end  ;

   adodm.tcr.Next;
   end;
   adodm.tcr.UpdateBatch();
   dbgrideh1.Enabled:=false;
   if print.Checked then
   begin
   fpreview.frrk.FindObject('memo1').Memo.Text:=label1.Caption;
   fpreview.frrk.ShowReport;
   fpreview.ShowModal;
   end;
   save.Enabled:=false;




end;

procedure Tfbs.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 adodm.tcr.close;
 adodm.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfbs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
adodm.tcr.CancelUpdates;
adodm.tcr.Close;
except
end;
action:=cafree;
end;

procedure Tfbs.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
adodm.tcr.Append;
dbgrideh1.Col:=1;
end;
end;

procedure Tfbs.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
