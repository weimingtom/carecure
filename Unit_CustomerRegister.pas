unit Unit_CustomerRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  Tfrm_CustomerRegister = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CustomerRegister_ref;
  end;

var
  frm_CustomerRegister: Tfrm_CustomerRegister;

implementation

{$R *.dfm}

procedure Tfrm_CustomerRegister.CustomerRegister_ref ;
begin
  
end;

procedure Tfrm_CustomerRegister.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frm_CustomerRegister:=nil;
end;

end.
