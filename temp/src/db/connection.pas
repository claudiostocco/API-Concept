unit connection;

{$mode Delphi}

interface

uses
  Classes, SysUtils, ZConnection, dialogs, IniFiles;

type

  { TdmConn }

  TdmConn = class(TDataModule)
    ZConnection: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  dmConn: TdmConn;

implementation

{$R *.lfm}

{ TdmConn }

procedure TdmConn.DataModuleCreate(Sender: TObject);
var sPath: String;
    Ini: TIniFile;
begin
   sPath := ExtractFilePath(ParamStr(0));
   try
     Ini := TIniFile.Create(sPath+'application.ini');
     showmessage(Ini.ReadString('database','driver',''));

     ZConnection.Protocol := Ini.ReadString('database','driver','');
     ZConnection.Database := Ini.ReadString('database','dbfile','');
     ZConnection.User := Ini.ReadString('database','user','');
     ZConnection.Password := Ini.ReadString('database','password','');
     //ZConnection.Connected := True;
   finally
     FreeAndNil(Ini);
   end;
end;

end.

