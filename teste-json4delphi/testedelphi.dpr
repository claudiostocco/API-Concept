program testedelphi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  main in 'main.pas';

begin
  try
    RunTest;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
