object frmConfigRelatorios: TfrmConfigRelatorios
  Left = 0
  Top = 0
  Caption = 'frmConfigRelatorios'
  ClientHeight = 249
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 249
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 304
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object rdgRelatorios: TRadioGroup
      Left = 0
      Top = 0
      Width = 447
      Height = 105
      Align = alTop
      Caption = 'Relatorios'
      Columns = 2
      Items.Strings = (
        'Modelo 1 (Todos os Agrupamentos)'
        'Modelo 2 (Agrupamento Escolhido)')
      TabOrder = 0
      OnClick = rdgRelatoriosClick
      ExplicitTop = 8
    end
    object pnlRelatorios: TPanel
      Left = 0
      Top = 153
      Width = 447
      Height = 96
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 104
      ExplicitWidth = 445
      object sbImprimir: TSpeedButton
        Left = 0
        Top = 41
        Width = 447
        Height = 55
        Align = alBottom
        Caption = 'Relatorios      '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B4444444444444444444444444444
          4444444444444444444444444444444444444444444444444444444444444444
          44444B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A5151517777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777751
          51510A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFB2B2B27777777777
          77777777777777777777777777777777777777777777777777B2B2B2FFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFF8585854444444444
          44444444444444444444444444444444444444444444444444868686FFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0
          3B3B3B111111111111111111111111010101ADADADFFFFFF6161611111111111
          11111111111111111111111111111111161616E2E2E2FFFFFFFFFFFFFFFFFFAD
          ADAD0101011111111111111111111111113C3C3CE0E0E0FFFFFFFFFFFF626262
          000000000000000000000000000000000000ADADADFFFFFFD6D6D6AAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB3B3B3FDFDFDFFFFFFFFFFFFFFFFFFAD
          ADAD000000000000000000000000000000000000636363FFFFFFFFFFFF484848
          000000000000000000000000000000000000ADADADFFFFFFC9C9C99999999999
          99999999999999999999999999999999999999999999999999C9C9C9FFFFFFAD
          ADAD000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          000000000000000000000000000000000000ADADADFFFFFF6E6E6E2222222222
          222222222222222222222222222222222222222222222222226F6F6FFFFFFFAD
          ADAD000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          000000000000000000000000000000000000ADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000008B8B8BCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8B
          8B8B000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001F1F1F464646010101000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000020202E7E7E7FFFFFF636363000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000D5D5D5FEFEFE505050000000000000484848FFFFFFFFFFFF484848
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000B0B0B202020000000000000000000484848FFFFFFFFFFFF4F4F4F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000004F4F4FFFFFFFFFFFFFA1A1A1
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010101A2A2A2FFFFFFFFFFFFFFFFFF
          C9C9C99A9A9A9999999999999999990606066868689999999999999999999999
          9999999999999999999999999999999999999999999999999999999999999968
          68680606069999999999999999999A9A9AC9C9C9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0AADADADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
          ADAD0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A5151517777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777751
          51510A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B4444444444444444444444444444
          4444444444444444444444444444444444444444444444444444444444444444
          44444B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = sbImprimirClick
        ExplicitLeft = 239
        ExplicitTop = 33
        ExplicitWidth = 176
      end
    end
    object GroupAgrupamentos: TGroupBox
      Left = 0
      Top = 105
      Width = 447
      Height = 88
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 5
        Top = 4
        Width = 74
        Height = 13
        Caption = 'Agrupamentos:'
      end
      object CbAgrupamentos: TComboBox
        Left = 3
        Top = 23
        Width = 198
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Dia'
        Items.Strings = (
          'Dia'
          'Tanque'
          'Bomba')
      end
    end
  end
end