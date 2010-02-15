unit Unit_Dictionary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, StdCtrls, Buttons, ExtCtrls,Math;

type
  Tfrm_dictionary = class(TForm)
    PageControl1: TPageControl;
    sht_EmpType: TTabSheet;
    sht_CusType: TTabSheet;
    sg_EmpType: TStringGrid;
    Panel1: TPanel;
    sbtn_append: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sg_CusType: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    sbtn_save: TSpeedButton;
    sht_ServiceItemType: TTabSheet;
    sg_SerType: TStringGrid;
    Label3: TLabel;
    sht_ServiceItem: TTabSheet;
    sg_ItemType: TStringGrid;
    sht_MemberCardType: TTabSheet;
    sg_CardType: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_EmpTypeid: TEdit;
    edt_EmpTypename: TEdit;
    edt_EmpTyperemark: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edt_CusTypename: TEdit;
    edt_CusTypeid: TEdit;
    edt_CusTypeRemark: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edt_SerTypename: TEdit;
    edt_SerTypeId: TEdit;
    edt_SerTyperemark: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    edt_ItemTypeid: TEdit;
    edt_ItemTypename: TEdit;
    cbb_SerType: TComboBox;
    Label16: TLabel;
    edt_ItemTypePrice: TEdit;
    edt_ItemTyperemark: TMemo;
    Label15: TLabel;
    Label17: TLabel;
    edt_CardTypeid: TEdit;
    Label18: TLabel;
    edt_CardTypeName: TEdit;
    edt_Discount: TEdit;
    Label20: TLabel;
    edt_CardTyperemark: TMemo;
    Label19: TLabel;
    edt_MinCost: TEdit;
    sht_ServiceMealType: TTabSheet;
    sg_MealType: TStringGrid;
    Label21: TLabel;
    edt_MealTypeid: TEdit;
    Label22: TLabel;
    edt_MealTypeName: TEdit;
    sht_ServiceMeal: TTabSheet;
    sg_MealType2: TStringGrid;
    Label23: TLabel;
    edt_MealTyperemark: TMemo;
    sg_ItemType2: TStringGrid;
    cbb_MealType: TComboBox;
    sbtn_Add: TSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    edt_TotalSum: TEdit;
    edt_PromotionSum: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label28: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel2: TPanel;
    Image7: TImage;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sg_EmpTypeDblClick(Sender: TObject);
    procedure sg_EmpTypeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_CusTypeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_SerTypeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_ItemTypeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_SerTypeDblClick(Sender: TObject);
    procedure sg_CusTypeDblClick(Sender: TObject);
    procedure cbb_SerTypeEnter(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sg_CardTypeDblClick(Sender: TObject);
    procedure sg_ItemTypeDblClick(Sender: TObject);
    procedure sg_MealTypeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbb_MealTypeEnter(Sender: TObject);
    procedure sbtn_AddClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure sg_MealType2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_ItemTypePriceExit(Sender: TObject);
    procedure edt_MinCostExit(Sender: TObject);
    procedure edt_DiscountExit(Sender: TObject);
  private
    { Private declarations }
    EmpTypeAppendOrEdit,CusTypeAppendOrEdit,SerTypeAppendOrEdit,ItemTypeAppendOrEdit,MealTypeAppendOrEdit,CardTypeAppendOrEdit:boolean;
    EmpTypeId,CusTypeId,SerTypeId,ItemTypeId,MealTypeid,CardTypeId:string;

    procedure MakeEmpTypeEnabled(temp:boolean);
    procedure MakeCusTypeEnabled(temp:boolean);
    procedure MakeServiceItemTypeEnabled(temp:boolean);
    procedure MakeServiceItemEnabled(temp:boolean);
    procedure MakeServiceMealTypeEnabled(temp:boolean);
    procedure MakeMemberCardTypeEnabled(temp:boolean);

    procedure SearchEmpTypeInfo();
    procedure SearchCusTypeInfo();
    procedure SearchServiceItemTypeInfo();
    procedure SearchServiceItemInfo();
    procedure SearchServiceMealTypeInfo();
    procedure SearchServiceMealInfo();
    procedure SearchServiceMealItemInfo(temp:string);
    procedure SearchServiceItem2Info();
    procedure SearchMemberCardTypeInfo();

    procedure ClearEmpTypeInfo();
    procedure ClearCusTypeInfo();
    procedure ClearServiceItemTypeInfo();
    procedure ClearServiceItemInfo();
    procedure ClearServiceMealTypeInfo();
    procedure ClearMemberCardTypeInfo();

    function SaveEmpTypeInfo():boolean;
    function SaveCusTypeInfo():boolean;
    function SaveServiceItemTypeInfo():boolean;
    function SaveServiceItemInfo():boolean;
    function SaveServiceMealTypeInfo():boolean;
    function SaveServiceMealInfo():boolean;
    function SaveMemberCardTypeInfo():boolean;

    function CalculateTotalSum():double;
  public
    { Public declarations }
    procedure dic_ref;
    procedure cus_ref;
    procedure emp_ref;
    procedure ServiceItemType_ref;
    procedure ServiceItem_ref;
    procedure ServiceMealType_ref;
    procedure ServiceMeal_ref;
    procedure MemberCardType_ref;
  end;

var
  frm_dictionary: Tfrm_dictionary;

implementation
      uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;

{$R *.dfm}

procedure Tfrm_dictionary.dic_ref ;
begin
  sbtn_append.Enabled := GetPower(SysUserId,'用户字典','修改权');
  sbtn_edit.Enabled := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled ;
end;

function Tfrm_dictionary.CalculateTotalSum():double;
var
  total_sum:double;
  i:integer;
begin
  total_sum:=0.0;
  for i:=1 to sg_ItemType2.RowCount -2 do
  begin
     total_sum := total_sum+StrToFloat(sg_ItemType2.cells[2,i]);
  end;
  result:=total_sum;
end;
{*********************EmployeeType******************************}
//进行员工类别的初始化
procedure Tfrm_dictionary.emp_ref;
begin
  with sg_EmpType do
  begin
    cells[0,0] := '序号';
    cells[1,0] := '员工类别';
    cells[2,0] := '类别描述';
  end;
  SearchEmpTypeInfo();
end;
//进行员工类别记录的查询
procedure Tfrm_dictionary.SearchEmpTypeInfo ();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name,type_remark from EmployeeType';
    Open;
    i:=1;
    while not eof do
    begin
      sg_EmpType.Cells[0,i] := FieldByName('type_id').AsString ;
      sg_EmpType.Cells[1,i] := FieldByName('type_name').AsString ;
      sg_EmpType.Cells[2,i] := FieldbyName('type_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_EmpType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_EmpType.RowCount >3 then sbtn_back.Enabled := true;
end;
//进行员工类别数据的保存
function Tfrm_dictionary.SaveEmpTypeInfo():boolean;
begin
  result := true;
  if trim(edt_EmpTypename.Text)='' then
  begin
    Messagebox(handle,'请输入员工类别名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_EmpTypename.SetFocus ;
    exit;
  end;

  EmpTypeid:=trim(edt_Emptypeid.Text );
  if EmpTypeAppendOrEdit then //如果是新增加员工类别
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from EmployeeType where type_id=:typeid';
    Parameters.ParamValues['typeid'] := EmpTypeid;
    Open;
    if not eof then  //如果员工编号已经存在
    begin
      MessageBox(self.handle,'该员工类别编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_EmpTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from EmployeeType where type_name=:typename';
    Parameters.ParamValues['typename'] := trim(edt_EmpTypename.Text);
    open;
    if not eof then
    if FieldByName('type_id').AsString <> Emptypeid then
    begin
      MessageBox(self.Handle ,'该员工姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_EmpTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
//    dmod.Database.StartTransaction ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from EmployeeType where type_id=:typeid';
      Parameters.ParamValues['typeid'] := EmpTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into EmployeeType(type_id,type_name,type_remark) values(:typeid,:typename,:typeremark)';
      Parameters.ParamValues['typeid'] := trim(edt_Emptypeid.Text );
      Parameters.ParamValues['typename'] := trim(edt_Emptypename.Text );
      Parameters.ParamValues['typeremark'] := trim(edt_Emptyperemark.Text );
      ExecSQL;
    end;
  finally
    try
//      dmod.Database.Commit ;
      dmod.ADOConn.CommitTrans ;
    except
//      dmod.Database.Rollback ;
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
//进行员工信息的清除
procedure Tfrm_dictionary.ClearEmpTypeInfo();
begin
  edt_EmpTypeid.Text :='';
  edt_EmpTypename.Text :='';
  edt_EmpTyperemark.Text :='';
end;
//进行员工信息的按钮设置
procedure Tfrm_dictionary.MakeEmpTypeEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
     sbtn_save.Enabled := true
  else
     sbtn_save.Enabled := false;
  sbtn_delete.Enabled :=false;

  edt_EmpTypeid.Enabled := temp;
  edt_EmpTypename.Enabled := temp;
  edt_EmpTyperemark.Enabled := temp;

end;
{***********************EmployeeType**************************}

{***********************CustomerType**************************}
//进行客户类型的初始化
procedure Tfrm_dictionary.cus_ref;
begin
  with sg_CusType do
  begin
    cells[0,0] := '序号';
    cells[1,0] := '顾客类别';
    cells[2,0] := '类别描述';
  end;
  SearchCusTypeInfo();
end;
//进行客户类型的查询列表
procedure Tfrm_dictionary.SearchCusTypeInfo();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name,type_remark from CustomerType order by type_id desc';
    Open;
    i:=1;
    while not eof do
    begin
      sg_CusType.Cells[0,i] := FieldByName('type_id').AsString ;
      sg_CusType.Cells[1,i] := FieldByName('type_name').AsString ;
      sg_CusType.Cells[2,i] := FieldbyName('type_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_CusType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_CusType.RowCount >3 then sbtn_back.Enabled := true;
end;
//进行客户类别的清除
procedure Tfrm_dictionary.ClearCusTypeInfo ();
begin
  edt_CusTypeid.Text :='';
  edt_CusTypename.Text :='';
  edt_CusTyperemark.Text :='';
end;

procedure Tfrm_dictionary.MakeCusTypeEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
     sbtn_save.Enabled :=true
  else
     sbtn_save.Enabled :=false;
  sbtn_delete.Enabled  :=false;

  edt_Custypeid.Enabled :=temp;
  edt_Custypename.Enabled :=temp;
  edt_Custyperemark.Enabled :=temp;
end;

function Tfrm_dictionary.SaveCusTypeInfo():boolean;
begin
  result := true;
  if trim(edt_CusTypename.Text)='' then
  begin
    Messagebox(handle,'请输入客户类别名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_CusTypename.SetFocus ;
    exit;
  end;

  CusTypeid:=trim(edt_Custypeid.Text );
  if CusTypeAppendOrEdit then //如果是新增加员工类别
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from CustomerType where type_id=:typeid';
    Parameters.ParamValues['typeid'] := EmpTypeid;
    Open;
    if not eof then  //如果员工编号已经存在
    begin
      MessageBox(self.handle,'该客户类别编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_EmpTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from CustomerType where type_name=:typename';
    Parameters.ParamValues['typename'] := trim(edt_CusTypename.Text);
    open;
    if not eof then
    if FieldByName('type_id').AsString <> Custypeid then
    begin
      MessageBox(self.Handle ,'该员工姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_CusTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from CustomerType where type_id=:typeid';
      Parameters.ParamValues['typeid'] := CusTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into CustomerType(type_id,type_name,type_remark) values(:typeid,:typename,:typeremark)';
      Parameters.ParamValues['typeid'] := trim(edt_Custypeid.Text );
      Parameters.ParamValues['typename'] := trim(edt_Custypename.Text );
      Parameters.ParamValues['typeremark'] := trim(edt_Custyperemark.Text );
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
{***********************CustomerType**************************}

{***********************ServiceItemType***********************}
procedure Tfrm_dictionary.ServiceItemType_ref ;
begin
  with sg_SerType do
  begin
    cells[0,0] := '序号';
    cells[1,0] := '服务类别';
    cells[2,0] := '服务描述';
  end;
  SearchServiceItemTypeInfo();
end;

procedure Tfrm_dictionary.SearchServiceItemTypeInfo();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name,type_remark from ServiceItemType';
    Open;
    i:=1;
    while not eof do
    begin
      sg_SerType.Cells[0,i] := FieldByName('type_id').AsString ;
      sg_SerType.Cells[1,i] := FieldByName('type_name').AsString ;
      sg_SerType.Cells[2,i] := FieldbyName('type_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_SerType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_SerType.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_dictionary.ClearServiceItemTypeInfo ();
begin
  edt_SerTypeid.Text :='';
  edt_SerTypename.Text :='';
  edt_Sertyperemark.Text :='';
end;

procedure Tfrm_dictionary.MakeServiceItemTypeEnabled(temp:boolean);
begin
  if sbtn_append.enabled then
     sbtn_save.Enabled :=true
  else
     sbtn_save.Enabled :=false;
  sbtn_delete.Enabled  :=false;
  edt_SerTypeid.Enabled :=temp;
  edt_Sertypename.Enabled :=temp;
  edt_Sertyperemark.Enabled :=temp;
end;

function Tfrm_dictionary.SaveServiceItemTypeInfo ():boolean;
begin
  result := true;
  if trim(edt_SerTypename.Text)='' then
  begin
    Messagebox(handle,'请输入员工类别名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_SerTypename.SetFocus ;
    exit;
  end;

  SerTypeid:=trim(edt_Sertypeid.Text );
  if SerTypeAppendOrEdit then //如果是新增加员工类别
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from ServiceItemType where type_id=:typeid';
    Parameters.ParamValues['typeid'] := SerTypeid;
    Open;
    if not eof then  //如果员工编号已经存在
    begin
      MessageBox(self.handle,'该员工类别编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_SerTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from ServiceItemType where type_name=:typename';
    Parameters.ParamValues['typename'] := trim(edt_SerTypename.Text);
    open;
    if not eof then
    if FieldByName('type_id').AsString <> Sertypeid then
    begin
      MessageBox(self.Handle ,'该员工姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_SerTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceItemType where type_id=:typeid';
      Parameters.ParamValues['typeid'] := SerTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into ServiceItemType(type_id,type_name,type_remark) values(:typeid,:typename,:typeremark)';
      Parameters.ParamValues['typeid'] := trim(edt_Sertypeid.Text );
      Parameters.ParamValues['typename'] := trim(edt_Sertypename.Text );
      Parameters.ParamValues['typeremark'] := trim(edt_Sertyperemark.Text );
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
{***********************ServiceItemType***********************}

{***********************ServiceItem******************************}
procedure Tfrm_dictionary.ServiceItem_ref ;
begin
  with sg_ItemType do
  begin
    cells[0,0] := '项目序号';
    cells[1,0] := '项目名称';
    cells[2,0] := '服务类别';
    cells[3,0] := '项目价格';
    cells[4,0] := '项目描述';
  end;
  SearchServiceItemInfo();
end;

procedure Tfrm_dictionary.SearchServiceItemInfo();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select item_id,item_name,service_type_id,service_type_name,item_price,item_remark from ServiceItem';
    Open;
    i:=1;
    while not eof do
    begin
      sg_ItemType.Cells[0,i] := FieldByName('item_id').AsString ;
      sg_ItemType.Cells[1,i] := FieldByName('item_name').AsString ;
      sg_ItemType.Cells[2,i] := FieldbyName('service_type_id').AsString +'-'+ FieldbyName('service_type_name').AsString ;
      sg_ItemType.Cells[3,i] := FloatToStr(FieldByName('item_price').AsFloat);
      sg_ItemType.Cells[4,i] := FieldByName('item_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_ItemType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_ItemType.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_dictionary.ClearServiceItemInfo ();
begin
  edt_ItemTypeid.Text :='';
  edt_ItemTypename.Text :='';
  cbb_SerType.Text :='';
  edt_ItemTypePrice.Text :='';
  edt_Itemtyperemark.Text :='';
end;

procedure Tfrm_dictionary.MakeServiceItemEnabled(temp:boolean);
begin
  if sbtn_append.enabled then
     sbtn_save.Enabled :=true
  else
     sbtn_save.Enabled :=false;
  sbtn_delete.Enabled  :=false;
  edt_ItemTypeid.Enabled :=temp;
  edt_Itemtypename.Enabled :=temp;
  cbb_SerType.Enabled :=temp;
  edt_ItemTypePrice.Enabled :=temp;
  edt_Itemtyperemark.Enabled :=temp;
end;

function Tfrm_dictionary.SaveServiceItemInfo ():boolean;
var
   servicetypeid,servicetypename:string;
begin
  result := true;
  if trim(edt_ItemTypename.Text)='' then
  begin
    Messagebox(handle,'请输入服务项目名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_ItemTypename.SetFocus ;
    exit;
  end;

  ItemTypeid:=trim(edt_Itemtypeid.Text );
  if ItemTypeAppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select item_id from ServiceItem where item_id=:itemid';
    Parameters.ParamValues['itemid'] := ItemTypeid;
    Open;
    if not eof then
    begin
      MessageBox(self.handle,'该服务项目编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_ItemTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select item_id from ServiceItem where item_name=:itemname';
    Parameters.ParamValues['itemname'] := trim(edt_ItemTypename.Text);
    open;
    if not eof then
    if FieldByName('item_id').AsString <> Itemtypeid then
    begin
      MessageBox(self.Handle ,'该服务项目名称已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_ItemTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceItem where item_id=:itemid';
      Parameters.ParamValues['itemid'] := ItemTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into ServiceItem(item_id,item_name,service_type_id,service_type_name,item_price,item_remark) '+
                  'values (:itemid,:itemname,:servicetypeid,:servicetypename,:itemprice,:itemremark)';
      Parameters.ParamValues['itemid'] := trim(edt_itemtypeid.Text );
      Parameters.ParamValues['itemname'] := trim(edt_itemtypename.Text );
      servicetypeid:= copy(trim(cbb_sertype.Text),0,(length(cbb_sertype.Text)-length(strpos(pchar(cbb_sertype.Text),'-'))));
      servicetypename:= copy(trim(cbb_sertype.Text),(length(cbb_sertype.Text)-length(strpos(pchar(cbb_sertype.Text),'-')))+2,length(trim(cbb_sertype.text)));
      Parameters.ParamValues['servicetypeid'] := servicetypeid;
      Parameters.ParamValues['servicetypename'] := servicetypename;
      Parameters.ParamValues['itemprice'] := StrToFloat(trim(edt_ItemTypePrice.Text ));
      Parameters.ParamValues['itemremark'] := trim(edt_itemtyperemark.Text );
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
{***********************ServiceItem******************************}

{***********************ServiceMealType***********************}
procedure Tfrm_dictionary.ServiceMealType_ref ;
begin
  with sg_MealType do
  begin
    cells[0,0] := '类型序号';
    cells[1,0] := '套餐名称';
    cells[2,0] := '套餐描述';
  end;
  SearchServiceMealTypeInfo();
end;

procedure Tfrm_dictionary.SearchServiceMealTypeInfo();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name,type_remark from ServiceMealType';
    Open;
    i:=1;
    while not eof do
    begin
      sg_MealType.Cells[0,i] := FieldByName('type_id').AsString ;
      sg_MealType.Cells[1,i] := FieldByName('type_name').AsString ;
      sg_MealType.Cells[2,i] := FieldbyName('type_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_MealType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_MealType.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_dictionary.ClearServiceMealTypeInfo ();
begin
  edt_MealTypeid.Text :='';
  edt_MealTypename.Text :='';
  edt_Mealtyperemark.Text :='';
end;

procedure Tfrm_dictionary.MakeServiceMealTypeEnabled(temp:boolean);
begin
  if sbtn_append.enabled then
     sbtn_save.Enabled :=true
  else
     sbtn_save.Enabled :=false;
  sbtn_delete.Enabled  :=false;
  edt_MealTypeid.Enabled :=temp;
  edt_Mealtypename.Enabled :=temp;
  edt_Mealtyperemark.Enabled :=temp;
end;

function Tfrm_dictionary.SaveServiceMealTypeInfo ():boolean;
begin
  result := true;
  if trim(edt_MealTypename.Text)='' then
  begin
    Messagebox(handle,'请输入服务套餐名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_MealTypename.SetFocus ;
    exit;
  end;

  MealTypeid:=trim(edt_Mealtypeid.Text );
  if MealTypeAppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from ServiceMealType where type_id=:typeid';
    Parameters.ParamValues['typeid'] := MealTypeid;
    Open;
    if not eof then
    begin
      MessageBox(self.handle,'该员工类别编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_MealTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from ServiceItemType where type_name=:typename';
    Parameters.ParamValues['typename'] := trim(edt_MealTypename.Text);
    open;
    if not eof then
    if FieldByName('type_id').AsString <> Mealtypeid then
    begin
      MessageBox(self.Handle ,'该员工姓名已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_MealTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceMealType where type_id=:typeid';
      Parameters.ParamValues['typeid'] := MealTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into ServiceMealType(type_id,type_name,type_remark) values(:typeid,:typename,:typeremark)';
      Parameters.ParamValues['typeid'] := trim(edt_Mealtypeid.Text );
      Parameters.ParamValues['typename'] := trim(edt_Mealtypename.Text );
      Parameters.ParamValues['typeremark'] := trim(edt_Mealtyperemark.Text );
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
{***********************ServiceMealType***********************}

{***********************ServiceMeal***********************}
procedure Tfrm_dictionary.ServiceMeal_ref ;
begin
  with sg_MealType2 do
  begin
    cells[0,0] := '套餐序号';
    cells[1,0] := '套餐名称';
  end;
  with sg_ItemType2 do
  begin
    cells[0,0] := '项目序号';
    cells[1,0] := '项目名称';
    cells[2,0] := '项目价格';
  end;
  SearchServiceMealInfo();
  SearchServiceItem2Info();
end;

procedure Tfrm_dictionary.SearchServiceMealInfo ();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name from ServiceMealType';
    Open;
    i:=1;
    while not eof do
    begin
      sg_MealType2.Cells[0,i]:=FieldByName('type_id').AsString ;
      sg_MealType2.Cells[1,i]:=FieldByName('type_name').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_MealType2.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_MealType2.RowCount >3 then sbtn_back.Enabled := true;

  if sg_MealType2.Cells[0,1]<>'' then
  SearchServiceMealItemInfo(sg_MealType2.Cells[0,1]);
end;

procedure Tfrm_dictionary.SearchServiceMealItemInfo (temp:string);
var
   i:integer;
   total_sum,promotion_sum:double;
begin
   total_sum:=0.0;promotion_sum:=0.0;
  StringGridClear(sg_ItemType2);

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select total_sum,promotion_sum from ServiceMealType where type_id=:typeid';
    Parameters.ParamValues['typeid'] :=temp;
    Open;
    if not eof then
    begin
      total_sum:=FieldbyName('total_sum').AsFloat ;
      promotion_sum:=FieldbyName('promotion_sum').AsFloat ;
    end;

    Close;
    SQL.Text := 'select i.item_id,item_name,item_price from ServiceMeal m,ServiceItem i where m.item_id=i.item_id '+
                'and m.type_id='+#39+temp+#39;
    Open;
    i:=1;
    while not eof do
    begin
      sg_ItemType2.Cells[0,i]:= FieldByName('item_id').AsString ;
      sg_ItemType2.Cells[1,i]:= FieldByName('item_name').AsString ;
      sg_ItemType2.Cells[2,i]:= FieldByName('item_price').AsString ;
      inc(i);
      next;
    end;
  end;

  edt_totalsum.Text :=FloatToStr(total_sum);
  edt_promotionsum.Text :=FloatToStr(promotion_sum);

  if i<>1 then sg_ItemType2.RowCount := i+1;

  //sbtn_front.Enabled := false;
  //sbtn_back.Enabled  := false;
  //if sg_ItemType2.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_dictionary.SearchServiceItem2Info ();
begin
  cbb_MealType.Clear ;
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text:='select item_id,item_name,item_price from ServiceItem';
    Open;
    while not eof do
    begin
      cbb_MealType.Items.Add(FieldByName('item_id').AsString+'-'+FieldByName('item_name').AsString+'-'+FloatToStr(FieldByName('item_Price').AsFloat));
      next;
    end;
  end;
end;

function Tfrm_dictionary.SaveServiceMealInfo ():boolean;
var
  temp_type_id,temp_type_name:string;
  i:integer;
begin
  result:=true;
  temp_type_id:=sg_MealType2.Cells[0,sg_MealType2.Row];
  temp_type_name:=sg_MealType2.cells[1,sg_MealType2.row];

  if temp_type_id='' then
  begin
     MessageBox(handle,'请先选择一个服务项目类型','提示',mb_ok+mb_iconinformation);
     result:=false;
     exit;
  end;

  if (edt_promotionsum.Text ='') or (edt_promotionsum.Text ='0') then
  begin
     MessageBox(handle,'请输入服务套餐的优惠价','提示',mb_ok+mb_iconinformation);
     edt_PromotionSum.SetFocus ;
     result:=false;
     exit;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text :='update ServiceMealType set total_sum=:totalsum,promotion_sum=:promotionsum where '+
                 'type_id=:typeid';
      Parameters.ParamValues['totalsum'] := StrToFloat(edt_totalsum.Text );
      Parameters.ParamValues['promotionsum'] := StrToFloat(edt_promotionsum.Text );
      Parameters.ParamValues['typeid'] := temp_type_id;
      ExecSQL;

      close;
      SQL.Text :='delete from ServiceMeal where type_id=:typeid';
      Parameters.ParamValues['typeid'] :=temp_type_id;
      ExecSQL;

      for i:=1 to sg_ItemType2.RowCount -2 do
      begin
        close;
        SQL.Text :='insert into ServiceMeal(type_id,item_id) values(:typeid,:itemid)';
        Parameters.ParamValues['typeid'] :=temp_type_id;
        //ParamByName('typename').AsString :=temp_type_name;
        Parameters.ParamValues['itemid'] := trim(sg_ItemType2.Cells[0,i]);
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      result:=true;
    except
      MessageBox(handle,'操作失败，请重试!','提示',mb_ok+mb_iconinformation);
      dmod.ADOConn.RollbackTrans ;
      result:=false;
    end;
  end;
end;
{***********************ServiceMeal***********************}

{***********************MemberCardType******************************}
procedure Tfrm_dictionary.MemberCardType_ref ;
begin
  with sg_CardType do
  begin
    cells[0,0] := '类型序号';
    cells[1,0] := '类型名称';
    cells[2,0] := '最低消费';
    cells[3,0] := '享受折扣';
    cells[4,0] := '类型描述';
  end;
  SearchMemberCardTypeInfo();
end;

procedure Tfrm_dictionary.SearchMemberCardTypeInfo();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id,type_name,mincost,discount,type_remark from MemberCardType';
    Open;
    i:=1;
    while not eof do
    begin
      sg_CardType.Cells[0,i] := FieldByName('type_id').AsString ;
      sg_CardType.Cells[1,i] := FieldByName('type_name').AsString ;
      sg_CardType.Cells[2,i] := FloatToStr(FieldbyName('mincost').AsFloat);
      sg_CardType.Cells[3,i] := FloatToStr(FieldByName('discount').AsFloat);
      sg_CardType.Cells[4,i] := FieldByName('type_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_CardType.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_CardType.RowCount >3 then sbtn_back.Enabled := true;
end;

procedure Tfrm_dictionary.ClearMemberCardTypeInfo ();
begin
  edt_CardTypeid.Text :='';
  edt_CardTypename.Text :='';
  edt_Mincost.Text :='';
  edt_discount.Text :='';
  edt_Cardtyperemark.Text :='';
end;

procedure Tfrm_dictionary.MakeMemberCardTypeEnabled(temp:boolean);
begin
  if sbtn_append.enabled then
     sbtn_save.Enabled :=true
  else
     sbtn_save.Enabled :=false;
  sbtn_delete.Enabled  :=false;
  edt_CardTypeid.Enabled :=temp;
  edt_CardTypename.Enabled :=temp;
  edt_Mincost.Enabled :=temp;
  edt_discount.Enabled :=temp;
  edt_Cardtyperemark.Enabled :=temp;
end;

function Tfrm_dictionary.SaveMemberCardTypeInfo():boolean;
begin
  result := true;
  if trim(edt_CardTypename.Text)='' then
  begin
    Messagebox(handle,'请输入会员卡类型名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    edt_CardTypename.SetFocus ;
    exit;
  end;
  
  CardTypeid:=trim(edt_Cardtypeid.Text );
  if CardTypeAppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from MemberCardType where type_id=:typeid';
    Parameters.ParamValues['typeid'] := CardTypeid;
    Open;
    if not eof then
    begin
      MessageBox(self.handle,'该会员卡类型编号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_CardTypeid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select type_id from MemberCardType where type_name=:typename';
    Parameters.ParamValues['typename'] := trim(edt_CardTypename.Text);
    open;
    if not eof then
    if FieldByName('type_id').AsString <> CardTypeid then
    begin
      MessageBox(self.Handle ,'该会员卡类型名称已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      edt_CardTypename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from MemberCardType where type_id=:typeid';
      Parameters.ParamValues['typeid'] := CardTypeId;
      ExecSQL;

      close;
      SQL.Text := 'insert into MemberCardType(type_id,type_name,mincost,discount,type_remark) '+
                  'values (:typeid,:typename,:mincost,:discount,:typeremark)';
      Parameters.ParamValues['typeid'] := trim(edt_Cardtypeid.Text );
      Parameters.ParamValues['typename'] := trim(edt_Cardtypename.Text );
      Parameters.ParamValues['mincost'] := StrToFloat(trim(edt_MinCost.Text));
      Parameters.ParamValues['discount'] := StrToFloat(trim(edt_Discount.Text ));
      Parameters.ParamValues['typeremark'] := trim(edt_Cardtyperemark.Text );
      ExecSQL;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
    end;
  end;
end;
{***********************MemberCardType******************************}

procedure Tfrm_dictionary.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_dictionary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_dictionary := nil; 
end;

procedure Tfrm_dictionary.sbtn_appendClick(Sender: TObject);
var
  i:integer;
  temp:string;
begin
  {*********************如果新建员工类别**********************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
    if (not EmpTypeAppendOrEdit) and (not edt_Emptypeid.Enabled) and (edt_Emptypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveEmpTypeInfo then i:=2;
      if i=2 then exit;
    end;
    EmpTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeEmpTypeEnabled(true);
    ClearEmpTypeInfo();

    sg_EmpType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_EmpTypeid.Text :=GetNo('DBMeirong','EmployeeType','','','type_id',temp,2); //to set value of Empno like '2003101301'
  end
  {**********************//如果新建客户类别************************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin
    if (not CusTypeAppendOrEdit) and (not edt_Custypeid.Enabled) and (edt_Custypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveCusTypeInfo then i:=2;
      if i=2 then exit;
    end;
    CusTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeCusTypeEnabled(true);
    ClearCusTypeInfo();

    sg_CusType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_CusTypeid.Text :=GetNo('DBMeirong','CustomerType','','','type_id',temp,2); //to set value of Empno like '2003101301'
  end
  {******************************新建服务项目类别***************************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if (not SerTypeAppendOrEdit) and (not edt_Sertypeid.Enabled) and (edt_Sertypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemTypeInfo then i:=2;
      if i=2 then exit;
    end;
    SerTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeServiceItemTypeEnabled(true);
    ClearServiceItemTypeInfo();

    sg_SerType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_SerTypeid.Text :=GetNo('DBMeirong','ServiceItemType','','','type_id',temp,2); //to set value of Empno like '2003101301'
  end
  {*******************************新建服务项目**********************************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if (not ItemTypeAppendOrEdit) and (not edt_Itemtypeid.Enabled) and (edt_Itemtypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemInfo then i:=2;
      if i=2 then exit;
    end;
    ItemTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeServiceItemEnabled(true);
    ClearServiceItemInfo();

    sg_ItemType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_ItemTypeid.Text :=GetNo('DBMeirong','ServiceItem','','','Item_id',temp,2); //to set value of Empno like '2003101301'
  end
  {*******************************新建服务套餐类型**********************************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if (not MealTypeAppendOrEdit) and (not edt_Mealtypeid.Enabled) and (edt_Mealtypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceMealTypeInfo then i:=2;
      if i=2 then exit;
    end;
    MealTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeServiceMealTypeEnabled(true);
    ClearServiceMealTypeInfo();

    sg_MealType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_MealTypeid.Text :=GetNo('DBMeirong','ServiceMealType','','','type_id',temp,2); //to set value of Empno like '2003101301'
  end
  {*******************************新建会员卡类型**********************************}
  else if pagecontrol1.ActivePage = sht_MemberCardType then
  begin
    if (not CardTypeAppendOrEdit) and (not edt_Cardtypeid.Enabled) and (edt_Cardtypeid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveMemberCardTypeInfo then i:=2;
      if i=2 then exit;
    end;
    CardTypeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeMemberCardTypeEnabled(true);
    ClearMemberCardTypeInfo();

    sg_CardType.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_CardTypeid.Text :=GetNo('DBMeirong','MemberCardType','','','type_id',temp,2); //to set value of Empno like '2003101301'
  end;
end;

procedure Tfrm_dictionary.sbtn_saveClick(Sender: TObject);
var
  i:integer;
  temp:string;
begin
  {**********************#进行员工类别的保存********************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
    if not SaveEmpTypeInfo then exit;
    if EmpTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Emptype);
      i:=1;
    end else i:=sg_Emptype.Row;
    with sg_Emptype do
    begin
      cells[0,i] := trim(edt_EmpTypeid.Text );
      cells[1,i] := trim(edt_EmpTypename.Text );
      cells[2,i] := trim(edt_EmpTyperemark.Text );
    end;
    if EmpTypeAppendOrEdit then
    begin
      ClearEmpTypeInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_EmpTypeid.Text :=GetNo('DBMeiRong','EmployeeType','','','type_id',temp,2);
      if sg_EmpType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
    MakeEmpTypeEnabled(false);
    ClearEmpTypeInfo();
    sg_EmpType.Enabled:=true;
    sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************#进行客户类别的保存********************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin 
    if not SaveCusTypeInfo then exit;
    if CusTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Custype);
      i:=1;
    end else i:=sg_Custype.Row;
    with sg_Custype do
    begin
      cells[0,i] := trim(edt_CusTypeid.Text );
      cells[1,i] := trim(edt_CusTypename.Text );
      cells[2,i] := trim(edt_CusTyperemark.Text );
    end;
    if CusTypeAppendOrEdit then
    begin
      ClearCusTypeInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_CusTypeid.Text :=GetNo('DBMeiRong','CustomerType','','','type_id',temp,2);
      if sg_CusType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
    MakeCusTypeEnabled(false);
    ClearCusTypeInfo();
    sg_CusType.Enabled:=true;
    sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************#进行服务类别的保存********************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if not SaveServiceItemTypeInfo then exit;
    if SerTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Sertype);
      i:=1;
    end else i:=sg_Sertype.Row;
    with sg_Sertype do
    begin
      cells[0,i] := trim(edt_SerTypeid.Text );
      cells[1,i] := trim(edt_SerTypename.Text );
      cells[2,i] := trim(edt_SerTyperemark.Text );
    end;
    if SerTypeAppendOrEdit then
    begin
      ClearServiceItemTypeInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_SerTypeid.Text :=GetNo('DBMeiRong','ServiceItemType','','','type_id',temp,2);
      if sg_SerType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeServiceItemTypeEnabled(false);
      ClearServiceItemTypeInfo();
      sg_SerType.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************#进行服务项目的保存********************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if not SaveServiceItemInfo then exit;
    if ItemTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Itemtype);
      i:=1;
    end else i:=sg_Itemtype.Row;
    with sg_Itemtype do
    begin
      cells[0,i] := trim(edt_ItemTypeid.Text );
      cells[1,i] := trim(edt_ItemTypename.Text );
      cells[2,i] := trim(cbb_SerType.Text );
      cells[3,i] := trim(edt_ItemTypePrice.Text);
      cells[4,i] := trim(edt_ItemTyperemark.Text );
    end;
    if ItemTypeAppendOrEdit then
    begin
      ClearServiceItemInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_ItemTypeid.Text :=GetNo('DBMeiRong','ServiceItem','','','item_id',temp,2);
      if sg_ItemType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeServiceItemEnabled(false);
      ClearServiceItemInfo();
      sg_ItemType.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************#进行服务套餐类型的保存********************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if not SaveServiceMealTypeInfo then exit;
    if MealTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Mealtype);
      i:=1;
    end else i:=sg_MealType.Row;
    with sg_Mealtype do
    begin
      cells[0,i] := trim(edt_MealTypeid.Text );
      cells[1,i] := trim(edt_MealTypename.Text );
      cells[2,i] := trim(edt_MealTyperemark.Text );
    end;
    if MealTypeAppendOrEdit then
    begin
      ClearServiceMealTypeInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_MealTypeid.Text :=GetNo('DBMeiRong','ServiceMealType','','','type_id',temp,2);
      if sg_MealType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeServiceMealTypeEnabled(false);
      ClearServiceMealTypeInfo();
      sg_MealType.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************#进行服务套餐的保存********************}
  else if pagecontrol1.ActivePage = sht_ServiceMeal then
  begin
    if not SaveServiceMealInfo() then exit;
    sbtn_save.Enabled :=false;
  end
  {**********************#进行会员卡类型的保存********************}
  else if pagecontrol1.ActivePage = sht_MemberCardtype then
  begin
    if not SaveMemberCardTypeInfo then exit;
    if CardTypeAppendOrEdit then
    begin
      StringGridInsert(sg_Cardtype);
      i:=1;
    end else i:=sg_Cardtype.Row;
    with sg_Cardtype do
    begin
      cells[0,i] := trim(edt_cardTypeid.Text );
      cells[1,i] := trim(edt_CardTypename.Text );
      cells[2,i] := trim(edt_Mincost.Text );
      cells[3,i] := trim(edt_discount.Text);
      cells[4,i] := trim(edt_CardTyperemark.Text );
    end;
    if CardTypeAppendOrEdit then
    begin
      ClearMemberCardTypeInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_CardTypeid.Text :=GetNo('DBMeiRong','MemberCardType','','','type_id',temp,2);
      if sg_CardType.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeMemberCardTypeEnabled(false);
      ClearMemberCardTypeInfo();
      sg_CardType.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end;

end;

procedure Tfrm_dictionary.sbtn_backClick(Sender: TObject);
var
  i:integer;
begin
  {*********************员工类别向后移动*****************************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
     if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveEmpTypeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearEmpTypeInfo(); sg_EmpType.Enabled:=true;MakeEmpTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_EmpType.Row > sg_EmpType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_EmpType.Row :=sg_EmpType.Row +1;
  end
  {*********************客户类别向后移动*****************************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveCusTypeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearCusTypeInfo(); sg_CusType.Enabled:=true;MakeCusTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_CusType.Row > sg_CusType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_CusType.Row :=sg_CusType.Row +1;
  end
  {*********************服务项目类别向后移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveServiceItemTypeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearServiceItemTypeInfo(); sg_SerType.Enabled:=true;MakeServiceItemTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_SerType.Row > sg_SerType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_SerType.Row :=sg_SerType.Row +1;
  end
  {*********************服务项目向后移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveServiceItemInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearServiceItemInfo(); sg_ItemType.Enabled:=true;MakeServiceItemEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_ItemType.Row > sg_ItemType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_ItemType.Row :=sg_ItemType.Row +1;
  end
  {*********************服务套餐类型向后移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveServiceMealTypeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearServiceMealTypeInfo(); sg_MealType.Enabled:=true;MakeServiceMealTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_MealType.Row > sg_MealType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_MealType.Row :=sg_MealType.Row +1;
  end
  {*********************会员卡类型向后移动*****************************}
  else if pagecontrol1.ActivePage = sht_MemberCardtype then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveMemberCardTypeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearMemberCardTypeInfo(); sg_CardType.Enabled:=true;MakeMemberCardTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_CardType.Row > sg_CardType.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_CardType.Row :=sg_CardType.Row +1;
  end;
  
end;

procedure Tfrm_dictionary.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  {*************************员工类别向前移动*****************************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveEmpTypeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearEmpTypeInfo();sg_EmpType.Enabled:=true;MakeEmpTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_EmpType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_EmpType.Row :=sg_EmpType.Row -1;
  end
  {*************************客户类别向前移动*****************************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveCusTypeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearCusTypeInfo();sg_CusType.Enabled:=true;MakeCusTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_CusType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_CusType.Row :=sg_CusType.Row -1;
  end
  {*************************服务项目类别向前移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemTypeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearServiceItemTypeInfo();sg_SerType.Enabled:=true;MakeServiceItemTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_SerType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_SerType.Row :=sg_SerType.Row -1;
  end
  {*************************服务项目向前移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearServiceItemInfo();sg_ItemType.Enabled:=true;MakeServiceItemEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_ItemType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_ItemType.Row :=sg_ItemType.Row -1;
  end
  {*********************服务套餐类型向前移动*****************************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceMealTypeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearServiceMealTypeInfo();sg_MealType.Enabled:=true;MakeServiceMealTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_MealType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_MealType.Row :=sg_MealType.Row -1;
  end
  {*********************会员卡类型向前移动*****************************}
  else if pagecontrol1.ActivePage = sht_MemberCardType then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveMemberCardTypeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearMemberCardTypeInfo();sg_ItemType.Enabled:=true;MakeMemberCardTypeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_CardType.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_CardType.Row :=sg_CardType.Row -1;
  end;
end;

procedure Tfrm_dictionary.sbtn_deleteClick(Sender: TObject);
var
   i,j:integer;
   temp_type_id,temp_item_id:string;
begin
  {******************进行员工类别的删除*************************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
    if sg_EmpType.Cells[0,sg_EmpType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该员工类别信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from EmployeeType where type_id='+#39+sg_EmpType.Cells[0,sg_EmpType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_EmpType,sg_EmpType.Row);
    if sg_EmpType.Row = sg_EmpType.RowCount - 1 then
    begin
      if sg_EmpType.RowCount > 2 then
        sg_EmpType.Row := sg_EmpType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_EmpType.Row = 1 then sbtn_front.Enabled := false;
    if sg_EmpType.Row = sg_EmpType.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行客户类别的删除*************************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin
    if sg_CusType.Cells[0,sg_CusType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该员工类别信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from CustomerType where type_id='+#39+sg_CusType.Cells[0,sg_CusType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_CusType,sg_CusType.Row);
    if sg_CusType.Row = sg_CusType.RowCount - 1 then
    begin
      if sg_CusType.RowCount > 2 then
        sg_CusType.Row := sg_CusType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_CusType.Row = 1 then sbtn_front.Enabled := false;
    if sg_CusType.Row = sg_CusType.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行服务项目类别的删除*************************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if sg_SerType.Cells[0,sg_SerType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该服务项目类别信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;

    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'select service_type_id from ServiceItem where service_type_id='+#39+sg_SerType.Cells[0,sg_SerType.Row]+#39;
      Open;
      if not eof then
      begin
        MessageBox(self.handle,'无法删除该服务项目类型，请先删除属于该类型的服务项目再重试!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
    end;

    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceItemType where type_id='+#39+sg_SerType.Cells[0,sg_SerType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_SerType,sg_SerType.Row);
    if sg_SerType.Row = sg_SerType.RowCount - 1 then
    begin
      if sg_SerType.RowCount > 2 then
        sg_SerType.Row := sg_SerType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_SerType.Row = 1 then sbtn_front.Enabled := false;
    if sg_SerType.Row = sg_SerType.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行服务项目的删除*************************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if sg_ItemType.Cells[0,sg_ItemType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该服务项目信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceItem where item_id='+#39+sg_ItemType.Cells[0,sg_ItemType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_ItemType,sg_ItemType.Row);
    if sg_ItemType.Row = sg_ItemType.RowCount - 1 then
    begin
      if sg_ItemType.RowCount > 2 then
        sg_ItemType.Row := sg_ItemType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_ItemType.Row = 1 then sbtn_front.Enabled := false;
    if sg_ItemType.Row = sg_ItemType.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行服务套餐类型的删除*************************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if sg_MealType.Cells[0,sg_MealType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该服务套餐类别信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;

    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'select type_id from ServiceMeal where type_id='+#39+sg_MealType.Cells[0,sg_MealType.Row]+#39;
      Open;
      if not eof then
      begin
        MessageBox(self.handle,'无法删除该服务套餐类型，请先删除属于该类型的服务套餐再重试!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
    end;
    
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from ServiceMealType where type_id='+#39+sg_MealType.Cells[0,sg_MealType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_MealType,sg_MealType.Row);
    if sg_MealType.Row = sg_MealType.RowCount - 1 then
    begin
      if sg_MealType.RowCount > 2 then
        sg_MealType.Row := sg_MealType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_MealType.Row = 1 then sbtn_front.Enabled := false;
    if sg_MealType.Row = sg_MealType.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行服务项目的删除*************************}
  else if pagecontrol1.ActivePage = sht_ServiceMeal then
  begin
   //提示删除的具体内容
   i:=MessageBox(handle,'删除服务套餐选择[Y]，删除服务套餐选项选择[N]!','提示',mb_yesnocancel+mb_iconinformation);
   //删除服务套餐
   if i=6 then
   begin
      if MessageBox(handle,'确认删除所选服务套餐吗？','询问',mb_yesno+mb_iconquestion)=IDYes then
      begin
         temp_type_id:=sg_MealType2.Cells[0,sg_MealType2.Row];

         if temp_type_id='' then
         begin
           MessageBox(handle,'请先选择一个服务套餐再重试!','提示',mb_ok+mb_iconinformation);
           exit;
         end;

         try
           dmod.ADOConn.BeginTrans ;
           with dmod.ADOQuery1 do
           begin
             close;
             SQL.Text :='delete from ServiceMeal where type_id=:typeid';
             Parameters.ParamValues['typeid'] :=temp_type_id;
             ExecSQL;

             close;
             SQL.Text :='update ServiceMealType set total_sum=0.0,promotion_sum=0.0 where type_id=:typeid';
             Parameters.ParamValues['typeid'] :=temp_type_id;
             ExecSQL;
           end;
         finally
           try
             dmod.ADOConn.CommitTrans ;
             SearchServiceMealItemInfo(sg_MealType2.Cells[0,sg_MealType2.Row]);
           except
             dmod.ADOConn.RollbackTrans ;
             MessageBox(handle,'操作失败，请重试!','提示',mb_ok+mb_iconinformation);
           end;
         end;
      end;
   end;
    //删除服务套餐选项
   if i=7 then begin
      temp_type_id:=sg_Mealtype2.Cells[0,sg_Mealtype2.row];
      temp_item_id:=sg_ItemType2.Cells[0,sg_ItemType2.Row];
      if temp_item_id='' then
      begin
        MessageBox(handle,'没有选重要删除的服务项目,请重试!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
      with dmod.ADOQuery1 do
      begin
        close;
        SQL.Text :='delete from ServiceMeal where type_id=:typeid and item_id=:itemid';
        Parameters.ParamValues['typeid']:=temp_type_id;
        Parameters.ParamValues['itemid']:=temp_item_id;
        ExecSQL;
      end;
      StringGridDelete(sg_ItemType2,sg_ItemType2.Row);
      edt_totalsum.Text :=FloatToStr(CalculateTotalSum);
      edt_promotionsum.Text :='';
      sbtn_save.Enabled :=true;
    end;
  end
  {******************进行会员卡类型的删除*************************}
  else if pagecontrol1.ActivePage = sht_MemberCardType then
  begin
    if sg_CardType.Cells[0,sg_CardType.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该服务项目信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from MemberCardType where type_id='+#39+sg_CardType.Cells[0,sg_CardType.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_CardType,sg_CardType.Row);
    if sg_CardType.Row = sg_CardType.RowCount - 1 then
    begin
      if sg_CardType.RowCount > 2 then
        sg_CardType.Row := sg_CardType.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_CardType.Row = 1 then sbtn_front.Enabled := false;
    if sg_CardType.Row = sg_CardType.RowCount - 2 then sbtn_back.Enabled := false;
  end;
end;

procedure Tfrm_dictionary.sbtn_editClick(Sender: TObject);
var
  i:integer;
begin
  {**************************修改员工类别************************}
  if pagecontrol1.ActivePage = sht_EmpType then
  begin
    if EmpTypeAppendOrEdit and edt_EmpTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveEmpTypeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_EmpType.Cells[0,sg_EmpType.Row]='' then exit;

    EmpTypeAppendOrEdit:=false;

    edt_EmpTypeid.Text :=sg_EmpType.Cells[0,sg_EmpType.Row];
    edt_EmpTypename.Text := sg_EmpType.Cells[1,sg_EmpType.Row];
    edt_EmpTyperemark.Text := sg_EmpType.Cells[2,sg_EmpType.Row];

    MakeEmpTypeEnabled(true);
    edt_Emptypeid.Enabled :=false;
    sg_EmpType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改客户类别************************}
  else if pagecontrol1.ActivePage = sht_CusType then
  begin
    if CusTypeAppendOrEdit and edt_CusTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveCusTypeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_CusType.Cells[0,sg_CusType.Row]='' then exit;

    CusTypeAppendOrEdit:=false;

    edt_CusTypeid.Text :=sg_CusType.Cells[0,sg_CusType.Row];
    edt_CusTypename.Text := sg_CusType.Cells[1,sg_CusType.Row];
    edt_CusTyperemark.Text := sg_CusType.Cells[2,sg_CusType.Row];

    MakeCusTypeEnabled(true);
    edt_Custypeid.Enabled :=false;
    sg_CusType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改服务项目类别************************}
  else if pagecontrol1.ActivePage = sht_ServiceItemType then
  begin
    if SerTypeAppendOrEdit and edt_SerTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemTypeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_SerType.Cells[0,sg_SerType.Row]='' then exit;

    SerTypeAppendOrEdit:=false;

    edt_SerTypeid.Text :=sg_SerType.Cells[0,sg_SerType.Row];
    edt_SerTypename.Text := sg_SerType.Cells[1,sg_SerType.Row];
    edt_SerTyperemark.Text := sg_SerType.Cells[2,sg_SerType.Row];

    MakeServiceItemTypeEnabled(true);
    edt_Sertypeid.Enabled :=false;
    sg_SerType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改服务项目************************}
  else if pagecontrol1.ActivePage = sht_ServiceItem then
  begin
    if ItemTypeAppendOrEdit and edt_ItemTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceItemInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_ItemType.Cells[0,sg_ItemType.Row]='' then exit;

    ItemTypeAppendOrEdit:=false;

    edt_ItemTypeid.Text :=sg_ItemType.Cells[0,sg_ItemType.Row];
    edt_ItemTypename.Text := sg_ItemType.Cells[1,sg_ItemType.Row];
    cbb_SerType.Text  := sg_ItemType.Cells[2,sg_ItemType.row];
    edt_ItemTypePrice.Text := sg_Itemtype.Cells[3,sg_ItemType.Row];
    edt_ItemTyperemark.Text := sg_ItemType.Cells[4,sg_ItemType.Row];

    MakeServiceItemEnabled(true);
    edt_Itemtypeid.Enabled :=false;
    sg_ItemType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改服务套餐类别************************}
  else if pagecontrol1.ActivePage = sht_ServiceMealType then
  begin
    if MealTypeAppendOrEdit and edt_MealTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveServiceMealTypeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_MealType.Cells[0,sg_MealType.Row]='' then exit;

    MealTypeAppendOrEdit:=false;

    edt_MealTypeid.Text :=sg_MealType.Cells[0,sg_MealType.Row];
    edt_MealTypename.Text := sg_MealType.Cells[1,sg_MealType.Row];
    edt_MealTyperemark.Text := sg_MealType.Cells[2,sg_MealType.Row];

    MakeServiceMealTypeEnabled(true);
    edt_Mealtypeid.Enabled :=false;
    sg_MealType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改会员卡类别************************}
  else if pagecontrol1.ActivePage = sht_MemberCardType then
  begin
    if CardTypeAppendOrEdit and edt_CardTypeid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveMemberCardTypeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_CardType.Cells[0,sg_CardType.Row]='' then exit;

    CardTypeAppendOrEdit:=false;

    edt_CardTypeid.Text :=sg_CardType.Cells[0,sg_cardType.Row];
    edt_CardTypename.Text := sg_CardType.Cells[1,sg_CardType.Row];
    edt_MinCost.Text  := sg_CardType.Cells[2,sg_CardType.row];
    edt_discount.Text := sg_cardtype.Cells[3,sg_CardType.Row];
    edt_CardTyperemark.Text := sg_CardType.Cells[4,sg_cardType.Row];

    MakeMemberCardTypeEnabled(true);
    edt_cardtypeid.Enabled :=false;
    sg_cardType.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end;

end;

procedure Tfrm_dictionary.sg_EmpTypeDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_dictionary.sg_EmpTypeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_EmpType.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_EmpType.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

procedure Tfrm_dictionary.sg_CusTypeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_CusType.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_CusType.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

procedure Tfrm_dictionary.sg_SerTypeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_SerType.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_SerType.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

procedure Tfrm_dictionary.sg_ItemTypeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_ItemType.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_ItemType.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
  if sbtn_save.Enabled then
  begin
     MessageBox(handle,'请先保存当前操作的数据，再重试!','提示',mb_ok+mb_iconinformation);
     CanSelect:=false;
  end;
end;

procedure Tfrm_dictionary.sg_SerTypeDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_dictionary.sg_CusTypeDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_dictionary.cbb_SerTypeEnter(Sender: TObject);
begin
  cbb_Sertype.Clear ;
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select type_id,type_name from ServiceItemType';
    Open;
    while not eof do
    begin
      cbb_sertype.Items.Add(FieldByName('type_id').AsString+'-'+FieldByName('type_name').AsString);
      next; 
    end;
  end;
end;

procedure Tfrm_dictionary.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  i:integer;
  temp:TComponent;
begin
  sbtn_save.Enabled :=false;
  //showmessage(pagecontrol1.ActivePage.Name);
  //showmessage(IntToStr(pagecontrol1.ActivePage.ComponentCount)); 
  for i:=0 to pagecontrol1.ActivePage.ComponentCount-1 do
  begin
     Temp := PageControl1.ActivePage.Components[i];
     if(Temp is TEdit) then
       (temp as TEdit).Text :='';
     if(Temp is TMemo) then
       (temp as TMemo).Text :='';
     if(Temp is TComboBox) then
       (Temp as TComboBox).Text :='';
  end;
end;

procedure Tfrm_dictionary.sg_CardTypeDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_dictionary.sg_ItemTypeDblClick(Sender: TObject);
begin
  sbtn_editClick(nil);
end;

procedure Tfrm_dictionary.sg_MealTypeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_MealType.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_MealType.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

procedure Tfrm_dictionary.cbb_MealTypeEnter(Sender: TObject);
begin
  SearchServiceItem2Info();
end;

procedure Tfrm_dictionary.sbtn_AddClick(Sender: TObject);
var
   i,j:integer;
   temp_str,Temp_str2:string;
begin
   temp_str:=trim(cbb_MealType.Text) ;
   if temp_str='' then MessageBox(handle,'请先选择一个服务项目再添加!','提示',mb_ok+mb_iconinformation);
   StringGridInsert(sg_ItemType2);
   for i:=1 to 3 do
   begin
    temp_str2:=StringGetChar(temp_str,'-');
    if i=1 then
    begin//判断该选项是否已经存在过
      for j:=1 to sg_ItemType2.RowCount-1 do
      begin
        if sg_ItemType2.Cells[0,j]=temp_str2 then
        begin
           MessageBox(handle,'该服务项目已经添加!','提示',mb_ok+mb_iconinformation);
           StringGridDelete(sg_ItemType2,1);
           exit;
        end;
      end;
    end;
    sg_ItemType2.Cells[i-1,1]:=temp_Str2;
   end;

   edt_totalsum.Text :=FloatToStr(CalculateTotalSum());
   cbb_MealType.Text :='';
   sbtn_save.Enabled :=true;

end;

procedure Tfrm_dictionary.PageControl1Change(Sender: TObject);
begin
  case pagecontrol1.ActivePageIndex of
  5: panel2.Visible := False ;
  3:
     begin
     panel2.Left := 413 ;
     panel2.Visible := True ;
     end ;
  else
    begin
    panel2.Left := 404 ;
    panel2.Visible := true ;
    end;
  end ;
  if pagecontrol1.ActivePage = sht_ServiceMeal then
  begin
    sbtn_append.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  else begin
    sbtn_append.Enabled :=true;
    sbtn_edit.Enabled :=true;
  end;
end;

procedure Tfrm_dictionary.sg_MealType2Click(Sender: TObject);
begin
  if sg_MealType2.Cells[0,sg_MealType2.Row]<>'' then
  SearchServiceMealItemInfo(sg_MealType2.Cells[0,sg_MealType2.Row]);
end;

procedure Tfrm_dictionary.FormShow(Sender: TObject);
begin
  pagecontrol1.ActivePage := sht_EmpType;
end;

procedure Tfrm_dictionary.edt_ItemTypePriceExit(Sender: TObject);
begin
  try
    StrToFloat(trim(edt_ItemTypePrice.Text));
  except
    MessageBox(handle,'请输入正确的价格!','提示',mb_ok+mb_iconinformation);
    edt_ItemTypePrice.SetFocus ;
  end;
end;

procedure Tfrm_dictionary.edt_MinCostExit(Sender: TObject);
begin
  try
    StrToFloat(trim(edt_MinCost.Text));
  except
    MessageBox(handle,'请输入正确的价格!','提示',mb_ok+mb_iconinformation);
    edt_MinCost.SetFocus ;
  end;
end;

procedure Tfrm_dictionary.edt_DiscountExit(Sender: TObject);
begin
  try
    StrToFloat(trim(edt_Discount.Text));
  except
    MessageBox(handle,'请输入正确的价格!','提示',mb_ok+mb_iconinformation);
    edt_Discount.SetFocus ;
  end;
end;

end.
