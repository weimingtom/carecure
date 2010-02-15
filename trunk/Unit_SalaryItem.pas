unit Unit_SalaryItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons;

type
  Tfrm_salaryitem = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    sg_add: TStringGrid;
    sg_reduced: TStringGrid;
    sbtn_save: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_addadd: TSpeedButton;
    sbtn_addreduced: TSpeedButton;
    sbtn_deleteadd: TSpeedButton;
    sbtn_deletereduced: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_addaddClick(Sender: TObject);
    procedure sbtn_addreducedClick(Sender: TObject);
    procedure sbtn_deleteaddClick(Sender: TObject);
    procedure sbtn_deletereducedClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchSalaryItem(isAdd:boolean);
  public
    { Public declarations }
    procedure SalaryItem_ref;
  end;

var
  frm_salaryitem: Tfrm_salaryitem;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}
{*******************************************************}
procedure Tfrm_salaryitem.SalaryItem_ref ;
begin
  with sg_add do
  begin
    cells[0,0]:='项目名称';
    cells[1,0]:='默认金额';
  end;
  SearchSalaryItem(true);

  with sg_reduced do
  begin
    cells[0,0]:='项目名称';
    cells[1,0]:='默认金额';
  end;
  SearchSalaryItem(false);
  sbtn_addadd.Enabled := GetPower(SysUserId,'工资项目','修改权');
  sbtn_deleteadd.Enabled := sbtn_addadd.Enabled ;
  sbtn_addreduced.Enabled := sbtn_addadd.Enabled ;
  sbtn_deletereduced.Enabled := sbtn_addadd.Enabled ;
  
end;

procedure Tfrm_salaryitem.SearchSalaryItem(isadd:boolean);
var
  i:integer;
begin
  if isadd then
  begin
     StringGridClear(sg_add);
     with dmod.ADOQuery1 do
     begin
       Close;
       SQL.Text :='select item_name,default_price from salaryitem where add_or_reduced=''0''';
       Open;
       i:=1;
       while not eof do
       begin
         with sg_add do
         begin
          cells[0,i]:=FieldByName('item_name').AsString ;
          cells[1,i]:=FloatToStr(FieldByName('default_price').AsFloat) ;
         end;
         inc(i);
         next;
       end;
       if i<>1 then sg_add.Rowcount:=i+1;
     end;
  end else
  begin
     StringGridClear(sg_reduced);
     with dmod.ADOQuery1 do
     begin
       Close;
       SQL.Text :='select item_name,default_price from salaryitem where add_or_reduced=''1''';
       Open;
       i:=1;
       while not eof do
       begin
         with sg_reduced do
         begin
           cells[0,i]:=FieldByName('item_name').AsString ;
           cells[1,i]:=FloatToStr(FieldByName('default_price').AsFloat) ;
         end;
         inc(i);
         next;
       end;
       if i<>1 then sg_reduced.RowCount :=i+1;
     end;
  end;
end;
{*******************************************************}
procedure Tfrm_salaryitem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_salaryitem:=nil;
end;

procedure Tfrm_salaryitem.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_salaryitem.sbtn_addaddClick(Sender: TObject);
begin
  if sbtn_save.Enabled then
  begin
    MessageBox(handle,'请先保存添加的数据，再重试!','提示',mb_ok+mb_iconinformation);
    exit;
  end;
  StringGridInsert(sg_add);
  sg_add.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
  sbtn_addadd.Enabled :=false;
  sbtn_save.Enabled :=true;
end;

procedure Tfrm_salaryitem.sbtn_addreducedClick(Sender: TObject);
begin
  if sbtn_save.Enabled then
  begin
    MessageBox(handle,'请先保存添加的数据，再重试!','提示',mb_ok+mb_iconinformation);
    exit;
  end;
  StringGridInsert(sg_reduced);
  sg_reduced.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
  sbtn_addreduced.Enabled :=false;
  sbtn_save.Enabled :=true;
end;

procedure Tfrm_salaryitem.sbtn_deleteaddClick(Sender: TObject);
begin
  if sbtn_save.Enabled then
  begin
    MessageBox(handle,'请先保存添加的数据，再重试!','提示',mb_ok+mb_iconinformation);
    exit;
  end;
  if sg_add.Cells[0,sg_add.Row ]='' then exit;

  if MessageBox(handle,'你确定要删除该工资项目吗?','询问',mb_yesno+mb_iconquestion)<>IDYES then exit;

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='delete from salaryitem where item_name='+#39+sg_add.Cells[0,sg_add.Row ]+#39;
    ExecSQL;
  end;

  SearchSalaryItem(true);
end;

procedure Tfrm_salaryitem.sbtn_deletereducedClick(Sender: TObject);
begin
  if sbtn_save.Enabled then
  begin
    MessageBox(handle,'请先保存添加的数据，再重试!','提示',mb_ok+mb_iconinformation);
    exit;
  end;
  if sg_reduced.Cells[0,sg_reduced.Row ]='' then exit;

  if MessageBox(handle,'你确定要删除该工资项目吗?','询问',mb_yesno+mb_iconquestion)<>IDYES then exit;

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='delete from salaryitem where item_name='+#39+sg_reduced.Cells[0,sg_reduced.Row ]+#39;
    ExecSQL;
  end;

  SearchSalaryItem(false);
end;

procedure Tfrm_salaryitem.sbtn_saveClick(Sender: TObject);
var
  i:integer;
  temp:double;
  code:integer;
begin
  //判断各项的合法性
  for i:=1 to sg_add.RowCount-2 do
  begin
      Val(sg_add.Cells[1,i],temp,code);
      if code<>0 then
      begin
        MessageBox(handle,'非法数据或者没有填写金额，请修改!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
  end;
  for i:=1 to sg_reduced.RowCount-2 do
  begin
      Val(sg_reduced.Cells[1,i],temp,code);
      if code<>0 then
      begin
        MessageBox(handle,'非法数据或者没有填写金额，请修改!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='delete from SalaryItem';
      ExecSQL;

      for i:=1 to sg_add.RowCount-2 do
      begin
         Close;
         SQL.Text :='insert into salaryitem(item_name,default_price,add_or_reduced) '+
                    ' values(:itemname,:defaultprice,:addorreduced)';
         Parameters.ParamValues['itemname'] := sg_add.Cells[0,i];
         Parameters.ParamValues['defaultprice'] := StrToFloat(sg_add.Cells[1,i]);
         Parameters.ParamValues['addorreduced'] := '0';
         ExecSQL;
       end;

       for i:=1 to sg_reduced.RowCount-2 do
       begin
         Close;
         SQL.Text :='insert into salaryitem(item_name,default_price,add_or_reduced) '+
                    ' values(:itemname,:defaultprice,:addorreduced)';
         Parameters.ParamValues['itemname'] := sg_reduced.Cells[0,i];
         Parameters.ParamValues['defaultprice'] := StrToFloat(sg_reduced.Cells[1,i]);
         Parameters.ParamValues['addorreduced'] := '1';
         ExecSQL;
       end;

    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      MessageBox(handle,'工资项目数据保存完毕!','提示',mb_ok+mb_iconinformation);
      SearchSalaryItem(true);
      SearchSalaryItem(false);
      sg_add.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goRowSelect];;
      sg_reduced.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goRowSelect];
      sbtn_save.Enabled :=false;
      sbtn_addadd.Enabled :=true;
      sbtn_addreduced.Enabled :=true;
    except
      dmod.ADOConn.RollbackTrans;
      MessageBox(handle,'工资项目数据保存失败，请重试!','提示',mb_ok+mb_iconinformation);
    end;
  end;
end;

end.
