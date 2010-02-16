unit Unit_StyleSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WinSkinStore, ImgList, WinSkinData,
  ToolWin, inifiles, ComCtrls;

type
  Tfrm_StyleSet = class(TForm)
    ToolBar1: TToolBar;
    Dialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    btnWriteBegin: TBitBtn;
    grpCustomStyle: TGroupBox;
    LoadBtn: TButton;
    edtSkinAddress: TEdit;
    procedure LoadBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWriteBeginClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
var
  StyleFile: Tinifile;
  DefaultStyleSkin: Integer;
  CustomStyleSkin: string;

procedure Tfrm_StyleSet.LoadBtnClick(Sender: TObject);
begin
  Dialog1.filter := 'Skin files (*.skn)|*.SKN';
  Dialog1.initialdir := extractfilepath(application.ExeName) + 'skin';
  if Dialog1.execute then
  begin
    radiogroup1.ItemIndex := 11;
    edtSkinAddress.Text := dialog1.filename;
  end;  
end;

procedure Tfrm_StyleSet.FormCreate(Sender: TObject);
begin
  StyleFile := tinifile.Create(extractfilepath(application.ExeName) +
    'CareCure.ini');
  DefaultStyleSkin := StyleFile.Readinteger('Style', 'DefaultSkin', 0);
  CustomStyleSkin := StyleFile.ReadString('Style', 'CustomSkin', '0');
  ClientHeight := StyleFile.readinteger('WindowInfo', 'height', 400);
  ClientWidth := StyleFile.readinteger('WindowInfo', 'width', 400);
  top := StyleFile.readinteger('WindowInfo', 'top', 0);
  left := StyleFile.readinteger('WindowInfo', 'left', 0);
  StyleFile.free;
  case DefaultStyleSkin of
    0..10: radiogroup1.ItemIndex := DefaultStyleSkin;
  else
    begin
      radiogroup1.ItemIndex := 11;
      edtSkinAddress.Text := CustomStyleSkin;
    end;
  end;

end;

procedure Tfrm_StyleSet.btnWriteBeginClick(Sender: TObject);
begin
  StyleFile := TIniFile.Create(extractfilepath(application.ExeName) +
    'CareCure.ini');
  case RadioGroup1.ItemIndex of
    0..10:
    begin
    StyleFile.writeinteger('Style', 'DefaultSkin', RadioGroup1.ItemIndex);
    frm_Main.skindata1.skinfile := extractfilepath(application.ExeName)+'skin\'+ InttoStr(RadioGroup1.ItemIndex) +'.skn';
    edtSkinAddress.Text:='';
    end;
  else
    begin
      StyleFile.writeinteger('Style', 'DefaultSkin', 11);
      StyleFile.WriteString('Style', 'CustomSkin', edtSkinAddress.Text);
      frm_Main.skindata1.skinfile := edtSkinAddress.Text;
    end;
  end;

  StyleFile.writeinteger('WindowInfo', 'Width', ClientWidth);
  StyleFile.writeinteger('WindowInfo', 'Height', ClientHeight);
  StyleFile.writeinteger('WindowInfo', 'Left', left);
  StyleFile.writeinteger('WindowInfo', 'Top', top);
  StyleFile.free;

   if not frm_Main.skindata1.Active then
    frm_Main.skindata1.Active := true;
end;

procedure Tfrm_StyleSet.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_StyleSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

end.

