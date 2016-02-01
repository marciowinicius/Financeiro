unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls;

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
    procedure FormKeyPress(Sender: TObject; var key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

procedure TfrmCadastroBasico.FormKeyPress(Sender: TObject; var key: char);
begin
  if key = #27 then
    Close;
  if key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

end.
