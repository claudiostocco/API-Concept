unit entrypoints.customerEntry;

{$ifdef FPC}
  {$mode delphi}{$H+}
{$endif}

interface

uses
  {$ifdef FPC}
  Classes, SysUtils
  {$else}
  System.Classes, System.SysUtils
  {$endif}
  , entrypoints.entry;

  type

    { TCustomerEntry }

    TCustomerEntry = class
    private
    public
      class procedure registerRoutes;
    end;


implementation

{ TCustomerEntry }

class procedure TCustomerEntry.registerRoutes;
begin

end;

end.

