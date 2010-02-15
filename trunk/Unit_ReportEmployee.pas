unit Unit_ReportEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, ADODB ;

type
  Tfrm_reportemployee = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ADOQueryName: TADOQuery;
    ADOQueryMain: TADOQuery;
    QRShape6: TQRShape;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ref;
  end;

var
  frm_reportemployee: Tfrm_reportemployee  ;

implementation

uses preview , Unit_DataModule;

{$R *.dfm}

procedure Tfrm_reportemployee.ref ;
begin
  ADOqueryName.Open ;
  qrlbl_title.Caption := ADOqueryname.fieldbyname('unitname').AsString +'---'+qrlbl_title.Caption;
  ADOquerymain.Open ;

 // select emp_no,emp_name,type_name,emp_mobile,emp_address
 // from employee,employeetype where employee.emp_type=
 // employeetype.type_id order by emp_no

end;

procedure Tfrm_reportemployee.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_reportemployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOqueryname.Close;
  ADOquerymain.Close;
  action:=cafree;
  frm_reportemployee:=nil;
end;

end.
