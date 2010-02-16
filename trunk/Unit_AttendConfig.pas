unit Unit_AttendConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ComCtrls, Buttons, StdCtrls, Mask;

type
  Tfrm_attendconfig = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    sht_Time: TTabSheet;
    sht_Reason: TTabSheet;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_append: TSpeedButton;
    sbtn_edit: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_close: TSpeedButton;
    sg_Time: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    sg_Reason: TStringGrid;
    Label4: TLabel;
    edt_Reasonid: TEdit;
    Label6: TLabel;
    mm_remark: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cbb_Timename: TComboBox;
    Label5: TLabel;
    Label7: TLabel;
    dtp_timetime: TMaskEdit;
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_appendClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_TimeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_ReasonSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    TimeAppendOrEdit,ReasonAppendOrEdit:boolean;
    Reasonid:string;
    procedure SearchTimeInfo();
    procedure ClearTimeInfo();
    procedure MakeTimeEnabled(temp:boolean);
    function  SaveTimeInfo():boolean;

    procedure SearchReasonInfo();
    procedure ClearReasonInfo();
    procedure MakeReasonEnabled(temp:boolean);
    function  SaveReasonInfo():boolean;
  public
    { Public declarations }
    procedure Time_ref;
    procedure Reason_ref;
  end;

var
  frm_attendconfig: Tfrm_attendconfig;

implementation

uses Unit_DataModule,unit_TotalPublic,PublicFunOrPro;

{$R *.dfm}

{***************时间设置******************}
procedure Tfrm_attendconfig.Time_ref;
begin
  with sg_Time do
  begin
    cells[0,0] := '时间名称';
    cells[1,0] := '时间设置';
  end;
  dtp_timetime.Text := TimeToStr(Now());
  SearchTimeInfo();

  sbtn_append.Enabled := GetPower(SysUserId,'考勤设置','修改权');
  sbtn_edit.Enabled   := sbtn_append.Enabled ;
  sbtn_delete.Enabled := sbtn_append.Enabled ;
end;
procedure Tfrm_attendconfig.SearchTimeInfo ();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select time_name,time_time from AttendTime order by order_by';
    Open;
    i:=1;
    while not eof do
    begin
      sg_Time.Cells[0,i] := FieldByName('time_name').AsString ;
      sg_Time.Cells[1,i] := TimeToStr(FieldbyName('time_time').AsDateTime) ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Time.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_Time.RowCount >3 then sbtn_back.Enabled := true;
end;

function Tfrm_attendconfig.SaveTimeInfo():boolean;
var
  orderby:integer;
begin
  result := true;orderby:=0;
  if trim(cbb_timename.Text)='' then
  begin
    Messagebox(handle,'请选择设置的时间名称!','提示',mb_ok+mb_iconinformation);
    result:=false;
    cbb_timename.SetFocus ;
    exit;
  end;
  try
    dtp_timetime.Text := timetostr(strtotime(dtp_timetime.Text)) ;
  except
    Messagebox(handle,'请输入正确的时间!','提示',mb_ok+mb_iconinformation);
    result:=false;
    dtp_timetime.SetFocus ;
    exit ;
  end ;

  if TimeAppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select count(*) as [count] from AttendTime where time_name=:timename';
    Parameters.ParamValues['timename'] := trim(cbb_timename.Text);
    open;
    if FieldByName('count').AsInteger>0 then
    begin
      MessageBox(self.Handle ,'该时间设置名称已经存在，请重新确认！','提示',mb_ok+mb_iconinformation);
      cbb_timename.SetFocus ;
      result := false;
      exit;
    end;
  end;

  //设置orderby分别为1,2,3,4,5,6
  if trim(cbb_timename.Text)='上午上班' then
     orderby:=1
  else if  trim(cbb_timename.Text)='上午下班' then
     orderby:=2
  else if  trim(cbb_timename.Text)='下午上班' then
     orderby:=3
  else if  trim(cbb_timename.Text)='下午下班' then
     orderby:=4
  else if  trim(cbb_timename.Text)='晚上上班' then
     orderby:=5
  else if  trim(cbb_timename.Text)='晚上下班' then
     orderby:=6;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from AttendTime where time_name=:timename';
      Parameters.ParamValues['timename'] := trim(cbb_timename.Text);
      ExecSQL;

      close;
      SQL.Clear ;
      SQL.Add('insert into AttendTime(time_name,time_time,order_by) values(') ;
      SQL.Add('''' + trim(cbb_Timename.Text) + ''',' ) ;
      SQL.Add('''' + dtp_timetime.text + ''',' ) ;
      SQL.Add( inttostr(orderby) + ')') ;
      ExecSQL;
      dmod.ADOConn.CommitTrans ;
    end ;
  except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'操作失败，请重试！','提示',mb_ok+mb_iconinformation);
      result:=false;
  end;
end;
procedure Tfrm_attendconfig.ClearTimeInfo();
begin
  cbb_timename.Text :='';
  dtp_timetime.Text :='';
end;
procedure Tfrm_attendconfig.MakeTimeEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
     sbtn_save.Enabled := true
  else
     sbtn_save.Enabled := false;
  sbtn_delete.Enabled  :=false;
  cbb_timename.Enabled := temp;
  dtp_timetime.Enabled := temp;
end;
{***************时间设置******************}

{***************原因设置******************}
procedure Tfrm_attendconfig.Reason_ref;
begin
  with sg_Reason do
  begin
    cells[0,0] := '理由序号';
    cells[1,0] := '理由描述';
  end;
  SearchReasonInfo();
end;
procedure Tfrm_attendconfig.SearchReasonInfo ();
var
  i:integer;
begin
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select reason_id,reason_remark from specialreason';
    Open;
    i:=1;
    while not eof do
    begin
      sg_Reason.Cells[0,i] := FieldByName('reason_id').AsString ;
      sg_Reason.Cells[1,i] := FieldByName('reason_remark').AsString ;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Reason.RowCount := i+1;
  sbtn_front.Enabled := false;
  sbtn_back.Enabled  := false;
  if sg_Reason.RowCount >3 then sbtn_back.Enabled := true;
end;

function Tfrm_attendconfig.SaveReasonInfo():boolean;
begin
  result := true;
  if trim(mm_remark.Text)='' then
  begin
    Messagebox(handle,'请先填写不能考勤的原因!','提示',mb_ok+mb_iconinformation);
    result:=false;
    mm_remark.SetFocus ;
    exit;
  end;

  Reasonid:=trim(edt_Reasonid.Text );
  if ReasonAppendOrEdit then
  with dmod.ADOQuery1 do
  begin
    close;
    SQL.Text := 'select reason_id from specialreason where reason_id=:reasonid';
    Parameters.ParamValues['reasonid'] := reasonid;
    Open;
    if not eof then
    begin
      MessageBox(self.handle,'该时间设置序号已经存在，请重新确认!','提示',mb_ok+mb_iconinformation);
      edt_reasonid.SetFocus ;
      result:=false;
      exit;
    end;
  end;

  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from specialreason where reason_id=:reasonid';
      Parameters.ParamValues['reasonid'] := reasonId;
      ExecSQL;

      close;
      SQL.Text := 'insert into specialreason(reason_id,reason_remark) values(:reasonid,:reasonremark)';
      Parameters.ParamValues['reasonid'] := trim(edt_reasonid.Text );
      Parameters.ParamValues['reasonremark'] := trim(mm_remark.Text );
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
procedure Tfrm_attendconfig.ClearReasonInfo();
begin
  edt_Reasonid.Text :='';
  mm_remark.Text :='';
end;
procedure Tfrm_attendconfig.MakeReasonEnabled(temp:boolean);
begin
  if sbtn_append.Enabled then
     sbtn_save.Enabled := true
  else
     sbtn_save.Enabled := false;
  sbtn_delete.Enabled  :=false;

  edt_Reasonid.Enabled := temp;
  mm_remark.Enabled := temp;
end;
{***************原因设置******************}
procedure Tfrm_attendconfig.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_attendconfig.sbtn_appendClick(Sender: TObject);
var
  i:integer;
  temp:string;
begin
  {*********************如果新建考勤设置**********************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
    if (not TimeAppendOrEdit) and (not cbb_Timename.Enabled) and (cbb_Timename.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveTimeInfo then i:=2;
      if i=2 then exit;
    end;
    TimeAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeTimeEnabled(true);
    ClearTimeInfo();

    sg_Time.Enabled :=true;
  end
  {*********************如果新建未考勤理由**********************}
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    if (not ReasonAppendOrEdit) and (not edt_Reasonid.Enabled) and (edt_Reasonid.Text<>'') then
    begin
      i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveReasonInfo then i:=2;
      if i=2 then exit;
    end;
    ReasonAppendOrEdit:=true;
    sbtn_edit.Enabled :=true;
    MakeReasonEnabled(true);
    ClearReasonInfo();

    sg_Time.Enabled :=true;

    temp:=GetDateString('DBMeirong');//to get current datetime such as 2003-10-13 13:37:03
    temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2); //to set value of temp like '20031013'
    edt_Reasonid.Text :=GetNo('DBMeirong','specialreason','','','reason_id',temp,2); //to set value of Empno like '2003101301'
  end;
end;

procedure Tfrm_attendconfig.sbtn_editClick(Sender: TObject);
var
  i:integer;
begin
  {**************************修改时间设置************************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
    if TimeAppendOrEdit and cbb_Timename.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveTimeInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_Time.Cells[0,sg_Time.Row]='' then exit;

    TimeAppendOrEdit:=false;

    cbb_Timename.Text := sg_Time.Cells[0,sg_Time.Row];
    dtp_Timetime.Text := sg_Time.Cells[1,sg_Time.Row];

    MakeTimeEnabled(true);
    cbb_timename.Enabled :=false;
    sg_Time.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
  {**************************修改未考勤原因************************}
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    if ReasonAppendOrEdit and edt_Reasonid.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveReasonInfo then i:=2;
      if i=2 then exit;
    end;
    if sg_Reason.Cells[0,sg_Reason.Row]='' then exit;

    ReasonAppendOrEdit:=false;

    edt_Reasonid.Text :=sg_Reason.Cells[0,sg_Reason.Row];
    mm_remark.Text := sg_Reason.Cells[1,sg_Reason.Row];

    MakeReasonEnabled(true);
    edt_Reasonid.Enabled :=false;
    sg_Reason.Enabled :=false;
    sbtn_edit.Enabled :=false;
  end
end;

procedure Tfrm_attendconfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_attendConfig:=nil;
end;

procedure Tfrm_attendconfig.sbtn_saveClick(Sender: TObject);
var
  i:integer;
  temp:string;
begin
  {**********************进行时间设置的保存********************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
    if not SaveTimeInfo then exit;
    if TimeAppendOrEdit then
    begin
      StringGridInsert(sg_Time);
      i:=1;
    end else i:=sg_Time.Row;
    with sg_Time do
    begin
      cells[0,i] := trim(cbb_timename.Text );
      cells[1,i] := dtp_timetime.Text;
    end;
    if TimeAppendOrEdit then
    begin
      ClearTimeInfo();
      if sg_Time.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeTimeEnabled(false);
      ClearTimeInfo();
      sg_Time.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end
  {**********************进行理由的保存********************}
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    if not SaveReasonInfo then exit;
    if ReasonAppendOrEdit then
    begin
      StringGridInsert(sg_Reason);
      i:=1;
    end else i:=sg_Reason.Row;
    with sg_Reason do
    begin
      cells[0,i] := trim(edt_Reasonid.Text );
      cells[1,i] := trim(mm_remark.Text );
    end;
    if ReasonAppendOrEdit then
    begin
      ClearReasonInfo();
      temp:=GetDateString('DBMeiRong');
      temp:=copy(temp,1,4)+copy(temp,6,2)+copy(temp,9,2);
      edt_Reasonid.Text :=GetNo('DBMeiRong','specialreason','','','reason_id',temp,2);
      if sg_Reason.rowcount>3 then sbtn_Back.Enabled:=true;
    end
    else begin
      MakeReasonEnabled(false);
      ClearReasonInfo();
      sg_Reason.Enabled:=true;
      sbtn_save.Enabled :=false;
    end;
    sbtn_delete.enabled:=true;
    sbtn_edit.Enabled :=true;
  end;

end;

procedure Tfrm_attendconfig.sbtn_deleteClick(Sender: TObject);
begin
  {******************进行时间设置的删除*************************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
    if sg_Time.Cells[0,sg_Time.Row]='' then exit;
    if MessageBox(handle,'你确定要删除该时间设置信息吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from AttendTime where time_name='+#39+sg_Time.Cells[0,sg_Time.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_Time,sg_Time.Row);
    if sg_Time.Row = sg_Time.RowCount - 1 then
    begin
      if sg_Time.RowCount > 2 then
        sg_Time.Row := sg_Time.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_Time.Row = 1 then sbtn_front.Enabled := false;
    if sg_Time.Row = sg_Time.RowCount - 2 then sbtn_back.Enabled := false;
  end
  {******************进行理由的删除*************************}
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    if sg_Reason.Cells[0,sg_Reason.Row]='' then exit;
    if MessageBox(handle,'你确定要删除未考勤理由吗？','询问',mb_yesno+mb_iconquestion)<> IDYes then exit;
    with dmod.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete from specialreason where reason_id='+#39+sg_Reason.Cells[0,sg_Reason.Row]+#39;
      ExecSQL;
    end;
    StringGridDelete(sg_Reason,sg_Reason.Row);
    if sg_Reason.Row = sg_Reason.RowCount - 1 then
    begin
      if sg_Reason.RowCount > 2 then
        sg_Reason.Row := sg_Reason.Row - 1
      else
        sbtn_back.Enabled := false;
    end;
    if sg_Reason.Row = 1 then sbtn_front.Enabled := false;
    if sg_Reason.Row = sg_Reason.RowCount - 2 then sbtn_back.Enabled := false;
  end
end;

procedure Tfrm_attendconfig.sbtn_backClick(Sender: TObject);
var
  i:integer;
begin
  {*********************时间设置向后移动*****************************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
     if sbtn_save.Enabled and sbtn_append.Enabled then
     begin
       i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
       if i=6 then
       if not SaveTimeInfo then i:=2;
       if i=2 then exit;
       if i=7 then begin ClearTimeInfo(); sg_Time.Enabled:=true;MakeTimeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
    end;
    if sg_Time.Row > sg_Time.RowCount -2 then
    begin
      sbtn_back.Enabled :=false;
      exit;
    end;
    sbtn_front.Enabled :=true;
    sbtn_edit.Enabled  :=true;
    sg_Time.Row :=sg_Time.Row +1;
  end
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    {*********************时间设置向后移动*****************************}
    if pagecontrol1.ActivePage = sht_Reason then
    begin
       if sbtn_save.Enabled and sbtn_append.Enabled then
       begin
         i:=MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
         if i=6 then
         if not SaveReasonInfo then i:=2;
         if i=2 then exit;
         if i=7 then begin ClearReasonInfo(); sg_Reason.Enabled:=true;MakeReasonEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true;end;
      end;
      if sg_Reason.Row > sg_Reason.RowCount -2 then
      begin
         sbtn_back.Enabled :=false;
         exit;
      end;
      sbtn_front.Enabled :=true;
      sbtn_edit.Enabled  :=true;
      sg_Reason.Row :=sg_Reason.Row +1;
    end
  end;
end;

procedure Tfrm_attendconfig.sbtn_frontClick(Sender: TObject);
var
  i:integer;
begin
  {*************************时间设置向前移动*****************************}
  if pagecontrol1.ActivePage = sht_Time then
  begin
    if sbtn_save.Enabled and sbtn_append.Enabled then
    begin
      i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
      if i=6 then
      if not SaveTimeInfo then i:=2;
      if i=2 then exit;
      if i=7 then begin ClearTimeInfo();sg_Time.Enabled:=true;MakeTimeEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
    end;
    if sg_Time.Row =1 then
    begin
      sbtn_front.Enabled:=false;
      exit;
    end;
    sbtn_back.Enabled :=true;
    sbtn_edit.Enabled :=true;
    sg_Time.Row :=sg_Time.Row -1;
  end
  else if pagecontrol1.ActivePage = sht_Reason then
  begin
    {*************************时间设置向前移动*****************************}
    if pagecontrol1.ActivePage = sht_Reason then
    begin
      if sbtn_save.Enabled and sbtn_append.Enabled then
      begin
        i := MessageBox(handle,'你要保存操作的数据吗？','询问',mb_yesnocancel+mb_iconquestion);
        if i=6 then
        if not SaveReasonInfo then i:=2;
        if i=2 then exit;
        if i=7 then begin ClearReasonInfo();sg_Reason.Enabled:=true;MakeReasonEnabled(false);sbtn_save.Enabled :=false;sbtn_delete.Enabled :=true; end;
      end;
      if sg_Reason.Row =1 then
      begin
        sbtn_front.Enabled:=false;
        exit;
      end;
      sbtn_back.Enabled :=true;
      sbtn_edit.Enabled :=true;
      sg_Reason.Row :=sg_Reason.Row -1;
    end
  end;
end;

procedure Tfrm_attendconfig.sg_TimeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_Time.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_Time.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

procedure Tfrm_attendconfig.sg_ReasonSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow=sg_Reason.RowCount-1 then
    CanSelect:=false
  else
  begin
    sbtn_back.Enabled :=true;
    sbtn_front.Enabled :=true;
    if ARow = sg_Reason.rowcount-2 then sbtn_back.Enabled := false;
    if ARow=1  then sbtn_front.Enabled := false;
    CanSelect:=true;
  end;
end;

end.