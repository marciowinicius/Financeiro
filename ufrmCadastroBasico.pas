unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    stat1: TStatusBar;
    pnl1: TPanel;
    acttb1: TActionToolBar;
    pgcCadastro: TPageControl;
    tbsCadastro: TTabSheet;
    tbsPesquisa: TTabSheet;
    dbgrd1: TDBGrid;
    ilCadastro: TImageList;
    actmgrCadastro: TActionManager;
    actInserir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actPesquisar: TAction;
    actImprimir: TAction;
    actFechar: TAction;
    procedure FormKeyPress(Sender: TObject; var key: Char);
    procedure actInserirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisaShow(Sender: TObject);
    procedure actInserirUpdate(Sender: TObject);
    procedure actSalvarUpdate(Sender: TObject);
    procedure actEditarUpdate(Sender: TObject);
    procedure actExcluirUpdate(Sender: TObject);
    procedure actImprimirUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses ModConexao;


procedure TfrmCadastroBasico.actCancelarExecute(Sender: TObject);
begin
  TClientDataSet(dsTabela.DataSet).Cancel;
  if pgcCadastro.ActivePage = tbsCadastro then
    pgcCadastro.ActivePage := tbsPesquisa;

end;

procedure TfrmCadastroBasico.actCancelarUpdate(Sender: TObject);
begin
  actCancelar.Enabled := actSalvar.Enabled = True;
end;

procedure TfrmCadastroBasico.actEditarExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCadastroBasico.actEditarUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  actEditar.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actExcluirExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCadastroBasico.actExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  actExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroBasico.actImprimirExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCadastroBasico.actImprimirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  actImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actInserirExecute(Sender: TObject);
begin
  if pgcCadastro.ActivePage = tbsPesquisa then
    pgcCadastro.ActivePage := tbsCadastro;
    TClientDataSet(dsTabela.DataSet).Open;
    TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmCadastroBasico.actInserirUpdate(Sender: TObject);
begin
  actInserir.Enabled := dsTabela.State in [dsBrowse,dsInactive];
end;

procedure TfrmCadastroBasico.actPesquisarExecute(Sender: TObject);
begin
  TClientDataSet(dsTabela.DataSet).Close;
  TClientDataSet(dsTabela.DataSet).Open;
end;

procedure TfrmCadastroBasico.actSalvarExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCadastroBasico.actSalvarUpdate(Sender: TObject);
begin
  actSalvar.Enabled := dsTabela.State in [dsInsert,dsEdit];
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

procedure TfrmCadastroBasico.tbsPesquisaShow(Sender: TObject);
begin
  pgcCadastro.ActivePage := tbsPesquisa;
end;

end.
