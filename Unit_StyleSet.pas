unit Unit_StyleSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WinSkinStore, ImgList, WinSkinData,
  ToolWin, ComCtrls;

type
  Tfrm_StyleSet = class(TForm)
    ToolBar1: TToolBar;
    Dialog1: TOpenDialog;
    Button4: TButton;
    BitBtn1: TBitBtn;
    LoadBtn: TButton;
    lblStyleTitle: TLabel;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    procedure LoadBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_StyleSet: Tfrm_StyleSet;

implementation
uses Unit_Main;
{$R *.dfm}

procedure Tfrm_StyleSet.LoadBtnClick(Sender: TObject);
begin
  Dialog1.filter := 'Skin files (*.skn)|*.SKN';
  Dialog1.initialdir := extractfilepath(application.ExeName) + 'skin';
  if Dialog1.execute then
    frm_Main.skindata1.skinfile := dialog1.filename;
  if not frm_Main.skindata1.Active then
    frm_Main.skindata1.Active := true;
end;

end.

