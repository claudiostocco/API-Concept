unit adapter.query.impl;

{$mode Delphi}

interface

uses
    (* System Units *)
    Classes, SysUtils, DB,
    (* Project units *)
    adapter.query.intf;

type

  { TAbstractQuery }
  TAbstractQuery = class(TInterfacedObject, IQuery)
  protected
    FInternalDataSet: TDataSet;
    FRowsAffected: Integer;
  public
    function AsDataSet: TDataSet;
    function Exec(SQL: String): IQuery; overload; virtual;
    function Exec: IQuery; overload; virtual; abstract;
    function Insert(SQL: String; UpSert: Boolean=False): IQuery;
    function Open: IQuery; overload;
    function Open(SQL: String): IQuery; overload;
    function Select(SQL: String): IQuery virtual; abstract;
    procedure SetConnection(Connection: TComponent); virtual; abstract;
    function SetFieldMask(Field: String; Mask: String; TypeMask: TTypeFieldMaskSet): IQuery;
    function SetParamByName(Param: String; Value: Variant): IQuery; virtual; abstract;
    function Update(SQL: String): IQuery;
  published
    property RowsAffected: Integer read FRowsAffected;
  end;

implementation

{ TAbstractQuery }

function TAbstractQuery.AsDataSet: TDataSet;
begin
   Result := FInternalDataSet;
end;

function TAbstractQuery.Exec(SQL: String): IQuery;
begin
   Result := Update(SQL).Exec;
end;

function TAbstractQuery.Insert(SQL: String; UpSert: Boolean): IQuery;
begin
   if UpSert then SQL := 'UPDATE OR '+SQL;
   Result := Select(SQL);
end;

function TAbstractQuery.Open: IQuery;
begin
   FInternalDataSet.Open;
   Result := Self;
end;

function TAbstractQuery.Open(SQL: String): IQuery;
begin
   Result := Select(SQL).Open;
end;

function TAbstractQuery.SetFieldMask(Field: String; Mask: String;
  TypeMask: TTypeFieldMaskSet): IQuery;
begin
   if tmEditMask in TypeMask then
      FInternalDataSet.FieldByName(Field).EditMask := Mask;
   (* Somente para campos numéricos *)
   if tmDisplayFormat in TypeMask then
      (FInternalDataSet.FieldByName(Field) as TNumericField).DisplayFormat := Mask;
   if tmEditFormat in TypeMask then
      (FInternalDataSet.FieldByName(Field) as TNumericField).EditFormat := Mask;

   Result := Self;
end;

function TAbstractQuery.Update(SQL: String): IQuery;
begin
   Result := Select(SQL);
end;

end.
