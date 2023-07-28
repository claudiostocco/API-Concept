unit controller.routes;

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
  , Horse;

  type

				{ TControllerRoutes }

    TControllerRoutes = class
    private
      class procedure rootRoute;
    public
      class procedure registerRoutes;
    end;

implementation

{ TControllerRoutes }

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

class procedure TControllerRoutes.rootRoute;
begin
   THorse.Get('/',onGet);
end;

class procedure TControllerRoutes.registerRoutes;
begin
  rootRoute;
end;

end.

