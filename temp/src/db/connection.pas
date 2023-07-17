unit connection;

{$mode Delphi}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, dialogs, IniFiles, DB;

type

  { TdmConn }

  TdmConn = class(TDataModule)
    ZConnection: TZConnection;
    ZQuery1: TZQuery;
    ZQuery1CEP: TStringField;
    ZQuery1ENDERECO: TStringField;
    ZQuery1ID: TStringField;
    ZQuery1IDMUNICIPIO: TLongintField;
    ZQuery1NASCIMENTO: TDateField;
    ZQuery1NOME: TStringField;
    ZQuery1NUMERO: TLongintField;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  dmConn: TdmConn;

implementation

uses connector.factory;

{$R *.lfm}

{ TdmConn }

procedure TdmConn.DataModuleCreate(Sender: TObject);
var sPath: String;
    Ini: TIniFile;
begin
   sPath := ExtractFilePath(ParamStr(0));
   try
      try
         Ini := TIniFile.Create(sPath+'application.ini');
         ZConnection.Protocol := Ini.ReadString('database','driver','');
         ZConnection.Database := Ini.ReadString('database','dbfile','');
         ZConnection.User := Ini.ReadString('database','user','');
         ZConnection.Password := Ini.ReadString('database','password','');
         ZConnection.LibraryLocation := Ini.ReadString('database','libraryClient','');
         ZConnection.Connected := True;
      finally
         FreeAndNil(Ini);
      end;

      (* Instancia a connection factory, passando o connection da tecnologia utilizada *)
      TConnectionFactory.Create(Self, ZConnection);
   except on e: Exception do
      ShowMessage(e.Message);
   end;
end;

end.
