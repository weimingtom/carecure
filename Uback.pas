unit Uback;

interface

uses
  Windows, Messages, Forms,
  Dialogs, Buttons,Unit_DataModule, StdCtrls, ComCtrls, Controls, Classes;

type
  Tfback = class(TForm)
    a1: TAnimate;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fback: Tfback;

implementation

{$R *.dfm}

procedure Tfback.BitBtn1Click(Sender: TObject);
begin
label1.Caption:='正在备份....';
a1.Active:=true;
DMod.cback.CommandText:='backup database yd to disk=''d:\BACKUP\yd.back''';
try
 DMod.cback.Execute;
 label1.Caption:='备份成功！'; a1.Active:=false;
except
 label1.Caption:='备份失败！';a1.Active:=false;
end;




end;

procedure Tfback.BitBtn2Click(Sender: TObject);
begin

  label1.Caption:='正在恢复....';
  DMod.ADOCON.Close;
  if application.MessageBox('此操作将使上次备份以来的所有数据丢失，是否继续？','恢复数据',MB_OKCANCEL)=idok then
 begin
 a1.Active:=true;
 DMod.cback.CommandText:='restore database yd from disk=''d:\BACKUP\yd.back'' with replace';
  try
   try
   DMod.cback.Execute;
    label1.Caption:='恢复成功！';
    except
    showmessage('数据库正在被使用！请确定已关闭其它药店管理程序！');
    label1.Caption:='恢复失败！';
    end;
  finally
  a1.Active:=false;
   try
    DMod.typzdk.Open;
    DMod.tdw.Open;
    DMod.tbm.Open;
    DMod.tyg.Open;
    DMod.tkc.Open;
    DMod.tcr.Open;
    DMod.toper.Open;
    DMod.tuser.Open;
   except
     showmessage('程序运行发生错误，请重新启动程序！');
     application.Terminate;
   end;
  end;
end;
end;

procedure Tfback.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.