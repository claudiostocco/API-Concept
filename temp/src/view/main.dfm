object fmMain: TfmMain
  Left = 149
  Top = 31
  Caption = 'Menu'
  ClientHeight = 148
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 172
    Top = 66
    object MenuItem1: TMenuItem
      Caption = 'Cadastros'
      object MenuItem5: TMenuItem
        Caption = 'Clientes'
        OnClick = MenuItem5Click
      end
    end
    object MenuItem2: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object MenuItem3: TMenuItem
      Caption = 'Ajuda'
      object MenuItem4: TMenuItem
        Caption = 'Sobre'
        OnClick = MenuItem4Click
      end
    end
  end
end
