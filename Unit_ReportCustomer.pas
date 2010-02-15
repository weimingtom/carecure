unit Unit_ReportCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, ADODB;

type
  Tfrm_ReportCustomer = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    CusNo: TQRDBText;
    CusName: TQRDBText;
    CusSex: TQRDBText;
    CusMobile: TQRDBText;
    CusAddress: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    ADOQueryName: TADOQuery;
    ADOQueryMain: TADOQuery;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ref;
  end;

var
  frm_ReportCustomer: Tfrm_ReportCustomer;

implementation
  uses Unit_DataModule,preview;
{$R *.dfm}

procedure Tfrm_reportCustomer.ref ;
begin
  ADOQueryname.Open ;
  qrlbl_title.Caption := ADOQueryname.fieldbyname('unitname').AsString +'---'+qrlbl_title.Caption;
  ADOQuerymain.Open ;
end;


procedure Tfrm_ReportCustomer.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_ReportCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQueryname.Close;
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportcustomer:=nil;
end;

end.
