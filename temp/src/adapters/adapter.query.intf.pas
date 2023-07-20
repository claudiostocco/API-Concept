unit adapter.query.intf;

{$ifdef FPC}
   {$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, DB;

type
  TTypeFieldMask = (tmEditMask, tmDisplayFormat, tmEditFormat);
  TTypeFieldMaskSet = set of TTypeFieldMask;

  IQuery = Interface
    function AsDataSet: TDataSet;
    function Exec: IQuery; overload;
    function Exec(SQL: String): IQuery; overload;
    //function GetField<T>(FieldName: String): T;
    function Insert(SQL: String; UpSert: Boolean = False): IQuery;
    function Open: IQuery; overload;
    function Open(SQL: String): IQuery; overload;
    function Select(SQL: String): IQuery;
    procedure SetConnection(Connection: TComponent);
    function SetParamByName(Param: String; Value: Variant): IQuery;
    function SetFieldMask(Field: String; Mask: String; TypeMask: TTypeFieldMaskSet): IQuery;
    function Update(SQL: String): IQuery;
    function GetRowsAffected: Int64;
    property RowsAffected: Int64 read GetRowsAffected;
  end;

implementation

end.

