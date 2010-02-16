unit Uls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, 
  DBLookupEh,upreview,Unit_DataModule, DBSumLst, Mask, DBCtrlsEh, sncCurrency, Menus,
  DBCtrls, GridsEh;

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

uses Umain, unit_UserLogin;

{$R *.dfm}

procedure Tfls.FormShow(Sender: TObject);
begin
  try
  DMod.tcr.Close;
  DMod.tcr.Open;
  except
  showmessage('mistake;');
  end;
  dwfilter:=' ����<>1 and clientid>=0';
  label3.caption:=datetimetostr(date());
  DMod.tdw.Filter:=' ����<>1 and clientid>=0' ;
  DMod.tdw.Filtered:=true;
  dw.Text:='�˿�';
  dbgrideh1.SetFocus;
  
end;

procedure Tfls.DBGridEh1ColExit(Sender: TObject);
begin
 if (trim(DMod.tcr.FieldByName('ypid').AsString)<>'') and (trim(DMod.tcr.FieldByName('����').AsString)<>'')  then

   if  DMod.tkc.Locate('ypid',DMod.tcr.Fieldvalues['ypid'],[])  then
      begin
       if DMod.tkc.FieldByName('����').AsInteger<DMod.tcr.FieldByName('����').AsInteger then
        begin
          showmessage('�������:'+DMod.tkc.FieldByName('����').Asstring+'    ������֧��');
          DMod.tcr.Edit;
          DMod.tcr.FieldByName('����').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        if  DMod.typzdk.Locate('id',DMod.tcr.Fieldvalues['ypid'],[]) then
        begin
        DMod.tcr.edit;
        DMod.tcr.FieldByName('����').Asfloat:=DMod.typzdk.fieldbyname('���ۼ�').asfloat
        end
        else showmessage('�����������ֹ�¼�����Ʒ�ĵ���');
        end
      end
   else
    begin
    showmessage('��ҩƷû�п��');
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('ҩƷ����').AsString:='';
    dbgrideh1.col:=1;
   end;


  if (DMod.tcr.FieldByName('����').AsString<>'') and  (DMod.tcr.FieldByName('����').Asstring<>'') then
    begin
    DMod.tcr.edit;
    DMod.tcr.FieldByName('���').AsFloat:=DMod.tcr.FieldByName('����').Asinteger*DMod.tcr.FieldByName('����').Asfloat ;
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

 if DMod.tcr.RecordCount<=0 then
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
  DMod.ctemp.Parameters.ParamValues['@lx']:='ls';
  DMod.ctemp.Execute;
  edit2.Text:=DMod.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  DMod.tcr.First;
  while not DMod.tcr.Eof do
  begin
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('���').AsString:=trim(edit2.Text);
    if trim(dw.Text)<>'' then
    DMod.tcr.FieldByName('��ⵥλ').AsInteger:=DMod.tdw.fieldbyname('clientid').AsInteger;
    
    DMod.tcr.FieldByName('��Ʊ��').Asinteger:=DMod.tyg.fieldbyname('ygid').Asinteger;
    DMod.tcr.FieldByName('������').Asstring:=trim(edit1.Text);
    DMod.tcr.FieldByName('����').Asstring:='����';
    DMod.tcr.fieldbyname('����').asboolean:=false;
    DMod.tcr.FieldByName('����').Asdatetime:=date;
    
    if DMod.tkc.Locate('ypid',DMod.tcr.FieldValues['ypid'],[]) then
    begin
      DMod.tkc.Edit;
      DMod.tkc.FieldByName('����').AsInteger:=DMod.tkc.FieldByName('����').AsInteger-DMod.tcr.FieldByName('����').AsInteger;
      DMod.tkc.FieldByName('�������').Asfloat:=DMod.tkc.FieldByName('��������').Asfloat*DMod.tkc.FieldByName('����').Asfloat;
      DMod.tcr.FieldByName('�ɱ����').AsFloat:=DMod.tkc.FieldByName('��������').Asfloat*DMod.tcr.FieldByName('����').Asfloat;
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
   fpreview.frrk.FindObject('memo27').Memo.Text:='��Ʊ�ˣ�'+ren.text;
   fpreview.frrk.FindObject('memo27').Memo.Text:='�����ˣ�ǩ�֣���'  ; 
   fpreview.frrk.ShowReport;
   end;
   save.Enabled:=false;




end;

procedure Tfls.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 DMod.tcr.close;
 DMod.tcr.Open;
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
DMod.tcr.CancelBatch();
except

end;
try
DMod.tcr.Close;
except

end;
action:=cafree;
end;

procedure Tfls.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin



if (key=vk_down) and DMod.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
DMod.tcr.Append;
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
  DMod.tdw.DisableControls;
  DMod.tdw.filtered:=false;
  DMod.tdw.Filter:='(���� like '''+trim(dw.text)+'%'' and '+dwfilter+') or (���� like '''+trim(dw.text)+'%'' and '+dwfilter+')';
  // showmessage(DMod.tdw.Filter);
  DMod.tdw.Filtered:=true;
  DMod.tdw.EnableControls;
 end
else
 DMod.tdw.Filter:=dwfilter;
  DMod.tdw.Filtered:=true;
end;

procedure Tfls.dwExit(Sender: TObject);
begin
if not DMod.tdw.Locate('����',dw.Text,[]) then
begin
  dw.SetFocus;
  showmessage('û�д˵�λ��������¼�룡');
end;
end;

procedure Tfls.renChange(Sender: TObject);
begin
if trim(ren.Text)<>'' then
 begin
  DMod.tyg.DisableControls;
  DMod.tyg.filtered:=false;
  DMod.tyg.Filter:=' ���� like '''+trim(ren.text)+'%'' or '+'Ա����� like '''+trim(ren.text)+'%''';
  //showmessage(DMod.tdw.Filter);
  DMod.tyg.Filtered:=true;
  DMod.tyg.EnableControls;
  sendmessage(ren.Handle,wm_keydown,vk_down,0);
 end
else
  DMod.tyg.Filtered:=false;

end;

procedure Tfls.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tfls.renExit(Sender: TObject);
begin
if not DMod.tyg.Locate('����',ren.Text,[]) then
begin
  ren.SetFocus;
  showmessage('û�д��ˣ�������¼�룡');
end;
end;

end.