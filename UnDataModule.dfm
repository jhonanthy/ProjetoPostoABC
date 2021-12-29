object frmDataModule: TfrmDataModule
  Left = 0
  Top = 0
  Caption = 'frmDataModule'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Database=C:\Workspace\ProjetoPostoABC\Base\ProjetoPostoABC.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 72
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ABASTECIMENTO')
    Left = 272
    Top = 128
    object FDQuery1ABA_CODIGO: TIntegerField
      FieldName = 'ABA_CODIGO'
      Origin = 'ABA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1ABA_TIPOCOMBUSTIVEL: TIntegerField
      FieldName = 'ABA_TIPOCOMBUSTIVEL'
      Origin = 'ABA_TIPOCOMBUSTIVEL'
    end
    object FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField
      FieldName = 'ABA_BOMBA_UTILIZADA'
      Origin = 'ABA_BOMBA_UTILIZADA'
    end
    object FDQuery1ABA_QTDLITROS: TFMTBCDField
      FieldName = 'ABA_QTDLITROS'
      Origin = 'ABA_QTDLITROS'
      Precision = 18
      Size = 2
    end
    object FDQuery1ABA_DATA: TDateField
      FieldName = 'ABA_DATA'
      Origin = 'ABA_DATA'
    end
    object FDQuery1ABA_VALOR_BRUTO: TFMTBCDField
      FieldName = 'ABA_VALOR_BRUTO'
      Origin = 'ABA_VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object FDQuery1ABA_VALOR_LIQUIDO: TFMTBCDField
      FieldName = 'ABA_VALOR_LIQUIDO'
      Origin = 'ABA_VALOR_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object FDQuery1ABA_PRECO_COMBUSTIVEL: TFMTBCDField
      FieldName = 'ABA_PRECO_COMBUSTIVEL'
      Origin = 'ABA_PRECO_COMBUSTIVEL'
      Precision = 18
      Size = 2
    end
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'ABA_CODIGO'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'ABASTECIMENTO'
    TableName = 'ABASTECIMENTO'
    Left = 120
    Top = 96
    object FDTable1ABA_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ABA_CODIGO'
    end
    object FDTable1ABA_BOMBA_UTILIZADA: TIntegerField
      FieldName = 'ABA_BOMBA_UTILIZADA'
    end
    object FDTable1ABA_QTDLITROS: TFMTBCDField
      FieldName = 'ABA_QTDLITROS'
      Precision = 18
      Size = 2
    end
    object FDTable1ABA_DATA: TDateField
      FieldName = 'ABA_DATA'
    end
    object FDTable1ABA_VALOR_BRUTO: TFMTBCDField
      FieldName = 'ABA_VALOR_BRUTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDTable1ABA_VALOR_LIQUIDO: TFMTBCDField
      FieldName = 'ABA_VALOR_LIQUIDO'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDTable1ABA_PRECO_COMBUSTIVEL: TFMTBCDField
      FieldName = 'ABA_PRECO_COMBUSTIVEL'
      Origin = 'ABA_PRECO_COMBUSTIVEL'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDTable1DESCONTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DESCONTO'
      Calculated = True
    end
    object FDTable1ABA_TIPOCOMBUSTIVEL: TStringField
      FieldName = 'ABA_TIPOCOMBUSTIVEL'
      Origin = 'ABA_TIPOCOMBUSTIVEL'
      Size = 30
    end
  end
  object FDQueryConsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ABASTECIMENTO')
    Left = 264
    Top = 32
  end
end
