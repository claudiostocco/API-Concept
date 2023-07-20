unit connection;

{$I dbcomponent.inc}

{$ifdef FPC}
   {$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, Dialogs, IniFiles, DB,
  {$ifdef USE_FIREDAC}
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG
  {$endif}
  {$ifdef USE_ZEOS}
  ZConnection, ZDataset
  {$endif}
  ;

type

  { TdmConn }

  TdmConn = class(TDataModule)
  {$ifdef USE_FIREDAC}
    Cursor: TFDGUIxWaitCursor;
    FDConnection: TFDConnection;
    PgDriverLink: TFDPhysPgDriverLink;
  {$endif}
  {$ifdef USE_ZEOS}
    ZConnection: TZConnection;
    ZQuery1: TZQuery;
    ZQuery1CEP: TStringField;
    ZQuery1ENDERECO: TStringField;
    ZQuery1ID: TStringField;
    ZQuery1IDMUNICIPIO: TLongintField;
    ZQuery1NASCIMENTO: TDateField;
    ZQuery1NOME: TStringField;
    ZQuery1NUMERO: TLongintField;
  {$endif}
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  dmConn: TdmConn;

implementation

uses connector.factory;

{$ifdef FPC}
  {$R *.lfm}
{$else}
  {$R *.dfm}
{$endif}

{ TdmConn }

procedure TdmConn.DataModuleCreate(Sender: TObject);
var sPath: String;
    Ini: TIniFile;
    dbConnection: TComponent;
begin
   sPath := ExtractFilePath(ParamStr(0));
   try
      try
         Ini := TIniFile.Create(sPath+'application.ini');
         {$ifdef USE_ZEOS}
	           ZConnection.Protocol := Ini.ReadString('database','driver','');
	           ZConnection.Database := Ini.ReadString('database','dbfile','');
	           ZConnection.User := Ini.ReadString('database','user','');
	           ZConnection.Password := Ini.ReadString('database','password','');
	           ZConnection.LibraryLocation := Ini.ReadString('database','libraryClient','');
	           ZConnection.Connected := True;
	           dbConnection := ZConnection;
         {$endif}
         {$ifdef USE_FIREDAC}
	           FDConnection.DriverName := Ini.ReadString('database','driver','');
	           FDConnection.Params.Database := Ini.ReadString('database','dbfile','');
	           FDConnection.Params.UserName := Ini.ReadString('database','user','');
	           FDConnection.Params.Password := Ini.ReadString('database','password','');
	           PgDriverLink.VendorLib := Ini.ReadString('database','libraryClient','');
	           FDConnection.Connected := True;
	           dbConnection := FDConnection;
         {$endif}
      finally
         FreeAndNil(Ini);
      end;

      (* Instancia a connection factory, passando o connection da tecnologia utilizada *)
      TConnectionFactory.Create(Self, dbConnection);
   except on e: Exception do
      ShowMessage(e.Message);
   end;
end;

end.
