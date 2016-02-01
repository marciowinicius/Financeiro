object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 340
  Width = 447
  object SQLConnection: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver220.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=22.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver220.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=22.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=financeiro'
      'User_Name=root'
      'Password=winicius11'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 32
    Top = 16
  end
  object sdsCaixa: TSQLDataSet
    CommandText = 'select *from caixa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 24
    Top = 88
  end
  object dspCaixa: TDataSetProvider
    DataSet = sdsCaixa
    Left = 104
    Top = 88
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 184
    Top = 88
    object cdsCaixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsCaixanumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object cdsCaixadescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsCaixavalor: TFMTBCDField
      FieldName = 'valor'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsCaixatipo: TStringField
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCaixadt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
  end
  object sdsContas_pagar: TSQLDataSet
    CommandText = 'select *from contas_pagar'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 24
    Top = 136
  end
  object dspContas_pagar: TDataSetProvider
    DataSet = sdsContas_pagar
    Left = 104
    Top = 136
  end
  object cdsContas_pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_pagar'
    Left = 184
    Top = 136
    object cdsContas_pagarid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsContas_pagarnumero_doc: TStringField
      FieldName = 'numero_doc'
      Required = True
    end
    object cdsContas_pagardescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContas_pagarparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
    end
    object cdsContas_pagarvlr_parcela: TFMTBCDField
      FieldName = 'vlr_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagarvlr_compra: TFMTBCDField
      FieldName = 'vlr_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagarvlr_abatido: TFMTBCDField
      FieldName = 'vlr_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagardt_compra: TDateField
      FieldName = 'dt_compra'
      Required = True
    end
    object cdsContas_pagardt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdsContas_pagardt_vencimento: TDateField
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdsContas_pagardt_pagamento: TDateField
      FieldName = 'dt_pagamento'
      Required = True
    end
    object cdsContas_pagarstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sdsContas_receber: TSQLDataSet
    CommandText = 'select *from contas_receber'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 24
    Top = 192
  end
  object dspContas_receber: TDataSetProvider
    DataSet = sdsContas_receber
    Left = 104
    Top = 192
  end
  object cdsContas_receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_receber'
    Left = 184
    Top = 192
    object cdsContas_receberid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsContas_receberdocumento: TStringField
      FieldName = 'documento'
      Required = True
    end
    object cdsContas_receberdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContas_receberparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
    end
    object cdsContas_recebervlr_parcela: TFMTBCDField
      FieldName = 'vlr_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_recebervlr_compra: TFMTBCDField
      FieldName = 'vlr_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_recebervlr_abatido: TFMTBCDField
      FieldName = 'vlr_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_receberdt_compra: TDateField
      FieldName = 'dt_compra'
      Required = True
    end
    object cdsContas_receberdt_vencimento: TDateField
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdsContas_receberdt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdsContas_receberstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsContas_receberdt_pagamento: TDateField
      FieldName = 'dt_pagamento'
    end
  end
  object sdsUsuarios: TSQLDataSet
    CommandText = 'select *from usuarios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 24
    Top = 248
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sdsUsuarios
    Left = 104
    Top = 248
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 184
    Top = 248
    object cdsUsuariosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsUsuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object cdsUsuarioslogin: TStringField
      FieldName = 'login'
      Required = True
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
      Required = True
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsUsuariosdt_cadastro: TDateField
      FieldName = 'dt_cadastro'
    end
  end
end
