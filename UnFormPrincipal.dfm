object frmFormPrincipal: TfrmFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema PostoABC'
  ClientHeight = 428
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 428
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 658
      Height = 428
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cadastro Abastecimento'
        object pnlCadastroAbastecimento: TPanel
          Left = 0
          Top = 0
          Width = 650
          Height = 400
          Align = alClient
          TabOrder = 0
          object pnlTop: TPanel
            Left = 1
            Top = 1
            Width = 648
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object sb_Inserir: TSpeedButton
              Left = 283
              Top = 2
              Width = 57
              Height = 33
              Caption = 'Novo'
              OnClick = sb_InserirClick
            end
            object sb_alterar: TSpeedButton
              Left = 346
              Top = 2
              Width = 57
              Height = 33
              Caption = 'Alterar'
              OnClick = sb_alterarClick
            end
            object Sb_Excluir: TSpeedButton
              Left = 466
              Top = 1
              Width = 57
              Height = 33
              Caption = 'Excluir'
              OnClick = Sb_ExcluirClick
            end
            object Sb_Sair: TSpeedButton
              Left = 585
              Top = 1
              Width = 57
              Height = 33
              Caption = 'Sair'
              OnClick = Sb_SairClick
            end
            object Sb_Limpar: TSpeedButton
              Left = 525
              Top = 1
              Width = 57
              Height = 33
              Caption = 'Limpar'
              OnClick = Sb_LimparClick
            end
            object sb_gravar: TSpeedButton
              Left = 405
              Top = 2
              Width = 57
              Height = 33
              Caption = 'Gravar'
              OnClick = sb_gravarClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 1
            Top = 42
            Width = 648
            Height = 357
            Align = alClient
            Caption = 'Abastecimento'
            TabOrder = 1
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
              Left = 177
              Top = 69
              Width = 80
              Height = 13
              Caption = 'Valor Abastecido'
            end
            object lbValorAbastecido: TLabel
              Left = 410
              Top = 69
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
              Left = 282
              Top = 69
              Width = 101
              Height = 13
              Hint = 'Valor Abastecido -13%(Imposto)'
              Caption = 'Desc.Imposto(-13%)'
            end
            object edtCodigo: TDBEdit
              Left = 3
              Top = 35
              Width = 53
              Height = 21
              DataField = 'ABA_CODIGO'
              DataSource = DataSource1
              TabOrder = 1
            end
            object CbBombaUtilizada: TComboBox
              Left = 3
              Top = 88
              Width = 145
              Height = 21
              Style = csDropDownList
              Enabled = False
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 177
              Top = 88
              Width = 79
              Height = 21
              DataField = 'ABA_VALOR_BRUTO'
              DataSource = DataSource1
              TabOrder = 2
              OnExit = DBEdit2Exit
            end
            object DBEdtValorAbastecido: TDBEdit
              Left = 410
              Top = 88
              Width = 59
              Height = 21
              DataField = 'ABA_VALOR_LIQUIDO'
              DataSource = DataSource1
              TabOrder = 3
            end
            object edtData: TDBEdit
              Left = 93
              Top = 35
              Width = 121
              Height = 21
              DataField = 'ABA_DATA'
              DataSource = DataSource1
              TabOrder = 4
            end
            object edtDesconto: TEdit
              Left = 283
              Top = 88
              Width = 102
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Text = 'edtDesconto'
            end
            object RdgTipoCombustivel: TDBRadioGroup
              Left = 252
              Top = 22
              Width = 309
              Height = 43
              Caption = 'Tipo de Combustivel'
              Columns = 2
              DataField = 'ABA_TIPOCOMBUSTIVEL'
              DataSource = DataSource1
              Items.Strings = (
                'Gasolina'
                'Ol'#233'o Diesel')
              TabOrder = 6
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
          Width = 650
          Height = 351
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ABA_CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_TIPOCOMBUSTIVEL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_BOMBA_UTILIZADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_QTDLITROS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_DATA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_VALOR_BRUTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABA_VALOR_LIQUIDO'
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 650
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
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
          end
          object ComboBox1: TComboBox
            Left = 499
            Top = 13
            Width = 146
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'Codigo do Abastecimento'
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
  object IBDataSet1: TIBDataSet
    Database = frmDataModule.IBDatabase1
    Transaction = frmDataModule.Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ABASTECIMENTO'
      'where'
      '  ABA_CODIGO = :OLD_ABA_CODIGO')
    InsertSQL.Strings = (
      'insert into ABASTECIMENTO'
      
        '  (ABA_CODIGO, ABA_TIPOCOMBUSTIVEL, ABA_BOMBA_UTILIZADA, ABA_QTD' +
        'LITROS, '
      '   ABA_DATA, ABA_VALOR_BRUTO, ABA_VALOR_LIQUIDO)'
      'values'
      
        '  (:ABA_CODIGO, :ABA_TIPOCOMBUSTIVEL, :ABA_BOMBA_UTILIZADA, :ABA' +
        '_QTDLITROS, '
      '   :ABA_DATA, :ABA_VALOR_BRUTO, :ABA_VALOR_LIQUIDO)')
    SelectSQL.Strings = (
      'select * from ABASTECIMENTO')
    ModifySQL.Strings = (
      'update ABASTECIMENTO'
      'set'
      '  ABA_CODIGO = :ABA_CODIGO,'
      '  ABA_TIPOCOMBUSTIVEL = :ABA_TIPOCOMBUSTIVEL,'
      '  ABA_BOMBA_UTILIZADA = :ABA_BOMBA_UTILIZADA,'
      '  ABA_QTDLITROS = :ABA_QTDLITROS,'
      '  ABA_DATA = :ABA_DATA,'
      '  ABA_VALOR_BRUTO = :ABA_VALOR_BRUTO,'
      '  ABA_VALOR_LIQUIDO = :ABA_VALOR_LIQUIDO'
      'where'
      '  ABA_CODIGO = :OLD_ABA_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 436
    Top = 146
    object IBDataSet1ABA_CODIGO: TIntegerField
      FieldName = 'ABA_CODIGO'
      Origin = 'ABASTECIMENTO.ABA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDataSet1ABA_TIPOCOMBUSTIVEL: TIntegerField
      FieldName = 'ABA_TIPOCOMBUSTIVEL'
      Origin = 'ABASTECIMENTO.ABA_TIPOCOMBUSTIVEL'
    end
    object IBDataSet1ABA_BOMBA_UTILIZADA: TIntegerField
      FieldName = 'ABA_BOMBA_UTILIZADA'
      Origin = 'ABASTECIMENTO.ABA_BOMBA_UTILIZADA'
    end
    object IBDataSet1ABA_QTDLITROS: TIBBCDField
      FieldName = 'ABA_QTDLITROS'
      Origin = 'ABASTECIMENTO.ABA_QTDLITROS'
      Precision = 18
      Size = 2
    end
    object IBDataSet1ABA_DATA: TDateField
      FieldName = 'ABA_DATA'
      Origin = 'ABASTECIMENTO.ABA_DATA'
    end
    object IBDataSet1ABA_VALOR_BRUTO: TIBBCDField
      FieldName = 'ABA_VALOR_BRUTO'
      Origin = 'ABASTECIMENTO.ABA_VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object IBDataSet1ABA_VALOR_LIQUIDO: TIBBCDField
      FieldName = 'ABA_VALOR_LIQUIDO'
      Origin = 'ABASTECIMENTO.ABA_VALOR_LIQUIDO'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 368
    Top = 147
  end
end
