unit uty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh,upreview,udm;

type
  Tfty = class(TForm)
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

{$R *.dfm}

procedure Tfty.FormShow(Sender: TObject);
begin
  adodm.tcr.Close;
  adodm.tcr.Open;
  label3.caption:=datetimetostr(date());
  adodm.tdw.Filter:=' ����<> 0 ' ;
  adodm.tdw.Filtered:=true;
end;

procedure Tfty.DBGridEh1ColExit(Sender: TObject);
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
      end
   else
    begin
    showmessage('��ҩƷû�п��');
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('ҩƷ����').AsString:='';
    dbgrideh1.col:=1;
   end;


 adodm.tcr.Edit;
 adodm.tcr.Edit;
  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='����'     then
  try
   adodm.tcr.FieldByName('���').AsFloat:=adodm.tcr.FieldByName('����').Asinteger*adodm.tcr.FieldByName('����').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='����'    then
  try
   adodm.tcr.FieldByName('���').AsFloat:=adodm.tcr.FieldByName('����').Asinteger*adodm.tcr.FieldByName('����').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='���'    then
  try
   adodm.tcr.FieldByName('����').AsFloat:=adodm.tcr.FieldByName('���').Asfloat/adodm.tcr.FieldByName('����').Asinteger ;
  except
  end;


end;




function Tfty.check: boolean;
begin
  result:=true;
 if trim(dw.Text)='' then
   begin
    showmessage('��ѡ��һ����ҩ��λ�����û�г������б��У�����ӣ�');
    result:=false;
    exit;
    end;
 if adodm.tcr.RecordCount<=0 then
   begin
    showmessage('��¼���˳���ҩƷ��Ϣ��');
    result:=false;
    exit;
   end;
end;

procedure Tfty.saveClick(Sender: TObject);
begin
 
  if not check then
  exit;
  adodm.ctemp.Parameters.ParamValues['@lx']:='ty';
  adodm.ctemp.Execute;
  edit2.Text:=adodm.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  adodm.tcr.First;
  while not adodm.tcr.Eof do
  begin
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('���').AsString:=trim(edit2.Text);
    adodm.tcr.FieldByName('��ⵥλ').AsInteger:=adodm.tdw.fieldbyname('clientid').AsInteger;
    if trim(ren.Text)<>'' then
    adodm.tcr.FieldByName('��Ʊ��').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('������').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('����').Asstring:='��ҩ';
    adodm.tcr.fieldbyname('����').asboolean:=false;
    adodm.tcr.FieldByName('����').Asdatetime:=date;
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tcr.FieldByName('�ɱ����').AsFloat:=adodm.tkc.FieldByName('��������').Asfloat*adodm.tcr.FieldByName('����').Asfloat;
      adodm.tkc.FieldByName('����').AsInteger:=adodm.tkc.FieldByName('����').AsInteger-adodm.tcr.FieldByName('����').AsInteger;
      adodm.tkc.FieldByName('�������').Asfloat:=adodm.tkc.FieldByName('�������').Asfloat-adodm.tcr.FieldByName('���').Asfloat;
      adodm.tkc.FieldByName('��������').Asfloat:=adodm.tkc.FieldByName('�������').Asfloat/adodm.tkc.FieldByName('����').AsInteger;
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

procedure Tfty.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 adodm.tcr.close;
 adodm.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
adodm.tcr.CancelUpdates;
adodm.tcr.Close;
except
end;


action:=cafree;
end;

procedure Tfty.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
adodm.tcr.Append;
dbgrideh1.Col:=1;
end;
end;

procedure Tfty.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
