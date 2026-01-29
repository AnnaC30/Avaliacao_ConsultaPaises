object frmConsultaPaises: TfrmConsultaPaises
  Left = 0
  Top = 0
  Caption = 'Consulta de Pa'#237'ses'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClick = btnConsultarClick
  TextHeight = 15
  object lblPais: TLabel
    Left = 40
    Top = 48
    Width = 77
    Height = 15
    Caption = 'Nome do pa'#237's:'
  end
  object lblNomeOficial: TLabel
    Left = 42
    Top = 136
    Width = 71
    Height = 15
    Caption = 'Nome oficial:'
  end
  object lblCapital: TLabel
    Left = 42
    Top = 184
    Width = 40
    Height = 15
    Caption = 'Capital:'
  end
  object lblRegiao: TLabel
    Left = 42
    Top = 232
    Width = 39
    Height = 15
    Caption = 'Regiao:'
  end
  object lblPopulacao: TLabel
    Left = 42
    Top = 280
    Width = 59
    Height = 15
    Caption = 'Popula'#231#227'o:'
  end
  object lblMoeda: TLabel
    Left = 42
    Top = 328
    Width = 40
    Height = 15
    Caption = 'Moeda:'
  end
  object edtPais: TEdit
    Left = 123
    Top = 48
    Width = 230
    Height = 23
    TabOrder = 0
  end
  object btnConsultar: TButton
    Left = 42
    Top = 88
    Width = 311
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object edtNomeOficial: TEdit
    Left = 119
    Top = 136
    Width = 234
    Height = 23
    ReadOnly = True
    TabOrder = 2
  end
  object edtCapital: TEdit
    Left = 88
    Top = 184
    Width = 265
    Height = 23
    ReadOnly = True
    TabOrder = 3
  end
  object edtRegiao: TEdit
    Left = 87
    Top = 232
    Width = 265
    Height = 23
    ReadOnly = True
    TabOrder = 4
  end
  object edtPopulacao: TEdit
    Left = 107
    Top = 277
    Width = 246
    Height = 23
    ReadOnly = True
    TabOrder = 5
  end
  object edtMoeda: TEdit
    Left = 88
    Top = 328
    Width = 264
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 496
    Top = 48
  end
end
