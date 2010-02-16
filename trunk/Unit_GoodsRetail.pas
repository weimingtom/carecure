unit Unit_GoodsRetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, 
  DBLookupEh,upreview,Unit_DataModule, DBSumLst, Mask, DBCtrlsEh, sncCurrency, Menus,
  DBCtrls, GridsEh;

type
  Tfrm_GoodsRetail = class(TForm)
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

uses Umain, unit_UserLogin;

{$R *.dfm}

procedure Tfrm_GoodsRetail.FormShow(Sender: TObject);
begin
  try
  DMod.tcr.Close;
  DMod.tcr.Open;
  except
  showmessage('mistake;');
  end;
  dwfilter:=' 出入<>1 and clientid>=0';
  label3.caption:=datetimetostr(date());
  DMod.tdw.Filter:=' 出入<>1 and clientid>=0' ;
  DMod.tdw.Filtered:=true;
  dw.Text:='顾客';
  dbgrideh1.SetFocus;
  
end;

procedure Tfrm_GoodsRetail.DBGridEh1ColExit(Sender: TObject);
begin
 if (trim(DMod.tcr.FieldByName('ypid').AsString)<>'') and (trim(DMod.tcr.FieldByName('数量').AsString)<>'')  then

   if  DMod.tkc.Locate('ypid',DMod.tcr.Fieldvalues['ypid'],[])  then
      begin
       if DMod.tkc.FieldByName('数量').AsInteger<DMod.tcr.FieldByName('数量').AsInteger then
        begin
          showmessage('库存数量:'+DMod.tkc.FieldByName('数量').Asstring+'    不足以支付');
          DMod.tcr.Edit;
          DMod.tcr.FieldByName('数量').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        if  DMod.typzdk.Locate('id',DMod.tcr.Fieldvalues['ypid'],[]) then
        begin
        DMod.tcr.edit;
        DMod.tcr.FieldByName('单价').Asfloat:=DMod.typzdk.fieldbyname('零售价').asfloat
        end
        else showmessage('发生错误，请手工录入该商品的单价');
        end
      end
   else
    begin
    showmessage('该商品没有库存');
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('商品简码').AsString:='';
    dbgrideh1.col:=1;
   end;


  if (DMod.tcr.FieldByName('单价').AsString<>'') and  (DMod.tcr.FieldByName('数量').Asstring<>'') then
    begin
    DMod.tcr.edit;
    DMod.tcr.FieldByName('金额').AsFloat:=DMod.tcr.FieldByName('数量').Asinteger*DMod.tcr.FieldByName('单价').Asfloat ;
    end  ;
   


end;




function Tfrm_GoodsRetail.check: boolean;
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

 if DMod.tcr.RecordCount<=0 then
   begin
    showmessage('请录入售出的商品信息！');
    result:=false;
    exit;
   end;
end;

procedure Tfrm_GoodsRetail.saveClick(Sender: TObject);
begin

  if not check then
  exit;
  DMod.ctemp.Parameters.ParamValues['@lx']:='ls';
  DMod.ctemp.Execute;
  edit2.Text:=DMod.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  DMod.tcr.First;
  while not DMod.tcr.Eof do
  begin
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('编号').AsString:=trim(edit2.Text);
    if trim(dw.Text)<>'' then
    DMod.tcr.FieldByName('入库单位').AsInteger:=DMod.tdw.fieldbyname('clientid').AsInteger;
    
    DMod.tcr.FieldByName('开票人').Asinteger:=DMod.tyg.fieldbyname('ygid').Asinteger;
    DMod.tcr.FieldByName('操作人').Asstring:=trim(edit1.Text);
    DMod.tcr.FieldByName('类型').Asstring:='零售';
    DMod.tcr.fieldbyname('出入').asboolean:=false;
    DMod.tcr.FieldByName('日期').Asdatetime:=date;
    
    if DMod.tkc.Locate('ypid',DMod.tcr.FieldValues['ypid'],[]) then
    begin
      DMod.tkc.Edit;
      DMod.tkc.FieldByName('数量').AsInteger:=DMod.tkc.FieldByName('数量').AsInteger-DMod.tcr.FieldByName('数量').AsInteger;
      DMod.tkc.FieldByName('购进金额').Asfloat:=DMod.tkc.FieldByName('购进单价').Asfloat*DMod.tkc.FieldByName('数量').Asfloat;
      DMod.tcr.FieldByName('成本金额').AsFloat:=DMod.tkc.FieldByName('购进单价').Asfloat*DMod.tcr.FieldByName('数量').Asfloat;
      DMod.tkc.Post;
    end  ;

   DMod.tcr.Next;
   end;
   DMod.tcr.UpdateBatch();
   dbgrideh1.Enabled:=false;
   if print.Checked then
   begin
   fpreview.frrk.LoadFromFile(frm_UserLogin.apppath+'print\ls.frf');
   fpreview.frrk.FindObject('memo1').Memo.Text:=label1.Caption;
   fpreview.frrk.FindObject('memo27').Memo.Text:='开票人：'+ren.text;
   fpreview.frrk.FindObject('memo27').Memo.Text:='经办人（签字）：'  ; 
   fpreview.frrk.ShowReport;
   end;
   save.Enabled:=false;




end;

procedure Tfrm_GoodsRetail.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 DMod.tcr.close;
 DMod.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
 sf.Value:=0;
 zq.Value:=0;
 dw.Text:='顾客';
 dbgrideh1.SetFocus;
end;

procedure Tfrm_GoodsRetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
DMod.tcr.CancelBatch();
except

end;
try
DMod.tcr.Close;
except

end;
action:=cafree;
end;

procedure Tfrm_GoodsRetail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin



if (key=vk_down) and DMod.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
DMod.tcr.Append;
dbgrideh1.Col:=1;

end;
end;

procedure Tfrm_GoodsRetail.sfExit(Sender: TObject);
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

procedure Tfrm_GoodsRetail.DBGridEh1ColEnter(Sender: TObject);
begin
sf.Value:=0;
zq.Value:=0;
end;

procedure Tfrm_GoodsRetail.dwChange(Sender: TObject);
begin
if trim(dw.Text)<>'' then
 begin
  DMod.tdw.DisableControls;
  DMod.tdw.filtered:=false;
  DMod.tdw.Filter:='(简码 like '''+trim(dw.text)+'%'' and '+dwfilter+') or (名称 like '''+trim(dw.text)+'%'' and '+dwfilter+')';
  // showmessage(DMod.tdw.Filter);
  DMod.tdw.Filtered:=true;
  DMod.tdw.EnableControls;
 end
else
 DMod.tdw.Filter:=dwfilter;
  DMod.tdw.Filtered:=true;
end;

procedure Tfrm_GoodsRetail.dwExit(Sender: TObject);
begin
if not DMod.tdw.Locate('名称',dw.Text,[]) then
begin
  dw.SetFocus;
  showmessage('没有此单位，请重新录入！');
end;
end;

procedure Tfrm_GoodsRetail.renChange(Sender: TObject);
begin
if trim(ren.Text)<>'' then
 begin
  DMod.tyg.DisableControls;
  DMod.tyg.filtered:=false;
  DMod.tyg.Filter:=' 姓名 like '''+trim(ren.text)+'%'' or '+'员工编号 like '''+trim(ren.text)+'%''';
  //showmessage(DMod.tdw.Filter);
  DMod.tyg.Filtered:=true;
  DMod.tyg.EnableControls;
  sendmessage(ren.Handle,wm_keydown,vk_down,0);
 end
else
  DMod.tyg.Filtered:=false;

end;

procedure Tfrm_GoodsRetail.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_GoodsRetail.renExit(Sender: TObject);
begin
if not DMod.tyg.Locate('姓名',ren.Text,[]) then
begin
  ren.SetFocus;
  showmessage('没有此人，请重新录入！');
end;
end;

end.