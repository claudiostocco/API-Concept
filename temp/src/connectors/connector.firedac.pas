unit connector.firedac;

interface

uses
   (* System Units *)
   Classes, SysUtils, DB,
   (* Firedac Units *)
   FireDAC.Phys.IB, FireDAC.DApt, FireDAC.Phys.FB, FireDAC.Phys.SQLite, FireDAC.Stan.Intf,
   FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
   FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client,
   FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
   FireDAC.Phys.FBDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.IBBase,
   FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
   {$IFDEF CONSOLE}
   FireDAC.ConsoleUI.Wait,
   {$ELSE}
   FireDAC.VCLUI.Wait,
   {$ENDIF}
   (* Project units *)
   adapter.query.intf, adapter.query.impl;

type

  { TZeosConnection }

  TFiredacConnection = class
    class function NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
  end;

  { TFiredacQuery }
  TFiredacQuery = class(TAbstractQuery)
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

class function TFiredacConnection.NewConnection(AOwner: TComponent; Connection: TComponent): TComponent;
begin
   Result := TFDConnection.Create(AOwner);
   with (Result as TFDConnection) do
   begin
	   DriverName := (Connection as TFDConnection).DriverName;
	   Params.Database := (Connection as TFDConnection).Params.Database;
	   Params.UserName := (Connection as TFDConnection).Params.UserName;
	   Params.Password := (Connection as TFDConnection).Params.Password;
//      LibraryLocation := (Connection as TFDConnection).LibraryLocation;
      Connected := True;
   end;
end;

constructor TFiredacQuery.Create(AOwner: TComponent);
begin
   FInternalDataSet := TFDQuery.Create(AOwner);
end;

function TFiredacQuery.Exec: IQuery;
begin
   (FInternalDataSet as TFDQuery).ExecSQL;
   FRowsAffected := (FInternalDataSet as TFDQuery).RowsAffected;
   Result := Self;
end;

function TFiredacQuery.Exec(SQL: String): IQuery;
begin
   FRowsAffected := (FInternalDataSet as TFDQuery).Connection.ExecSQL(SQL);
   Result := Self;
end;

function TFiredacQuery.Select(SQL: String): IQuery;
begin
   (FInternalDataSet as TFDQuery).SQL.Text := SQL;
   (FInternalDataSet as TFDQuery).Prepare;
   Result := Self;
end;

procedure TFiredacQuery.SetConnection(Connection: TComponent);
begin
   (FInternalDataSet as TFDQuery).Connection := (Connection as TFDCustomConnection);
end;

function TFiredacQuery.SetParamByName(Param: String; Value: Variant): IQuery;
begin
   (FInternalDataSet as TFDQuery).ParamByName(Param).Value := Value;
   Result := Self;
end;

end.

