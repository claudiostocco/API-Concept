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
  , Horse;

  type

    { TCustomerEntry }

    TCustomerEntry = class
    private
    public
      class procedure registerRoutes;
    end;


implementation

procedure onGet(req: THorseRequest; res: THorseResponse);
begin
  try
    res.ContentType('application/json')
       .Status(200)
       .Send('[]');
  except
    on e: EHorseException do
      raise;
    on e: Exception do
      if not (e is EHorseException) then
        raise EHorseException.New.Status(THTTPStatus.InternalServerError).Error('Erro na solicitação do recursso: '''+THorseRequest(req).RawWebRequest.PathInfo+''' Msg de erro: '+e.Message);
  end;
end;

procedure onPost(req: THorseRequest; res: THorseResponse);
begin
  try

  except
    on e: EHorseException do
      raise;
    on e: Exception do
      if not (e is EHorseException) then
        raise EHorseException.New.Status(THTTPStatus.InternalServerError).Error('Erro na solicitação do recursso: '''+THorseRequest(req).RawWebRequest.PathInfo+''' Msg de erro: '+e.Message);
  end;
end;

procedure onPut(req: THorseRequest; res: THorseResponse);
begin
  try

  except
    on e: EHorseException do
      raise;
    on e: Exception do
      if not (e is EHorseException) then
        raise EHorseException.New.Status(THTTPStatus.InternalServerError).Error('Erro na solicitação do recursso: '''+THorseRequest(req).RawWebRequest.PathInfo+''' Msg de erro: '+e.Message);
  end;
end;

procedure onDelete(req: THorseRequest; res: THorseResponse);
begin
  try

  except
    on e: EHorseException do
      raise;
    on e: Exception do
      if not (e is EHorseException) then
        raise EHorseException.New.Status(THTTPStatus.InternalServerError).Error('Erro na solicitação do recursso: '''+THorseRequest(req).RawWebRequest.PathInfo+''' Msg de erro: '+e.Message);
  end;
end;

{ TCustomerEntry }

class procedure TCustomerEntry.registerRoutes;
begin
  THorse.Get('/customer',onGet);
  THorse.Get('/customer/:id',onGet);
  THorse.Get('/customer',onPost);
  THorse.Get('/customer/:id',onPut);
  THorse.Get('/customer/:id',onDelete);
end;

end.

