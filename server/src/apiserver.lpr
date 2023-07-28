program apiserver;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, main, controller.routes
  { you can add units after this };

begin
  TServerMain.CreateServer.Start;
end.

