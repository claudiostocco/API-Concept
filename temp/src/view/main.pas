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
				procedure MenuItem4Click(Sender: TObject);
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

procedure TfmMain.MenuItem4Click(Sender: TObject);
begin
   ShowMessage('Application to demontrate the connection concept using clean architeture.'+#13+
               'Enabling easy switching of connection component and database technology.');
end;

end.

