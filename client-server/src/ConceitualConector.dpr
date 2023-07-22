program ConceitualConector;

uses
  Vcl.Forms,
  connection in 'db\connection.pas',
  connector.factory in 'connectors\connector.factory.pas',
  adapter.query.impl in 'adapters\adapter.query.impl.pas',
  adapter.query.intf in 'adapters\adapter.query.intf.pas',
  connector.firedac in 'connectors\connector.firedac.pas',
  service.cadcli in 'services\service.cadcli.pas',
  main in 'view\main.pas',
  cadcli in 'view\cadcli.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConn, dmConn);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmCadCli, fmCadCli);
  Application.Run;
end.
