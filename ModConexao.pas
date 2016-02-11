unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXMySQL,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TdmDados = class(TDataModule)
    SQLConnection: TSQLConnection;
    sdsCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    sdsContas_pagar: TSQLDataSet;
    dspContas_pagar: TDataSetProvider;
    cdsContas_pagar: TClientDataSet;
    sdsContas_receber: TSQLDataSet;
    dspContas_receber: TDataSetProvider;
    cdsContas_receber: TClientDataSet;
    sdsUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsCaixaid: TIntegerField;
    cdsCaixanumero: TStringField;
    cdsCaixadescricao: TStringField;
    cdsCaixavalor: TFMTBCDField;
    cdsCaixatipo: TStringField;
    cdsCaixadt_cadastro: TDateField;
    cdsContas_pagarid: TIntegerField;
    cdsContas_pagarnumero_doc: TStringField;
    cdsContas_pagardescricao: TStringField;
    cdsContas_pagarparcela: TIntegerField;
    cdsContas_pagarvlr_parcela: TFMTBCDField;
    cdsContas_pagarvlr_compra: TFMTBCDField;
    cdsContas_pagarvlr_abatido: TFMTBCDField;
    cdsContas_pagardt_compra: TDateField;
    cdsContas_pagardt_cadastro: TDateField;
    cdsContas_pagardt_vencimento: TDateField;
    cdsContas_pagardt_pagamento: TDateField;
    cdsContas_pagarstatus: TStringField;
    cdsContas_receberid: TIntegerField;
    cdsContas_receberdocumento: TStringField;
    cdsContas_receberdescricao: TStringField;
    cdsContas_receberparcela: TIntegerField;
    cdsContas_recebervlr_parcela: TFMTBCDField;
    cdsContas_recebervlr_compra: TFMTBCDField;
    cdsContas_recebervlr_abatido: TFMTBCDField;
    cdsContas_receberdt_compra: TDateField;
    cdsContas_receberdt_vencimento: TDateField;
    cdsContas_receberdt_cadastro: TDateField;
    cdsContas_receberstatus: TStringField;
    cdsContas_receberdt_pagamento: TDateField;
    cdsUsuariosid: TIntegerField;
    cdsUsuariosnome: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariossenha: TStringField;
    cdsUsuariosstatus: TStringField;
    cdsUsuariosdt_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
