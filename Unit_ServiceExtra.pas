unit Unit_ServiceExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Grids, Menus;

type
  Tfrm_serviceitemextra = class(TForm)
    PageControl1: TPageControl;
    sht_same: TTabSheet;
    sht_specific: TTabSheet;
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_close: TSpeedButton;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    sg_same: TStringGrid;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    edt_Tcnumber1: TEdit;
    sbtn_sure1: TSpeedButton;
    sbtn_save: TSpeedButton;
    Panel4: TPanel;
    sg_specific: TStringGrid;
    Panel5: TPanel;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    edt_Tcnumber2: TEdit;
    sbtn_sure2: TSpeedButton;
    sbtn_Reconfig: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sg_Employee: TStringGrid;
    Label13: TLabel;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_sameSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sbtn_sure1Click(Sender: TObject);
    procedure sg_sameClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_sure2Click(Sender: TObject);
    procedure sg_EmployeeClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtn_ReconfigClick(Sender: TObject);
    procedure sg_specificSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_EmployeeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    isSameConfig,isConfig:boolean;

    procedure InitialServiceExtra;
    procedure SearchSpecificServiceExtra(temp:string);
    procedure SearchEmployeeInfo;
    procedure SaveSameServiceExtra;
    procedure SaveSpecificServiceExtra(temp:string);
  public
    { Public declarations }
    procedure ServiceExtra_ref;
  end;

var
  frm_serviceitemextra: Tfrm_serviceitemextra;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
  
{$R *.dfm}
{***************************************************}
procedure Tfrm_serviceitemextra.ServiceExtra_ref ;
begin

  pagecontrol1.ActivePage := sht_same;
  
  with sg_Same do
  begin
    cells[0,0]:='服务编号';
    cells[1,0]:='服务名称';
    cells[2,0]:='服务价格';
    cells[3,0]:='提成方法';
    cells[4,0]:='提成数目';
  end;

  with sg_specific do
  begin
    cells[0,0]:='服务编号';
    cells[1,0]:='服务名称';
    cells[2,0]:='服务价格';
    cells[3,0]:='提成方法';
    cells[4,0]:='提成数目';
  end;

  with sg_Employee do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工姓名';
  end;

  InitialServiceExtra;
  SearchEmployeeInfo;
end;

procedure Tfrm_serviceitemextra.SearchEmployeeInfo ;
var
  i:integer;
begin
  with dmod.qrydata do
  begin
    Close;
    SQL.Text :='select emp_no,emp_name from employee order by emp_no';
    Open;
    i:=1;
    while not eof do
    begin
      sg_Employee.Cells[0,i]:=FieldByName('emp_no').AsString ;
      sg_Employee.Cells[1,i]:=FieldByName('emp_name').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Employee.RowCount :=i+1;
end;

procedure Tfrm_serviceitemextra.InitialServiceExtra ;
var
  i:integer;
begin
  with dmod.qrydata do
  begin
    Close;
    SQL.Text :='select count(*) as count from serviceextra';
    Open;
    if FieldByName('count').AsInteger =0 then //如果没有设置服务提成
    begin
      Close;
      SQL.Text :='select item_id,item_name,item_price from serviceitem order by item_id';
      Open;
      i:=1;
      while not eof do
      begin
        sg_same.Cells[0,i]:=FieldByName('item_id').AsString ;
        sg_same.Cells[1,i]:=FieldByName('item_name').AsString ;
        sg_same.Cells[2,i]:=FloatToStr(FieldByName('item_price').AsFloat) ;

        inc(i);
        next;
      end;
      StatusBar1.Panels[0].Text :='友好提示：你还没有进行服务提成设置';
      sbtn_reconfig.Enabled := false;
      isConfig:=false;
    end else if FieldByName('count').AsInteger >0 then  //如果已经设置服务提成
    begin
      Close;
      SQL.Text :='select distinct conf_type from serviceextra';
      Open;
      if FieldByName('conf_type').AsString ='0' then  //如果进行统一设置
      begin
        pagecontrol1.ActivePage := sht_same;
        Close;
        SQL.Text :='select e.item_id,item_name,item_price,tc_type,tc_value from serviceitem i,serviceextra e '+
                   ' where i.item_id=e.item_id';
        Open;
        i:=1;
        while not eof do
        begin
          sg_same.Cells[0,i]:=FieldByName('item_id').AsString ;
          sg_same.Cells[1,i]:=FieldByName('item_name').AsString ;
          sg_same.Cells[2,i]:=FloatToStr(FieldByName('item_price').AsFloat) ;
          if FieldByName('tc_type').AsString='0' then
            sg_same.Cells[3,i]:='固定提成'
          else
            sg_same.Cells[3,i]:='按百分比' ;
          sg_same.Cells[4,i]:=FloatToStr(FieldByName('tc_value').AsFloat) ;

          inc(i);
          next;
        end;
        StatusBar1.Panels[0].Text :='友好提示：服务提成按统一方法设置';
        isSameConfig:=true;
      end else if FieldByName('conf_type').AsString ='1' then   //如果进行分别设置
      begin
        pagecontrol1.ActivePage := sht_specific;
        StatusBar1.Panels[0].Text :='友好提示：服务提成按分别方法设置';
        isSameConfig:=false;
      end;
    isConfig:=true;
    sbtn_reconfig.Enabled := true;
    end;

  end;
  if i<>1 then sg_same.RowCount :=i+1;
end;

procedure Tfrm_serviceitemextra.SearchSpecificServiceExtra(temp:string) ;
var
  i:integer;
begin
  StringGridClear(sg_specific);
  with dmod.qrydata do
  begin
    Close;
    SQL.Text :='select e.item_id,item_name,item_price,tc_type,tc_value from serviceextra e,serviceitem i '+
               ' where e.item_id=i.item_id and emp_no='+#39+temp+#39;
    Open;
    i:=1;
    if not eof then
    begin
      while not eof do
      begin
        sg_specific.Cells[0,i]:=FieldByName('item_id').AsString ;
        sg_specific.Cells[1,i]:=FieldByName('item_name').AsString ;
        sg_specific.Cells[2,i]:=FieldByName('item_price').AsString ;
        if FieldByName('tc_type').AsString='0' then
          sg_specific.Cells[3,i]:='固定提成'
        else if FieldByName('tc_type').AsString='1' then
          sg_specific.Cells[3,i]:='按百分比';
        sg_specific.Cells[4,i]:=FloatToStr(FieldByName('tc_value').AsFloat) ;
        inc(i);
        next;
      end;
    end else begin
      Close;
      SQL.Text :='select item_id,item_name,item_price from serviceitem order by item_id';
      Open;
      i:=1;
      while not eof do
      begin
        sg_specific.cells[0,i]:=FieldByName('item_id').AsString ;
        sg_specific.cells[1,i]:=FieldByName('item_name').AsString ;
        sg_specific.cells[2,i]:=FloatToStr(FieldByName('item_price').AsFloat) ;
        inc(i);
        next;
      end;
    end;
  end;
  if i<>1 then sg_specific.RowCount :=i+1;
end;

procedure Tfrm_serviceitemextra.SaveSameServiceExtra ;
var
  i:integer;
begin
    if pagecontrol1.ActivePage <> sht_same then
    begin
      MessageBox(handle,'你已经对服务提成采用统一设置，分别设置保存不予处理!','提示',mb_ok+mb_iconinformation);
      exit;
    end;
    for i:=1 to sg_Same.RowCount-2 do
    begin
      if (sg_Same.cells[3,i]='') or (sg_Same.cells[4,i]='') then
      begin
        MessageBox(handle,'服务提成设置不完全，请重试!','提示',mb_ok+mb_iconinformation);
        exit;
      end;
    end;

    try
      dmod.Database.StartTransaction ;
      with dmod.qrydata do
      begin
        Close;
        SQL.Text :='delete from serviceextra';
        ExecSQL;

        for i:=1 to sg_same.RowCount-2 do
        begin
          Close;
          SQL.Text :='insert into serviceextra(item_id,emp_no,tc_type,tc_value,conf_type) '+
                   ' values(:itemid,:empno,:tctype,:tcvalue,:conftype)';
          ParamByName('itemid').AsString :=sg_same.Cells[0,i];
          ParamByName('empno').AsString :='';
          if sg_same.Cells[3,i]='固定提成' then
            ParamByName('tctype').AsString :='0'
          else if sg_same.cells[3,i]='按百分比' then
            ParamByName('tctype').AsString :='1';
          ParamByName('tcvalue').AsFloat :=StrToFloat(sg_same.Cells[4,i]);
          ParamByName('conftype').AsString :='0';
          ExecSQL;
        end;

      end;
    finally
      try
        dmod.Database.Commit ;
        MessageBox(handle,'服务提成按统一设置保存完成!','提示',mb_ok+mb_iconinformation);
      except
        dmod.Database.Rollback ;
        MessageBox(handle,'服务提成按统一设置保存失败，请重试!','提示',mb_ok+mb_iconinformation);
      end;
    end;
end;

procedure Tfrm_serviceitemextra.SaveSpecificServiceExtra(temp:string) ;
var
  i:integer;
begin
  if pagecontrol1.ActivePage <> sht_specific then
  begin
    MessageBox(handle,'你已经对服务提成采用分别设置，保存统一设置不予处理!','提示',mb_ok+mb_iconinformation);
    exit;
  end;
  for i:=1 to sg_specific.RowCount-2 do
  begin
    if (sg_specific.cells[3,i]='') or (sg_specific.cells[4,i]='') then
    begin
      MessageBox(handle,'服务提成设置不完全，请重试!','提示',mb_ok+mb_iconinformation);
      exit;
    end;
  end;
  try
    dmod.Database.StartTransaction ;
    with dmod.qrydata do
    begin
      Close;
      SQL.Text :='select count(*) as count from serviceextra where emp_no='+#39+temp+#39;
      Open;
      if FieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from serviceextra where emp_no='+#39+temp+#39;
        ExecSQL;
      end;

      for i:=1 to sg_specific.RowCount-2 do
      begin
        Close;
        SQL.Text :='insert into serviceextra(item_id,emp_no,tc_type,tc_value,conf_type) '+
                 'values(:itemid,:empno,:tctype,:tcvalue,:conftype)';
        ParamByName('itemid').AsString :=sg_specific.Cells[0,i];
        ParamByName('empno').AsString  :=temp;
        if sg_specific.Cells[3,i]='固定提成' then
          ParamByName('tctype').AsString :='0'
        else  if sg_specific.Cells[3,i]='按百分比' then
          ParamByName('tctype').AsString :='1';
        ParamByName('tcvalue').AsFloat :=StrToFloat(sg_specific.Cells[4,i]);
        ParamByName('conftype').AsString :='1';
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.Database.Commit ;
      isConfig:=true;
      isSameConfig:=false;
      StatusBar1.panels[0].text:='友好提示：服务提成按分别方法设置';
    except
      dmod.Database.Rollback ;
    end;
  end;
end;
{***************************************************}

procedure Tfrm_serviceitemextra.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_serviceitemextra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_serviceextra:=nil;
end;

procedure Tfrm_serviceitemextra.sg_sameSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Same.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Same.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_serviceitemextra.sbtn_backClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_same then
  begin
    if sg_Same.Row > sg_Same.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_Same.Row := sg_Same.Row+1;
  end else if pagecontrol1.ActivePage = sht_specific then
  begin
    if sg_Specific.Row > sg_Specific.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_Specific.Row := sg_Specific.Row+1;
  end;
end;

procedure Tfrm_serviceitemextra.sbtn_frontClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_same then
  begin
    if sg_Same.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_Same.Row := sg_Same.Row-1;
  end else if pagecontrol1.ActivePage = sht_specific then
  begin
    if sg_Specific.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_specific.Row := sg_specific.Row-1;
  end;
end;

procedure Tfrm_serviceitemextra.sbtn_sure1Click(Sender: TObject);
var
  temp:double;
begin
  if sg_Same.Cells[0,sg_Same.Row]='' then exit;

  try
    temp:=StrToFloat(edt_tcnumber1.Text);
  except
    MessageBox(handle,'请正确输入提成数目!','提示',mb_ok+mb_iconinformation);
    edt_tcnumber1.SetFocus ;
    exit;
  end;
  sg_Same.Cells[3,sg_Same.Row]:=radiogroup1.Items[radiogroup1.itemindex];
  sg_Same.Cells[4,sg_Same.Row]:=FloatToStr(temp);

  sbtn_backClick(nil);
  edt_tcnumber1.Text :='';
  sbtn_save.enabled:=true;
end;

procedure Tfrm_serviceitemextra.sg_sameClick(Sender: TObject);
begin
  if sg_Same.Cells[0,sg_Same.Row]='' then
  begin
    radiogroup1.ItemIndex :=0;
    edt_tcnumber1.Text:='';
    exit;
 end;

 if sg_Same.Cells[3,sg_Same.Row]='固定提成' then
    radiogroup1.ItemIndex :=0
 else if sg_Same.Cells[3,sg_Same.Row]='按百分比' then
    radiogroup1.ItemIndex :=1;

  edt_tcnumber1.Text := sg_Same.Cells[4,sg_Same.Row];
end;

procedure Tfrm_serviceitemextra.sbtn_saveClick(Sender: TObject);
begin
  if not isConfig then             //如果还没有进行服务设置
  begin
    if pagecontrol1.ActivePage = sht_same then
    begin
      SaveSameServiceExtra;
      isConfig:=true;
      isSameConfig:=true;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;

    if pagecontrol1.activepage = sht_specific then
    begin
      SaveSpecificServiceExtra(sg_Employee.cells[0,sg_Employee.row]);
      isConfig:=true;
      isSameConfig:=false;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;
  end;

  if isConfig and isSameConfig then //如果已经设置而且按统一方法设置
  begin
    SaveSameServiceExtra;
    sbtn_reconfig.Enabled :=true;
    sbtn_save.enabled:=false;
    exit;
  end;

  if isConfig and (not isSameConfig) then
  begin
    SaveSpecificServiceExtra(sg_Employee.cells[0,sg_Employee.row]);
    sbtn_reconfig.Enabled :=true;
    sbtn_save.enabled:=false;
    exit;
  end;

end;

procedure Tfrm_serviceitemextra.sbtn_sure2Click(Sender: TObject);
var
  temp:double;
begin
  if sg_specific.Cells[0,sg_specific.Row]='' then exit;
  try
    temp:=StrToFloat(edt_tcnumber2.Text);
  except
    MessageBox(handle,'请正确输入提成数目!','提示',mb_ok+mb_iconinformation);
    edt_tcnumber2.SetFocus ;
    exit;
  end;
  sg_specific.Cells[3,sg_specific.Row]:=radiogroup2.Items[radiogroup2.itemindex];
  sg_specific.Cells[4,sg_specific.Row]:=FloatToStr(temp);
  sbtn_backClick(nil);
  edt_tcnumber2.Text :='';
  sbtn_save.enabled:=true;
end;

procedure Tfrm_serviceitemextra.sg_EmployeeClick(Sender: TObject);
var
  temp_str:string;
begin
  if not sbtn_save.Enabled then
  begin
    temp_str:=sg_Employee.Cells[0,sg_Employee.Row];
    SearchSpecificServiceExtra(temp_str);
    sg_specific.Row :=1;
  end;
end;

procedure Tfrm_serviceitemextra.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if not isConfig then AllowChange:=true;

  if pagecontrol1.ActivePage = sht_same then
  begin
    if isConfig and isSameConfig then
    begin
      MessageBox(handle,'服务提成采用统一方法设置，要重新设置请点击按钮!','提示',mb_ok+mb_iconinformation);
      AllowChange:=false;
    end else if isConfig and (not isSameConfig) then
    begin
      AllowChange:=true;
    end;
  end;

  if pagecontrol1.ActivePage = sht_specific then
  begin
    if isConfig and isSameConfig then
    begin
      AllowChange:=true;
    end else if isConfig and (not isSameConfig) then
    begin
      MessageBox(handle,'服务提成采用分别方法设置，要重新设置请点击按钮!','提示',mb_ok+mb_iconinformation);
      AllowChange:=false;
    end;
  end;
end;

procedure Tfrm_serviceitemextra.sbtn_ReconfigClick(Sender: TObject);
begin
  if MessageBox(handle,'重新设置将清除数据库中的数据，继续吗?','提示',mb_YESNO+mb_iconinformation)<>IDYES then exit;
  if pagecontrol1.ActivePage = sht_same then
    StringGridClear(sg_Same)
  else if pagecontrol1.ActivePage = sht_specific then
    StringGridClear(sg_specific);
  with dmod.qrydata do
  begin
    Close;
    SQL.Text :='delete from serviceextra';
    ExecSQL;
  end;
  isConfig:=false;
  sbtn_reconfig.Enabled :=false;
  InitialServiceExtra;
end;

procedure Tfrm_serviceitemextra.sg_specificSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Specific.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Specific.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_serviceitemextra.sg_EmployeeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if sbtn_save.enabled then
  begin
    MessageBox(handle,'请先保存部分的服务提成设置!','提示',mb_ok+mb_iconinformation);
    CanSelect:=false;
    exit;
  end;
end;

end.
