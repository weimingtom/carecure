unit uuser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, CheckLst, ImgList;
type intptr=record
         id:integer;
         qx:int64;
      end;

type
  TFuser = class(TForm)
    man: TTreeView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qx: TCheckListBox;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure manChange(Sender: TObject; Node: TTreeNode);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fuser: TFuser;

implementation

uses udm,uuser2;

{$R *.dfm}

procedure TFuser.BitBtn1Click(Sender: TObject);
var newnode:Ttreenode;ptr:^intptr;i:integer;
begin
  adodm.tuser.Append;
  i:= fuser2.ShowModal ;
  //showmessage(inttostr(i));
  if i=mrok then
  begin
  adodm.tuser.Last;
 // showmessage(adodm.tuser.fieldbyname('yh').asstring);
  newnode:=ttreenode.Create(man.Items);
  new(ptr);
  ptr.id:= adodm.tuser.fieldbyname('userid').AsInteger;
  ptr.qx:=adodm.tuser.fieldbyname('able').asinteger;
  man.Items.AddObject(newnode,adodm.tuser.fieldbyname('oper').asstring,ptr) ;
  newnode.Free;
  end;
end;

procedure TFuser.FormShow(Sender: TObject);

var newnode:Ttreenode;
    ptr:^intptr;

begin
 man.Items.Clear;
 adodm.tuser.Close;
 adodm.tuser.Open;
 adodm.tuser.First;
 newnode:=ttreenode.Create(man.Items);
 
 while not adodm.tuser.Eof do
 begin
 new(ptr);
 ptr.id:= adodm.tuser.fieldbyname('userid').AsInteger;
 ptr.qx:=adodm.tuser.fieldbyname('able').asinteger;
 man.Items.AddObject(newnode,adodm.tuser.fieldbyname('oper').asstring,ptr) ;
 adodm.tuser.Next;

 end;
 newnode.Free;
end;

procedure TFuser.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFuser.manChange(Sender: TObject; Node: TTreeNode);
var a:int64; i:integer;
begin
    a:=intptr(node.Data^).qx;
    //showmessage(inttostr(a));
    a:=a xor 1234567890;
    a:=a shr 10;
    for i:=0 to qx.Items.Count-1 do //共有6 种权限
    if ((1 shl i) and a)<>0 then
    qx.Checked[i]:=true
    else
    qx.Checked[i]:=false;

    
end;

procedure TFuser.BitBtn3Click(Sender: TObject);
var i:integer; a:int64;
begin
  a:=0;
  for i:=0 to  qx.Items.Count-1 do
  if qx.Checked[i] then
  a:=a or (1 shl i);

  a:=a shl 10  ;

  a:=a xor 1234567890;
 // showmessage(inttostr(a));
 if  adodm.tuser.Locate('userid',intptr(man.Selected.Data^).id,[]) then
 begin
    // showmessage('找到了!'+adodm.tuser.FieldByName('yh').Asstring);
     adodm.tuser.Edit;
     adodm.tuser.FieldByName('able').Asstring:=inttostr(a);
    // showmessage(adodm.tuser.FieldByName('qx').Asstring+'  a='+inttostr(a)) ;
     adodm.tuser.Post;
     intptr(man.Selected.Data^).qx:=a;
 end
 else
      showmessage('在数据库中没有找到该用户的信息,请重新录入信息!');
      



end;

procedure TFuser.BitBtn2Click(Sender: TObject);
begin
 if  adodm.tuser.Locate('userid',intptr(man.Selected.Data^).id,[]) then
    begin
    if messagedlg('真的要删除此用户吗?',mtwarning,[mbyes,mbno],0)=mryes then
       adodm.tuser.delete;
    end

 else
      showmessage('在数据库中没有找到该用户的信息,可能已经被删除了!');
       man.Selected.Delete;
 end;
     
procedure TFuser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
