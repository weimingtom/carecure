unit Unit_SysInitial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_SysInitial = class(TForm)
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    edt_FileName: TEdit;
    sbtn_read: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    sbtn_Execute: TSpeedButton;
    sbtn_close: TSpeedButton;
    procedure sbtn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_readClick(Sender: TObject);
    procedure sbtn_ExecuteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ref;
  end;

var
  frm_SysInitial: Tfrm_SysInitial;

implementation
  uses unit_TotalPublic,PublicFunOrPro;
{$R *.dfm}

procedure Tfrm_SysInitial.ref ;
begin
  sbtn_Execute.Enabled := GetPower(SysUserId,'系统初始化','修改权');
end;

procedure Tfrm_SysInitial.sbtn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SysInitial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_sysinitial:=nil;
end;

procedure Tfrm_SysInitial.sbtn_readClick(Sender: TObject);
var
  FileName:string;
  iFileHandle,iFileLength,iBytesRead,i: Integer;
  Buffer: PChar;
begin
  OpenDialog1.Filter :='SQL files (*.sql)|*.SQL';
  OpenDialog1.InitialDir := Application.GetNamePath ;
  OpenDialog1.Execute ;
  FileName:=OpenDialog1.FileName ;
  if FileName<>'' then
  begin
    edt_FileName.Text := FileName;
    try
      iFileHandle := FileOpen(FileName, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);
      Buffer := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, Buffer^, iFileLength);

      FileClose(iFileHandle);
      for i := 0 to iBytesRead-1 do
      begin
        Memo1.Text  := Memo1.Text + Buffer[i];
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

procedure Tfrm_SysInitial.sbtn_ExecuteClick(Sender: TObject);
begin
  if MessageBox(handle,'系统初始化操作将使系统恢复到初始状态，以后所有的操作数据都被删除,确认吗?','询问',mb_yesno+mb_iconwarning)<>IDYES then exit;
end;

end.
