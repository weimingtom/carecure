unit Unit_SalaryManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Buttons, StdCtrls, ComCtrls;

type
  Tfrm_salarymanager = class(TForm)
    sg_salary: TStringGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sbtn_front: TSpeedButton;
    sbtn_back: TSpeedButton;
    sbtn_close: TSpeedButton;
    sbtn_save: TSpeedButton;
    Label1: TLabel;
    sbtn_salarymanager: TSpeedButton;
    sbtn_print: TSpeedButton;
    sbtn_edit: TSpeedButton;
    cbb_Year: TComboBox;
    Label2: TLabel;
    cbb_Month: TComboBox;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_backClick(Sender: TObject);
    procedure sbtn_frontClick(Sender: TObject);
    procedure sg_salarySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbtn_salarymanagerClick(Sender: TObject);
    procedure sbtn_saveClick(Sender: TObject);
    procedure sbtn_editClick(Sender: TObject);
    procedure sbtn_printClick(Sender: TObject);
  private
    { Private declarations }
    SalaryAddItems: array of string;
    SalaryReducedItems: array of string;
    search_year_month:string;
    addcount,reducedcount: integer;
    addamount,reducedamount: double;

    procedure SearchExistedEmployeeSalary(temp:string);
  public
    { Public declarations }
    procedure SalaryManager_ref;
  end;

var
  frm_salarymanager: Tfrm_salarymanager;

implementation

  uses unit_DataModule,unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

{****************************************************}
procedure Tfrm_salarymanager.SalaryManager_ref ;
var
  i:integer;
begin

  with dmod.ADOQuery1 do
  begin
    //查找增加工资的项目
    Close;
    SQL.Text :='select count(*) as [count] from salaryitem where add_or_reduced=''0''';
    Open;
    SetLength(SalaryAddItems,FieldByName('count').AsInteger);

    Close;
    SQL.Text :='select item_name,default_price from salaryitem where add_or_reduced=''0''';
    Open;
    i:=0;
    while not eof do
    begin
      SalaryAddItems[i]:=FieldByName('item_name').AsString +'-'+FloatToStr(FieldByName('default_price').AsFloat);

      inc(i);
      next;
    end;
    addcount:=i;
    //查找扣除工资的项目
    Close;
    SQL.Text :='select count(*) as [count] from salaryitem where add_or_reduced=''1''';
    Open;
    SetLength(SalaryReducedItems,FieldByName('count').AsInteger);

    Close;
    SQL.Text :='select item_name,default_price from salaryitem where add_or_reduced=''1''';
    Open;
    i:=0;
    while not eof do
    begin
      SalaryReducedItems[i]:=FieldByName('item_name').AsString +'-'+FloatToStr(FieldByName('default_price').AsFloat);

      inc(i);
      next;
    end;
    reducedcount:=i;
  end;

  with sg_salary do
  begin
    cells[0,0]:='员工编号';
    cells[1,0]:='员工编号';
    cells[2,0]:='基本工资';
    cells[3,0]:='服务提成';

    for i:=0 to addcount-1 do
    begin
      cells[4+i,0]:=StringGetChar(SalaryAddItems[i],'-'); //使得代表工资添加项目的数组变化
    end;

    for i:=0 to reducedcount-1 do
    begin
      cells[4+addcount+i,0]:=StringGetChar(SalaryReducedItems[i],'-');  //使得代表工资减少项目的数组变化
    end;

    cells[4+addcount+reducedcount,0]:='应发工资';
  end;
  sg_salary.ColCount :=5+addcount+reducedcount;

  //sbtn_edit.Enabled := GetPower(SysUserId,'工资管理','修改权');
  sbtn_print.Enabled := GetPower(SysUserId,'工资管理','打印权');
end;

procedure Tfrm_salarymanager.SearchExistedEmployeeSalary(temp:string);
var
  arow,i,dcols:integer;
  temp_empno:string;
begin
  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select b.emp_no,emp_name,b_salary,s_extra,t_salary from salarybasic b,employee e '+
               ' where b.emp_no=e.emp_no and year_month='+#39+temp+#39;
    Open;
    arow:=1;
    while not eof do
    begin
      temp_empno:=FieldByName('emp_no').AsString;
      sg_salary.Cells[0,arow]:=temp_empno;
      sg_salary.Cells[1,arow]:=FieldByName('emp_name').AsString ;
      sg_salary.Cells[2,arow]:=FLoatToStr(FieldByName('b_salary').AsFloat);
      sg_salary.Cells[3,arow]:=FloatToStr(FieldbyName('s_extra').AsFloat);

      with dmod.ADOQuery2 do
      begin
        Close;
        SQL.Text :='select distinct item_name from salarydynamic where year_month='+#39+temp+#39+' order by item_name';
        Open;
        dcols:=0;
        while not eof do
        begin
          sg_salary.Cells[4+dcols,0]:= FieldByName('item_name').AsString ;
          inc(dcols);
          next;
        end;
        sg_salary.Cells[4+dcols,0]:='应发工资';
      end;

      for i:=0 to dcols-1 do
      begin
        with dmod.ADOQuery2 do
        begin
          Close;
          SQL.Text :='select item_value from salarydynamic where emp_no='+#39+temp_empno+#39+
                   ' and item_name='+#39+sg_salary.Cells[4+i,0]+#39+
                   ' and year_month='+#39+temp+#39;
          Open;
          sg_salary.Cells[4+i,arow]:=FloatToStr(FieldByName('item_value').asFloat);
        end;
      end;

      sg_salary.Cells[4+dcols,arow]:=FloatToStr(FieldByName('t_salary').AsFloat);

      inc(arow);
      next;
    end;
  end;
  if arow<>1 then
  begin
    sg_salary.RowCount :=arow+1;
    sbtn_edit.Enabled:=true;
    sbtn_save.Enabled:=true;
    sbtn_edit.Enabled := GetPower(SysUserId,'工资管理','修改权');
    sbtn_save.Enabled := sbtn_edit.Enabled ;
  end;
end;
{*****************************************************************}
procedure Tfrm_salarymanager.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_salarymanager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_salarymanager:=nil;
end;

procedure Tfrm_salarymanager.sbtn_backClick(Sender: TObject);
begin
  if sg_Salary.Row > sg_Salary.RowCount-2 then
  begin
     sbtn_back.Enabled := false;
     exit;
  end;
  sbtn_front.Enabled := true;
  sg_Salary.Row := sg_Salary.Row+1;
end;

procedure Tfrm_salarymanager.sbtn_frontClick(Sender: TObject);
begin
  if sg_Salary.Row=1 then
  begin
    sbtn_front.Enabled := false;
    exit;
  end;

  sbtn_back.Enabled := true;
  sg_Salary.Row := sg_Salary.Row-1;
end;

procedure Tfrm_salarymanager.sg_salarySelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = sg_Salary.RowCount - 1 then
    CanSelect:= false
  else
  begin
    sbtn_back.Enabled := true;
    sbtn_front.Enabled := true;
    if ARow = sg_Salary.RowCount - 2 then sbtn_back.Enabled := false;
    if ARow = 1 then sbtn_front.Enabled := false;
    CanSelect := true;
  end;
end;

procedure Tfrm_salarymanager.sbtn_salarymanagerClick(Sender: TObject);
var
  temp,temp_year,temp_mindate,temp_maxdate,temp_sql:string;
  temp_empno,temp_itemid,temp_typeid:string;
  i,arow:integer;
  tc_items,tc_meals,totalsalary:double;
begin

  temp:= trim(cbb_year.Text+'-'+cbb_month.Text);
  search_year_month:=trim(cbb_year.Text+'-'+cbb_month.Text);
  if temp ='' then exit;
  
  //首先查找该年月的员工工资是否已经保存在数据库中
  {with dmod.adoquery1 do
  begin
    Close;
    SQL.Text :='select count(*) as [count] from salarybasic where year_month='+#39+search_year_month+#39;
    Open;
    if FieldByName('count').AsInteger >0 then
    begin
      SearchExistedEmployeeSalary(search_year_month);
      StatusBar1.Panels[0].Text :='统计月份:'+trim(edt_SalaryStatistic.Text);
      StatusBar1.Panels[1].Text :='提示:工资数据直接从数据库取得';
      exit;
    end;
  end; }

  temp_mindate:= trim(cbb_year.Text+'-'+cbb_month.Text)+'-01';
  temp_year:=StringGetChar(temp,'-');
  temp_maxdate:=GetMaxDate(StrToInt(temp_year),StrToInt(copy(temp,2,length(temp))));

  with dmod.ADOQuery1 do
  begin
    Close;
    SQL.Text :='select emp_no,emp_name from employee order by emp_no';
    Open;
    arow:=1;
    while not eof do
    begin
      //设置最基本两项
      temp_empno:=FieldByName('emp_no').AsString;
      sg_salary.Cells[0,arow]:=FieldByName('emp_no').AsString ;
      sg_salary.Cells[1,arow]:=FieldByName('emp_name').AsString ;

      //查找基本工资
      dmod.ADOQuery2.Close ;
      dmod.ADOQuery2.SQL.Text :='select b_salary from EmployeeBasicSalary where emp_no='+#39+temp_empno+#39;
      dmod.ADOQuery2.Open ;
      sg_salary.Cells[2,arow]:=FloatToStr(dmod.ADOQuery2.fieldbyname('b_salary').asfloat) ;

      //计算员工提成---仅针对单个服务
      tc_items:=0.0;
      dmod.ADOQuery2.Close ;
      dmod.ADOQuery2.SQL.Text :='select ccd.item_id,cc.cost_date from customercost cc,customercostdetail ccd '+
                               ' where cc.cost_no=ccd.cost_no and cost_date between '+#39+temp_mindate+#39+' and '+
                               #39+temp_maxdate+#39+' and ccd.emp_no='+#39+temp_empno+#39+' and ccd.itemortype=''0'''+
                               ' order by cc.cost_no';
      dmod.ADOQuery2.Open ;   //得到这个月以来该员工所有提供的服务列表
      while not dmod.ADOQuery2.Eof do
      begin
        temp_itemid:=dmod.ADOQuery2.fieldbyname('item_id').AsString ;

        dmod.ADOQuery3.Close;
        dmod.ADOQuery3.SQL.Text :='select distinct conf_type from serviceitemextra';
        dmod.ADOQuery3.Open ;
        if dmod.ADOQuery3.FieldByName('conf_type').AsString ='0' then        //如果采用统一设置
           temp_sql:='select tc_type,tc_value,item_price from serviceitemextra,serviceitem where serviceitemextra.item_id=serviceitem.item_id and serviceitemextra.item_id='+#39+temp_itemid+#39
        else  if dmod.ADOQuery3.FieldByName('conf_type').AsString ='1' then  //如果采用分别设置
           temp_sql:='select tc_type,tc_value,item_price from serviceitemextra,serviceitem where serviceitemextra.item_id=serviceitem.item_id and serviceitemextra.item_id='+#39+temp_itemid+#39+' and emp_no='+#39+temp_empno+#39;

        dmod.ADOQuery3.Close ;
        dmod.ADOQuery3.SQL.Text :=temp_sql;
        dmod.ADOQuery3.Open ;
        if dmod.ADOQuery3.FieldByName('tc_type').AsString ='0' then         //如果采用固定提成
          tc_items:=tc_items+dmod.ADOQuery3.fieldbyname('tc_value').AsFloat
        else if dmod.ADOQuery3.FieldByName('tc_type').AsString ='0' then    //如果采用按百分比提成
          tc_items:=tc_items+dmod.ADOQuery3.fieldbyname('tc_value').AsFloat*dmod.ADOQuery3.fieldbyname('item_price').AsFloat;

        dmod.ADOQuery2.next;
      end;

      //计算员工提成---仅针对套餐服务
      tc_meals:=0.0;
      dmod.ADOQuery2.Close ;
      dmod.ADOQuery2.SQL.Text :='select ccd.type_id,cc.cost_date from customercost cc,customercostdetail ccd '+
                               ' where cc.cost_no=ccd.cost_no and cost_date between '+#39+temp_mindate+#39+' and '+
                               #39+temp_maxdate+#39+' and ccd.emp_no='+#39+temp_empno+#39+' and ccd.itemortype=''1'''+
                               ' order by cc.cost_no';
      dmod.ADOQuery2.Open ;   //得到这个月以来该员工所有提供的服务列表
      while not dmod.ADOQuery2.Eof do
      begin
        temp_typeid:=dmod.ADOQuery2.fieldbyname('type_id').AsString ;

        dmod.ADOQuery3.Close;
        dmod.ADOQuery3.SQL.Text :='select distinct conf_type from servicemealextra';
        dmod.ADOQuery3.Open ;
        if dmod.ADOQuery3.FieldByName('conf_type').AsString ='0' then        //如果采用统一设置
           temp_sql:='select tc_type,tc_value,promotion_sum from servicemealextra,servicemealtype where servicemealextra.type_id=servicemealtype.type_id and servicemealextra.type_id='+#39+temp_typeid+#39
        else  if dmod.ADOQuery3.FieldByName('conf_type').AsString ='1' then  //如果采用分别设置
           temp_sql:='select tc_type,tc_value,promotion_sum from servicemealextra,servicemealtype where servicemealextra.type_id=servicemealtype.type_id and servicemealextra.type_id='+#39+temp_typeid+#39+' and emp_no='+#39+temp_empno+#39;

        dmod.ADOQuery3.Close ;
        dmod.ADOQuery3.SQL.Text :=temp_sql;
        dmod.ADOQuery3.Open ;
        if dmod.ADOQuery3.FieldByName('tc_type').AsString ='0' then         //如果采用固定提成
          tc_meals:=tc_meals+dmod.ADOQuery3.fieldbyname('tc_value').AsFloat
        else if dmod.ADOQuery3.FieldByName('tc_type').AsString ='0' then    //如果采用按百分比提成
          tc_meals:=tc_meals+dmod.ADOQuery3.fieldbyname('tc_value').AsFloat*dmod.ADOQuery3.fieldbyname('promotion_sum').AsFloat;

        dmod.ADOQuery2.next;
      end;

      sg_salary.Cells[3,arow]:=FloatToStr(tc_items+tc_meals);

      //得到其他工资增加项目
      for i:=0 to addcount-1 do
      begin
        sg_salary.cells[4+i,arow]:=copy(SalaryAddItems[i],2,length(SalaryAddItems[i]));
      end;
      //得到其他工资减少项目
      for i:=0 to reducedcount-1 do
      begin
        sg_salary.cells[4+addcount+i,arow]:=copy(SalaryReducedItems[i],2,length(SalaryReducedItems[i]));
      end;

      //计算应该发的工资
      totalsalary:=0.0;
      totalsalary:=StrToFloat(sg_salary.cells[2,arow])+StrToFloat(sg_salary.cells[3,arow]);
      for i:=0 to addcount-1 do
      begin
        totalsalary:=totalsalary+StrToFloat(sg_salary.Cells[4+i,arow]);
      end;
      for i:=0 to reducedcount-1 do
      begin
        totalsalary:=totalsalary-StrToFloat(sg_salary.Cells[4+addcount+i,arow]);
      end;
      sg_salary.cells[4+addcount+reducedcount,arow]:=FloatToStr(totalsalary);

      inc(arow);
      next;//员工记录下移一条;
    end;
  end;
  StatusBar1.Panels[0].Text :='统计月份:'+trim(cbb_year.Text+'-'+cbb_month.Text);
  //StatusBar1.Panels[1].Text :='提示:工资数据未保存到数据库';
  if arow<>1 then
  begin
    sg_salary.RowCount :=arow+1;
    sbtn_edit.Enabled:=true;
    sbtn_save.Enabled:=true;
    sbtn_edit.Enabled := GetPower(SysUserId,'工资管理','修改权');
    sbtn_save.Enabled := sbtn_edit.Enabled ;
  end;
end;

procedure Tfrm_salarymanager.sbtn_saveClick(Sender: TObject);
var
  arow,i:integer;
begin
  try
    dmod.ADOConn.BeginTrans ;
    with dmod.ADOQuery1 do
    begin
      Close;
      SQL.Text :='select count(*) as [count] from salarybasic where year_month='+#39+Search_Year_Month+#39;
      Open;
      if FieldByName('count').AsInteger >0 then
      begin
        Close;
        SQL.Text :='delete from salarybasic where year_month='+#39+Search_Year_Month+#39;
        ExecSQL;

        Close;
        SQL.Text :='delete from salarydynamic where year_month='+#39+Search_Year_month+#39;
        ExecSQL;
      end;

      for arow:=1 to sg_salary.RowCount-2 do
      begin
        Close;
        SQL.Text :='Insert into salarybasic(emp_no,b_salary,s_extra,t_salary,o_add,o_reduced,year_month) '+
                   ' values(:empno,:bsalary,:sextra,:tsalary,:oadd,:oreduced,:yearmonth)';
        Parameters.ParamValues['empno'] :=sg_salary.Cells[0,arow];
        Parameters.ParamValues['bsalary'] :=StrToFloat(sg_salary.Cells[2,arow]);
        Parameters.ParamValues['sextra'] :=StrToFloat(sg_salary.Cells[3,arow]);
        Parameters.ParamValues['tsalary'] :=StrToFloat(sg_salary.Cells[4+addcount+reducedcount,arow]);
        addamount:=0.0;
        for i:=0 to addcount-1 do
        begin
          addamount:=addamount+StrToFloat(sg_salary.Cells[4+i,arow]);
        end;
        Parameters.ParamValues['oadd']    := addamount;
        reducedamount:=0.0;
        for i:=0 to reducedcount-1 do
        begin
          reducedamount:=reducedamount+ StrToFloat(sg_salary.Cells[4+addcount+i,arow]);
        end;
        Parameters.ParamValues['oreduced']:= reducedamount;
        Parameters.ParamValues['yearmonth'] := Search_Year_Month;
        ExecSQL;

        for i:=0 to addcount-1 do
        begin
          Close;
          SQL.Text :='insert into salarydynamic(emp_no,item_name,item_value,year_month) '+
                   ' values(:empno,:itemname,:itemvalue,:yearmonth)';
          Parameters.ParamValues['empno'] :=sg_salary.Cells[0,arow];
          Parameters.ParamValues['itemname'] :=sg_salary.Cells[4+i,0];
          Parameters.ParamValues['itemvalue'] :=StrToFloat(sg_salary.Cells[4+i,arow]);
          Parameters.ParamValues['yearmonth'] := Search_Year_Month;
          ExecSQL;
        end;

        for i:=0 to reducedcount-1 do
        begin
          Close;
          SQL.Text :='insert into salarydynamic(emp_no,item_name,item_value,year_month) '+
                   ' values(:empno,:itemname,:itemvalue,:yearmonth)';
          Parameters.ParamValues['empno'] :=sg_salary.Cells[0,arow];
          Parameters.ParamValues['itemname'] :=sg_salary.Cells[4+addcount+i,0];
          Parameters.ParamValues['itemvalue'] :=StrToFloat(sg_salary.Cells[4+addcount+i,arow]);
          Parameters.ParamValues['yearmonth'] := Search_Year_Month;
          ExecSQL;
        end;

      end;
    end;
  finally
    try
      dmod.ADOConn.CommitTrans ;
      MessageBox(handle,'员工该月份的工资已经保存到数据库!','提示',mb_ok+mb_iconinformation);
      sg_salary.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goTabs,goRowSelect];
      sbtn_save.Enabled :=false;
      sbtn_edit.Enabled :=false;
    except
      dmod.ADOConn.RollbackTrans ;
      MessageBox(handle,'员工该月份的工资保存到数据库失败!','提示',mb_ok+mb_iconinformation);
    end;
  end;
end;

procedure Tfrm_salarymanager.sbtn_editClick(Sender: TObject);
begin
  sg_salary.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goTabs,goEditing];
end;

procedure Tfrm_salarymanager.sbtn_printClick(Sender: TObject);
begin
  DoReportSalary;
end;

end.