unit entrypoints.horseEntry;

{$ifdef FPC}
  {$mode delphi}{$H+}
{$endif}

interface

uses
  {$ifdef FPC}
  Classes, SysUtils,
  {$else}
  System.Classes, System.SysUtils,
  {$endif}
  Horse,
  constants.common;

  type

    { THorseEntrypoint }

    THorseEntrypoint = class
    private
    public
      class procedure rootRoute;
      class procedure versionRoute;
      class procedure customerRoute;
    end;

implementation

uses entrypoints.customerEntry;

{ THorseEntrypoint }

procedure onGet(req: THorseRequest; res: THorseResponse);
begin
  res.ContentType('text/html').Status(THTTPStatus.OK).Send(Format(
           '<html>'+
           '  <head><title>API Server home page</title></head>'+
           '  <body>'+
           '    <h1>API Server home page - Server is running on port %d - Horse version %s</h1>'+
           '  </body>'+
           '</html>',
           [THorse.Port,THorse.Version]));
end;

procedure onVersion(req: THorseRequest; res: THorseResponse);
var jVer: String;
begin
  jVer := Format('{"version": "%d.%d.%d"}',[MajorVersion,MinorVersion,Release]);
  res.ContentType('application/json').Status(THTTPStatus.OK).Send(jVer);
end;

class procedure THorseEntrypoint.rootRoute;
begin
  THorse.Get('/',onGet);
end;

class procedure THorseEntrypoint.versionRoute;
begin
  THorse.Get('/version',onVersion);
end;

class procedure THorseEntrypoint.customerRoute;
begin
  TCustomerEntry.registerRoutes;
end;

end.
