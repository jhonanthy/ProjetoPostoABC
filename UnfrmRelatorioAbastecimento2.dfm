object frmRelatorioAbastecimento2: TfrmRelatorioAbastecimento2
  Left = 0
  Top = 0
  Caption = 'frmRelatorioAbastecimento2'
  ClientHeight = 561
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 114
        Top = 3
        Width = 591
        Height = 50
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLLbTitulo: TRLLabel
          Left = 12
          Top = 9
          Width = 343
          Height = 32
          Caption = 'Relatorio de Abastecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 272
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        BandType = btHeader
        object RLPanel2: TRLPanel
          Left = 5
          Top = 23
          Width = 710
          Height = 33
          Color = clActiveBorder
          ParentColor = False
          Transparent = False
          object RLLabel1: TRLLabel
            Left = 2
            Top = 9
            Width = 37
            Height = 16
            Caption = 'Cod.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 80
            Top = 9
            Width = 82
            Height = 16
            Caption = 'Combustivel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 192
            Top = 9
            Width = 49
            Height = 16
            Caption = 'Bomba'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 272
            Top = 9
            Width = 33
            Height = 16
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 344
            Top = 9
            Width = 112
            Height = 16
            Caption = 'Valor Abastecido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 464
            Top = 9
            Width = 86
            Height = 16
            Caption = 'Imposto(13%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 568
            Top = 9
            Width = 74
            Height = 16
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 57
        object RLDBText2: TRLDBText
          Left = 349
          Top = 22
          Width = 108
          Height = 16
          DataField = 'ABA_VALOR_BRUTO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 469
          Top = 22
          Width = 86
          Height = 16
          DataField = 'Desconto'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 576
          Top = 22
          Width = 140
          Height = 16
          DataField = 'ABA_VALOR_LIQUIDO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 3
          Top = 22
          Width = 89
          Height = 16
          DataField = 'ABA_CODIGO'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 85
          Top = 22
          Width = 74
          Height = 16
          DataField = 'ABA_TIPOCOMBUSTIVEL'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 197
          Top = 22
          Width = 45
          Height = 16
          DataField = 'ABA_BOMBA_UTILIZADA'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 269
          Top = 22
          Width = 72
          Height = 16
          DataField = 'ABA_DATA'
          DataSource = DataSource1
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 122
        Width = 718
        Height = 71
        BandType = btFooter
        object RLLabel3: TRLLabel
          Left = 502
          Top = 41
          Width = 78
          Height = 16
          Caption = 'Valor Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 579
          Top = 41
          Width = 138
          Height = 16
          DataField = 'ABA_VALOR_LIQUIDO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Info = riSum
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 369
      Width = 718
      Height = 104
      BandType = btSummary
      object RLPanel3: TRLPanel
        Left = 3
        Top = 6
        Width = 712
        Height = 95
        Color = clActiveBorder
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 2
          Top = 79
          Width = 135
          Height = 16
          Caption = 'Total Geral(Liquido):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 128
          Top = 79
          Width = 179
          Height = 16
          DataField = 'ABA_VALOR_LIQUIDO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Info = riSum
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 2
          Top = 63
          Width = 133
          Height = 16
          Caption = 'Total Geral Imposto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult3: TRLDBResult
          Left = 128
          Top = 63
          Width = 115
          Height = 16
          Color = clActiveBorder
          DataField = 'DESCONTO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentColor = False
          ParentFont = False
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 2
          Top = 45
          Width = 121
          Height = 16
          Caption = 'Total Geral(Bruto):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult4: TRLDBResult
          Left = 128
          Top = 45
          Width = 179
          Height = 16
          DataField = 'ABA_VALOR_BRUTO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Info = riSum
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
        object RLLabel12: TRLLabel
          Left = 5
          Top = 11
          Width = 59
          Height = 16
          Caption = 'Resumo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
  object FDQuery1: TFDQuery
    Active = True
    OnCalcFields = FDQuery1CalcFields
    Connection = frmCadAbastecimento.FDConnection1
    SQL.Strings = (
      'select'
      'ABA_CODIGO,'
      'ABA_TIPOCOMBUSTIVEL,'
      'ABA_BOMBA_UTILIZADA,'
      'ABA_DATA,'
      'ABA_VALOR_BRUTO,'
      'ABA_VALOR_LIQUIDO'
      'FROM ABASTECIMENTO'
      'order by'
      'ABA_DATA,'
      'ABA_TIPOCOMBUSTIVEL,'
      'ABA_BOMBA_UTILIZADA')
    Left = 288
    Top = 240
    object FDQuery1ABA_CODIGO: TIntegerField
      FieldName = 'ABA_CODIGO'
      Origin = 'ABA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1ABA_TIPOCOMBUSTIVEL: TStringField
      FieldName = 'ABA_TIPOCOMBUSTIVEL'
      Origin = 'ABA_TIPOCOMBUSTIVEL'
      Size = 30
    end
    object FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField
      FieldName = 'ABA_BOMBA_UTILIZADA'
      Origin = 'ABA_BOMBA_UTILIZADA'
    end
    object FDQuery1ABA_DATA: TDateField
      FieldName = 'ABA_DATA'
      Origin = 'ABA_DATA'
    end
    object FDQuery1ABA_VALOR_BRUTO: TSingleField
      FieldName = 'ABA_VALOR_BRUTO'
      Origin = 'ABA_VALOR_BRUTO'
    end
    object FDQuery1ABA_VALOR_LIQUIDO: TSingleField
      FieldName = 'ABA_VALOR_LIQUIDO'
      Origin = 'ABA_VALOR_LIQUIDO'
    end
    object FDQuery1Desconto: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Desconto'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 344
    Top = 248
  end
end
