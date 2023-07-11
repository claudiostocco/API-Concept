unit service.CadCli;

{$mode Delphi}

interface

uses
	  (* System Units *)
	  Classes, SysUtils, DB,
	  (* Project units *)
	  adapter.query.intf;

type

  { TCadCliService }

  TCadCliService = class
    private
      FQueryCad: IQuery;
    public
      constructor Create;
      function GetCadCliDataSet: TDataSet;
  end;

implementation

{ TCadCliService }

constructor TCadCliService.Create;
begin

end;

function TCadCliService.GetCadCliDataSet: TDataSet;
begin
   Result := nil;
end;

end.

