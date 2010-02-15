unit Unit_ReportBasicSalary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, ADODB;

type
  Tfrm_reportbasicsalary = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlbl_title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
  frm_reportbasicsalary: Tfrm_reportbasicsalary;

implementation
  uses unit_TotalPublic, preview,Unit_DataModule;
{$R *.dfm}

procedure Tfrm_reportbasicsalary.ref ;
begin
  ADOQueryname.Open ;
  qrlbl_title.Caption := ADOQueryname.fieldbyname('unitname').AsString +'---'+qrlbl_title.Caption;
  ADOQuerymain.Open ;
end;
procedure Tfrm_reportbasicsalary.QuickRep1Preview(Sender: TObject);
begin
  myprevform:=Tmyprevform.Create(self);
  myprevform.QRPreview.QRPrinter := quickrep1.QRPrinter;
  myprevform.show;
end;

procedure Tfrm_reportbasicsalary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQueryname.Close;
  ADOQuerymain.Close;
  action:=cafree;
  frm_reportbasicsalary:=nil;
end;

end.
