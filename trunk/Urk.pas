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
  adodm.tdw.Filter:=' ����<> 0 ' ;
  adodm.tdw.Filtered:=true;
end;

procedure Tfrk.DBGridEh1ColExit(Sender: TObject);
begin

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




function Tfrk.check: boolean;
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
    showmessage('��¼�빺���ҩƷ��Ϣ��');
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
    adodm.tcr.FieldByName('���').AsString:=trim(edit2.Text);

    adodm.tcr.FieldByName('���ⵥλ').AsInteger:=adodm.tdw.fieldbyname('clientid').AsInteger;
    if trim(ren.Text)<>'' then
    adodm.tcr.FieldByName('��Ʊ��').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('������').Asstring:=trim(edit1.Text);
    adodm.tcr.FieldByName('����').Asstring:='���';
    adodm.tcr.fieldbyname('����').asboolean:=true;
    adodm.tcr.FieldByName('����').Asdatetime:=date;
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('����').AsInteger:=adodm.tkc.FieldByName('����').AsInteger+adodm.tcr.FieldByName('����').AsInteger;
      adodm.tkc.FieldByName('�������').Asfloat:=adodm.tkc.FieldByName('�������').Asfloat+adodm.tcr.FieldByName('���').Asfloat;
      adodm.tkc.FieldByName('��������').Asfloat:=adodm.tkc.FieldByName('�������').Asfloat/adodm.tkc.FieldByName('����').AsInteger;
      adodm.tkc.Post;
    end
    else
    begin
      adodm.tkc.Append;
      adodm.tkc.FieldByName('ypid').Asinteger:=adodm.tcr.fieldbyname('ypid').AsInteger;
      adodm.tkc.FieldByName('����').AsInteger:=adodm.tcr.FieldByName('����').AsInteger;
      adodm.tkc.FieldByName('�������').Asfloat:=adodm.tcr.FieldByName('�������').Asfloat;
      adodm.tkc.FieldByName('��������').Asfloat:=adodm.tcr.FieldByName('�������').Asfloat;
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
