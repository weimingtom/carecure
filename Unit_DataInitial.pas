unit Unit_DataInitial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh;

type
  Tfrm_DataInitial = class(TForm)
    lblDataInitial: TLabel;
    chkAll: TCheckBox;
    grpDataInitial: TGroupBox;
    lblBizTitle: TLabel;
    lblEmployeeTitle: TLabel;
    lblAttendTitle: TLabel;
    lblNotice: TLabel;
    lblSalesTitle: TLabel;
    lblWholeSalesTitle: TLabel;
    lblBizReturnTitle: TLabel;
    lblManReturnTitle: TLabel;
    chkUserTitle: TCheckBox;
    chkBaseTitle: TCheckBox;
    chkClean1: TCheckBox;
    chkMemberInfo: TCheckBox;
    chkEmployeeInfo: TCheckBox;
    edtFromdate1: TDBDateTimeEditEh;
    chkClean2: TCheckBox;
    edtFromdate2: TDBDateTimeEditEh;
    chkClean3: TCheckBox;
    edtFromdate3: TDBDateTimeEditEh;
    btnInitBegin: TBitBtn;
    chkClean4: TCheckBox;
    chkClean5: TCheckBox;
    chkClean6: TCheckBox;
    edtFromdate4: TDBDateTimeEditEh;
    chkClean7: TCheckBox;
    edtFromdate5: TDBDateTimeEditEh;
    chkClean8: TCheckBox;
    edtFromdate6: TDBDateTimeEditEh;
    chkClean9: TCheckBox;
    edtFromdate7: TDBDateTimeEditEh;
    chkClean10: TCheckBox;
    btnClose: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DataInitial: Tfrm_DataInitial;

implementation

{$R *.dfm}

end.
