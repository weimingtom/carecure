unit Unit_MdbManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons, ComCtrls, ExtCtrls;

type
  Tfrm_MdbManager = class(TForm)
    pgcMdbManager: TPageControl;
    tsMdbBack: TTabSheet;
    grpDefaulPath: TGroupBox;
    lblBackPathTitle: TLabel;
    edtBackPath: TEdit;
    btnBackBegin: TBitBtn;
    btnClose: TBitBtn;
    grpCustomPath: TGroupBox;
    lblCustomPathTitle: TLabel;
    edtCustomPath: TEdit;
    dirlstCustomPath: TDirectoryListBox;
    drvcbbCustomPath: TDriveComboBox;
    btnBackBegin2: TBitBtn;
    btnClose2: TBitBtn;
    tsMdbCompact: TTabSheet;
    pnlMdbCompact: TPanel;
    btnCompactBegin: TBitBtn;
    btnClose3: TBitBtn;
    pnlMdbCompact2: TPanel;
    mmoMdbCompactTitle: TMemo;
    tsMdbRestore: TTabSheet;
    grpMdbRestore: TGroupBox;
    lblMdbRestoreTitle: TLabel;
    dirlstMdbRestore: TDirectoryListBox;
    drvcbbMdbRestore: TDriveComboBox;
    fllstMdbRestore: TFileListBox;
    btnRestoreBegin: TBitBtn;
    btnClose4: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MdbManager: Tfrm_MdbManager;

implementation

{$R *.dfm}

end.
