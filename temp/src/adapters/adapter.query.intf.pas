unit adapter.query.intf;

{$mode Delphi}

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
    property RowsAffected: Integer;
  end;

implementation

end.

