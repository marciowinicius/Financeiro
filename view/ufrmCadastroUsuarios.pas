unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroUsuarios = class(TfrmCadastroBasico)
    lblNome: TLabel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    procedure acSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}

uses ModConexao;

procedure TfrmCadastroUsuarios.acSalvarExecute(Sender: TObject);
begin
  if Trim(edtNome.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo nome!','Aten��o',MB_OK+MB_ICONWARNING);
      edtNome.SetFocus;
      Abort;
    end;

  if Trim(edtLogin.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo login!','Aten��o',MB_OK+MB_ICONWARNING);
      edtLogin.SetFocus;
      Abort;
    end;

  if Trim(edtSenha.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo senha!','Aten��o',MB_OK+MB_ICONWARNING);
      edtSenha.SetFocus;
      Abort;
    end;

  dmDados.cdsUsuariosNome.AsString := Trim(edtNome.Text);
  dmDados.cdsUsuariosLogin.AsString := Trim(edtLogin.Text);
  dmDados.cdsUsuariosSenha.AsString := Trim(edtSenha.Text);

  inherited;

end;

end.
