unit Uac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  Tfac = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fac: Tfac;

implementation

{$R *.dfm}

procedure Tfac.Button1Click(Sender: TObject);
var
newbmp:tbitmap;
i,j,bmpheight,bmpwidth:integer;
begin
newbmp:= tbitmap.create;
newbmp.width:=image1.width;
newbmp.height:=image1.height;
bmpheight:=image1.height;
bmpwidth:=image1.width;
i:=0;
while i<=bmpwidth do
begin
j:=i;
while j >0 do
begin
  newbmp.canvas.copyrect(rect(j-1,0,j,bmpheight),
  image1.canvas,
  rect(bmpwidth-i+j-1,0,bmpwidth-i+j,bmpheight));
  newbmp.canvas.copyrect(rect
  (bmpwidth-j,0,bmpwidth-j+1,bmpheight),
  image1.canvas,
  rect(i-j,0,i-j+1,bmpheight));
  j:=j-2;

end;
canvas.draw(2,10,newbmp);
i:=i+2;
;
end;
newbmp.free;

end;

procedure Tfac.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure Tfac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfac.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfac.FormActivate(Sender: TObject);
begin
BUTTON1.Click;
end;

procedure Tfac.FormCreate(Sender: TObject);
var hr :thandle;
begin
hr:=createroundrectrgn(0,0,width,height,30,30);
setwindowrgn(handle,hr,true);

end;

end.
