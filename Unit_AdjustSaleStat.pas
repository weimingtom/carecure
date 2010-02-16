unit Unit_AdjustSaleStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  Tfrm_AdjustSaleStat = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AdjustSaleStat: Tfrm_AdjustSaleStat;

implementation

{$R *.dfm}

procedure Tfrm_AdjustSaleStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_AdjustSaleStat:=nil;
end;

end.
