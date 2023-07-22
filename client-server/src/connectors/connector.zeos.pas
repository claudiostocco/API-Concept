unit connector.zeos;

{$mode Delphi}

interface

uses
   (* System Units *)
   Classes, SysUtils, DB,
   (* Zeos Units *)
   ZAbstractConnection, ZDataSet, zcomponent, ZConnection,
   (* Project units *)
   adapter.query.intf, adapter.query.impl;

type

  { TZeosConnection }

  TZeosConnection = class
    class function NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
  end;

  { TZeosQuery }
  TZeosQuery = class(TAbstractQuery)
  public
    constructor Create(AOwner: TComponent);
    function Exec: IQuery; overload; override;
    function Exec(SQL: String): IQuery; overload; override;
    function Select(SQL: String): IQuery; override;
    procedure SetConnection(Connection: TComponent); override;
    function SetParamByName(Param: String; Value: Variant): IQuery; override;
  end;

implementation

{ TZeosConnection }

class function TZeosConnection.NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
begin
   Result := TZConnection.Create(AOwner);
   with (Result as TZConnection) do
   begin
      Protocol := (Connection as TZConnection).Protocol;
      Database := (Connection as TZConnection).Database;
      User := (Connection as TZConnection).User;
      Password := (Connection as TZConnection).Password;
      LibraryLocation := (Connection as TZConnection).LibraryLocation;
      Connected := True;
   end;
end;

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
var iRowsAffected: Integer;
begin
   (FInternalDataSet as TZQuery).Connection.ExecuteDirect(SQL,iRowsAffected);
   FRowsAffected := iRowsAffected;
   Result := Self;
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

