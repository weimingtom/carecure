unit preview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, QRPrntr, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList;

type
  Tmyprevform = class(TForm)
    QRPreview: TQRPreview;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ImageList2: TImageList;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  myprevform: Tmyprevform;

implementation


{$R *.DFM}
procedure Tmyprevform.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  qrpreview.pagenumber:=1;
end;

procedure Tmyprevform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  myprevform:=nil;
end;

procedure Tmyprevform.SpeedButton1Click(Sender: TObject);
begin
  qrpreview.zoomtofit;
end;

procedure Tmyprevform.SpeedButton2Click(Sender: TObject);
begin
  qrpreview.zoom:=100;
end;

procedure Tmyprevform.SpeedButton3Click(Sender: TObject);
begin
  qrpreview.zoomtowidth;
end;

procedure Tmyprevform.SpeedButton4Click(Sender: TObject);
begin
  qrpreview.pagenumber:=1;
end;

procedure Tmyprevform.SpeedButton5Click(Sender: TObject);
begin
  if qrpreview.pagenumber>1 then
  begin
    qrpreview.PageNumber:=qrpreview.pagenumber-1;
  end;
end;

procedure Tmyprevform.SpeedButton6Click(Sender: TObject);
begin
  if qrpreview.pagenumber<qrpreview.qrprinter.pagecount then
  begin
    qrpreview.PageNumber:=qrpreview.pagenumber+1;
  end;
end;

procedure Tmyprevform.SpeedButton7Click(Sender: TObject);
begin
  qrpreview.pagenumber:=qrpreview.qrprinter.pagecount;
end;

procedure Tmyprevform.SpeedButton8Click(Sender: TObject);
begin
  if opendialog1.execute then qrpreview.qrprinter.Load(opendialog1.filename);
end;

procedure Tmyprevform.SpeedButton9Click(Sender: TObject);
begin
  if savedialog1.execute then qrpreview.qrprinter.save(savedialog1.filename);
end;

procedure Tmyprevform.SpeedButton10Click(Sender: TObject);
begin
  try
    qrpreview.qrprinter.PrintSetup ;
  except
    messagebox(handle,'没有按装打印机','提示',mb_ok or mb_iconinformation);
  end;
end;

procedure Tmyprevform.SpeedButton11Click(Sender: TObject);
begin
  try
    qrpreview.qrprinter.print;
  except
    messagebox(handle,'没有按装打印机','提示',mb_ok or mb_iconinformation);
  end;
end;

procedure Tmyprevform.SpeedButton12Click(Sender: TObject);
begin
  Update;
  Close;
end;

end.
