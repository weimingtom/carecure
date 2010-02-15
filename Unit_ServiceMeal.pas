unit Unit_ServiceMeal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, ExtCtrls, ComCtrls, StdCtrls;

type
  Tfrm_servicemeal = class(TForm)
    Panel2: TPanel;
    sbtn_ok: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sg_Item: TStringGrid;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    lbl_TotalSum: TLabel;
    lbl_PromotionSum: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtn_okClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateServiceMealTree;
    procedure SearchServiceMealItemInfo;
  public
    { Public declarations }
    procedure servicemeal_ref;
  end;

var
  frm_servicemeal: Tfrm_servicemeal;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_frontcheck;
{$R *.dfm}

procedure Tfrm_servicemeal.servicemeal_ref ;
begin

  CreateServiceMealTree ;

  with sg_Item do
  begin
    cells[0,0]:='项目编号';
    cells[1,0]:='项目名称';
    cells[2,0]:='项目价格';
  end;
  
end;

procedure Tfrm_servicemeal.CreateServiceMealTree ;
var
  BootNode:TTreeNode;
begin
  BootNode:=TreeView1.Items.Add(nil,'套餐列表');
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select type_id,type_name from servicemealtype';
    Open;
    while not eof do
    begin
      TreeView1.Items.AddChild(BootNode,FieldByName('type_id').AsString + '-' + FieldByName('type_name').AsString);
      next;
    end;
  end;
end;

procedure Tfrm_servicemeal.SearchServiceMealItemInfo ;
var
  temp_str,temp_typeid:string;
  i:integer;
begin
  if TreeView1.Selected.text ='套餐列表' then exit;
  temp_str:=TreeView1.Selected.Text;
  temp_typeid:=StringGetChar(temp_str,'-');
  StringGridClear(sg_Item);

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select si.item_id,item_name,item_price from ServiceItem si,ServiceMeal sm '+
               ' where sm.item_id=si.item_id and sm.type_id='+#39+temp_typeid+#39;
    //showmessage(SQL.Text);
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Item do
      begin
        cells[0,i]:=FieldByName('item_id').AsString ;
        cells[1,i]:=FieldByName('item_name').AsString ;
        cells[2,i]:=FloatToStr(FieldByName('item_price').AsFloat) ;
      end;
      inc(i);
      next;
    end;

    close;
    SQL.Text :='select total_sum,promotion_sum from servicemealtype where type_id='+#39+temp_typeid+#39;
    Open;
    lbl_TotalSum.Caption := FloatToStr(FieldByName('total_sum').asFloat);
    lbl_PromotionSum.Caption := FloatToStr(FieldByName('promotion_sum').asFloat);
  end;

  if i<>1 then sg_Item.RowCount :=i+1;
end;

procedure Tfrm_servicemeal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_servicemeal:=nil;
end;

procedure Tfrm_servicemeal.TreeView1Click(Sender: TObject);
begin
  SearchServiceMealItemInfo
end;

procedure Tfrm_servicemeal.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_servicemeal.sbtn_okClick(Sender: TObject);
var
  temp:string;
begin
  temp:=TreeView1.Selected.Text;

  StringGridInsert(frm_frontcheck.sg_Meal);

  frm_frontcheck.sg_Meal.Cells[0,1]:=StringGetChar(temp,'-');
  frm_frontcheck.sg_Meal.Cells[1,1]:=copy(temp,2,length(temp));
  frm_frontcheck.sg_Meal.Cells[2,1]:=lbl_PromotionSum.Caption ;
  frm_frontcheck.ComputeCostsum ;
  close;
end;

end.
