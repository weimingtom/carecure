unit Unit_ReportReceipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, ADODB;

type
  Tfrm_ReportReceipt = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    qrlbl_welcome: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrlbl_title: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    ADOQueryName: TADOQuery;
    ADOQueryMain: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ref;
  end;

var
  frm_ReportReceipt: Tfrm_ReportReceipt;

implementation

uses preview,unit_frontcheck,Unit_DataModule;

{$R *.dfm}

procedure Tfrm_ReportReceipt.ref ;
begin
  ADOQueryname.Open ;
  qrlbl_title.Caption := ADOQueryname.fieldbyname('unitname').AsString +' -- '+ qrlbl_title.Caption;
  qrlbl_welcome.Caption := ADOQueryname.fieldbyname('unitname').AsString +' -- '+ qrlbl_welcome.Caption;
  ADOQuerymain.Parameters.ParamValues['costno'] := frm_frontcheck.sg_CostList.Cells[0,frm_frontcheck.sg_CostList.row];
  ADOQuerymain.Open;
end;

procedure Tfrm_ReportReceipt.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_ReportReceipt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQueryname.Close;
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportReceipt:=nil;
end;







end.
