unit Unit_ReportDayStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, ADODB;

type
  Tfrm_ReportDayStatistic = class(TForm)
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
    qrlbl_day: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
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
  frm_ReportDayStatistic: Tfrm_ReportDayStatistic;

implementation
  uses unit_daystatistic, preview,Unit_DataModule;
{$R *.dfm}

procedure Tfrm_reportDayStatistic.ref ;
begin
  qrlbl_day.Caption := DateToStr(frm_daystatistic.dtp_dayStatistic.Date);
  ADOQuerymain.SQL.Clear ;
  ADOQuerymain.SQL.Add('select cost_no,cus_name,cost_sum,discount_sum,') ;
  ADOQuerymain.SQL.Add('payment,change,check_type from CustomerCost cc,Customer c') ;
  ADOQuerymain.SQL.Add('where cc.cus_no=c.cus_no and cc.cost_date=') ;
  ADOQuerymain.SQL.Add('''' + datetostr(frm_daystatistic.dtp_dayStatistic.Date) + '''') ;
//  ADOQuerymain.Parameters.ParamValues['temp_date'] := frm_daystatistic.dtp_dayStatistic.Date ;
  ADOQuerymain.Open ;
end;

procedure Tfrm_ReportDayStatistic.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_ReportDayStatistic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportDayStatistic:=nil;
end;

end.
