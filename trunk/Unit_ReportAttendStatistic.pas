unit Unit_ReportAttendStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, ADODB;

type
  Tfrm_reportattendstatistic = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
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
  frm_reportattendstatistic: Tfrm_reportattendstatistic;

implementation

uses preview,unit_attenstat,Unit_DataModule;

{$R *.dfm}


procedure Tfrm_reportattendstatistic.ref ;
begin
  Adoqueryname.Open ;
  qrlbl_title.Caption := Adoqueryname.fieldbyname('unitname').AsString +'---'+qrlbl_title.Caption;
  Adoquerymain.Parameters.ParamValues['yearmonth'] :=frm_attendstat.temp_yearmonth;
  Adoquerymain.Open;
  QRDBText2.DataField :='emp_no';
  QRDBText1.DataField :='year_month';
  QRDBText3.DataField :='emp_name';
  QRDBText4.DataField :='total_work';
  QRDBText5.DataField :='total_attend';
  QRDBText6.DataField :='late_morning';
  QRDBText7.DataField :='early_morning';
  QRDBText8.DataField :='late_afternoon';
  QRDBText9.DataField :='early_afternoon';
  QRDBText10.DataField:='late_evening';
  QRDBText11.DataField:='early_evening';
  QRDBText12.DataField:='total_late';
  QRDBText13.DataField:='total_early';
  QRDBText14.DataField:='special_attend'; 

end;

procedure Tfrm_reportattendstatistic.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_reportattendstatistic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Adoqueryname.Close;
  Adoquerymain.Close;
  action:=cafree;
  frm_reportattendstatistic:=nil;
end;

end.
