unit connector.sqldb;

{$mode Delphi}

interface

uses
   (* System Units *)
   Classes, SysUtils, DB,
   (* SQLdb Units *)
   SQLDB,
   (* Project units *)
   adapter.query.intf, adapter.query.impl;

type

  { TSQLdbConnection }

  TSQLdbConnection = class
    class function NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
  end;

  { TSQLdbQuery }
  TSQLdbQuery = class(TAbstractQuery)
  public
    constructor Create(AOwner: TComponent);
    function Exec: IQuery; overload; override;
    function Exec(SQL: String): IQuery; overload; override;
    function Select(SQL: String): IQuery; override;
    procedure SetConnection(Connection: TComponent); override;
    function SetParamByName(Param: String; Value: Variant): IQuery; override;
  end;

implementation

{ TSQLdbConnection }

class function TSQLdbConnection.NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
begin
   //Result := TZConnection.Create(AOwner);
   //with (Result as TZConnection) do
   //begin
   //   Protocol := (Connection as TZConnection).Protocol;
   //   Database := (Connection as TZConnection).Database;
   //   User := (Connection as TZConnection).User;
   //   Password := (Connection as TZConnection).Password;
   //   LibraryLocation := (Connection as TZConnection).LibraryLocation;
   //   Connected := True;
   //end;
end;

constructor TSQLdbQuery.Create(AOwner: TComponent);
begin
   FInternalDataSet := TSQLQuery.Create(AOwner);
end;

function TSQLdbQuery.Exec: IQuery;
begin
   (FInternalDataSet as TSQLQuery).ExecSQL;
   FRowsAffected := (FInternalDataSet as TSQLQuery).RowsAffected;
   Result := Self;
end;

function TSQLdbQuery.Exec(SQL: String): IQuery;
begin
   (FInternalDataSet as TSQLQuery).SQLConnection.ExecuteDirect(SQL);
   FRowsAffected := 0;
   Result := Self;
end;

function TSQLdbQuery.Select(SQL: String): IQuery;
begin
   (FInternalDataSet as TSQLQuery).SQL.Text := SQL;
   (FInternalDataSet as TSQLQuery).Prepare;
   Result := Self;
end;

procedure TSQLdbQuery.SetConnection(Connection: TComponent);
begin
   (FInternalDataSet as TSQLQuery).SQLConnection := (Connection as TSQLConnection);
end;

function TSQLdbQuery.SetParamByName(Param: String; Value: Variant): IQuery;
begin
   (FInternalDataSet as TSQLQuery).ParamByName(Param).Value := Value;
   Result := Self;
end;

end.

