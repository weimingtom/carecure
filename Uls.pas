unit Uls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, 
  DBLookupEh,upreview,udm, DBSumLst, Mask, DBCtrlsEh, sncCurrency, Menus,
  DBCtrls;

type
  Tfls = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    TabControl1: TTabControl;
    Label2: TLabel;
    Label3: TLabel;
    dw: TDBLookupComboboxEh;
    Label4: TLabel;
    Edit2: TEdit;
    sum1: TDBSumList;
    TabControl2: TTabControl;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    sncCurrencyLabel1: TsncCurrencyLabel;
    Label10: TLabel;
    sncCurrencyLabel2: TsncCurrencyLabel;
    Edit1: TEdit;
    ren: TDBLookupComboboxEh;
    print: TCheckBox;
    save: TBitBtn;
    ret: TBitBtn;
    sf: TsncCurrencyEdit;
    zq: TsncCurrencyEdit;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1ColExit(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure retClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sfExit(Sender: TObject);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure dwChange(Sender: TObject);
    procedure dwExit(Sender: TObject);
    procedure renChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure renExit(Sender: TObject);
  private
    function  check():boolean;

    { Private declarations }
  public
    { Public declarations }
  end;
  var dwfilter:string;


implementation

uses Umain, Ulogin;

{$R *.dfm}

procedure Tfls.FormShow(Sender: TObject);
begin
  try
  adodm.tcr.Close;
  adodm.tcr.Open;
  except
  showmessage('mistake;');
  end;
  dwfilter:=' 出入<>1 and clientid>=0';
  label3.caption:=datetimetostr(date());
  adodm.tdw.Filter:=' 出入<>1 and clientid>=0' ;
  adodm.tdw.Filtered:=true;
  dw.Text:='顾客';
  dbgrideh1.SetFocus;
  
end;

procedure Tfls.DBGridEh1ColExit(Sender: TObject);
begin
 if (trim(adodm.tcr.FieldByName('ypid').AsString)<>'') and (trim(adodm.tcr.FieldByName('数量').AsString)<>'')  then

   if  adodm.tkc.Locate('ypid',adodm.tcr.Fieldvalues['ypid'],[])  then
      begin
       if adodm.tkc.FieldByName('数量').AsInteger<adodm.tcr.FieldByName('数量').AsInteger then
        begin
          showmessage('库存数量:'+adodm.tkc.FieldByName('数量').Asstring+'    不足以支付');
          adodm.tcr.Edit;
          adodm.tcr.FieldByName('数量').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        if  adodm.typzdk.Locate('id',adodm.tcr.Fieldvalues['ypid'],[]) then
        begin
        adodm.tcr.edit;
        adodm.tcr.FieldByName('单价').Asfloat:=adodm.typzdk.fieldbyname('零售价').asfloat
        end
        else showmessage('发生错误，请手工录入该商品的单价');
        end
      end
   else
    begin
    showmessage('该药品没有库存');
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('药品简码').AsString:='';
    dbgrideh1.col:=1;
   end;


  if (adodm.tcr.FieldByName('单价').AsString<>'') and  (adodm.tcr.FieldByName('数量').Asstring<>'') then
    begin
    adodm.tcr.edit;
    adodm.tcr.FieldByName('金额').AsFloat:=adodm.tcr.FieldByName('数量').Asinteger*adodm.tcr.FieldByName('单价').Asfloat ;
    end  ;
   


end;




function Tfls.check: boolean;
begin
  result:=true;
 if trim(dw.Text)='' then
   begin
    showmessage('请选择一个购药单位，如果没有出现在列表中，请添加！');
    result:=false;
    exit;
    end;
 if trim(ren.Text)='' then
   begin
    showmessage('请选择开票人，如果没有出现在列表中，请添加！');
    result:=false;
    exit;
    end;

 if adodm.tcr.RecordCount<=0 then
   begin
    showmessage('请录入售出的药品信息！');
    result:=false;
    exit;
   end;
end;

procedure Tfls.saveClick(Sender: TObject);
begin

  if not check then
  exit;
  adodm.ctemp.Parameters.ParamValues['@lx']:='ls';
  adodm.ctemp.Execute;
  edit2.Text:=adodm.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  adodm.tcr.First;
  while not adodm.tcr.Eof do
  begin
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('编号').AsString:=trim(edit2.Text);
    if trim(dw.Text)<>'' then
    adodm.tcr.FieldByName('入库单位').AsInteger:=adodm.tdw.fieldbyname('clientid').AsInteger;
    
    adodm.tcr.FieldByName('开票人').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('操作人').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('类型').Asstring:='零售';
    adodm.tcr.fieldbyname('出入').asboolean:=false;
    adodm.tcr.FieldByName('日期').Asdatetime:=date;
    
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('数量').AsInteger:=adodm.tkc.FieldByName('数量').AsInteger-adodm.tcr.FieldByName('数量').AsInteger;
      adodm.tkc.FieldByName('购进金额').Asfloat:=adodm.tkc.FieldByName('购进单价').Asfloat*adodm.tkc.FieldByName('数量').Asfloat;
      adodm.tcr.FieldByName('成本金额').AsFloat:=adodm.tkc.FieldByName('购进单价').Asfloat*adodm.tcr.FieldByName('数量').Asfloat;
      adodm.tkc.Post;
    end  ;

   adodm.tcr.Next;
   end;
   adodm.tcr.UpdateBatch();
   dbgrideh1.Enabled:=false;
   if print.Checked then
   begin
   fpreview.frrk.LoadFromFile(Flogin.apppath+'print\ls.frf');
   fpreview.frrk.FindObject('memo1').Memo.Text:=label1.Caption;
   fpreview.frrk.FindObject('memo27').Memo.Text:='开票人：'+ren.text;
   fpreview.frrk.FindObject('memo27').Memo.Text:='经办人（签字）：'  ; 
   fpreview.frrk.ShowReport;
   end;
   save.Enabled:=false;




end;

procedure Tfls.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 adodm.tcr.close;
 adodm.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
 sf.Value:=0;
 zq.Value:=0;
 dw.Text:='顾客';
 dbgrideh1.SetFocus;
end;

procedure Tfls.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
adodm.tcr.CancelBatch();
except

end;
try
adodm.tcr.Close;
except

end;
action:=cafree;
end;

procedure Tfls.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin



if (key=vk_down) and adodm.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
adodm.tcr.Append;
dbgrideh1.Col:=1;

end;
end;

procedure Tfls.sfExit(Sender: TObject);
var aa:real;
begin

sum1.Activate(true);
//showmessage(floattostr(sum1.SumCollection[0].SumValue));
zq.Value:=0;
if sf.Value=0 then
begin
exit;
sum1.Active:=false;
end;
try
  aa:=sf.Value;
  aa:=aa-sum1.SumCollection[0].SumValue;
  if aa<0 then
  begin
  showmessage('所付金额不足！！');
  sf.SetFocus;
  end
  else
  zq.value:=aa;

except
  sf.SetFocus;
end;
 sum1.Active:=false;

end;

procedure Tfls.DBGridEh1ColEnter(Sender: TObject);
begin
sf.Value:=0;
zq.Value:=0;
end;

procedure Tfls.dwChange(Sender: TObject);
begin
if trim(dw.Text)<>'' then
 begin
  adodm.tdw.DisableControls;
  adodm.tdw.filtered:=false;
  adodm.tdw.Filter:='(简码 like '''+trim(dw.text)+'%'' and '+dwfilter+') or (名称 like '''+trim(dw.text)+'%'' and '+dwfilter+')';
  // showmessage(adodm.tdw.Filter);
  adodm.tdw.Filtered:=true;
  adodm.tdw.EnableControls;
 end
else
 adodm.tdw.Filter:=dwfilter;
  adodm.tdw.Filtered:=true;
end;

procedure Tfls.dwExit(Sender: TObject);
begin
if not adodm.tdw.Locate('名称',dw.Text,[]) then
begin
  dw.SetFocus;
  showmessage('没有此单位，请重新录入！');
end;
end;

procedure Tfls.renChange(Sender: TObject);
begin
if trim(ren.Text)<>'' then
 begin
  adodm.tyg.DisableControls;
  adodm.tyg.filtered:=false;
  adodm.tyg.Filter:=' 姓名 like '''+trim(ren.text)+'%'' or '+'员工编号 like '''+trim(ren.text)+'%''';
  //showmessage(adodm.tdw.Filter);
  adodm.tyg.Filtered:=true;
  adodm.tyg.EnableControls;
  sendmessage(ren.Handle,wm_keydown,vk_down,0);
 end
else
  adodm.tyg.Filtered:=false;

end;

procedure Tfls.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfls.renExit(Sender: TObject);
begin
if not adodm.tyg.Locate('姓名',ren.Text,[]) then
begin
  ren.SetFocus;
  showmessage('没有此人，请重新录入！');
end;
end;

end.
