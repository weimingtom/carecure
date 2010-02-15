unit Unit_ChooseCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids;

type
  Tfrm_choosecustomer = class(TForm)
    sg_Customer: TStringGrid;
    Panel1: TPanel;
    sbtn_ok: TSpeedButton;
    sbtn_close: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_CustomerDblClick(Sender: TObject);
    procedure sbtn_okClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchCustomerInfo;
  public
    { Public declarations }
     procedure choosecustomer_ref;
  end;

var
  frm_choosecustomer: Tfrm_choosecustomer;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_FrontCheck;
{$R *.dfm}

procedure Tfrm_choosecustomer.choosecustomer_ref ;
begin
  with sg_Customer do
  begin
    cells[0,0]:='客户编号';
    cells[1,0]:='客户姓名';
    cells[2,0]:='性别';
    cells[3,0]:='注册日期';
  end;

  SearchCustomerInfo;
end;

procedure Tfrm_choosecustomer.SearchCustomerInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select cus_no,cus_name,cus_sex,cus_register from customer order by cus_no';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Customer do
      begin
        cells[0,i]:=FieldByname('cus_no').asstring;
        cells[1,i]:=FieldByname('cus_name').asstring;
        cells[2,i]:=FieldByname('cus_sex').asstring;
        cells[3,i]:=DateToString(FieldByname('cus_register').asDateTime);
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Customer.rowcount:=i+1;
end;
procedure Tfrm_choosecustomer.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_choosecustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_choosecustomer:=nil;
end;

procedure Tfrm_choosecustomer.sg_CustomerDblClick(Sender: TObject);
begin
  sbtn_okClick(nil);
end;

procedure Tfrm_choosecustomer.sbtn_okClick(Sender: TObject);
begin
  if sg_Customer.Cells[0,sg_Customer.Row]='' then exit;

  frm_frontcheck.edt_CusNo.Text := sg_Customer.Cells[0,sg_Customer.Row];
  frm_frontcheck.edt_CusNo.SetFocus ;
   
  close;
end;

end.
