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
label1.Caption:='���ڱ���....';
a1.Active:=true;
DMod.cback.CommandText:='backup database yd to disk=''d:\BACKUP\yd.back''';
try
 DMod.cback.Execute;
 label1.Caption:='���ݳɹ���'; a1.Active:=false;
except
 label1.Caption:='����ʧ�ܣ�';a1.Active:=false;
end;




end;

procedure Tfback.BitBtn2Click(Sender: TObject);
begin

  label1.Caption:='���ڻָ�....';
  DMod.ADOCON.Close;
  if application.MessageBox('�˲�����ʹ�ϴα����������������ݶ�ʧ���Ƿ������','�ָ�����',MB_OKCANCEL)=idok then
 begin
 a1.Active:=true;
 DMod.cback.CommandText:='restore database yd from disk=''d:\BACKUP\yd.back'' with replace';
  try
   try
   DMod.cback.Execute;
    label1.Caption:='�ָ��ɹ���';
    except
    showmessage('���ݿ����ڱ�ʹ�ã���ȷ���ѹر�����ҩ���������');
    label1.Caption:='�ָ�ʧ�ܣ�';
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
     showmessage('�������з���������������������');
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