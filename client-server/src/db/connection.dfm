object dmConn: TdmConn
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 241
  Width = 271
  object Cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 20
    Top = 16
  end
  object FDConnection: TFDConnection
    Left = 92
    Top = 16
  end
  object PgDriverLink: TFDPhysPgDriverLink
    Left = 40
    Top = 76
  end
end
