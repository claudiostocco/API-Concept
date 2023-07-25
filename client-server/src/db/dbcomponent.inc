{$ifdef FPC}
  {$define USE_SQLDB}
  {$define USE_ZEOS}
  {$define DEFAULT_ZEOS}
  {define DEFAULT_SQLDB}
{$else}
  {$define USE_FIREDAC}
{$endif}

