unit CadCli;

{$mode Delphi}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, Buttons,
  DBCtrls, StdCtrls, service.CadCli;

type

  { TfmCadCli }

  TfmCadCli = class(TForm)
    dsCad: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    sbNovo: TSpeedButton;
    sbGravar: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbVoltar: TSpeedButton;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
				procedure FormCreate(Sender: TObject);
    procedure sbVoltarClick(Sender: TObject);
  private
    FCadCliService: TCadCliService;
  public

  end;

var
  fmCadCli: TfmCadCli;

implementation

{$R *.lfm}

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

