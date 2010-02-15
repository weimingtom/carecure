unit Unit_SelectReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tfrm_selectreason = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    sbtn_sure: TSpeedButton;
    sbtn_close: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_sureClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure selectreason_ref;
  end;

var
  frm_selectreason: Tfrm_selectreason;

implementation
   uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_attendmanager;
   
{$R *.dfm}

procedure Tfrm_selectreason.selectreason_ref ;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select reason_id,reason_remark from specialreason';
    Open;
    while not eof do
    begin
      ListBox1.Items.Add(FieldByName('reason_id').AsString +'-'+FieldByName('reason_remark').AsString);
      next; 
    end;
  end;
end;

procedure Tfrm_selectreason.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_selectreason.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_selectreason:=nil;
end;

procedure Tfrm_selectreason.sbtn_sureClick(Sender: TObject);
var
  temp_str,temp_str1:string;
begin
  if ListBox1.ItemIndex < 0 then
  begin
    MessageBox(handle,'清先选中一条特殊考勤原因!','提示',mb_ok+mb_iconinformation);
    exit;
  end else
  begin
    temp_str := ListBox1.items[ListBox1.itemindex];
    temp_str1:= StringGetChar(temp_str,'-');
    frm_attendmanager.sg_Special.Cells[1,frm_attendmanager.sg_Special.row]:=temp_str1;
    frm_attendmanager.sg_Special.Cells[2,frm_attendmanager.sg_Special.row]:=copy(temp_str,2,length(temp_str));
    frm_attendmanager.sbtn_save.Enabled :=true;
    close;
  end;
end;

end.
