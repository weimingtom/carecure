unit unit_UserManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, CheckLst, ImgList;
type
  intptr = record
    id: string; //integer; --> String
    qx: int64;
  end;

type
  Tfrm_UserManage = class(TForm)
    man: TTreeView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qx: TCheckListBox;
    ImageList1: TImageList;
    chkAll: TCheckBox;
    lblUserListTitle: TLabel;
    lblUserPowerTitle: TLabel;
    btnUserEdit: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure manChange(Sender: TObject; Node: TTreeNode);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAllClick(Sender: TObject);
    procedure btnUserEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_UserManage: Tfrm_UserManage;

implementation

uses Unit_DataModule, Unit_UserProfile;

{$R *.dfm}

procedure Tfrm_UserManage.BitBtn1Click(Sender: TObject);
var
  newnode: Ttreenode;
  ptr: ^intptr;
  i: integer;
begin
  DMod.tuser.Append;
  frm_UserProfile := Tfrm_UserProfile.Create(nil);
  i := frm_UserProfile.ShowModal;
  //showmessage(inttostr(i));
  if i = mrok then
  begin
    DMod.tuser.Last;
    // showmessage(DMod.tuser.fieldbyname('yh').asstring);
    newnode := ttreenode.Create(man.Items);
    new(ptr);
    ptr.id := DMod.tuser.fieldbyname('userid').AsString; //.AsInteger;
    ptr.qx := DMod.tuser.fieldbyname('able').asinteger;
    man.Items.AddObject(newnode, DMod.tuser.fieldbyname('userid').asstring,
      ptr);
    newnode.Free;
  end;
end;

procedure Tfrm_UserManage.FormShow(Sender: TObject);

var
  newnode: Ttreenode;
  ptr: ^intptr;

begin
  man.Items.Clear;
  DMod.tuser.Close;
  DMod.tuser.Open;
  DMod.tuser.First;
  newnode := ttreenode.Create(man.Items);

  while not DMod.tuser.Eof do
  begin
    new(ptr);
    ptr.id := DMod.tuser.fieldbyname('userid').AsString; //.AsInteger;
    ptr.qx := DMod.tuser.fieldbyname('able').asinteger;
    man.Items.AddObject(newnode, DMod.tuser.fieldbyname('userid').asstring,
      ptr);
    DMod.tuser.Next;

  end;
  newnode.Free;
end;

procedure Tfrm_UserManage.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_UserManage.manChange(Sender: TObject; Node: TTreeNode);
var
  a: int64;
  i: integer;
begin
  a := intptr(node.Data^).qx;
  //showmessage(inttostr(a)); //调试权限运算时使用,发布时屏蔽
  a := a xor 1234567890;
  a := a shr 10;
  for i := 0 to qx.Items.Count - 1 do //最高支持64种权限
    if ((1 shl i) and a) <> 0 then
      qx.Checked[i] := true
    else
      qx.Checked[i] := false;

end;

procedure Tfrm_UserManage.BitBtn3Click(Sender: TObject);
var
  i: integer;
  a: int64;
begin
  a := 0;
  //a为int64位,可以表示64种权限能否,不过在32位intel-pc机上要避免多用户同时操作该值而意外.
  for i := 0 to qx.Items.Count - 1 do
    if qx.Checked[i] then
      a := a or (1 shl i); //把第i项的权限能否写入a的第n位

  a := a shl 10; //用左移10位来混淆加密一下a

  a := a xor 1234567890; //用随机选的数字1234567890混淆加密一下a
  //showmessage(inttostr(a));
  if DMod.tuser.Locate('userid', intptr(man.Selected.Data^).id, []) then
  begin
    //showmessage('找到了!'+DMod.tuser.FieldByName('userid').Asstring);
    DMod.tuser.Edit;
    DMod.tuser.FieldByName('able').Asstring := inttostr(a);
    //showmessage(DMod.tuser.FieldByName('able').Asstring+'  a='+inttostr(a)) ;
    DMod.tuser.Post;
    //DMod.tuser.Refresh;
    showmessage('您对' + DMod.tuser.FieldByName('userid').Asstring +
      '授权成功!');
    intptr(man.Selected.Data^).qx := a;
  end
  else
    showmessage('在数据库中没有找到该用户的信息,请重新录入信息!');

end;

procedure Tfrm_UserManage.BitBtn2Click(Sender: TObject);
begin
  if DMod.tuser.Locate('userid', intptr(man.Selected.Data^).id, []) then
  begin
    if messagedlg('真的要删除此用户吗?', mtwarning, [mbyes, mbno], 0) = mryes
      then
      DMod.tuser.delete;
  end

  else
    showmessage('在数据库中没有找到该用户的信息,可能已经被删除了!');
  man.Selected.Delete;
end;

procedure Tfrm_UserManage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrm_UserManage.chkAllClick(Sender: TObject);
var
  i: integer;
begin

  for I := 0 to qx.Items.Count - 1 do
    if chkAll.Checked then
      qx.Checked[I] := True
    else
      qx.Checked[I] := False;
end;

procedure Tfrm_UserManage.btnUserEditClick(Sender: TObject);
begin
  if DMod.tuser.Locate('userid', intptr(man.Selected.Data^).id, []) then
  begin
    //showmessage('找到了!'+DMod.tuser.FieldByName('userid').Asstring);
    DMod.tuser.Edit;
    frm_UserProfile := Tfrm_UserProfile.Create(nil);
    frm_UserProfile.ShowModal;
  end
  else
    showmessage('请先选择一个用户以编辑其资料!');
end;

end.

