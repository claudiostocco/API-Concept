unit entrypoints.entry;

{$ifdef FPC}
  {$mode delphi}{$H+}
{$endif}

interface

uses
  {$ifdef FPC}
  Classes, SysUtils
  {$else}
  System.Classes, System.SysUtils
  {$endif}
  , entrypoints.horseEntry;

  type
    TEntrypoint = THorseEntrypoint;

implementation

end.

