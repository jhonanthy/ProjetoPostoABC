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
  object IbqConsulta: TIBQuery
    Database = IBDatabase1
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 208
    Top = 32
  end
  object DsConsulta: TDataSource
    DataSet = IbqConsulta
    Left = 256
    Top = 32
  end
  object Trans: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 88
    Top = 16
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Workspace\ProjetoPostoABC\Base\ProjetoPostoABC.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Trans
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
end
