unit Unit_ServiceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Buttons;

type
  Tfrm_ServiceItem = class(TForm)
    Panel1: TPanel;
    sg_Item: TStringGrid;
    Panel2: TPanel;
    sbtn_ok: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtn_okClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_ItemDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchServiceItemInfo;
  public
    { Public declarations }
    procedure serviceitem_ref;
  end;

var
  frm_ServiceItem: Tfrm_ServiceItem;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_frontcheck;
{$R *.dfm}

procedure Tfrm_serviceitem.serviceitem_ref ;
begin
  with sg_Item do
  begin
    cells[0,0]:='项目编号';
    cells[1,0]:='项目名称';
    cells[2,0]:='所属类别';
    cells[3,0]:='项目价格';
  end;

  SearchServiceItemInfo;
end;

procedure Tfrm_ServiceItem.SearchServiceItemInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text :='select item_id,item_name,type_name,item_price from serviceItem si,ServiceItemType sit '+
               'where si.service_type_id=sit.type_id';
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Item do
      begin
        cells[0,i]:=FieldByName('item_id').AsString ;
        cells[1,i]:=FieldByName('item_name').AsString ;
        cells[2,i]:=FieldByName('type_name').AsString ;
        cells[3,i]:=FieldByName('item_price').AsString ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Item.RowCount :=i+1;
end;
procedure Tfrm_ServiceItem.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ServiceItem.sbtn_okClick(Sender: TObject);
{var
  i:integer; }
begin
  if sg_Item.Cells[0,sg_Item.Row]='' then exit;

  {for i:=0 to frm_frontcheck.sg_Item.RowCount-1 do
  begin
    if frm_frontcheck.sg_Item.Cells[0,i]= sg_Item.Cells[0,sg_Item.Row] then
    begin
      MessageBox(handle,'已经添加该服务项目，请另外选择','提示',mb_ok+mb_iconinformation);
      exit;
    end;
  end; }

  StringGridInsert(frm_frontcheck.sg_Item);
  frm_frontcheck.sg_Item.Cells[0,1]:=sg_Item.Cells[0,sg_Item.Row];
  frm_frontcheck.sg_Item.Cells[1,1]:=sg_Item.Cells[1,sg_Item.Row];
  frm_frontcheck.sg_Item.Cells[2,1]:=sg_Item.Cells[3,sg_Item.Row];
  frm_frontcheck.ComputeCostsum ;
  close;
end;

procedure Tfrm_ServiceItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_serviceItem:=nil;
end;

procedure Tfrm_ServiceItem.sg_ItemDblClick(Sender: TObject);
begin
  sbtn_okClick(nil);
end;

end.
