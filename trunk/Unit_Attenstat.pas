unit Unit_Attenstat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,Math;

type
  Tfrm_attendstat = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    sht_StatList: TTabSheet;
    sht_statdetail: TTabSheet;
    sg_Statistic: TStringGrid;
    sg_Detail: TStringGrid;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    sbtn_print: TSpeedButton;
    sbtn_Show: TSpeedButton;
    ListBox1: TListBox;
    Splitter2: TSplitter;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sbtn_attendstat: TSpeedButton;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cbb_Year: TComboBox;
    cbb_Month: TComboBox;
    procedure sbtn_attendstatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sg_StatisticSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_ShowClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_DetailSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_printClick(Sender: TObject);
  private
    //pre_morning,aft_morning,pre_afternoon,aft_afternoon,pre_evening,aft_evening:TDateTime;
    time_set:array of string;
    temp_MinDate,temp_MaxDate:string;
    
    procedure GetDetailNormalAttendInfo(temp_Empno,temp_Empname,temp_MinDate,temp_MaxDate:string);
    procedure GetDetailSpecialAttendInfo(temp_Empno,temp_Empname,temp_MinDate,temp_MaxDate:string);
    function  GetAttendTimeSet:boolean;
    procedure SaveAttendStatistic;
    { Private declarations }
  public
    { Public declarations }
    temp_yearmonth:string;
    procedure attendstat_ref;
  end;

var
  frm_attendstat: Tfrm_attendstat;

implementation
  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{*******************�û����̶���********************}
procedure Tfrm_attendstat.attendstat_ref ;
begin
  with sg_statistic do
  begin
    cells[0,0] := 'Ա�����';
    cells[1,0] := 'Ա������';
    cells[2,0] := '�ܹ�����';
    cells[3,0] := '�ܹ�����';
    cells[4,0] := '����ٵ�';
    cells[5,0] := '��������';
    cells[6,0] := '����ٵ�';
    cells[7,0] := '��������';
    cells[8,0] := '���ϳٵ�';
    cells[9,0] := '��������';
    cells[10,0]:= '�ܹ��ٵ�';
    cells[11,0]:= '�ܹ�����';
    cells[12,0]:= '���⿼��';
  end;

  with sg_Detail do
  begin
    cells[0,0] := 'Ա�����';
    cells[1,0] := 'Ա�����';
    cells[2,0] := '��������';
    cells[3,0] := '�����ϰ�';
    cells[4,0] := '�����°�';
    cells[5,0] := '�����ϰ�';
    cells[6,0] := '�����°�';
    cells[7,0] := '�����ϰ�';
    cells[8,0] := '�����°�';
  end;

  sbtn_attendstat.Enabled := GetPower(SysUserId,'����ͳ��','�޸�Ȩ');
  sbtn_print.Enabled  := GetPower(SysUserId,'����ͳ��','��ӡȨ');
end;

procedure Tfrm_attendstat.GetDetailNormalAttendInfo(temp_Empno,temp_Empname,temp_MinDate,temp_MaxDate:string);
var
  i:integer;
begin
  if sg_Statistic.Cells[0,sg_Statistic.row]='' then exit;

  pagecontrol1.ActivePage := sht_statdetail;
  
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select * from NormalAttend where emp_no='+#39+temp_Empno+#39+
               ' and att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
    Open;
    i:=1;
    while not eof do
    begin
      with sg_Detail do
      begin
        cells[0,i]:=temp_Empno;
        cells[1,i]:=temp_Empname;
        cells[2,i]:=FieldByName('att_date').AsString ;
        cells[3,i]:=TimeToStr(FieldByName('pre_morning').AsDateTime) ;
        cells[4,i]:=TimeToStr(FieldByName('aft_morning').AsDateTime) ;
        cells[5,i]:=TimeToStr(FieldByName('pre_afternoon').AsDateTime) ;
        cells[6,i]:=TimeToStr(FieldByName('aft_afternoon').AsDateTime) ;
        cells[7,i]:=TimeToStr(FieldByName('pre_evening').AsDateTime) ;
        cells[8,i]:=TimeToStr(FieldByName('aft_evening').AsDateTime) ;
      end;
      inc(i);
      next;
    end;
  end;
  if i<>1 then sg_Detail.RowCount :=i+1;
end;

procedure Tfrm_attendstat.GetDetailSpecialAttendInfo(temp_Empno,temp_Empname,temp_MinDate,temp_MaxDate:string);
begin
  ListBox1.Clear ;
  ListBox1.Items.Add('���⿼�ڼ�¼');
   
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select a.att_date,a.time_start,a.time_end,r.reason_remark from SpecialAttend a,SpecialReason r where a.reason_id=r.reason_id'+
               ' and a.emp_no='+#39+temp_Empno+#39+' and a.att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
    Open;
    while not eof do
    begin
      ListBox1.Items.Add(FieldByName('att_date').AsString);
      Listbox1.Items.Add(TimeToStr(FieldByName('time_start').AsDateTime)+'-'+TimeToStr(FieldByName('time_end').AsDateTime));
      Listbox1.Items.Add(FieldByName('reason_remark').AsString);
      ListBox1.Items.Add('----------');

      next;
    end;
  end;
end;

function Tfrm_attendStat.GetAttendTimeSet :boolean;
var
  i,array_length:integer;
begin
  result:=true;
  //�õ���ȷ��ʱ�����ã�����Ϊ4����¼
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select count(*) as [count] from attendtime';
    Open;
    array_length:=FieldByName('count').AsInteger ;
  end;

  if array_length<4 then
  begin
    MessageBox(handle,'�㻹û��������ȷ�Ŀ���ʱ�䣬�޷�ͳ��!','��ʾ',mb_ok+mb_iconinformation);
    result:=false;
    exit;
  end;
  //���ö�̬��׼ʱ������
  SetLength(time_set,array_length);

  //�õ���׼����ʱ��
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select * from attendtime order by order_by';
    Open;
    i:=0;
    while not Eof do
    begin
      time_set[i]:=TimeToStr(FieldByName('time_time').AsDateTime);
      inc(i);
      next;
    end;
    result:=true;
  end;
end;

procedure Tfrm_attendstat.SaveAttendStatistic ;
var
  i:integer;
begin
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select count(*) as [count] from EmployeeAttendStatistic where year_month='+#39+temp_yearmonth+#39;
      Open;
      if FieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from EmployeeAttendStatistic where year_month='+#39+temp_yearmonth+#39;
        ExecSQL;
      end;

      for i:=1 to sg_Statistic.rowcount-2 do
      begin
        Close;
        SQL.Text :='insert into EmployeeAttendStatistic(emp_no,year_month,total_work,total_attend,late_morning,'+
                   'early_morning,late_afternoon,early_afternoon,late_evening,early_evening,total_late,total_early,'+
                   'special_attend) values(:empno,:yearmonth,:totalwork,:totalattend,:latemorning,:earlymorning,'+
                   ':lateafternoon,:earlyafternoon,:lateevening,:earlyevening,:totallate,:totalearly,:specialattend)';
        Parameters.ParamValues['empno']      :=sg_Statistic.Cells[0,i];
        Parameters.ParamValues['yearmonth']  :=temp_yearmonth;
        Parameters.ParamValues['totalwork']    :=StrToInt(sg_Statistic.Cells[2,i]);
        Parameters.ParamValues['totalattend']  :=StrToInt(sg_Statistic.Cells[3,i]);
        Parameters.ParamValues['latemorning']  :=StrToInt(sg_Statistic.Cells[4,i]);
        Parameters.ParamValues['earlymorning'] :=StrToInt(sg_Statistic.Cells[5,i]);
        Parameters.ParamValues['lateafternoon']:=StrToInt(sg_Statistic.Cells[6,i]);
        Parameters.ParamValues['earlyafternoon']:=StrToInt(sg_Statistic.Cells[7,i]);
        Parameters.ParamValues['lateevening']   :=StrToInt(sg_Statistic.Cells[8,i]);
        Parameters.ParamValues['earlyevening']  :=StrToInt(sg_Statistic.Cells[9,i]);
        Parameters.ParamValues['totallate']     :=StrToInt(sg_Statistic.Cells[10,i]);
        Parameters.ParamValues['totalearly']    :=StrToInt(sg_Statistic.Cells[11,i]);
        Parameters.ParamValues['specialattend'] :=StrToInt(sg_Statistic.Cells[12,i]);
        ExecSQL;
      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
    except
      dmod.ADOConn.RollbackTrans ;
    end;
  end;

end;
{*******************�û����̶���********************}
procedure Tfrm_attendstat.sbtn_attendstatClick(Sender: TObject);
var
   temp_Empno,temp_Empname:string;
   temp_TotalWorkDay,temp_TotalAttendDay,temp_SpecialAttendDay,arow:integer;
   temp_LateTime,temp_EarlyTime:array[1..3] of integer;
begin

  StringGridClear(sg_Statistic);
  
  if (cbb_year.Text ='') or (cbb_month.Text ='') then
  begin
    MessageBox(handle,'��ѡ��ͳ������!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;

  {if (length(trim(cbb_year.Text)))<>4 then
  begin
    MessageBox(handle,'��������ȷ����λ���!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end;

  if (not( (StrToInt(edt_month.Text)<10) and (Length(edt_month.Text)=1) )) and (not( (StrToInt(edt_month.Text)>=10) and (Length(edt_month.Text)=2) )) then
  begin
    MessageBox(handle,'��������ȷ��һλ����λ�·�!','��ʾ',mb_ok+mb_iconinformation);
    exit;
  end; }

  if not GetAttendTimeSet then exit;
  
  //�õ��������� , �õ���С������
  temp_MaxDate:=GetMaxDate(StrToInt(trim(cbb_year.Text)),StrToInt(trim(cbb_month.Text)));
  temp_MinDate:=trim(cbb_year.Text)+'-'+trim(cbb_month.Text)+'-'+'1';
  if length(trim(cbb_month.Text)) <2 then
     temp_yearmonth:= trim(cbb_year.Text)+ '-0'+ trim(cbb_month.Text)
  else
     temp_yearmonth:= trim(cbb_year.Text)+ '-'+ trim(cbb_month.Text);
  
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select emp_no,emp_name from employee';
    Open;
    arow:=1;
    while not eof do
    begin
      temp_Empno:=FieldByName('emp_no').AsString ;
      temp_Empname:=FieldByName('emp_name').asString;

      with dmod.ADOQuery2 do
      begin
        Close; //�õ��ܵĹ�������
        SQL.Text :='select count(*) as [count] from normalattend where emp_no='+#39+temp_Empno+#39+
                   ' and att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
        Open;
        temp_TotalWorkDay:=FieldByName('count').AsInteger ;
        //showmessage(inttostr(temp_TotalWorkDay));
        Close; //�õ��ܵĿ�������
        SQL.Text :='select count(*) as [count] from normalattend where emp_no='+#39+temp_Empno+#39+
                   ' and is_attend=''1'' and att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
        Open;
        temp_TotalAttendDay:=FieldByName('count').AsInteger ;
        //showmessage(inttostr(temp_TotalAttendDay));
        Close; //�õ����硢���硢���ϳٵ����������硢���硢�������˴���
        SQL.Text :='select * from normalattend where emp_no='+#39+temp_Empno+#39+
                   ' and att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
        Open;
        
        while not eof do
        begin
          //showmessage(FieldByName('pre_morning').AsString);
          if FieldByName('pre_morning').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('pre_morning').AsDateTime)) > StrToTime(time_set[0]) then
             temp_LateTime[1]:=temp_LateTime[1]+1;
          end;
          //showmessage(FieldByName('aft_morning').AsString);
          if FieldByName('aft_morning').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('aft_morning').AsDateTime)) < StrToTime(time_set[1]) then
             temp_EarlyTime[1]:=temp_EarlyTime[1]+1;
          end;
          //showmessage(FieldByName('pre_afternoon').AsString);
          if FieldByName('pre_afternoon').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('pre_afternoon').AsDateTime)) > StrToTime(time_set[2]) then
             temp_LateTime[2]:=temp_LateTime[2]+1;
          end;
          //showmessage(FieldByName('aft_afternoon').AsString);
          if FieldByName('aft_afternoon').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('aft_afternoon').AsDateTime)) < StrToTime(time_set[3]) then
             temp_EarlyTime[2]:=temp_EarlyTime[2]+1;
          end;
          //showmessage(FieldByName('pre_evening').AsString);
          if FieldByName('pre_evening').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('pre_evening').AsDateTime)) > StrToTime(time_set[4]) then
             temp_LateTime[3]:=temp_LateTime[3]+1;
          end;
          //showmessage(FieldByName('aft_evening').AsString);
          if FieldByName('aft_evening').AsString <> '' then
          begin
          if StrToTime(TimeToStr(FieldByName('aft_afternoon').AsDateTime)) < StrToTime(time_set[5]) then
             temp_EarlyTime[3]:=temp_EarlyTime[3]+1;
          end;

          next;
        end;

        Close;//�õ��ܵ����⿼�ڴ���
        SQL.Text :='select count(*) as [count] from SpecialAttend where emp_no='+#39+temp_Empno+#39+
                   ' and att_date between '+#39+temp_MinDate+#39+' and '+#39+temp_MaxDate+#39;
        Open;
        temp_SpecialAttendDay:=FieldByName('count').AsInteger ;
        
      end;

      with sg_Statistic do
      begin
        Cells[0,arow]:=temp_Empno;
        Cells[1,arow]:=temp_Empname;
        Cells[2,arow]:=IntToStr(temp_TotalWorkDay);
        Cells[3,arow]:=IntToStr(temp_TotalAttendDay);
        Cells[4,arow]:=IntToStr(temp_LateTime[1]);
        Cells[5,arow]:=IntToStr(temp_EarlyTime[1]);
        Cells[6,arow]:=IntToStr(temp_LateTime[2]);;
        Cells[7,arow]:=IntToStr(temp_EarlyTime[2]);
        Cells[8,arow]:=IntToStr(temp_LateTime[3]);;
        Cells[9,arow]:=IntToStr(temp_EarlyTime[3]);
        Cells[10,arow]:=IntToStr(temp_LateTime[1]+temp_LateTime[2]+temp_LateTime[3]);
        Cells[11,arow]:=IntToStr(temp_EarlyTime[1]+temp_EarlyTime[2]+temp_EarlyTime[3]);
        cells[12,arow]:=IntToStr(temp_SpecialAttendDay);
      end;
      inc(arow);
      next;
    end;
  end;

  if arow<>1 then
  begin
    sg_Statistic.RowCount := arow+1;
    SaveAttendStatistic;
  end;
end;

procedure Tfrm_attendstat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_attendstat:=nil;
end;

procedure Tfrm_attendstat.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_attendstat.sg_StatisticSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Statistic.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Statistic.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_attendstat.sbtn_ShowClick(Sender: TObject);
begin
  GetDetailNormalAttendInfo(sg_Statistic.Cells[0,sg_statistic.row],sg_Statistic.Cells[1,sg_statistic.row],temp_MinDate,temp_Maxdate);
  GetDetailSpecialAttendInfo(sg_Statistic.Cells[0,sg_statistic.row],sg_Statistic.Cells[1,sg_statistic.row],temp_MinDate,temp_Maxdate);
end;

procedure Tfrm_attendstat.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pagecontrol1.ActivePage = sht_statdetail then exit;
  
  AllowChange := true;
  if sg_Statistic.cells[0,sg_Statistic.Row ]='' then
  begin
    //MessageBox(handle,'����ѡ��һλԱ����¼���ٲ鿴��ϸ��Ϣ!','��ʾ',mb_ok+mb_iconinformation);
    AllowChange:=false;
    exit;
  end;

  sbtn_ShowClick(nil);
end;

procedure Tfrm_attendstat.sbtn_backClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_statList then
  begin
    if sg_Statistic.Row > sg_Statistic.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_Statistic.Row := sg_Statistic.Row+1;
  end else begin
    if sg_Detail.Row > sg_Detail.RowCount-2 then
    begin
       sbtn_back.Enabled := false;
       exit;
    end;
    sbtn_front.Enabled := true;
    sg_Detail.Row := sg_Detail.Row+1
  end;
end;

procedure Tfrm_attendstat.sbtn_frontClick(Sender: TObject);
begin
  if pagecontrol1.ActivePage = sht_statList then
  begin
    if sg_Statistic.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_Statistic.Row := sg_Statistic.Row-1;
  end else begin
    if sg_Detail.Row=1 then
    begin
      sbtn_front.Enabled := false;
      exit;
    end;
    sbtn_back.Enabled := true;
    sg_Detail.Row := sg_Detail.Row-1;
  end;
end;

procedure Tfrm_attendstat.sg_DetailSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Detail.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Detail.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_attendstat.sbtn_printClick(Sender: TObject);
begin
  DoReportAttendStatistic;
end;

end.