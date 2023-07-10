unit service.CadCli;

{$mode Delphi}

interface

uses
  Classes, SysUtils, DB;

type

  { TCadCliService }

  TCadCliService = class
    public
      function GetCadCliDataSet: TDataSet;
  end;

implementation

{ TCadCliService }

function TCadCliService.GetCadCliDataSet: TDataSet;
begin
   Result := nil;
end;

end.

