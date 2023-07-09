unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfmMain }

  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

uses CadCli;

{ TfmMain }

procedure TfmMain.MenuItem5Click(Sender: TObject);
begin
   fmCadCli.ShowModal;
end;

end.

