unit Unit_ReportMonthStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, ADODB;

type
  Tfrm_ReportMonthStatistic = class(TForm)
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
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
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
  frm_ReportMonthStatistic: Tfrm_ReportMonthStatistic;

implementation

uses preview, Unit_ReportDayStatistic,unit_MonthStatistic,Unit_DataModule;

{$R *.dfm}

procedure Tfrm_ReportMonthStatistic.ref ;
begin
  ADOQuerymain.Parameters.ParamValues['yearmonth'] := trim(frm_monthstatistic.edt_monthstatistic.Text) ;
  ADOQuerymain.Open ;
end;

procedure Tfrm_ReportMonthStatistic.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_ReportMonthStatistic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportDayStatistic:=nil;
end;

end.
