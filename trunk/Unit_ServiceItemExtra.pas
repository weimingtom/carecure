unit Unit_ServiceItemExtra;

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

    procedure InitialServiceItemExtra;
    procedure SearchSpecificServiceItemExtra(temp:string);
    procedure SearchEmployeeInfo;
    procedure SaveSameServiceItemExtra;
    procedure SaveSpecificServiceItemExtra(temp:string);
  public
    { Public declarations }
    procedure ServiceItemExtra_ref;
  end;

var
  frm_serviceitemextra: Tfrm_serviceitemextra;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
  
{$R *.dfm}
{***************************************************}
procedure Tfrm_serviceitemextra.ServiceItemExtra_ref ;
begin

  pagecontrol1.ActivePage := sht_same;
  
  with sg_Same do
  begin
    cells[0,0]:='������';
    cells[1,0]:='��������';
    cells[2,0]:='����۸�';
    cells[3,0]:='��ɷ���';
    cells[4,0]:='�����Ŀ';
  end;

  with sg_specific do
  begin
    cells[0,0]:='������';
    cells[1,0]:='��������';
    cells[2,0]:='����۸�';
    cells[3,0]:='��ɷ���';
    cells[4,0]:='�����Ŀ';
  end;

  with sg_Employee do
  begin
    cells[0,0]:='Ա�����';
    cells[1,0]:='Ա������';
  end;

  InitialServiceItemExtra;
  SearchEmployeeInfo;

  sbtn_sure1.Enabled := GetPower(SysUserId,'�������','�޸�Ȩ');
  sbtn_sure2.Enabled := sbtn_sure1.Enabled ;
end;

procedure Tfrm_serviceitemextra.SearchEmployeeInfo ;
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

procedure Tfrm_serviceitemextra.InitialServiceItemExtra ;
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select count(*) as count from serviceitemextra';
    Open;
    if FieldByName('count').AsInteger =0 then //���û�����÷������
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
      StatusBar1.Panels[0].Text :='�Ѻ���ʾ���㻹û�н��з����������';
      sbtn_reconfig.Enabled := false;
      isConfig:=false;
    end else if FieldByName('count').AsInteger >0 then  //����Ѿ����÷������
    begin
      Close;
      SQL.Text :='select distinct conf_type from serviceitemextra';
      Open;
      if FieldByName('conf_type').AsString ='0' then  //�������ͳһ����
      begin
        pagecontrol1.ActivePage := sht_same;
        Close;
        SQL.Text :='select e.item_id,item_name,item_price,tc_type,tc_value from serviceitem i,serviceitemextra e '+
                   ' where i.item_id=e.item_id';
        Open;
        i:=1;
        while not eof do
        begin
          sg_same.Cells[0,i]:=FieldByName('item_id').AsString ;
          sg_same.Cells[1,i]:=FieldByName('item_name').AsString ;
          sg_same.Cells[2,i]:=FloatToStr(FieldByName('item_price').AsFloat) ;
          if FieldByName('tc_type').AsString='0' then
            sg_same.Cells[3,i]:='�̶����'
          else
            sg_same.Cells[3,i]:='���ٷֱ�' ;
          sg_same.Cells[4,i]:=FloatToStr(FieldByName('tc_value').AsFloat) ;

          inc(i);
          next;
        end;
        StatusBar1.Panels[0].Text :='�Ѻ���ʾ��������ɰ�ͳһ��������';
        isSameConfig:=true;
      end else if FieldByName('conf_type').AsString ='1' then   //������зֱ�����
      begin
        pagecontrol1.ActivePage := sht_specific;
        StatusBar1.Panels[0].Text :='�Ѻ���ʾ��������ɰ��ֱ𷽷�����';
        isSameConfig:=false;
      end;
    isConfig:=true;
    sbtn_reconfig.Enabled := true;
    end;

  end;
  if i<>1 then sg_same.RowCount :=i+1;
end;

procedure Tfrm_serviceitemextra.SearchSpecificServiceItemExtra(temp:string) ;
var
  i:integer;
begin
  StringGridClear(sg_specific);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select e.item_id,item_name,item_price,tc_type,tc_value from serviceitemextra e,serviceitem i '+
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
          sg_specific.Cells[3,i]:='�̶����'
        else if FieldByName('tc_type').AsString='1' then
          sg_specific.Cells[3,i]:='���ٷֱ�';
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

procedure Tfrm_serviceitemextra.SaveSameServiceItemExtra ;
var
  i:integer;
begin
    if pagecontrol1.ActivePage <> sht_same then
    begin
      MessageBox(handle,'���Ѿ��Է�����ɲ���ͳһ���ã��ֱ����ñ��治�账��!','��ʾ',mb_ok+mb_iconinformation);
      exit;
    end;
    for i:=1 to sg_Same.RowCount-2 do
    begin
      if (sg_Same.cells[3,i]='') or (sg_Same.cells[4,i]='') then
      begin
        MessageBox(handle,'����������ò���ȫ��������!','��ʾ',mb_ok+mb_iconinformation);
        exit;
      end;
    end;

    try
      dmod.ADOConn.BeginTrans ;
      with dmod.ADOQuery1 do
      begin
        Close;
        SQL.Text :='delete from serviceitemextra';
        ExecSQL;

        for i:=1 to sg_same.RowCount-2 do
        begin
          Close;
          SQL.Text :='insert into serviceitemextra(item_id,emp_no,tc_type,tc_value,conf_type) '+
                   ' values(:itemid,:empno,:tctype,:tcvalue,:conftype)';
          Parameters.ParamValues['itemid'] :=sg_same.Cells[0,i];
          Parameters.ParamValues['empno'] :='';
          if sg_same.Cells[3,i]='�̶����' then
            Parameters.ParamValues['tctype'] :='0'
          else if sg_same.cells[3,i]='���ٷֱ�' then
            Parameters.ParamValues['tctype'] :='1';
          Parameters.ParamValues['tcvalue'] :=StrToFloat(sg_same.Cells[4,i]);
          Parameters.ParamValues['conftype'] :='0';
          ExecSQL;
        end;

      end;
    finally
      try
        dmod.ADOConn.CommitTrans ;
        MessageBox(handle,'������ɰ�ͳһ���ñ������!','��ʾ',mb_ok+mb_iconinformation);
      except
        dmod.ADOConn.RollbackTrans ;
        MessageBox(handle,'������ɰ�ͳһ���ñ���ʧ�ܣ�������!','��ʾ',mb_ok+mb_iconinformation);
      end;
    end;
end;

procedure Tfrm_serviceitemextra.SaveSpecificServiceItemExtra(temp:string) ;
var
  i:integer;
begin
  if pagecontrol1.ActivePage <> sht_specific then
  begin
    MessageBox(handle,'���Ѿ��Է�����ɲ��÷ֱ����ã�����ͳһ���ò��账��!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;
  for i:=1 to sg_specific.RowCount-2 do
  begin
    if (sg_specific.cells[3,i]='') or (sg_specific.cells[4,i]='') then
    begin
      MessageBox(handle,'����������ò���ȫ��������!','��ʾ',mb_ok+mb_iconinformation);
      exit;
    end;
  end;
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select count(*) as count from serviceitemextra where emp_no='+#39+temp+#39;
      Open;
      if FieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from serviceitemextra where emp_no='+#39+temp+#39;
        ExecSQL;
      end;

      for i:=1 to sg_specific.RowCount-2 do
      begin
        Close;
        SQL.Text :='insert into serviceitemextra(item_id,emp_no,tc_type,tc_value,conf_type) '+
                 'values(:itemid,:empno,:tctype,:tcvalue,:conftype)';
        Parameters.ParamValues['itemid'] :=sg_specific.Cells[0,i];
        Parameters.ParamValues['empno']  :=temp;
        if sg_specific.Cells[3,i]='�̶����' then
          Parameters.ParamValues['tctype'] :='0'
        else  if sg_specific.Cells[3,i]='���ٷֱ�' then
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
      StatusBar1.panels[0].text:='�Ѻ���ʾ��������ɰ��ֱ𷽷�����';
    except
      dmod.ADOConn.RollbackTrans ;
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
  frm_serviceitemextra:=nil;
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
    MessageBox(handle,'����ȷ���������Ŀ!','��ʾ',mb_ok+mb_iconinformation);
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

 if sg_Same.Cells[3,sg_Same.Row]='�̶����' then
    radiogroup1.ItemIndex :=0
 else if sg_Same.Cells[3,sg_Same.Row]='���ٷֱ�' then
    radiogroup1.ItemIndex :=1;

  edt_tcnumber1.Text := sg_Same.Cells[4,sg_Same.Row];
end;

procedure Tfrm_serviceitemextra.sbtn_saveClick(Sender: TObject);
begin
  if not isConfig then             //�����û�н��з�������
  begin
    if pagecontrol1.ActivePage = sht_same then
    begin
      SaveSameServiceItemExtra;
      isConfig:=true;
      isSameConfig:=true;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;

    if pagecontrol1.activepage = sht_specific then
    begin
      SaveSpecificServiceItemExtra(sg_Employee.cells[0,sg_Employee.row]);
      isConfig:=true;
      isSameConfig:=false;
      sbtn_reconfig.Enabled :=true;
      sbtn_save.enabled:=false;
      exit;
    end;
  end;

  if isConfig and isSameConfig then //����Ѿ����ö��Ұ�ͳһ��������
  begin
    SaveSameServiceItemExtra;
    sbtn_reconfig.Enabled :=true;
    sbtn_save.enabled:=false;
    exit;
  end;

  if isConfig and (not isSameConfig) then
  begin
    SaveSpecificServiceItemExtra(sg_Employee.cells[0,sg_Employee.row]);
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
    MessageBox(handle,'����ȷ���������Ŀ!','��ʾ',mb_ok+mb_iconinformation);
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
    SearchSpecificServiceItemExtra(temp_str);
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
      MessageBox(handle,'������ɲ���ͳһ�������ã�Ҫ��������������ť!','��ʾ',mb_ok+mb_iconinformation);
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
      MessageBox(handle,'������ɲ��÷ֱ𷽷����ã�Ҫ��������������ť!','��ʾ',mb_ok+mb_iconinformation);
      AllowChange:=false;
    end;
  end;
end;

procedure Tfrm_serviceitemextra.sbtn_ReconfigClick(Sender: TObject);
begin
  if MessageBox(handle,'�������ý�������ݿ��е����ݣ�������?','��ʾ',mb_YESNO+mb_iconinformation)<>IDYES then exit;
  if pagecontrol1.ActivePage = sht_same then
    StringGridClear(sg_Same)
  else if pagecontrol1.ActivePage = sht_specific then
    StringGridClear(sg_specific);
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='delete from serviceitemextra';
    ExecSQL;
  end;
  isConfig:=false;
  sbtn_reconfig.Enabled :=false;
  InitialServiceItemExtra;
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
    MessageBox(handle,'���ȱ��沿�ֵķ����������!','��ʾ',mb_ok+mb_iconinformation);
    CanSelect:=false;
    exit;
  end;
end;

end.
