unit adapter.query.intf;

{$mode Delphi}

interface

uses
  Classes, SysUtils, DB;

type
  IQuery = Interface
    public
      function Select(SQL: String): TDataSet;
  end;

implementation

end.

