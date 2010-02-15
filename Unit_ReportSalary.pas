unit Unit_ReportSalary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, ADODB;

type
  Tfrm_ReportSalary = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    PageFooterBand1: TQRBand;
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
  frm_ReportSalary: Tfrm_ReportSalary;

implementation

uses preview,unit_SalaryManager,Unit_DataModule;

{$R *.dfm}

procedure Tfrm_ReportSalary.ref ;
begin
  ADOQueryname.Open;
  qrlbl_title.Caption := ADOQueryname.fieldbyname('unitname').AsString +'--'+qrlbl_title.Caption ;
  ADOQuerymain.Parameters.ParamValues['yearmonth'] :=Trim(frm_salarymanager.cbb_year.Text+'-'+frm_salarymanager.cbb_month.Text);
  ADOQuerymain.Open ;
end;

procedure Tfrm_ReportSalary.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_ReportSalary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQueryname.Close;
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportSalary:=nil;
end;

end.
