unit adapter.query.intf;

{$mode Delphi}

interface

uses
  Classes, SysUtils, DB;

type
  IQuery = Interface
    function AsDataSet: TDataSet;
    //function GetField<T>(FieldName: String): T;
    function Insert(SQL: String; UpSert: Boolean = False): IQuery;
    function Open: IQuery;
    function Select(SQL: String): IQuery;
    function SetParamByName(Param: String; Value: Variant): IQuery;
    function Update(SQL: String): IQuery;
    property RowsAffected: Integer;
  end;

implementation

end.

