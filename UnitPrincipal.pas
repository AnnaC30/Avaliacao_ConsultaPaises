unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  System.Net.HttpClient,
  System.Net.URLClient,
  System.JSON, System.Net.HttpClientComponent;

type
  TfrmConsultaPaises = class(TForm)
    lblPais: TLabel;
    edtPais: TEdit;
    btnConsultar: TButton;
    lblNomeOficial: TLabel;
    edtNomeOficial: TEdit;
    lblCapital: TLabel;
    edtCapital: TEdit;
    lblRegiao: TLabel;
    edtRegiao: TEdit;
    lblPopulacao: TLabel;
    edtPopulacao: TEdit;
    lblMoeda: TLabel;
    edtMoeda: TEdit;
    NetHTTPClient1: TNetHTTPClient;
    procedure btnConsultarClick(Sender: TObject);
  private
  public
  end;

var
  frmConsultaPaises: TfrmConsultaPaises;

implementation

{$R *.dfm}

procedure TfrmConsultaPaises.btnConsultarClick(Sender: TObject);
var
  Response: IHTTPResponse;
  Url, Pais: string;
  JsonArray: TJSONArray;
  JsonObj, JsonName, JsonCurrencies: TJSONObject;
  NomeMoeda: string;
begin
  Pais := Trim(edtPais.Text);
  if Pais = '' then
  begin
    ShowMessage('Digite o nome do país.');
    Exit;
  end;

  edtNomeOficial.Clear;
  edtCapital.Clear;
  edtRegiao.Clear;
  edtPopulacao.Clear;
  edtMoeda.Clear;

  try
    Url := 'https://restcountries.com/v3.1/name/' + Pais;

    Response := NetHTTPClient1.Get(Url);

    if Response.StatusCode <> 200 then
    begin
      ShowMessage('País não encontrado ou erro na API.');
      Exit;
    end;

    JsonArray :=
      TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONArray;

    if (JsonArray = nil) or (JsonArray.Count = 0) then
    begin
      ShowMessage('Nenhuma informação encontrada.');
      Exit;
    end;

    JsonObj := JsonArray.Items[0] as TJSONObject;

    JsonName := JsonObj.GetValue('name') as TJSONObject;
    edtNomeOficial.Text :=
      JsonName.GetValue('official').Value;

    if JsonObj.GetValue('capital') <> nil then
      edtCapital.Text :=
        (JsonObj.GetValue('capital') as TJSONArray)
          .Items[0].Value;

    edtRegiao.Text :=
      JsonObj.GetValue('region').Value;

    edtPopulacao.Text :=
      JsonObj.GetValue('population').Value;

    JsonCurrencies :=
      JsonObj.GetValue('currencies') as TJSONObject;

    if JsonCurrencies <> nil then
      NomeMoeda :=
        (JsonCurrencies.Pairs[0].JsonValue as TJSONObject)
          .GetValue('name').Value;

    edtMoeda.Text := NomeMoeda;

  except
    on E: Exception do
      ShowMessage('Erro ao consultar a API: ' + E.Message);
  end;
end;

end.

