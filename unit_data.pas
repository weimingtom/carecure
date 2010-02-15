unit unit_data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TWenYianData = class(TDataModule)
    Database1: TDatabase;
    qry_data: TQuery;
    qry_help: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WenYianData: TWenYianData;

implementation

{$R *.DFM}

end.
