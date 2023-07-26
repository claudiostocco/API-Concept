unit service.CadCli;

{$ifdef FPC}
   {$mode Delphi}
{$endif}

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
      procedure QueryCadAferPost(Dataset: TDataSet);
    public
      constructor Create(AOwner: TComponent);
      function GetCadCliDataSet: TDataSet;
  end;

implementation

{ TCadCliService }

procedure TCadCliService.QueryCadAferPost(Dataset: TDataSet);
begin
   FQueryCad.CommitOrApplyUpdates;
end;

constructor TCadCliService.Create(AOwner: TComponent);
{$ifdef linux}
   var i: Integer;
{$endif}
begin
   FQueryCad := TQueryFactory.New(AOwner)
                .Select('SELECT ID, NOME, ENDERECO, NUMERO, CEP, IDMUNICIPIO, NASCIMENTO FROM CLIENTE')
		.Open;
   {$ifdef linux}
       for i := 0 to FQueryCad.AsDataSet.FieldCount-1 do
          FQueryCad.AsDataSet.Fields[i].ReadOnly := False;
   {$endif}

   FQueryCad.SetFieldMask('CEP','99999-999;0;_',[tmEditMask])
            .SetFieldMask('NASCIMENTO','99/99/9999;1;_',[tmEditMask]);
   FQueryCad.AsDataSet.AfterPost := QueryCadAferPost;
end;

function TCadCliService.GetCadCliDataSet: TDataSet;
begin
   Result := FQueryCad.AsDataSet;
end;

end.

