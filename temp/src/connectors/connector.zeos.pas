unit connector.zeos;

{$mode Delphi}

interface

uses
   (* System Units *)
   Classes, SysUtils, DB,
   (* Zeos Units *)
   ZAbstractConnection, ZDataSet, zcomponent,
   (* Project units *)
   adapter.query.intf, adapter.query.impl;

type

  { TZeosQuery }
  TZeosQuery = class(TAbstractQuery, IQuery)
  public
    constructor Create(AOwner: TComponent);
    function Exec: IQuery; overload; override;
    function Exec(SQL: String): IQuery; overload; override;
    function Open(SQL: String): IQuery; overload; override;
    function Select(SQL: String): IQuery; override;
    procedure SetConnection(Connection: TComponent); override;
    function SetParamByName(Param: String; Value: Variant): IQuery; override;
  end;

implementation

constructor TZeosQuery.Create(AOwner: TComponent);
begin
   FInternalDataSet := TZQuery.Create(AOwner);
end;

function TZeosQuery.Exec: IQuery;
begin
   (FInternalDataSet as TZQuery).ExecSQL;
   FRowsAffected := (FInternalDataSet as TZQuery).RowsAffected;
   Result := Self;
end;

function TZeosQuery.Exec(SQL: String): IQuery;
begin
   (FInternalDataSet as TZQuery).Connection.ExecuteDirect(SQL,FRowsAffected);
   Result := Self;
end;

function TZeosQuery.Open(SQL: String): IQuery;
begin
   Result := Select(SQL);
   Self.Open;
end;

function TZeosQuery.Select(SQL: String): IQuery;
begin
   (FInternalDataSet as TZQuery).SQL.Text := SQL;
   (FInternalDataSet as TZQuery).Prepare;
   Result := Self;
end;

procedure TZeosQuery.SetConnection(Connection: TComponent);
begin
   (FInternalDataSet as TZQuery).Connection := (Connection as TZAbstractConnection);
end;

function TZeosQuery.SetParamByName(Param: String; Value: Variant): IQuery;
begin
   (FInternalDataSet as TZQuery).ParamByName(Param).Value := Value;
   Result := Self;
end;

end.

