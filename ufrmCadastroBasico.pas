unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Vcl.Buttons;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    stat1: TStatusBar;
    pnl1: TPanel;
    pgcCadastro: TPageControl;
    tbsCadastro: TTabSheet;
    ilCadastro: TImageList;
    Label1: TLabel;
    edtPesquisar: TEdit;
    btnFiltrar: TButton;
    actacoes: TActionList;
    acInserir: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acPesquisar: TAction;
    acImprimir: TAction;
    acFechar: TAction;
    btnInserir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnFechar: TSpeedButton;
    dbgDados: TDBGrid;
    tbsPesquisa: TTabSheet;
    procedure FormKeyPress(Sender: TObject; var key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisarShow(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acInserirUpdate(Sender: TObject);
    procedure acEditarUpdate(Sender: TObject);
    procedure acExcluirUpdate(Sender: TObject);
    procedure acSalvarUpdate(Sender: TObject);
    procedure acCancelarUpdate(Sender: TObject);
    procedure acImprimirUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses ModConexao;


procedure TfrmCadastroBasico.acCancelarExecute(Sender: TObject);
begin
  LimparTudo;
  TClientDataSet(dsTabela.DataSet).Cancel;
end;

procedure TfrmCadastroBasico.acCancelarUpdate(Sender: TObject);
begin
  acCancelar.Enabled := acSalvar.Enabled = True;
end;

procedure TfrmCadastroBasico.acEditarExecute(Sender: TObject);
begin
  if pgcCadastro.ActivePage = tbsPesquisa then
    pgcCadastro.ActivePage := tbsCadastro;
  TClientDataSet(dsTabela.DataSet).Edit;
end;

procedure TfrmCadastroBasico.acEditarUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  acEditar.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acExcluirExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
    begin
      try
        TClientDataSet(dsTabela.DataSet).Delete;
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

        Application.MessageBox('Registro excluído com sucesso!', 'Informação', 0+64);
        TClientDataSet(dsTabela.DataSet).Open;

        except on E : Exception do
        raise Exception.Create('Erro ao excluir registro: '+E.Message);

      end;
    end;
end;

procedure TfrmCadastroBasico.acExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  acExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroBasico.acImprimirExecute(Sender: TObject);
begin
  ShowMessage('Em desenvolvimento');
end;

procedure TfrmCadastroBasico.acImprimirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  acImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acInserirExecute(Sender: TObject);
begin
  if pgcCadastro.ActivePage = tbsPesquisa then
    pgcCadastro.ActivePage := tbsCadastro;

    if not TClientDataSet(dsTabela).Active then
    TClientDataSet(dsTabela.DataSet).Open;
    TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmCadastroBasico.acInserirUpdate(Sender: TObject);
begin
  acInserir.Enabled := dsTabela.State in [dsBrowse,dsInactive];
end;

procedure TfrmCadastroBasico.acPesquisarExecute(Sender: TObject);
begin
  TClientDataSet(dsTabela.DataSet).Close;
  TClientDataSet(dsTabela.DataSet).Open;
end;

procedure TfrmCadastroBasico.acSalvarExecute(Sender: TObject);
begin
  try
   TClientDataSet(dsTabela.DataSet).Post;
   TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

    case dsTabela.State of
      dsEdit : Application.MessageBox('Registro atualizado com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
      dsInsert : Application.MessageBox('Registro inserido com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    end;

      //limpar os campos
        LimparTudo;
        TClientDataSet(dsTabela.DataSet).Open;



    except on E : Exception do
    raise Exception.Create('Erro ao salvar registro: '+E.Message);
  end
end;

procedure TfrmCadastroBasico.acSalvarUpdate(Sender: TObject);
begin
  acSalvar.Enabled := dsTabela.State in [dsInsert,dsEdit];
end;

procedure TfrmCadastroBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TClientDataSet(dsTabela.DataSet).Cancel;
  TClientDataSet(dsTabela.DataSet).Close;
end;

procedure TfrmCadastroBasico.FormKeyPress(Sender: TObject; var key: char);
begin
  if key = #27 then
    Close;
  if key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadastroBasico.LimparTudo;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TCustomEdit then
    TCustomEdit(Components[i]).Clear;
  end;
  if pgcCadastro.ActivePage = tbsCadastro then
      pgcCadastro.ActivePage := tbsPesquisa;

end;

procedure TfrmCadastroBasico.tbsPesquisarShow(Sender: TObject);
begin
  pgcCadastro.ActivePage := tbsPesquisa;
end;

end.
