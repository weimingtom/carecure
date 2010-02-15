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
  dwfilter:=' ����<>1 and clientid>=0';
  label3.caption:=datetimetostr(date());
  adodm.tdw.Filter:=' ����<>1 and clientid>=0' ;
  adodm.tdw.Filtered:=true;
  dw.Text:='�˿�';
  dbgrideh1.SetFocus;
  
end;

procedure Tfls.DBGridEh1ColExit(Sender: TObject);
begin
 if (trim(adodm.tcr.FieldByName('ypid').AsString)<>'') and (trim(adodm.tcr.FieldByName('����').AsString)<>'')  then

   if  adodm.tkc.Locate('ypid',adodm.tcr.Fieldvalues['ypid'],[])  then
      begin
       if adodm.tkc.FieldByName('����').AsInteger<adodm.tcr.FieldByName('����').AsInteger then
        begin
          showmessage('�������:'+adodm.tkc.FieldByName('����').Asstring+'    ������֧��');
          adodm.tcr.Edit;
          adodm.tcr.FieldByName('����').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        if  adodm.typzdk.Locate('id',adodm.tcr.Fieldvalues['ypid'],[]) then
        begin
        adodm.tcr.edit;
        adodm.tcr.FieldByName('����').Asfloat:=adodm.typzdk.fieldbyname('���ۼ�').asfloat
        end
        else showmessage('�����������ֹ�¼�����Ʒ�ĵ���');
        end
      end
   else
    begin
    showmessage('��ҩƷû�п��');
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('ҩƷ����').AsString:='';
    dbgrideh1.col:=1;
   end;


  if (adodm.tcr.FieldByName('����').AsString<>'') and  (adodm.tcr.FieldByName('����').Asstring<>'') then
    begin
    adodm.tcr.edit;
    adodm.tcr.FieldByName('���').AsFloat:=adodm.tcr.FieldByName('����').Asinteger*adodm.tcr.FieldByName('����').Asfloat ;
    end  ;
   


end;




function Tfls.check: boolean;
begin
  result:=true;
 if trim(dw.Text)='' then
   begin
    showmessage('��ѡ��һ����ҩ��λ�����û�г������б��У�����ӣ�');
    result:=false;
    exit;
    end;
 if trim(ren.Text)='' then
   begin
    showmessage('��ѡ��Ʊ�ˣ����û�г������б��У�����ӣ�');
    result:=false;
    exit;
    end;

 if adodm.tcr.RecordCount<=0 then
   begin
    showmessage('��¼���۳���ҩƷ��Ϣ��');
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
    adodm.tcr.FieldByName('���').AsString:=trim(edit2.Text);
    if trim(dw.Text)<>'' then
    adodm.tcr.FieldByName('��ⵥλ').AsInteger:=adodm.tdw.fieldbyname('clientid').AsInteger;
    
    adodm.tcr.FieldByName('��Ʊ��').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('������').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('����').Asstring:='����';
    adodm.tcr.fieldbyname('����').asboolean:=false;
    adodm.tcr.FieldByName('����').Asdatetime:=date;
    
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('����').AsInteger:=adodm.tkc.FieldByName('����').AsInteger-adodm.tcr.FieldByName('����').AsInteger;
      adodm.tkc.FieldByName('�������').Asfloat:=adodm.tkc.FieldByName('��������').Asfloat*adodm.tkc.FieldByName('����').Asfloat;
      adodm.tcr.FieldByName('�ɱ����').AsFloat:=adodm.tkc.FieldByName('��������').Asfloat*adodm.tcr.FieldByName('����').Asfloat;
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
   fpreview.frrk.FindObject('memo27').Memo.Text:='��Ʊ�ˣ�'+ren.text;
   fpreview.frrk.FindObject('memo27').Memo.Text:='�����ˣ�ǩ�֣���'  ; 
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
 dw.Text:='�˿�';
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
  showmessage('�������㣡��');
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
  adodm.tdw.Filter:='(���� like '''+trim(dw.text)+'%'' and '+dwfilter+') or (���� like '''+trim(dw.text)+'%'' and '+dwfilter+')';
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
if not adodm.tdw.Locate('����',dw.Text,[]) then
begin
  dw.SetFocus;
  showmessage('û�д˵�λ��������¼�룡');
end;
end;

procedure Tfls.renChange(Sender: TObject);
begin
if trim(ren.Text)<>'' then
 begin
  adodm.tyg.DisableControls;
  adodm.tyg.filtered:=false;
  adodm.tyg.Filter:=' ���� like '''+trim(ren.text)+'%'' or '+'Ա����� like '''+trim(ren.text)+'%''';
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
if not adodm.tyg.Locate('����',ren.Text,[]) then
begin
  ren.SetFocus;
  showmessage('û�д��ˣ�������¼�룡');
end;
end;

end.
