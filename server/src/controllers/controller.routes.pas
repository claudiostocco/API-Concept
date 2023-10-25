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
  , entrypoints.entry;

  type

    { TControllerRoutes }

    TControllerRoutes = class
    private
    public
      class procedure registerRoutes;
    end;

implementation

{ TControllerRoutes }

class procedure TControllerRoutes.registerRoutes;
begin
  TEntrypoint.rootRoute;
  TEntrypoint.versionRoute;
  TEntrypoint.customerRoute;
end;

end.

