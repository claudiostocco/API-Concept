unit CadCli;

{$ifdef FPC}
   {$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, Buttons,
  DBCtrls, StdCtrls, ExtCtrls, service.CadCli
  {$ifndef FPC}
    , Vcl.Mask
  {$endif}
  ;

type

  { TfmCadCli }

  TfmCadCli = class(TForm)
    dbnControls: TDBNavigator;
    dsCad: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnControls: TPanel;
    sbVoltar: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure sbVoltarClick(Sender: TObject);
  private
    FCadCliService: TCadCliService;
  public

  end;

var
  fmCadCli: TfmCadCli;

implementation

{$ifdef FPC}
  {$R *.lfm}
{$else}
  {$R *.dfm}
{$endif}

{ TfmCadCli }

procedure TfmCadCli.sbVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TfmCadCli.FormCreate(Sender: TObject);
begin
   FCadCliService := TCadCliService.Create(Self);
   dsCad.DataSet := FCadCliService.GetCadCliDataSet;
end;

end.

