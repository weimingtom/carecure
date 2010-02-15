unit unit_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  Tfrm_unit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_UnitName: TEdit;
    edt_address: TEdit;
    edt_telephone: TEdit;
    edt_fax: TEdit;
    sbtn_sure: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_sureClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure ref;
    { Public declarations }
  end;

var
  frm_unit: Tfrm_unit;

implementation
  uses unit_TotalPublic, Unit_DataModule;
{$R *.dfm}

procedure Tfrm_unit.ref();
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select * from unit';
    Open;

    edt_UnitName.Text := FieldByName('UnitName').asstring;
    edt_address.Text := FieldByName('address').asstring;
    edt_telephone.Text := FieldByName('telephone').AsString;
    edt_fax.Text := FieldByName('fax').asstring;
  end;
  sbtn_sure.Enabled := GetPower(SysUserId,'单位信息','修改权'); 
end;

procedure Tfrm_unit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  frm_unit:=nil;
end;

procedure Tfrm_unit.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_unit.sbtn_sureClick(Sender: TObject);
begin
  if trim(edt_UnitName.Text)='' then
  begin
    MessageBox(handle,'请输入单位名称!','提示',mb_ok+mb_iconinformation);
    edt_UnitName.SetFocus;
    exit;
  end;
  try
    dmod.ADOConn.BeginTrans;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'delete from unit';
      ExecSQL;

      Close;
      SQL.Text := 'insert into unit (UnitName,address,telephone,fax)'+
                  ' values '+
                  '(:UnitName,:address,:telephone,:fax)';
      Parameters.ParamValues['UnitName']:=trim(edt_UnitName.text);
      Parameters.ParamValues['address']:=trim(edt_address.text);
      Parameters.ParamValues['telephone']:=trim(edt_telephone.text);
      Parameters.ParamValues['fax']:=trim(edt_fax.text);
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans;
      Close;
    except
      dmod.ADOConn.RollbackTrans;
      MessageBox(handle,'操作失败,请重试!','提示',mb_ok+mb_iconinformation);
      edt_UnitName.SetFocus;
    end;
  end;
end;

procedure Tfrm_unit.FormKeyPress(Sender: TObject; var Key: Char);
var
  temp,temp1:boolean;
begin
  temp:=false;
  temp1:=true;
  if key=#13 then
  begin
    temp:=true;
    if (ActiveControl is TEdit) then
    if TEdit(ActiveControl).name ='edt_fax' then temp1:=false;
  end;
  if temp then
  begin
    if temp1 then
    begin
      key:=#0;
      perform(WM_NEXTDLGCTL,0,0);
    end else sbtn_sureclick(nil);
  end;
end;

end.
