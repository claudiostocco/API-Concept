program ConceitualConector;

{$mode delphi}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  zcomponent,
  main,
  CadCli,
  service.CadCli,
  adapter.query.intf,
  adapter.query.impl,
  connector.zeos,
  connection, connector.factory;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
				Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmConn, dmConn);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmCadCli, fmCadCli);
  Application.Run;
end.
