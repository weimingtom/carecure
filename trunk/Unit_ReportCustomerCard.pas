unit Unit_ReportCustomerCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, ADODB;

type
  Tfrm_reportCustomerCard = class(TForm)
    QuickRep1: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
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
  frm_reportCustomerCard: Tfrm_reportCustomerCard;

implementation

uses preview,Unit_DataModule;

{$R *.dfm}

procedure Tfrm_reportCustomerCard.ref ;
begin
  ADOQueryname.Open ;
  qrlbl_title.Caption := ADOQueryname.fieldbyname('unitname').AsString +'---'+qrlbl_title.Caption;
  ADOQuerymain.Open ;
end;

procedure Tfrm_reportCustomerCard.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_reportCustomerCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQueryname.Close;
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportCustomerCard:=nil;
end;

end.
