unit Upd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Buttons, Mask, DBCtrlsEh,
  DBLookupEh, Menus,upreview,udm;

type
  Tfpd = class(TForm)
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

procedure Tfpd.FormShow(Sender: TObject);
begin
  adodm.tcr.Close;
  adodm.tcr.Open;
  label3.caption:=datetimetostr(date());
end;

procedure Tfpd.DBGridEh1ColExit(Sender: TObject);
begin
  if (trim(adodm.tcr.FieldByName('ypid').AsString)<>'') and (trim(adodm.tcr.FieldByName('����').AsString)<>'')  then

   if  adodm.tkc.Locate('ypid',adodm.tcr.Fieldvalues['ypid'],[])  then
        if adodm.tkc.FieldByName('����').AsInteger<adodm.tcr.FieldByName('����').AsInteger then
        begin
          showmessage('�������:'+adodm.tkc.FieldByName('����').Asstring+'    ������֧��');
          adodm.tcr.Edit;
          adodm.tcr.FieldByName('����').AsString:='';
          dbgrideh1.col:=2;
        end
        else
        begin
        adodm.tcr.edit;
        adodm.tcr.FieldByName('����').Asfloat:=adodm.tkc.fieldbyname('��������').asfloat
        end
  else
   begin
    showmessage('��ҩƷû�п��');
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('ҩƷ����').AsString:='';
    dbgrideh1.col:=1;
   end;

  if (adodm.tcr.FieldByName('����').AsString<>'') and (adodm.tcr.FieldByName('����').Asstring<>'') then
    begin
    adodm.tcr.FieldByName('���').AsFloat:=adodm.tcr.FieldByName('����').Asinteger*adodm.tcr.FieldByName('����').Asfloat ;
    end ;



end;




function Tfpd.check: boolean;
begin
  result:=true;

 if adodm.tcr.RecordCount<=0 then
   begin
    showmessage('��¼���˳���ҩƷ��Ϣ��');
    result:=false;
    exit;
   end;
end;

procedure Tfpd.saveClick(Sender: TObject);
begin
 
  if not check then
  exit;
  adodm.ctemp.Parameters.ParamValues['@lx']:='pd';
  adodm.ctemp.Execute;
  edit2.Text:=adodm.ctemp.Parameters.ParamValues['@bh'];
    {GETbh}
  adodm.tcr.First;
  while not adodm.tcr.Eof do
  begin
    adodm.tcr.Edit;
    adodm.tcr.FieldByName('���').AsString:=trim(edit2.Text);
    if adodm.tcr.FieldByName('����').AsInteger<0 then
    begin
    adodm.tcr.FieldByName('��ⵥλ').AsInteger:=-2;
    adodm.tcr.FieldByName('����').Asstring:='�̿�';
    adodm.tcr.fieldbyname('����').asboolean:=false;
    end
     else
     begin
    adodm.tcr.FieldByName('���ⵥλ').AsInteger:=-2;
    adodm.tcr.FieldByName('����').Asstring:='��ӯ';
    adodm.tcr.fieldbyname('����').asboolean:=true;
     end;
    if trim(ren.Text)<>'' then
    adodm.tcr.FieldByName('��Ʊ��').Asinteger:=adodm.tyg.fieldbyname('ygid').Asinteger;
    adodm.tcr.FieldByName('������').Asstring:=trim(edit1.Text);

   
    adodm.tcr.FieldByName('����').Asdatetime:=date;
    if adodm.tkc.Locate('ypid',adodm.tcr.FieldValues['ypid'],[]) then
    begin
      adodm.tkc.Edit;
      adodm.tkc.FieldByName('����').AsInteger:=adodm.tkc.FieldByName('����').AsInteger+adodm.tcr.FieldByName('����').AsInteger;
      adodm.tkc.FieldByName('�������').Asfloat:=adodm.tkc.FieldByName('��������').Asfloat*adodm.tkc.FieldByName('����').AsInteger;
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

procedure Tfpd.retClick(Sender: TObject);
begin
 dbgrideh1.Enabled:=true;
 adodm.tcr.close;
 adodm.tcr.Open;
 edit2.Text:='';
 save.Enabled:=true;
end;

procedure Tfpd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfpd.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) and adodm.tcr.Eof   then
begin
sendmessage(dbgrideh1.Handle,wm_keydown,vk_tab,0);
adodm.tcr.Append;
dbgrideh1.Col:=1;
end;
end;

procedure Tfpd.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
