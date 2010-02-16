unit uty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh,upreview,Unit_DataModule, GridsEh;

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
  DMod.tcr.Close;
  DMod.tcr.Open;
  label3.caption:=datetimetostr(date());
  DMod.tdw.Filter:=' ����<> 0 ' ;
  DMod.tdw.Filtered:=true;
end;

procedure Tfty.DBGridEh1ColExit(Sender: TObject);
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
      end
   else
    begin
    showmessage('��ҩƷû�п��');
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('ҩƷ����').AsString:='';
    dbgrideh1.col:=1;
   end;


 DMod.tcr.Edit;
 DMod.tcr.Edit;
  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='����'     then
  try
   DMod.tcr.FieldByName('���').AsFloat:=DMod.tcr.FieldByName('����').Asinteger*DMod.tcr.FieldByName('����').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='����'    then
  try
   DMod.tcr.FieldByName('���').AsFloat:=DMod.tcr.FieldByName('����').Asinteger*DMod.tcr.FieldByName('����').Asfloat ;
  except
  end;

  if dbgrideh1.Columns[dbgrideh1.Col-1].FieldName='���'    then
  try
   DMod.tcr.FieldByName('����').AsFloat:=DMod.tcr.FieldByName('���').Asfloat/DMod.tcr.FieldByName('����').Asinteger ;
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
 if DMod.tcr.RecordCount<=0 then
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
  DMod.ctemp.Parameters.ParamValues['@lx']:='ty';
  DMod.ctemp.Execute;
  edit2.Text:=DMod.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  DMod.tcr.First;
  while not DMod.tcr.Eof do
  begin
    DMod.tcr.Edit;
    DMod.tcr.FieldByName('���').AsString:=trim(edit2.Text);
    DMod.tcr.FieldByName('��ⵥλ').AsInteger:=DMod.tdw.fieldbyname('clientid').AsInteger;
    if trim(ren.Text)<>'' then
    DMod.tcr.FieldByName('��Ʊ��').Asinteger:=DMod.tyg.fieldbyname('ygid').Asinteger;
    DMod.tcr.FieldByName('������').Asstring:=trim(edit1.Text);
    DMod.tcr.FieldByName('����').Asstring:='��ҩ';
    DMod.tcr.fieldbyname('����').asboolean:=false;
    DMod.tcr.FieldByName('����').Asdatetime:=date;
    if DMod.tkc.Locate('ypid',DMod.tcr.FieldValues['ypid'],[]) then
    begin
      DMod.tkc.Edit;
      DMod.tcr.FieldByName('�ɱ����').AsFloat:=DMod.tkc.FieldByName('��������').Asfloat*DMod.tcr.FieldByName('����').Asfloat;
      DMod.tkc.FieldByName('����').AsInteger:=DMod.tkc.FieldByName('����').AsInteger-DMod.tcr.FieldByName('����').AsInteger;
      DMod.tkc.FieldByName('�������').Asfloat:=DMod.tkc.FieldByName('�������').Asfloat-DMod.tcr.FieldByName('���').Asfloat;
      DMod.tkc.FieldByName('��������').Asfloat:=DMod.tkc.FieldByName('�������').Asfloat/DMod.tkc.FieldByName('����').AsInteger;
      DMod.tkc.Post;
    end  ;

   DMod.tcr.Next;
   end;
   DMod.tcr.UpdateBatch();
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
 DMod.tcr.close;
 DMod.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
DMod.tcr.CancelUpdates;
DMod.tcr.Close;
except
end;


action:=cafree;
end;

procedure Tfty.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and DMod.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
DMod.tcr.Append;
dbgrideh1.Col:=1;
end;
end;

procedure Tfty.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.