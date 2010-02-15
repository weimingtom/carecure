unit Uypzdk2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, DBCtrlsEh,
  DBLookupEh;

type
  Tfypzdk2 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btok: TBitBtn;
    btno: TBitBtn;
    btadd: TBitBtn;
    Memo1: TMemo;
    Image1: TImage;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    pf: TDBEdit;
    Label21: TLabel;
    ls: TDBEdit;
    Label22: TLabel;
    edit6: TDBMemo;
    Bevel3: TBevel;
    jx: TDBComboBoxEh;
    dw: TDBComboBoxEh;
    Label1: TLabel;
    lx: TDBComboBoxEh;
    cj: TDBComboBoxEh;
    wh: TDBEdit;
    sp1: TSpeedButton;
    look1: TDBLookupComboboxEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure check(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure btnoClick(Sender: TObject);
    procedure btaddClick(Sender: TObject);
    procedure checkstr(Sender: TObject);
    procedure jxButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure dwButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lxButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure cjButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure pfExit(Sender: TObject);
    procedure lsExit(Sender: TObject);
    procedure whEnter(Sender: TObject);
    procedure whExit(Sender: TObject);
    procedure look1Change(Sender: TObject);
    procedure look1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function search(fieldname:string;value:string):boolean;
    procedure dotj;
    { Private declarations }
  public
     function checkdata:boolean;
    { Public declarations }
  end;

var fypzdk2:tfypzdk2;

implementation

uses udm;

{$R *.dfm}

procedure Tfypzdk2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  postmessage(handle,wm_keydown,vk_tab,0);
end;

function Tfypzdk2.checkdata: boolean;
begin

   result:=true;
   if trim(dbedit1.Text)='' then
   begin
   showmessage('ҩƷ��Ų���Ϊ��!');
   result:=false;
   dbedit1.SetFocus;
   exit;
   end ;
    if search(dbedit1.DataField,dbedit1.Text) then
      begin
      showmessage('ҩƷ����ظ�,������¼��!');
      result:=false;
      dbedit1.SetFocus;
      exit;
    end;


   if trim(dbedit2.Text)='' then
   begin
   showmessage('ҩƷ���벻��Ϊ��!');
   result:=false;
   dbedit2.SetFocus;
   exit;
   end;

    if search(dbedit2.datafield,dbedit2.Text) then
    begin
      showmessage('ҩƷ�����ظ�,������¼��!');
      result:=false;
      dbedit2.SetFocus;
      exit;
    end;

   if trim(dbedit3.Text)='' then
   begin
   showmessage('ҩƷ���Ʋ���Ϊ��!');
   result:=false;
   dbedit3.SetFocus;
   exit;
   end;
   if trim(jx.Text)='' then
   begin
   showmessage('ҩƷ���Ͳ���Ϊ��!');
   result:=false;
   jx.SetFocus;
   exit;
   end;
   if trim(dw.Text)='' then
   begin
   showmessage('ҩƷ��λ����Ϊ��!');
   result:=false;
   dw.SetFocus;
   exit;
   end;
   if trim(pf.Text)='' then
   begin
   showmessage('ҩƷ�����۸���Ϊ��!');
   result:=false;
   pf.SetFocus;
   exit;
   end;
     if trim(ls.Text)='' then
   begin
   showmessage('ҩƷ���ۼ۲���Ϊ��!');
   result:=false;
   ls.SetFocus;
   exit;
   end;

    if pf.Field.Value>ls.Field.Value then
    if application.MessageBox('�����۴������ۼ�,�Ƿ������','����' ,MB_yesno)=idyes then
    begin
    result:=false;
    pf.SetFocus;
    exit;
    end;


   if trim(dbedit5.Text)='' then
   begin
   showmessage('ҩƷ�����Ϊ��!');
   result:=false;
   dbedit5.SetFocus;
   exit;
   end;
     if trim(lx.Text)='' then
   begin
   showmessage('ҩƷ���Ͳ���Ϊ��!');
   result:=false;
   lx.SetFocus;
   exit;
   end;
   if  trim(wh.EditText)='' then
   begin
   showmessage('��׼�ĺŲ���Ϊ�գ���������д��');
   result:=false;
   wh.SetFocus;
   exit;
   end;
   if (trim(dbedit8.Text)<>'') and (trim(dbedit9.Text)<>'') then
   if (dbedit8.Field.Value<>-1) and (dbedit9.Field.Value<>0)  then
   if dbedit8.Field.Value<dbedit9.Field.Value then
   begin
   showmessage('��߿������С����Ϳ��������');
   result:=false;
   dbedit8.SetFocus;
   exit;
   end;



end;

procedure Tfypzdk2.check(Sender: TObject);
begin
if (sender as tdbedit).Field.AsFloat<0 then
begin
 showmessage('�������Ʊ������0');
 (sender as tdbedit).SetFocus;
end;
end;

procedure Tfypzdk2.btokClick(Sender: TObject);
begin
  if sp1.Visible then
  dotj
  else
  if checkdata then
    adodm.typzdk.Post;
  close;
end;

procedure Tfypzdk2.btnoClick(Sender: TObject);
begin
      adodm.typzdk.Cancel;
      close;
end;

procedure Tfypzdk2.btaddClick(Sender: TObject);
begin
   if checkdata then
   adodm.typzdk.Append;
end;

procedure Tfypzdk2.checkstr(Sender: TObject);
begin
   if   trim((sender as Tdbedit).Text)='' then
      (sender as Tdbedit).SetFocus;
end;

procedure Tfypzdk2.jxButtonDown(Sender: TObject; TopButton: Boolean;
  var AutoRepeat, Handled: Boolean);

begin

  jx.Items.Clear;
  adodm.ttemp.Close;
  adodm.ttemp.CommandText:=' select distinct ���� from ypzdk'   ;
  adodm.ttemp.Open;
  adodm.ttemp.First;
  while not adodm.ttemp.Eof do
  begin
    jx.Items.Add(adodm.ttemp.Fields[0].asstring) ;
    adodm.ttemp.Next;
  end;
end;

procedure Tfypzdk2.dwButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  dw.Items.Clear;
  adodm.ttemp.Close;
  adodm.ttemp.CommandText:=' select distinct ��λ from ypzdk'   ;
  adodm.ttemp.Open;
  adodm.ttemp.First;
  while not adodm.ttemp.Eof do
  begin
    dw.Items.Add(adodm.ttemp.Fields[0].asstring) ;
    adodm.ttemp.Next;
  end;
end;

procedure Tfypzdk2.FormShow(Sender: TObject);
begin
//adodm.typzdk.Append;

end;

procedure Tfypzdk2.lxButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  lx.Items.Clear;
  adodm.ttemp.Close;
  adodm.ttemp.CommandText:=' select distinct ���� from ypzdk'   ;
  adodm.ttemp.Open;
  adodm.ttemp.First;
  while not adodm.ttemp.Eof do
  begin
    lx.Items.Add(adodm.ttemp.Fields[0].asstring) ;
    adodm.ttemp.Next;
  end;
end;

procedure Tfypzdk2.cjButtonDown(Sender: TObject; TopButton: Boolean;
  var AutoRepeat, Handled: Boolean);
begin
  cj.Items.Clear;
  adodm.ttemp.Close;
  adodm.ttemp.CommandText:=' select distinct �������� from ypzdk'   ;
  adodm.ttemp.Open;
  adodm.ttemp.First;
  while not adodm.ttemp.Eof do
  begin
    cj.Items.Add(adodm.ttemp.Fields[0].asstring) ;
    adodm.ttemp.Next;
  end;
end;

procedure Tfypzdk2.pfExit(Sender: TObject);
begin
 if pf.Field.Value<0 then
 begin
 showmessage('�����۱������0!');
 pf.SetFocus;
 end;
end;

procedure Tfypzdk2.lsExit(Sender: TObject);
begin
if ls.Field.Value<0 then
 begin
 showmessage('�����۱������0!');
 ls.SetFocus;
 end;
end;

function Tfypzdk2.search(fieldname: string; value: string): boolean;
begin
   adodm.ttemp.Close;
   adodm.ttemp.CommandText:=' select id from ypzdk where '+trim(fieldname)+' ='''+trim(value)+'''';

   if look1.Visible then
   adodm.ttemp.commandtext:=adodm.ttemp.CommandText+' and id <>'+adodm.typzdk.Fieldbyname('id').asstring;

   showmessage(adodm.ttemp.commandtext);
   adodm.ttemp.Open;
   result:= not adodm.ttemp.Eof;  
end;

procedure Tfypzdk2.whEnter(Sender: TObject);
begin
   wh.Width:=150;
end;

procedure Tfypzdk2.whExit(Sender: TObject);
begin
wh.Width:=81;
end;

procedure Tfypzdk2.dotj;
var a:int64;
begin
  if (trim(pf.Text)='') or (trim(ls.Text)='') then
  begin
    showmessage('�뽫�۸���Ϣ¼��������');
    pf.SetFocus;
    exit;
  end;
  if pf.Field.Value>ls.Field.Value then
  begin
    
    showmessage('�����۴������ۼۣ�');
    ls.SetFocus;
    exit;
  end;
  // if (pf.Field.OldValue=pf.Field.Value) and (ls.Field.OldValue=ls.Field.Value) then
  // begin
    //showmessage('�۸�û�б䶯������ȡ����');
    //ls.SetFocus;
    //exit;
   //end;
   //showmessage(floattostr(pf.Field.OldValue));
   //showmessage(floattostr(pf.Field.value));
  begin
  a:=adodm.typzdk.FieldValues['id'];
  //showmessage(inttostr(a));
  adodm.ttj.Open;
  adodm.ttj.append;
  adodm.ttj.Edit;
  adodm.ttj.Fieldbyname('ypid').AsInteger:=a;
  adodm.ttj.Fieldvalues['oldpf']:=pf.Field.oldvalue;
  adodm.ttj.Fieldvalues['oldls']:=ls.Field.oldvalue;
  adodm.ttj.Fieldvalues['newpf']:=pf.Field.value;
  adodm.ttj.FieldValues['newls']:=ls.Field.Value;
  adodm.ttj.FieldValues['tjdate']:=now;
  adodm.ttj.Post;
  adodm.typzdk.Edit;
  adodm.typzdk.Post;
  adodm.ttj.Close;
  
  end

end;

procedure Tfypzdk2.look1Change(Sender: TObject);
begin
if trim(look1.Text)<>'' then
 begin
  adodm.typzdk.DisableControls;
  adodm.typzdk.filtered:=false;
  adodm.typzdk.Filter:=' ��� like '''+trim(look1.text)+'%'' or '+'���� like '''+trim(look1.text)+'%'' or '+'���� like '''+trim(look1.text)+'%''' ;
  //showmessage(adodm.typzdk.Filter);
  adodm.typzdk.Filtered:=true;
  adodm.typzdk.EnableControls;
 end
else
  adodm.typzdk.Filtered:=false;
end;

procedure Tfypzdk2.look1Exit(Sender: TObject);
begin
if adodm.typzdk.Filtered then
 postmessage(look1.Handle,wm_keydown,vk_down,0);
end;

procedure Tfypzdk2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sp1.Visible:=false;
  look1.Visible:=false;
  btadd.Visible:=false;
end;

end.
