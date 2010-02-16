unit PublicFunOrPro;
interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg, Menus, ComCtrls, ToolWin, Buttons,winsock,Grids,
   OleCtnrs, Db, DBTables, ImgList,shellapi,ADODB ;

  Type TSysInfo = record
     Caption: String;
     str_CurrentDir :string;            //当前运行的目录
     compuser : string;                 //计算机登录的用户名；
     hostname : string;                 //计算机的名称；
     hostip   : string;                 //主机的IP地址；
     name_id  : string;                 //系统用户名；
     name_yh  : string;                 //用户姓名；
  end;

//************************************************************//

  procedure SysInfo_ini();         //得到用户名； 初始化ＳysInfo
  function  sgcomp(sg0:tstringgrid;s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:string):Boolean; // 比较是否有重复的"|/"表示不考
  procedure DeleteOneRow(TempString: TStringGrid);
  procedure AppendBlankRow(TempString: TStringGrid);
  function  DateToString(Date1:Tdate):string;                         //把日期转为字符串            decodedate
  function  GetSubStr(str:string):string;                             //读字符串'aaa(bbb)'中的'bbb'  ;
  function  stringNotChar(SString,SChar:string):boolean;              //判断SString中没有Schar;
  Function  StringGetChar(var SString:String;SChar:String):string;    //从SString中得到第一个以SChar分开的字符串；
  procedure stringgriddelete(stringgrida:tStringGrid;arow:integer);   //把 stringgridA 的第 AROW 行删除；
  procedure stringgridinsert(stringgrida:tstringgrid);                //在 stringgridA 的最前面加一行；
  Procedure StringgridClear(Stringgrida:Tstringgrid);                 //清除Stringgrida所有内容;
  Procedure StringgridAutoSize(Stringgrida:Tstringgrid);              //使stringgrid自动长度；
  function LoadImage(TempImage: TImage; FileName: string): Boolean;   //在Image控件中加入图片
  function  stringgridRepeat(Stringgrida:Tstringgrid;ACol:integer;SString:String):boolean;      //stringgrid的ACol列是否有重复；
  function  StringgridAddString(Stringgrida:Tstringgrid;ACol:integer;SString:String):string;    //把Stringgrid的所有ACOL列以SString加在一起；
  function  GetNo(SDatabaseName:string;STableName,selectFieldName,SelectFiledValue,
                  SFieldName,StartString:string;IDigit:integer):string;
  function GetNo2(STableName,selectFieldName,SelectFiledValue,
                  SFieldName,StartString:string;IDigit:integer):string;
  function HaveField(SDatabaseName,StableName,SelectFieldName,SelectFiledValue:string):boolean;
  function havelikeField(SDatabaseName,StableName,SelectFieldName,SelectFiledValue:string):boolean;
  function getIndex(SS:string;Sarray : Array of String):Integer;
  Function GetComboboxIndex(SS:string;ComboboxX:Tcombobox):integer;
  function GetDateString(SDatabaseName: string): string;
  function GetDateTimeString(SDatabaseName: string): string;
  function MoveRow(TempString: TStringGrid; Symbol: Boolean): Boolean;
  function GetMaxDate(temp_year,temp_month:integer):string;
  procedure StringGridDrawCell(Sender: TObject; ACol,
                      ARow: Integer; Rect: TRect; State: TGridDrawState);
  var SysInfo :TsysInfo;
      DB_CONNString: string;

implementation
uses
   unit_DataModule ;


function  sgcomp(sg0:tstringgrid;s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:string):Boolean; // 比较是否有重复的
var i1:integer;
    t1:boolean;
begin
  i1:=1;
  result:=false;
  if sg0.Cells[0,i1]<>'' then
  begin
    while sg0.Cells[0,i1]<>'' do
    begin
      t1:=true;
      if s0<>'|/' then if sg0.cells[0,i1]<>s0 then t1:=false;
      if (s1<>'|/')and(T1) then if  sg0.cells[1,i1]<>s1 then t1:=false;
      if (s2<>'|/')and(T1) then if  sg0.cells[2,i1]<>s2 then t1:=false;
      if (s3<>'|/')and(T1) then if  sg0.cells[3,i1]<>s3 then t1:=false;
      if (s4<>'|/')and(T1) then if  sg0.cells[4,i1]<>s4 then t1:=false;
      if (s5<>'|/')and(T1) then if  sg0.cells[5,i1]<>s5 then t1:=false;
      if (s6<>'|/')and(T1) then if  sg0.cells[6,i1]<>s6 then t1:=false;
      if (s7<>'|/')and(T1) then if  sg0.cells[7,i1]<>s7 then t1:=false;
      if (s8<>'|/')and(T1) then if  sg0.cells[8,i1]<>s8 then t1:=false;
      if (s9<>'|/')and(T1) then if  sg0.cells[9,i1]<>s9 then t1:=false;
      if (s10<>'|/')and(T1) then if  sg0.cells[10,i1]<>s10 then t1:=false;
      i1:=i1+1;
      if t1 then break;
    end;
    result:=t1;
  end;
end;

procedure StringGridDrawCell(Sender: TObject; ACol,
                      ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  tstringgrid(sender).Canvas.Font.Size:=10;
  tstringgrid(sender).Canvas.Font.Name:='宋体' ;
  tstringgrid(sender).Canvas.font.Color:=clwindowtext;
  tstringgrid(sender).Canvas.Brush.Color:=$00D6F2F3;
  if gdselected in state then
  begin
    tstringgrid(sender).Canvas.Brush.Color:=clBlack;
    tstringgrid(sender).Canvas.font.Color:=clWhite;
  end;
  if gdfixed in state then
  begin
    tstringgrid(sender).Canvas.Brush.Color:=$00A1B6B7;
    tstringgrid(sender).Canvas.TextRect(rect,rect.left,rect.top+1,' '+tstringgrid(sender).Cells[acol,arow]);
  end else tstringgrid(sender).Canvas.TextRect(rect,rect.left,rect.top,tstringgrid(sender).Cells[acol,arow]);
end;

function LoadImage(TempImage: TImage; FileName: string): Boolean;
var
  I,J,LastWidth,LastHeight: Integer;
  Extension               : string;
begin
    Result := True;
    if FileName='' then
    begin
      Result := False;
      Exit
    end;

    if not FileExists(FileName) then
    begin
      MessageBox(Application.Handle,'指定的文件不存在,重新确认!','信息',MB_OK+MB_ICONINFORMATION);
      Result := False;
      Exit
    end;

    TempImage.Stretch := False;
    // 获取文件的扩展名
    Extension := copy(FileName,pos('.',FileName)+1,3);
    // 驻册这个扩展名
    TempImage.Picture.RegisterFileFormat('*',Extension,TGraphic);
    try
     //装入图片
      TempImage.Picture.LoadFromFile(FileName);
      LastWidth := TempImage.Width;
      LastHeight := TempImage.Height ;
      I:=TempImage.Picture.Height ;
      J:=TempImage.Picture.Width ;
      TempImage.Stretch :=False;
      if (I>TempImage.Height) or (J>TempImage.Width) then
      begin
        TempImage.Stretch := True;
        if I>J then
          TempImage.Height := Trunc(TempImage.Width* I/J )
        else
          TempImage.Width := Trunc(TempImage.Height* J/I );

        if (TempImage.Height>LastHeight) or (TempImage.Width>LastWidth) then
        begin
          if TempImage.Height>LastHeight  then
          begin
            TempImage.Height :=LastHeight;
            TempImage.Width :=Trunc(LastHeight*J/I)
          end
          else
          begin
            TempImage.Width :=LastWidth;
            TempImage.Height :=Trunc(LastWidth*I/J)
          end
        end
      end;
    except
      Result := False;
      MessageBox(Application.Handle,'文件不存在或已破坏！','错误',MB_OK+MB_ICONINFORMATION);
    end;
end;


//得到计算机名与IP（IP为GETIP的返回值，参数NAME为计算机名）；
function getiP(var name :string):string;
type
  tapinaddr = array [0..10] of pinaddr;
  papinaddr = ^tapinaddr;
var
  Phe  : phostent;
  pptr : papinaddr;
  buffer : array[0..63] of char;
  i : integer;
  ginitdata : twsadata;
  a:string;
begin
  a:='';
  wsastartup($101,ginitdata);
  result:='';
  for i:=0 to 63 do
  begin
    buffer[i]:=' ';
  end;
  gethostname(buffer,sizeof(buffer));
  for i:=0 to 63 do
  begin
    if buffer[i]>' ' then a:=a+buffer[i];
  end;
  name:=trim(a);
  phe:=gethostbyname(buffer);
  if phe=nil then exit;
  pptr:=papinaddr(phe^.h_addr_list);
  i:=0;
  while pptr^[i]<>nil do
  begin
    result:=strpas(inet_ntoa(pptr^[i]^));
    inc(i);
  end;
  wsacleanup;
end;

//得到用户名； 初始化ＳysInfo
procedure SysInfo_ini();
var  user : pchar;
     l    : dword;
begin
  SysInfo.str_CurrentDir:=GetCurrentDir;
  if copy(SysInfo.str_currentdir,length(SysInfo.str_currentdir),1)<>'\' then
     SysInfo.str_currentdir:=SysInfo.str_currentdir+'\';
  //用户名
  l:=1024;
  user:=stralloc(succ(l));
  if getusername(user,l) then SysInfo.compuser:=strpas(user)
  else SysInfo.compuser:='?';
  strdispose(user);
  SysInfo.hostip:=getip(SysInfo.hostname);
end;

//*********************************************************//

function  DateToString(Date1:Tdate):string;
var year1,monse1,date2:word;
    y,m,d:string;
begin
  decodedate(date1,year1,monse1,date2);
  y:=inttostr(year1);
  m:=inttostr(monse1);
  d:=inttostr(date2) ;
  if length(m)=1 then m:='0'+m;
  if length(d)=1 then d:='0'+d;
  result:=y+'-'+m+'-'+d;
end;
//读字符串'aaa(bbb)'中的'bbb'  ;
function  GetSubStr(str:string):string;
var i1:integer;
    str1:string;
begin
  str1:='';
  i1:=1;
  while ( copy(str,i1,1)<>'(') and (i1<length(str)) do
  begin
    i1:=i1+1;
  end;
  i1:=i1+1;
  if i1<length(str) then str1:=copy(str,i1,length(str)-i1)
  else str1:=str;
  result:=str1;
end;

function  stringNotChar(SString,SChar:string):boolean;
var i1:integer;
begin
  result:=True;
  for i1:=1 to length(SString) do
  begin
    if copy(SString,i1,1)=Schar then
    begin
      result := false;
      break;
    end;
  end;
end;

Function  StringGetChar(var SString:String;SChar:String):string;
var i1:integer;
begin
  result:='';
  while copy(SString,1,1)=SChar do
  begin
    SString:=copy(SString,2,Length(SString)-1);
    if Length(SString)=0 then break;
  end;
  if Length(SString)=0 then exit;
  while Copy(SString,1,1)<>SChar do
  begin
    result:=result+Copy(SString,1,1);
    SString:=copy(SString,2,Length(SString)-1);
    if Length(SString)=0 then break;
  end;
end;

//把 stringgridA 的第 AROW 行删除；
procedure stringgriddelete(stringgrida:tStringGrid;arow:integer);
var
  i1,j1:integer;
begin
  for i1:=0    to stringgrida.ColCount+11 do
  for j1:=arow to stringgrida.RowCount+10   do
    stringgrida.Cells[i1,j1]:=stringgrida.Cells[i1,j1+1];
  stringgrida.RowCount:=stringgrida.RowCount-1;
end;

//在 stringgridA 的最前面加一行；
procedure stringgridinsert(stringgrida:tstringgrid);
var
  i1,j1:integer;
begin
  stringgrida.RowCount:=stringgrida.RowCount+1;
  for i1:=0 to stringgrida.ColCount+11     do
  for j1:=stringgrida.RowCount+10 downto 2 do
    stringgrida.Cells[i1,j1]:=stringgrida.Cells[i1,j1-1];
  for i1:=0 to stringgrida.ColCount+1 do
    stringgrida.Cells[i1,1]:='';
end;

Procedure StringgridClear(Stringgrida:Tstringgrid);
var i1,j1:integer;
begin
  for i1:=0 to stringgrida.ColCount do
  for j1:=1 to stringgrida.RowCount do
  begin
    stringgrida.Cells[i1,j1]:='';
  end;
  stringgrida.RowCount:=2;
end;

Procedure StringgridAutoSize(Stringgrida:Tstringgrid);
Var i1,length1:integer;
begin
  length1:=0;
  for i1:=0 to stringgrida.ColCount-2 do
  begin
    length1:=length1+stringgrida.ColWidths[i1]+1;
  end;
  stringgrida.ColWidths[stringgrida.ColCount-1]:=stringgrida.Width-length1-5;
end;

function  stringgridRepeat(Stringgrida:Tstringgrid;ACol:integer;SString:String):boolean;
var i1:integer;
begin
  result:=false;
  i1:=0;
  while i1<stringgrida.RowCount do
  begin
    if SString=Stringgrida.Cells[ACol,i1] then
    begin
      result:=true;
      break;
    end;
    i1:=i1+1;
  end;
end;

function  StringgridAddString(Stringgrida:Tstringgrid;ACol:integer;SString:String):string;
var i1:integer;
begin
  result:='';
  for i1:=1 to stringgrida.RowCount-1 do
  begin
    if Stringgrida.Cells[aCol,i1]='' then Continue;
    result:=result+stringgrida.Cells[ACol,i1]+SString;
  end;
  result:=copy(result,1,length(result)-length(SString));
end;

{功能：自动生成编号
 Select***  :选择条件；
 StartString: 编号的前面固定位
 IDigit:    编号的后面自动生成的位数}
function GetNo(SDatabaseName:string;STableName,selectFieldName,SelectFiledValue,
                  SFieldName,StartString:string;IDigit:integer):string;
Var query1:Tadoquery;
    SString1:string;
    i1:integer;
begin
  query1:=Tadoquery.Create(application);
  try
    query1.Connection := dmod.ADOConn ;
//    query1.DatabaseName:=SDatabasename;
    query1.SQL.Add('select ' +SFieldName+' from '+STableName+' where (');
    if SelectFieldName<>'' then
      query1.sql.Add(SelectFieldName+' like '+#39+SelectFiledValue+'%'+#39+')and(') ;
    query1.SQL.Add(SFieldName+' like '+#39+StartString+'%'+#39+') order by '+SFieldName );
    query1.Open;
    i1:=0;
    while Not( query1.Eof ) do
    begin
      SString1:=query1.FieldByName(SFieldName).asstring;
      if Length(SString1)= Length(StartString)+Idigit then
      begin
        SString1:=Copy(SString1,Length(StartString)+1,Idigit);
        if i1<>StrToint(SString1) then break;
        i1:=i1+1;
      end;
      query1.Next;
    end;
  finally
    query1.Free;
  end;
  SString1:=IntToStr(i1);
  while (length(SString1)<IDigit) do
  begin
    SString1:='0'+SString1;
  end;
  result:=StartString+SString1;
end;

{功能：在临时表中自动生成编号
 Select***  :选择条件；
 StartString: 编号的前面固定位
 IDigit:    编号的后面自动生成的位数}
function GetNo2(STableName,selectFieldName,SelectFiledValue,
                  SFieldName,StartString:string;IDigit:integer):string;
Var query1:Tadoquery;
    SString1:string;
    i1:integer;
begin
  query1:=Tadoquery.Create(application);
  try
    query1.Connection := dmod.ADOConn ;
    query1.SQL.Add('select ' +SFieldName+' from '+STableName+' where (');
    if SelectFieldName<>'' then
      query1.sql.Add(SelectFieldName+' like '+#39+SelectFiledValue+'%'+#39+')and(') ;
    query1.SQL.Add(SFieldName+' like '+#39+StartString+'%'+#39+') order by '+SFieldName );
    query1.Open;
    i1:=0;
    while Not( query1.Eof ) do
    begin
      SString1:=query1.FieldByName(SFieldName).asstring;
      if Length(SString1)= Length(StartString)+Idigit then
      begin
        SString1:=Copy(SString1,Length(StartString)+1,Idigit);
        if i1<>StrToint(SString1) then break;
        i1:=i1+1;
      end;
      query1.Next;
    end;
  finally
    query1.Free;
  end;
  SString1:=IntToStr(i1);
  while (length(SString1)<IDigit) do
  begin
    SString1:='0'+SString1;
  end;
  result:=StartString+SString1;
end;

function HaveField(SDatabaseName,StableName,SelectFieldName,SelectFiledValue:string):boolean;
Var query1:Tadoquery;
begin
  result:=true;
  query1:=Tadoquery.Create(application);
  try
    query1.close;
    query1.Connection := dmod.ADOConn ;
//    query1.DatabaseName:=SDatabaseName;
    query1.SQL.Clear;
    query1.SQL.Add('select '+SelectFieldName+ ' from '+StableName+
       ' where '+ SelectFieldName+' = '+ #39+SelectFiledValue+#39);
    query1.Open;
    if query1.Eof then result:=false;
  finally
    query1.Free;
  end;
end;

function HavelikeField(SDatabaseName,StableName,SelectFieldName,SelectFiledValue:string):boolean;
Var query1:Tadoquery;
begin
  result:=true;
  query1:=Tadoquery.Create(application);
  try
    query1.close;
//    query1.DatabaseName:=SDatabaseName;
    query1.Connection := dmod.ADOConn ;
    query1.SQL.Clear;
    query1.SQL.Add('select '+SelectFieldName+ ' from '+StableName+
       ' where '+ SelectFieldName+' like '+ #39+SelectFiledValue+'%'+#39);
    query1.Open;
    if query1.Eof then result:=false;
  finally
    query1.Free;
  end;
end;

procedure AppendBlankRow(TempString: TStringGrid);
var
  I: Integer;
begin
  with TempString do
    for I := 0 to TempString.ColCount -1 do
      TempString.Cells[I,TempString.RowCount] := '';
  TempString.RowCount := TempString.RowCount + 1;
end;

procedure DeleteOneRow(TempString: TStringGrid);
var
  I, J: Integer;
begin
  with TempString do
  begin
    for I := Row to RowCount - 2 do
    for J := 0 to ColCount - 1 do
      Cells[J,I] := Cells[J,I+1];
    RowCount := RowCount - 1
  end
end;

function getIndex(SS:string;Sarray : Array of String):Integer;
var i1:integer;
begin
  i1:=0;
  while i1<=high(Sarray) do
  begin
    if SS=Sarray[i1] then break;
    i1:=i1+1;
  end;
  if i1> High(Sarray) then i1:=-1;
  result:=i1;
end;

Function GetComboboxIndex(SS:string;ComboboxX:Tcombobox):integer;
var i1:integer;
begin
  i1:=0;
  while i1<=comboboxx.Items.Count-1 do
  begin
    if SS=Comboboxx.Items[i1] then break;
    i1:=i1+1;
  end;
  if i1>=Comboboxx.Items.Count then i1:=-1;
  result:=i1;
end;
function MoveRow(TempString: TStringGrid; Symbol: Boolean): Boolean;
var
  TempRec: TGridRect;
  I: Integer;
begin
  Result := True;
  if Symbol then
  begin
    if TempString.Row = TempString.RowCount - 1 then
    begin
      Result := False;
      Exit;
    end;
  end
  else
  begin
    if TempString.Row = 1 then
    begin
      Result := False;
      Exit;
    end;
  end;
  if Symbol then I := 1 else I := -1;
  with TempRec do
  begin
    Top := TempString.Row + I;
    Bottom := TempString.Row + I;
    Left := 0;
    Right := TempString.ColCount + 1;
  end;
  TempString.Selection := TempRec;
end;

function GetDateString(SDatabaseName: string): string;
var
  TempQry: TadoQuery;
begin
  TempQry := TadoQuery.Create(Application);
//  TempQry.DatabaseName := SDatabaseName;
  TempQry.Connection := dmod.ADOConn ;
  with TempQry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select date() as MyDate');   //GetDate()
    Open;
  end;
  Result := DateToString(Tempqry.FieldByName('MyDate').AsDateTime);
  TempQry.Free;
  TempQry := nil;
end;

function GetDateTimeString(SDatabaseName: string) :string;
var
  TempQry:TadoQuery;
begin
  TempQry := TadoQuery.Create(application);
//  TempQry.DatabaseName := SDatabaseName;
    TempQry.Connection := dmod.ADOConn ;
  with TempQry do
  begin
    close;
    SQL.Clear ;
    SQL.Add('select Date() as MyTime'); //GetDate()
    Open;
  end;
  result:= DateTimeToStr(TempQry.fieldbyname('MyTime').asdatetime);
  TempQry.Free ;
  TempQry := nil; 
end;

function GetMaxDate(temp_year,temp_month:integer):string;
var
  temp_max_day:integer;
  tem_day:integer;
begin
  if ((temp_year mod 400)=0) or (((temp_year mod 4)=0) and ((temp_year mod 100)<>0)) then
     tem_day:=28
  else
     tem_day:=29;
     
  case temp_month of
  1: temp_max_day:=31;
  2: temp_max_day:=tem_day;
  3: temp_max_day:=31;
  4: temp_max_day:=30;
  5: temp_max_day:=31;
  6: temp_max_day:=30;
  7: temp_max_day:=31;
  8: temp_max_day:=31;
  9: temp_max_day:=30;
  10:temp_max_day:=31;
  11:temp_max_day:=30;
  12:temp_max_day:=31;
  end;
  result :=IntToStr(temp_year)+'-'+IntToStr(temp_month)+'-'+IntToStr(temp_max_day);
end;
end.

