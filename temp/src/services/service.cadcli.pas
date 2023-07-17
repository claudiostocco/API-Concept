unit service.CadCli;

{$mode Delphi}

interface

uses
  (* System Units *)
  Classes, SysUtils, DB,
  (* Project units *)
  adapter.query.intf, connector.factory;

type

  { TCadCliService }

  TCadCliService = class
    private
      FQueryCad: IQuery;
    public
      constructor Create(AOwner: TComponent);
      function GetCadCliDataSet: TDataSet;
  end;

implementation

{ TCadCliService }

constructor TCadCliService.Create(AOwner: TComponent);
begin
   FQueryCad := TQueryFactory.New(AOwner)
                .Select('SELECT ID, NOME, ENDERECO, NUMERO, CEP, IDMUNICIPIO, NASCIMENTO FROM CLIENTE')
		.Open;
end;

function TCadCliService.GetCadCliDataSet: TDataSet;
begin
   Result := FQueryCad.AsDataSet;
end;

end.

