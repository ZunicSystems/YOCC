unit uRaiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  uPrincipal, Vcl.DBGrids, Data.Win.ADODB;

type
  TfrmRaiz = class(TForm)
    pnlTitulo: TPanel;
    pnlWorkArea: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure setTema();
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure doOrdenaGrid(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRaiz: TfrmRaiz;

implementation

{$R *.dfm}

uses uTema;

procedure TfrmRaiz.DBGrid1TitleClick(Column: TColumn);
begin
   //Ordena a coluna do Grid que foi clicada
   doOrdenaGrid(Column);
end;

procedure TfrmRaiz.doOrdenaGrid(Column: TColumn);
begin
   if (TADOQuery(Column.Grid.DataSource.DataSet).Sort <> Column.FieldName + ' ASC') then
   begin
      TADOQuery(Column.Grid.DataSource.DataSet).Sort := Column.FieldName + ' ASC';
   end
   else
   begin
      TADOQuery(Column.Grid.DataSource.DataSet).Sort := Column.FieldName + ' DESC';
   end;
end;

procedure TfrmRaiz.FormCreate(Sender: TObject);
begin
   setTema();
end;

procedure TfrmRaiz.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TDBGrid then
    begin
      uPrincipal.Usuario.setConfigGrid(Self,TDBGrid(Self.Components[i]));
    end;
  end;
end;

procedure TfrmRaiz.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TDBGrid then
    begin
      uPrincipal.Usuario.doConfigGrid(Self,TDBGrid(Self.Components[i]));
      TDBGrid(Self.Components[i]).OnTitleClick := DBGrid1TitleClick;
    end;
  end;
end;

procedure TfrmRaiz.setTema;
begin
   {:: Troca o tema baseado na unit uTema ::}
   pnlTitulo.Color := frmTema.pnlCorBtn.Color;
   pnlWorkArea.Color := frmTema.pnlCorWA.Color;
end;

end.
