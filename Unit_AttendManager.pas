unit Unit_AttendManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ComCtrls, Buttons, StdCtrls, Menus;

type
  Tfrm_attendmanager = class(TForm)
    PageControl1: TPageControl;
    sht_Normal: TTabSheet;
    sht_Special: TTabSheet;
    sg_Normal: TStringGrid;
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_save: TSpeedButton;
    sbtn_delete: TSpeedButton;
    sbtn_close: TSpeedButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    SpeedButton2: TSpeedButton;
    edt_UserId: TEdit;
    edt_Password: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    sbtn_Search: TSpeedButton;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    dtp_DateEnd: TDateTimePicker;
    dtp_DateStart: TDateTimePicker;
    edt_Empname: TEdit;
    edt_Empno: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sg_Special: TStringGrid;
    sbtn_edit: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure sg_NormalSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_SpecialSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtn_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_closeClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_deleteClick(Sender: TObject);
    procedure edt_EmpnoExit(Sender: TObject);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure sg_SpecialMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function  CheckAdministrator(userid,password:string):boolean;
    procedure MakeInputEnabled(temp:boolean);
    procedure SearchNormalInfo();
    procedure SearchSpecialInfo();
  public
    { Public declarations }
    procedure attendmanager_ref();
  end;

var
  frm_attendmanager: Tfrm_attendmanager;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro,unit_selectreason,Unit_PublicFunction;
{$R *.dfm}
{*************************用户自定义过程***********************}
procedure Tfrm_attendmanager.MakeInputEnabled(temp:boolean);
begin
  edt_Empno.Enabled :=temp;
  edt_Empname.Enabled :=temp;
  dtp_DateStart.Enabled :=temp;
  dtp_DateEnd.Enabled :=temp;
  sbtn_Search.Enabled :=temp;
end;

procedure Tfrm_attendmanager.attendmanager_ref ();
begin
  pagecontrol1.ActivePage := sht_Normal;
  with sg_Normal do
  begin
    cells[0,0]:='考勤日期';
    cells[1,0]:='上午上班';
    cells[2,0]:='上午下班';
    cells[3,0]:='下午上班';
    cells[4,0]:='下午下班';
    cells[5,0]:='晚上上班';
    cells[6,0]:='晚上下班';
  end;

  with sg_Special do
  begin
    cells[0,0]:='考勤日期';
    cells[1,0]:='原因序号';
    cells[2,0]:='原因描述';
    cells[3,0]:='开始时间';
    cells[4,0]:='结束时间';
  end;

  dtp_datestart.Date := Date;
  dtp_dateend.Date   := Date+1;

  sbtn_edit.Enabled := GetPower(SysUserId,'考勤管理','修改权');
  sbtn_delete.Enabled := sbtn_edit.Enabled ;
end;

procedure Tfrm_attendmanager.SearchNormalInfo ();
var
  i:integer;
begin
  StringGridClear(sg_Normal);

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select att_date,pre_morning,aft_morning,pre_afternoon,aft_afternoon,pre_evening,aft_evening '+
               ' from normalattend where emp_no='+#39+trim(edt_Empno.Text)+#39+
               ' and att_date between '+#39+DateToStr(dtp_datestart.Date)+#39+
               ' and '+#39+DateTostr(dtp_dateend.Date)+#39;
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Normal do
      begin
        cells[0,i]:= FieldByName('att_date').AsString ;
        if FieldByName('pre_morning').AsString<>'' then
          cells[1,i]:= TimeToStr(StrToDateTime(FieldByName('pre_morning').AsString))
        else
          cells[1,i]:='';
        if FieldByName('aft_morning').AsString<>'' then
          cells[2,i]:= TimeToStr(StrToDateTime(FieldByName('aft_morning').AsString))
        else
          cells[2,i]:='';
        if FieldByName('pre_afternoon').AsString<>'' then
          cells[3,i]:= TimeToStr(StrToDateTime(FieldByName('pre_afternoon').AsString))
        else
          cells[3,i]:='';
        if FieldByName('aft_afternoon').AsString<>'' then
          cells[4,i]:= TimeToStr(StrToDateTime(FieldByName('aft_afternoon').AsString))
        else
          cells[4,i]:='';
        if FieldByName('pre_evening').AsString<>'' then
          cells[5,i]:= TimeToStr(StrToDateTime(FieldByName('pre_evening').AsString))
        else
          cells[5,i]:='';
        if FieldByName('aft_evening').AsString<>'' then
          cells[6,i]:= TimeToStr(StrToDateTime(FieldByName('aft_evening').AsString))
        else
          cells[6,i]:='';
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Normal.RowCount :=i+1;
end;

procedure Tfrm_attendmanager.SearchSpecialInfo ();
var
  i:integer;
begin
  StringGridClear(sg_Special);

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select att_date,specialattend.reason_id,reason_remark,time_start,time_end from specialattend,specialreason where'+
               ' specialattend.reason_id=specialreason.reason_id and  emp_no='+#39+trim(edt_Empno.Text)+#39+
               ' and att_date between '+#39+DateToStr(dtp_datestart.Date)+#39+
               ' and '+#39+DateTostr(dtp_dateend.Date)+#39;
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Special do
      begin
        cells[0,i]:= FieldByName('att_date').AsString ;
        cells[1,i]:= FieldByName('reason_id').AsString ;
        cells[2,i]:= FieldByName('reason_remark').AsString ;
        if FieldByName('time_start').AsString<>'' then
          cells[3,i]:= TimeToStr(StrToDateTime(FieldByName('time_start').AsString))
        else
          cells[3,i]:='';
        if FieldByName('time_end').AsString <>'' then
          cells[4,i]:= TimeToStr(StrToDateTime(FieldByName('time_end').AsString))
        else
          cells[4,i]:='';
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Special.RowCount :=i+1;
end;

function Tfrm_attendmanager.CheckAdministrator(userid,password:string):boolean;
begin
  if (userid<>'') and (password<>'') then
  begin
    result:=true;
  end else
  begin
    MessageBox(handle,'用户名和密码缺一不可，请重试!','提示',mb_ok+mb_iconinformation);
    result:=false;
  end;
end;
{*************************用户自定义过程***********************}

procedure Tfrm_attendmanager.sg_NormalSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Normal.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Normal.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_attendmanager.sg_SpecialSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Special.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Special.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_attendmanager.SpeedButton2Click(Sender: TObject);
begin
  if CheckAdministrator(edt_UserId.Text ,edt_Password.Text ) then
  begin
     MessageBox(handle,'管理员验证通过,可以进行考勤管理!','提示',mb_ok+mb_iconinformation);
     MakeInputEnabled(true);
  end else
  begin
     MessageBox(handle,'管理员验证失败,请重试!','提示',mb_ok+mb_iconinformation);
     MakeInputEnabled(false);
  end;
end;

procedure Tfrm_attendmanager.sbtn_SearchClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Normal then
     SearchNormalInfo
  else
     SearchSpecialInfo;
end;

procedure Tfrm_attendmanager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_attendmanager:=nil;
end;

procedure Tfrm_attendmanager.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_attendmanager.sbtn_editClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Normal then
  begin
    if sg_Normal.RowCount =2 then exit;
    sg_Normal.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
    sbtn_edit.Enabled :=false;
    sbtn_save.Enabled :=true;
    sbtn_delete.Enabled := false;
  end else
  begin
    if sg_Special.rowcount =2 then exit;
    sg_Special.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
    sbtn_edit.Enabled :=false;
    sbtn_save.Enabled :=true;
    sbtn_delete.Enabled := false;
  end;
end;

procedure Tfrm_attendmanager.sbtn_saveClick(Sender: TObject);
var
  i:integer;
  err_no : integer ;
  temp_date,temp_SQL,pre_morning,pre_afternoon,pre_evening,aft_morning,aft_afternoon,aft_evening:string;
  temp_Str : string ;
begin
  err_no := 0 ;
  temp_Str := '' ;
  if pagecontrol1.ActivePage = sht_Normal then
  begin
  dmod.ADOConn.BeginTrans ;
  try
    for i:=1 to sg_Normal.RowCount -2 do
    begin
      temp_date:= sg_Normal.cells[0,i];
      pre_morning:=sg_Normal.cells[1,i];
      aft_morning:=sg_Normal.cells[2,i];
      pre_afternoon:=sg_Normal.cells[3,i];
      aft_afternoon:=sg_Normal.cells[4,i];
      pre_evening:=sg_Normal.cells[5,i];
      aft_evening:=sg_Normal.cells[6,i];

      if temp_date <> '' then
      try
        strtodate(temp_date);
      except
        err_no := err_no + 1 ;
      end ;

      if pre_morning <> '' then
      try
        pre_morning := timetostr(strtotime(pre_morning));
        sg_Normal.cells[1,i] := pre_morning ;
      except
        err_no := err_no + 1 ;
      end ;

      if aft_morning <> '' then
      try
        aft_morning := timetostr(strtotime(aft_morning));
        sg_Normal.cells[2,i] := aft_morning ;
      except
        err_no := err_no + 1 ;
      end ;

      if pre_afternoon <> '' then
      try
        pre_afternoon := timetostr(strtotime(pre_afternoon));
        sg_Normal.cells[3,i] := pre_afternoon ;
      except
        err_no := err_no + 1 ;
      end ;

      if aft_afternoon <> '' then
      try
        aft_afternoon := timetostr(strtotime(aft_afternoon));
        sg_Normal.cells[4,i] := aft_afternoon ;
      except
        err_no := err_no + 1 ;
      end ;

      if pre_evening <> '' then
      try
        pre_evening := timetostr(strtotime(pre_evening));
        sg_Normal.cells[5,i] := pre_evening ;
      except
        err_no := err_no + 1 ;
      end ;

      if aft_evening <> '' then
      try
        aft_evening := timetostr(strtotime(aft_evening));
        sg_Normal.cells[6,i] := aft_evening ;
      except
        err_no := err_no + 1 ;
      end ;

      with dmod.ADOQuery1 do
      begin
        close;
        temp_SQL :='update normalattend set ';
        if pre_morning  <>'' then
           temp_Str := 'pre_morning='+#39+temp_date+' '+pre_morning+#39;

        if temp_str  <> '' then
        begin
          if aft_morning  <>'' then
             temp_Str := temp_Str +',aft_morning='+#39+temp_date  +' ' +aft_morning+#39;
        end else
        begin
          if aft_morning  <>'' then
             temp_Str := 'aft_morning='+#39+temp_date  +' ' +aft_morning+#39;
        end;

        if temp_str <>'' then
        begin
          if pre_afternoon<>'' then
             temp_Str := temp_Str +',pre_afternoon='+#39+temp_date+' ' +pre_afternoon+#39;
        end else
        begin
          if pre_afternoon<>'' then
             temp_Str := 'pre_afternoon='+#39+temp_date+' ' +pre_afternoon+#39;
        end;

        if temp_str <>'' then
        begin
          if aft_afternoon<>'' then
            temp_Str := temp_Str +',aft_afternoon='+#39+temp_date+' ' +aft_afternoon+#39;
        end else
        begin
          if aft_afternoon<>'' then
            temp_Str := 'aft_afternoon='+#39+temp_date+' ' +aft_afternoon+#39;
        end;

        if temp_str <>'' then
        begin
          if pre_evening  <>'' then
            temp_Str := temp_Str +',pre_evening='+#39+temp_date  +' ' +pre_evening+#39;
        end else
        begin
          if pre_evening  <>'' then
            temp_Str := 'pre_evening='+#39+temp_date  +' ' +pre_evening+#39;
        end;

        if temp_str <>'' then
        begin
          if aft_evening  <>'' then
             temp_Str := temp_Str +',aft_evening='+#39+temp_date  +' ' +aft_evening+#39;
        end else
        begin
          if aft_evening  <>'' then
             temp_Str := 'aft_evening='+#39+temp_date  +' ' +aft_evening+#39 ;
        end;

        if (temp_str <> '') and (err_no = 0) then
        begin
           temp_SQL := temp_SQL + temp_str + ' where emp_no='+#39+trim(edt_Empno.text)+#39+' and att_date='+#39+temp_date+#39;

           SQL.Text := temp_SQL;
           ExecSQL;
        end ;
      end;
    end;
  finally
    if err_no = 0 then
    begin
      try
        dmod.ADOConn.CommitTrans ;
        MessageBox(handle,'数据保存成功!','提示',mb_ok+mb_iconinformation);
        sg_Normal.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goRowSelect];
        sbtn_save.Enabled :=false;
        sbtn_edit.Enabled :=true;
        sbtn_delete.Enabled :=true;
      except
        dmod.ADOConn.RollbackTrans ;
        MessageBox(handle,'数据保存失败，请重试!','提示',mb_ok+mb_iconinformation);
      end;
    end
    else
    begin
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'数据保存失败，请重试!','提示',mb_ok+mb_iconinformation);
    end ;
  end;//开始进行特殊考勤的保存
  end else begin
    try
      dmod.ADOConn.BeginTrans ;
      with dmod.ADOQuery1 do
      begin
        close;
        SQL.Text :='delete from specialattend where emp_no='+#39+trim(edt_empno.Text)+#39+
                   ' and att_date between'+#39+DateToStr(dtp_datestart.Date)+#39+
                   ' and '+#39+DateToStr(dtp_dateend.Date)+#39;
        ExecSQL;

        for i:=1 to sg_Special.Rowcount-2 do
        begin
          Close;
          SQL.Text :='insert into SpecialAttend(emp_no,emp_name,att_date,time_start,time_end,reason_id) values('+
               ':empno,:empname,:attdate,:timestart,:timeend,:reasonid)';
          Parameters.ParamValues['empno']:=trim(edt_Empno.Text);
          Parameters.ParamValues['empname']:=trim(edt_Empname.Text);
          Parameters.ParamValues['attdate']:= StrToDate(sg_Special.cells[0,i]);
          Parameters.ParamValues['timestart'] :=StrToDateTime(sg_Special.cells[0,i]+' '+sg_Special.cells[3,i]) ;
          Parameters.ParamValues['timeend'] :=StrToDateTime(sg_Special.cells[0,i]+' '+sg_Special.cells[4,i]);
          Parameters.ParamValues['reasonid']:=sg_Special.cells[1,i];
          ExecSQL;
        end;
      end;
    finally
      try
        dmod.ADOConn.CommitTrans ;
        MessageBox(handle,'数据保存成功!','提示',mb_ok+mb_iconinformation);
        sg_Normal.Options :=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goRowSelect];
        sbtn_save.Enabled :=false;
        sbtn_edit.Enabled :=true;
        sbtn_delete.Enabled :=true;
      except
        dmod.ADOConn.RollbackTrans ;
        MessageBox(handle,'数据保存失败，请重试!','提示',mb_ok+mb_iconinformation);
      end;
    end;
  end;
end;

procedure Tfrm_attendmanager.sbtn_deleteClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Normal then
  begin
    if MessageBox(handle,'你确定删除该员工正常考勤记录吗?','询问',mb_yesno+mb_iconquestion)=IDYES then
    begin
      if sg_Normal.Cells[0,sg_Normal.Row]='' then exit;
    
      with dmod.ADOQuery1 do
      begin
        close;
        SQL.Text :='delete from normalattend where emp_no='+#39+trim(edt_Empno.Text)+#39+
                 ' and att_date='+#39+sg_Normal.Cells[0,sg_Normal.Row]+#39;
        ExecSQL;
      end;
      StringGridDelete(sg_Normal,sg_Normal.Row);
      if sg_Normal.Row = sg_Normal.RowCount - 1 then
      begin
        if sg_Normal.RowCount > 2 then
          sg_Normal.Row := sg_Normal.Row - 1
        else
          sbtn_back.Enabled := false;
      end;
      if sg_Normal.Row = 1 then sbtn_front.Enabled := false;
      if sg_Normal.Row = sg_Normal.RowCount - 2 then sbtn_back.Enabled := false;
    end;
  end else begin
    if MessageBox(handle,'你确定删除该员工特殊考勤记录吗?','询问',mb_yesno+mb_iconquestion)=IDYES then
    begin
      if sg_Special.Cells[0,sg_Special.Row]='' then exit;
    
      with dmod.ADOQuery1 do
      begin
        close;
        SQL.Text :='delete from specialattend where emp_no='+#39+trim(edt_Empno.Text)+#39+
                 ' and att_date='+#39+sg_Special.Cells[0,sg_Special.Row]+#39+
                 ' and reason_id='+#39+sg_Special.Cells[1,sg_Special.row]+#39;
        ExecSQL;
      end;
      StringGridDelete(sg_Special,sg_Special.Row);
      if sg_Special.Row = sg_Special.RowCount - 1 then
      begin
        if sg_Special.RowCount > 2 then
          sg_Special.Row := sg_Special.Row - 1
        else
          sbtn_back.Enabled := false;
      end;
      if sg_Special.Row = 1 then sbtn_front.Enabled := false;
      if sg_Special.Row = sg_Special.RowCount - 2 then sbtn_back.Enabled := false;
    end;
  end;
end;

procedure Tfrm_attendmanager.edt_EmpnoExit(Sender: TObject);
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select emp_name from employee where emp_no='+#39+trim(edt_Empno.Text)+#39;
    Open;
    if not eof then
      edt_empname.Text := FieldByName('emp_name').AsString 
    else begin
      MessageBox(self.handle,'该员工编号不存在，请重试!','提示',mb_ok+mb_iconinformation);
      edt_empno.SetFocus ;
    end;
  end;
end;

procedure Tfrm_attendmanager.sbtn_backClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Normal then
  begin
    if sg_Normal.Row > sg_Normal.RowCount-2 then
    begin
      sbtn_back.Enabled := false;
      exit;
    end;
    sbtn_front.Enabled := true;
    sg_Normal.Row := sg_Normal.Row+1;
  end else begin
    if sg_Special.Row > sg_Special.RowCount-2 then
    begin
      sbtn_back.Enabled := false;
      exit;
    end;
    sbtn_front.Enabled := true;
    sg_Special.Row := sg_Special.Row+1;
  end;
end;

procedure Tfrm_attendmanager.sbtn_frontClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_Normal then
  begin
    if sg_Normal.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;

    sbtn_back.Enabled := true;
    sg_Normal.Row := sg_Normal.Row-1;
  end else begin
    if sg_Special.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;

    sbtn_back.Enabled := true;
    sg_Special.Row := sg_Special.Row-1;
  end;
end;

procedure Tfrm_attendmanager.N1Click(Sender: TObject);
begin
  DoSelectReason;
end;

procedure Tfrm_attendmanager.sg_SpecialMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if sg_Special.cells[0,sg_Special.Row]='' then exit;
  if button=mbright then
     popupmenu1.Popup(X,Y+150); 
end;

end.
