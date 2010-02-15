unit Unit_ServiceMealExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ComCtrls, Buttons;

type
  Tfrm_servicemealextra = class(TForm)
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_Reconfig: TSpeedButton;
    PageControl1: TPageControl;
    sht_same: TTabSheet;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel2: TPanel;
    sg_same: TStringGrid;
    Panel3: TPanel;
    Label2: TLabel;
    sbtn_sure1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    edt_Tcnumber1: TEdit;
    sht_specific: TTabSheet;
    Splitter2: TSplitter;
    Panel4: TPanel;
    sg_specific: TStringGrid;
    Panel5: TPanel;
    Label3: TLabel;
    sbtn_sure2: TSpeedButton;
    RadioGroup2: TRadioGroup;
    edt_Tcnumber2: TEdit;
    sg_Employee: TStringGrid;
    StatusBar1: TStatusBar;
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_sameSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_specificSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_EmployeeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_ReconfigClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_sure1Click(Sender: TObject);
    procedure sbtn_sure2Click(Sender: TObject);
    procedure sg_EmployeeClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
    isSameConfig,isConfig:boolean;
    
    procedure InitialServiceMealExtra;
    procedure SearchSpecificServiceMealExtra(temp:string);
    procedure SearchEmployeeInfo;
    procedure SaveSameServiceMealExtra;
    procedure SaveSpecificServiceMealExtra(temp:string);
  public
    { Public declarations }

    procedure ServiceMealExtra_ref;
  end;

var
  frm_servicemealextra: Tfrm_servicemealextra;

implementation

uses Unit_DataModule,unit_TotalPublic,PublicFunOrPro;

{$R *.dfm}

{****************************************************}
procedure Tfrm_servicemealextra.ServiceMealExtra_ref ;
begin
  pagecontrol1.ActivePage := sht_same;

  with sg_Same do
  begin
    cells[0,0]:='套餐编号';
    cells[1,0]:='套餐名称';
    cells[2,0]:='套餐价格';
    cells[3,0]:='提成方法';
    cells[4,0]:='提成数目';
  end;

  with sg_specific do
  begin
    cells[0,0]:='套餐编号';
    cells[1,0]:='套餐名称';
    cells[2,0]:='套餐价格';
    cells[3,0]:='提成方法';
    cells[4,0]:='提成数目';
  end;

  with sg_Employee do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工姓名';
  end;

  InitialServiceMealExtra;
  SearchEmployeeInfo;

  sbtn_sure1.Enabled := GetPower(SysUserId,'套餐提成','修改权');
  sbtn_sure2.Enabled := sbtn_sure1.Enabled ;
end;

procedure Tfrm_servicemealextra.SearchEmployeeInfo ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
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

procedure Tfrm_servicemealextra.InitialServiceMealExtra ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select count(*) as count from servicemealextra';
    Open;
    if FieldByName('count').AsInteger =0 then //如果没有设置服务提成
    begin
      Close;
      SQL.Text :='select type_id,type_name,promotion_sum from serviceMealType order by type_id';
      Open;
      i:=1;
      while not eof do
      begin
        sg_same.Cells[0,i]:=FieldByName('type_id').AsString ;
        sg_same.Cells[1,i]:=FieldByName('type_name').AsString ;
        sg_same.Cells[2,i]:=FloatToStr(FieldByName('promotion_sum').AsFloat) ;

        inc(i);
        next;
      end;
      StatusBar1.Panels[0].Text :='友好提示：你还没有进行服务提成设置';
      sbtn_reconfig.Enabled := false;
      isConfig:=false;
    end else if FieldByName('count').AsInteger >0 then  //如果已经设置服务提成
    begin
      Close;
      SQL.Text :='select distinct conf_type from serviceitemextra';
      Open;
      if FieldByName('conf_type').AsString ='0' then  //如果进行统一设置
      begin
        pagecontrol1.ActivePage := sht_same;
        Close;
        SQL.Text :='select e.type_id,type_name,promotion_sum,tc_type,tc_value from servicemealtype t,servicemealextra e '+
                   ' where t.type_id=e.type_id';
        Open;
        i:=1;
        while not eof do
        begin
          sg_same.Cells[0,i]:=FieldByName('type_id').AsString ;
          sg_same.Cells[1,i]:=FieldByName('type_name').AsString ;
          sg_same.Cells[2,i]:=FloatToStr(FieldByName('promotion_sum').AsFloat) ;
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

procedure Tfrm_servicemealextra.SearchSpecificServiceMealExtra(temp:string) ;
var
  i:integer;
begin
  StringGridClear(sg_specific);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select e.type_id,type_name,promotion_sum,tc_type,tc_value from servicemealextra e,servicemealtype t '+
               ' where e.type_id=t.type_id and emp_no='+#39+temp+#39;
    Open;
    i:=1;
    if not eof then
    begin
      while not eof do
      begin
        sg_specific.Cells[0,i]:=FieldByName('type_id').AsString ;
        sg_specific.Cells[1,i]:=FieldByName('type_name').AsString ;
        sg_specific.Cells[2,i]:=FieldByName('promotion').AsString ;
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
      SQL.Text :='select type_id,type_name,promotion_sum from servicemealtype order by type_id';
      Open;
      i:=1;
      while not eof do
      begin
        sg_specific.cells[0,i]:=FieldByName('type_id').AsString ;
        sg_specific.cells[1,i]:=FieldByName('type_name').AsString ;
        sg_specific.cells[2,i]:=FloatToStr(FieldByName('promotion_sum').AsFloat) ;
        inc(i);
        next;
      end;
    end;
  end;
  if i<>1 then sg_specific.RowCount :=i+1;
end;

procedure Tfrm_servicemealextra.SaveSameServiceMealExtra ;
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
      dmod.ADOConn.BeginTrans ;
      with dmod.ADOQuery1 do
      begin
        Close;
        SQL.Text :='delete from servicemealextra';
        ExecSQL;

        for i:=1 to sg_same.RowCount-2 do
        begin
          Close;
          SQL.Text :='insert into servicemealextra(type_id,emp_no,tc_type,tc_value,conf_type) '+
                   ' values(:typeid,:empno,:tctype,:tcvalue,:conftype)';
          Parameters.ParamValues['typeid'] :=sg_same.Cells[0,i];
          Parameters.ParamValues['empno'].AsString :='';
          if sg_same.Cells[3,i]='固定提成' then
            Parameters.ParamValues['tctype'] :='0'
          else if sg_same.cells[3,i]='按百分比' then
            Parameters.ParamValues['tctype'] :='1';
          Parameters.ParamValues['tcvalue'] :=StrToFloat(sg_same.Cells[4,i]);
          Parameters.ParamValues['conftype'] :='0';
          ExecSQL;
        end;

      end;
    finally
      try
        dmod.ADOConn.CommitTrans ;
        MessageBox(handle,'服务提成按统一设置保存完成!','提示',mb_ok+mb_iconinformation);
      except
        dmod.ADOConn.RollbackTrans ;
        MessageBox(handle,'服务提成按统一设置保存失败，请重试!','提示',mb_ok+mb_iconinformation);
      end;
    end;
end;

procedure Tfrm_servicemealextra.SaveSpecificServiceMealExtra(temp:string) ;
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
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select count(*) as count from servicemealxtra where emp_no='+#39+temp+#39;
      Open;
      if FieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from servicemealextra where emp_no='+#39+temp+#39;
        ExecSQL;
      end;

      for i:=1 to sg_specific.RowCount-2 do
      begin
        Close;
        SQL.Text :='insert into servicemealextra(type_id,emp_no,tc_type,tc_value,conf_type) '+
                 'values(:typeid,:empno,:tctype,:tcvalue,:conftype)';
        Parameters.ParamValues['typeid'] :=sg_specific.Cells[0,i];
        Parameters.ParamValues['empno']  :=temp;
        if sg_specific.Cells[3,i]='固定提成' then
          Parameters.ParamValues['tctype'] :='0'
        else  if sg_specific.Cells[3,i]='按百分比' then
          Parameters.ParamValues['tctype'] :='1';
        Parameters.ParamValues['tcvalue'] :=StrToFloat(sg_specific.Cells[4,i]);
        Parameters.ParamValues['conftype'] :='1';
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      isConfig:=true;
      isSameConfig:=false;
      StatusBar1.panels[0].text:='友好提示：服务提成按分别方法设置';
    except
      dmod.ADOConn.RollbackTrans ;
    end;
  end;
end;

{************************************************************}
procedure Tfrm_servicemealextra.sbtn_backClick(Sender: TObject);
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

procedure Tfrm_servicemealextra.sbtn_frontClick(Sender: TObject);
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

procedure Tfrm_servicemealextra.sg_sameSelectCell(Sender: TObject; ACol,
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

procedure Tfrm_servicemealextra.sg_specificSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
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

procedure Tfrm_servicemealextra.sg_EmployeeSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if sbtn_save.enabled then
  begin
    MessageBox(handle,'请先保存部分的服务提成设置!','提示',mb_ok+mb_iconinformation);
    CanSelect:=false;
    exit;
  end;
end;

procedure Tfrm_servicemealextra.sbtn_ReconfigClick(Sender: TObject);
begin
  if MessageBox(handle,'重新设置将清除数据库中的数据，继续吗?','提示',mb_YESNO+mb_iconinformation)<>IDYES then exit;
  if pagecontrol1.ActivePage = sht_same then
    StringGridClear(sg_Same)
  else if pagecontrol1.ActivePage = sht_specific then
    StringGridClear(sg_specific);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='delete from servicemealextra';
    ExecSQL;
  end;
  isConfig:=false;
  sbtn_reconfig.Enabled :=false;
  InitialServiceMealExtra;
end;

procedure Tfrm_servicemealextra.sbtn_saveClick(Sender: TObject);
begin
  if not isConfig then             //如果还没有进行服务设置
  begin
    if pagecontrol1.ActivePage = sht_same then
    begin
      SaveSameServiceMealExtra;
      isConfig:=true;
      isSameConfig:=true;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;

    if pagecontrol1.activepage = sht_specific then
    begin
      SaveSpecificServiceMealExtra(sg_Employee.cells[0,sg_Employee.row]);
      isConfig:=true;
      isSameConfig:=false;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;
  end;

  if isConfig and isSameConfig then //如果已经设置而且按统一方法设置
  begin
    SaveSameServiceMealExtra;
    sbtn_reconfig.Enabled :=true;
    sbtn_save.enabled:=false;
    exit;
  end;

  if isConfig and (not isSameConfig) then
  begin
    SaveSpecificServiceMealExtra(sg_Employee.cells[0,sg_Employee.row]);
    sbtn_reconfig.Enabled :=true;
    sbtn_save.enabled:=false;
    exit;
  end;
end;

procedure Tfrm_servicemealextra.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_servicemealextra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_servicemealextra:=nil;
end;

procedure Tfrm_servicemealextra.sbtn_sure1Click(Sender: TObject);
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

procedure Tfrm_servicemealextra.sbtn_sure2Click(Sender: TObject);
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

procedure Tfrm_servicemealextra.sg_EmployeeClick(Sender: TObject);
var
  temp_str:string;
begin
  if not sbtn_save.Enabled then
  begin
    temp_str:=sg_Employee.Cells[0,sg_Employee.Row];
    SearchSpecificServiceMealExtra(temp_str);
    sg_specific.Row :=1;
  end;
end;

procedure Tfrm_servicemealextra.PageControl1Changing(Sender: TObject;
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

end.
 