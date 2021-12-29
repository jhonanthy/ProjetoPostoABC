object frmFormPrincipal: TfrmFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema PostoABC'
  ClientHeight = 368
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 943
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 658
    ExplicitHeight = 335
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 943
      Height = 368
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 658
      ExplicitHeight = 335
      object TabSheet1: TTabSheet
        Caption = 'Cadastro Abastecimento'
        object pnlCadastroAbastecimento: TPanel
          Left = 0
          Top = 0
          Width = 935
          Height = 340
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 650
          ExplicitHeight = 307
          object pnlTop: TPanel
            Left = 1
            Top = 1
            Width = 933
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 648
            object Sb_Limpar: TSpeedButton
              Left = 525
              Top = 1
              Width = 57
              Height = 33
              Caption = 'Limpar'
              OnClick = Sb_LimparClick
            end
            object DBNavigator1: TDBNavigator
              Left = 4
              Top = 1
              Width = 495
              Height = 34
              DataSource = DataSource1
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              TabOrder = 0
              BeforeAction = DBNavigator1BeforeAction
              OnClick = DBNavigator1Click
            end
          end
          object GroupBox1: TGroupBox
            Left = 1
            Top = 42
            Width = 933
            Height = 297
            Align = alClient
            Caption = 'Abastecimento'
            TabOrder = 1
            ExplicitWidth = 648
            ExplicitHeight = 264
            object Label1: TLabel
              Left = 4
              Top = 22
              Width = 27
              Height = 13
              Caption = 'Cod:.'
            end
            object Label2: TLabel
              Left = 3
              Top = 71
              Width = 79
              Height = 13
              Caption = 'Bomba Utilizada:'
            end
            object Label3: TLabel
              Left = 328
              Top = 71
              Width = 80
              Height = 13
              Caption = 'Valor Abastecido'
            end
            object lbValorAbastecido: TLabel
              Left = 561
              Top = 71
              Width = 59
              Height = 13
              Hint = 'Valor Abastecido -13%(Imposto)'
              Caption = 'Valor TOTAL'
            end
            object lbData: TLabel
              Left = 92
              Top = 22
              Width = 116
              Height = 13
              Caption = 'Data do Abastecimento:'
            end
            object Label4: TLabel
              Left = 433
              Top = 71
              Width = 101
              Height = 13
              Hint = 'Valor Abastecido -13%(Imposto)'
              Caption = 'Desc.Imposto(-13%)'
            end
            object Label5: TLabel
              Left = 231
              Top = 71
              Width = 50
              Height = 13
              Caption = 'QTD Litros'
            end
            object Label6: TLabel
              Left = 154
              Top = 71
              Width = 27
              Height = 13
              Caption = 'Pre'#231'o'
            end
            object CbBombaUtilizada: TComboBox
              Left = 3
              Top = 88
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 0
            end
            object DBEdtValAbastecido: TDBEdit
              Left = 328
              Top = 88
              Width = 79
              Height = 21
              Color = clBtnFace
              DataField = 'ABA_VALOR_BRUTO'
              DataSource = DataSource1
              Enabled = False
              TabOrder = 3
              OnChange = DBEdtValAbastecidoChange
            end
            object DBEdtValTotal: TDBEdit
              Left = 561
              Top = 88
              Width = 59
              Height = 21
              Color = clBtnFace
              DataField = 'ABA_VALOR_LIQUIDO'
              DataSource = DataSource1
              Enabled = False
              TabOrder = 4
            end
            object edtData: TDBEdit
              Left = 93
              Top = 35
              Width = 121
              Height = 21
              Color = clBtnFace
              DataField = 'ABA_DATA'
              DataSource = DataSource1
              TabOrder = 5
            end
            object DBEdtLitro: TDBEdit
              Left = 231
              Top = 88
              Width = 79
              Height = 21
              DataField = 'ABA_QTDLITROS'
              DataSource = DataSource1
              TabOrder = 2
              OnExit = DBEdtLitroExit
            end
            object DBEdtPreco: TDBEdit
              Left = 154
              Top = 88
              Width = 63
              Height = 21
              DataField = 'ABA_PRECO_COMBUSTIVEL'
              DataSource = DataSource1
              TabOrder = 1
            end
            object edtCodigo: TDBEdit
              Left = 3
              Top = 35
              Width = 64
              Height = 21
              Color = clBtnFace
              DataField = 'ABA_CODIGO'
              DataSource = DataSource1
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdtDesconto: TDBEdit
              Left = 433
              Top = 88
              Width = 101
              Height = 21
              Color = clBtnFace
              DataField = 'DESCONTO'
              DataSource = DataSource1
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Consulta Abastecimentos'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 49
          Width = 935
          Height = 291
          Align = alClient
          DataSource = DsConsulta
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ABA_CODIGO'
              Title.Caption = 'Codigo'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_TIPOCOMBUSTIVEL'
              Title.Caption = 'Tipo do Combust'#237'vel'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_BOMBA_UTILIZADA'
              Title.Caption = 'n'#186' da Bomba Utilizada'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_QTDLITROS'
              Title.Caption = 'Quant. Litros'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_DATA'
              Title.Caption = 'Data do Abastecimento'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_PRECO_COMBUSTIVEL'
              Title.Caption = 'Pre'#231'o do Litro'
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_VALOR_BRUTO'
              Title.Caption = 'Valor do Abastecimento'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_VALOR_LIQUIDO'
              Title.Caption = 'Valor do Abastecimento Total'
              Width = 148
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 935
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 650
          object lbConsulta: TLabel
            Left = 3
            Top = 16
            Width = 46
            Height = 13
            Caption = 'Pesquisa:'
          end
          object edtConsulta: TEdit
            Left = 58
            Top = 13
            Width = 433
            Height = 21
            TabOrder = 0
            OnChange = edtConsultaChange
          end
          object cbPesquisa: TComboBox
            Left = 499
            Top = 13
            Width = 146
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            OnChange = cbPesquisaChange
            Items.Strings = (
              'Codigo do Abastecimento'
              'Tipo de Combustivel'
              'Bomba Utilizada'
              'Dia'
              'M'#234's'
              'Ano'
              'Todos os Registros')
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = frmDataModule.FDTable1
    Left = 368
    Top = 147
  end
  object DsConsulta: TDataSource
    DataSet = frmDataModule.FDQueryConsulta
    Left = 464
    Top = 155
  end
end
