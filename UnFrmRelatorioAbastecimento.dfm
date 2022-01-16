object frmRelatorioAbastecimento: TfrmRelatorioAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmRelatorioAbastecimento'
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
    Top = -8
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLGroup1: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 360
      DataFields = 'ABA_DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 54
        BandType = btHeader
        object RLPanel2: TRLPanel
          Left = 5
          Top = 15
          Width = 710
          Height = 33
          Color = clActiveBorder
          ParentColor = False
          Transparent = False
          object RLDBText3: TRLDBText
            Left = 146
            Top = 10
            Width = 72
            Height = 16
            DataField = 'ABA_DATA'
            DataSource = DataSource1
            Text = ''
            Transparent = False
          end
          object RLLabel1: TRLLabel
            Left = 0
            Top = 10
            Width = 155
            Height = 16
            Caption = 'Data do Abastecimento:'
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
      object RLGroup2: TRLGroup
        Left = 0
        Top = 54
        Width = 718
        Height = 223
        DataFields = 'ABA_TIPOCOMBUSTIVEL'
        object RLBand1: TRLBand
          Left = 0
          Top = 137
          Width = 718
          Height = 51
          object RLDBText1: TRLDBText
            Left = 270
            Top = 14
            Width = 83
            Height = 16
            DataField = 'ABA_VALOR_LIQUIDO'
            DataSource = DataSource1
            DisplayMask = 'R$#,##0.00'
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 8
            Top = 14
            Width = 73
            Height = 16
            DataField = 'ABA_VALOR_BRUTO'
            DataSource = DataSource1
            DisplayMask = 'R$#,##0.00'
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 131
            Top = 14
            Width = 76
            Height = 16
            DataField = 'DESCONTO'
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
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 41
          BandType = btHeader
          object RLDBText4: TRLDBText
            Left = 151
            Top = 12
            Width = 159
            Height = 16
            DataField = 'ABA_TIPOCOMBUSTIVEL'
            DataSource = DataSource1
            Text = ''
          end
          object RLLabel4: TRLLabel
            Left = 1
            Top = 12
            Width = 142
            Height = 16
            Caption = 'Tanque(Combustivel):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLGroup3: TRLGroup
          Left = 0
          Top = 41
          Width = 718
          Height = 96
          DataFields = 'ABA_BOMBA_UTILIZADA'
          object RLBand6: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 90
            BandType = btFooter
            object RLLabel5: TRLLabel
              Left = 3
              Top = 17
              Width = 113
              Height = 16
              Caption = 'Bomba Utilizada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText5: TRLDBText
              Left = 151
              Top = 17
              Width = 159
              Height = 16
              DataField = 'ABA_BOMBA_UTILIZADA'
              DataSource = DataSource1
              Text = ''
            end
            object RLLabel6: TRLLabel
              Left = 3
              Top = 62
              Width = 80
              Height = 16
              Caption = 'Valor Bruto:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel8: TRLLabel
              Left = 126
              Top = 62
              Width = 90
              Height = 16
              Caption = 'Imposto(13%):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel9: TRLLabel
              Left = 270
              Top = 62
              Width = 94
              Height = 16
              Caption = 'Valor Liquido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 277
        Width = 718
        Height = 76
        BandType = btFooter
        object RLLabel2: TRLLabel
          Left = 385
          Top = 17
          Width = 117
          Height = 16
          Caption = 'Total Liquido Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 495
          Top = 17
          Width = 179
          Height = 16
          DataField = 'ABA_VALOR_LIQUIDO'
          DataSource = DataSource1
          DisplayMask = 'R$#,##0.00'
          Info = riSum
          ResetAfterPrint = True
          Text = ''
        end
        object RLDraw1: TRLDraw
          Left = 3
          Top = 39
          Width = 712
          Height = 35
          DrawKind = dkLine
        end
      end
    end
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
        object RLLabel3: TRLLabel
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
    object RLBand7: TRLBand
      Left = 38
      Top = 457
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
      'ABA_BOMBA_UTILIZADA'
      ''
      ''
      ''
      '')
    Left = 400
    Top = 264
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
    object FDQuery1DESCONTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DESCONTO'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 464
    Top = 264
  end
end
