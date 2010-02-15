unit upreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Ctrls, FR_View, ExtCtrls, FR_DSet, FR_DBSet, FR_Class, StdCtrls,udm,
  FR_Desgn;

type
  Tfpreview = class(TForm)
    Panel1: TPanel;
    frPreview1: TfrPreview;
    frSpeedButton1: TfrSpeedButton;
    frSpeedButton2: TfrSpeedButton;
    frSpeedButton3: TfrSpeedButton;
    frSpeedButton4: TfrSpeedButton;
    frSpeedButton5: TfrSpeedButton;
    frSpeedButton6: TfrSpeedButton;
    frSpeedButton7: TfrSpeedButton;
    frSpeedButton8: TfrSpeedButton;
    frSpeedButton9: TfrSpeedButton;
    frSpeedButton10: TfrSpeedButton;
    frSpeedButton11: TfrSpeedButton;
    frrk: TfrReport;
    frdbrk: TfrDBDataSet;
    frdbdj: TfrDBDataSet;
    frdj: TfrReport;
    frDesigner1: TfrDesigner;
    procedure frSpeedButton4Click(Sender: TObject);
    procedure frSpeedButton5Click(Sender: TObject);
    procedure frSpeedButton6Click(Sender: TObject);
    procedure frSpeedButton7Click(Sender: TObject);
    procedure frSpeedButton8Click(Sender: TObject);
    procedure frSpeedButton9Click(Sender: TObject);
    procedure frSpeedButton10Click(Sender: TObject);
    procedure frSpeedButton1Click(Sender: TObject);
    procedure frSpeedButton2Click(Sender: TObject);
    procedure frSpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure frSpeedButton11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frrkManualBuild(Page: TfrPage);
    procedure frdjManualBuild(Page: TfrPage);
    
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fpreview: Tfpreview;

implementation

{$R *.DFM}

procedure Tfpreview.frSpeedButton4Click(Sender: TObject);
begin
  frPreview1.First;
end;

procedure Tfpreview.frSpeedButton5Click(Sender: TObject);
begin
  frPreview1.Prev;
end;

procedure Tfpreview.frSpeedButton6Click(Sender: TObject);
begin
  frPreview1.Next;
end;

procedure Tfpreview.frSpeedButton7Click(Sender: TObject);
begin
  frPreview1.Last;
end;

procedure Tfpreview.frSpeedButton8Click(Sender: TObject);
begin
  frPreview1.LoadFromFile;
end;

procedure Tfpreview.frSpeedButton9Click(Sender: TObject);
begin
  frPreview1.SaveToFile;
end;

procedure Tfpreview.frSpeedButton10Click(Sender: TObject);
begin
 
  frPreview1.Print;
end;

procedure Tfpreview.frSpeedButton1Click(Sender: TObject);
begin
  frPreview1.OnePage;
end;

procedure Tfpreview.frSpeedButton2Click(Sender: TObject);
begin
  frPreview1.Zoom := 100;
end;

procedure Tfpreview.frSpeedButton3Click(Sender: TObject);
begin
  frPreview1.PageWidth;
end;

procedure Tfpreview.FormActivate(Sender: TObject);
begin
  frSpeedButton2.Down := True;
  frSpeedButton2Click(nil);
end;

procedure Tfpreview.frSpeedButton11Click(Sender: TObject);
begin
  ModalResult := mrOk;
  
end;

procedure Tfpreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frPreview1.Window.FormKeyDown(Sender, Key, Shift);
end;


procedure Tfpreview.frrkManualBuild(Page: TfrPage);
var
  i, j,k: Integer; 
begin



  k:=trunc(frdbrk.DataSet.RecordCount/8);
   with frRk.Dictionary do
   begin
     // creating category (space in category name required!)
     Variables['allpage'] := k+1; //设置一个系统变量
   end;

  frdbrk.First;
  //Sender.ShowBandByType(btReportTitle); //显示报表标题
  for i := 0 to k do      //循环打印每页
  begin
    page.ShowBandByName('Band1');
   //显示列头 （band2是一个主项数据，无数据源）
    for j := 1 to 8 do    //循环打印每行
      begin
      if not frdbrk.Eof then
      begin
      page.ShowBandByName('Band2');
        //显示主项数据 （band3是主项数据，数据源为frdbdataset1）
      frdbrk.Next;   //显示下一条数据
      end
      else
      page.ShowBandByName('band5'); //显示空白行  （band5为child　band）
      end ;
     // page.ShowBandByName('band4');
     //在实际的页面设计当中此处有一个栏目脚band 以显示合计
    if i <> k then
     page.NewPage
     else
    page.ShowBandByName('band4');     //产生新页面
  end;
end;



procedure Tfpreview.frdjManualBuild(Page: TfrPage);
var
  i, j,k: Integer;
begin



  k:=trunc(frdbdj.DataSet.RecordCount/8);
   with frdj.Dictionary do
   begin
     // creating category (space in category name required!)
     Variables['allpage'] := k+1; //设置一个系统变量
   end;

  frdbdj.First;
  //Sender.ShowBandByType(btReportTitle); //显示报表标题
  for i := 0 to k do      //循环打印每页
  begin
    page.ShowBandByName('Band1');
   //显示列头 （band2是一个主项数据，无数据源）
    for j := 1 to 8 do    //循环打印每行
      begin
      if not frdbdj.Eof then
      begin
      page.ShowBandByName('Band2');
        //显示主项数据 （band3是主项数据，数据源为frdbdataset1）
      frdbdj.Next;   //显示下一条数据
      end
      else
      page.ShowBandByName('band5'); //显示空白行  （band5为child　band）
      end ;
     // page.ShowBandByName('band4');
     //在实际的页面设计当中此处有一个栏目脚band 以显示合计
    if i <> k then
     page.NewPage
     else
    page.ShowBandByName('band4');     //产生新页面
  end;

end;

end.
