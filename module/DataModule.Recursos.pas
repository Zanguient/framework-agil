(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objetivo:

  Esta unidade poder� ser usada por todos os formul�rios do projeto para que estes
  tenham acesso a vari�veis (objetos) globais do sistemas. E como recomenda��o
  para diminuir o acoplamento desnecess�rio entre diferentes unidades de c�digos
  de diferentes projetos, recumenta-se declara neste Data Module apenas objetivos
  que poder�o ser usados em todos os projetos sem comprometer a sua compila��o.
*******************************************************************************)
unit DataModule.Recursos;

interface

uses
  Controller.VersaoAplicacao,
  Controller.Licenca,
  Controller.Sistema,
  ClasseAgil.Formulario,
  TypeAgil.ComplexTypes,

  Winapi.Windows,
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.ImgList, Vcl.Controls, Vcl.Dialogs,
  cxClasses, cxLookAndFeels,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsForm, cxGraphics, dxScreenTip, cxEdit,
  dxCustomHint, cxHint, cxStyles;

type
  TDtmRecursos = class(TDataModule)
    SkinController: TdxSkinController;
    LookAndFeelController: TcxLookAndFeelController;
    imgFlat16: TcxImageList;
    imgFlat32: TcxImageList;
    imgFlat32Disable: TcxImageList;
    imgFlat32Hot: TcxImageList;
    StyleControllerHint: TcxHintStyleController;
    StyleControllerDefaultEdit: TcxDefaultEditStyleController;
    imgOffice2013: TcxImageList;
    StyleRepository: TcxStyleRepository;
    stl_Selection: TcxStyle;
    stl_Content: TcxStyle;
    stl_ContentEven: TcxStyle;
    stl_Inactive: TcxStyle;
    svdExportar: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos : TDtmRecursos;
  gVersaoApp  : TVersaoAplicacaoController;
  gLicencaApp : TLicencaController;
  gSistema    : TSistemaController;
  gFormulario : TFormularios;

  function ExportTable(const AOnwer : TComponent;
    var aFileName : String; var aExtensao : ct_ExtensaoFileExport) : Boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function ExportTable(const AOnwer : TComponent;
  var aFileName : String; var aExtensao : ct_ExtensaoFileExport) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    DtmRecursos.svdExportar.Title := 'Exportar Registros';
    aRetorno := DtmRecursos.svdExportar.Execute;
    if aRetorno then
    begin
      aFileName := DtmRecursos.svdExportar.FileName;
      aExtensao := ct_ExtensaoFileExport(DtmRecursos.svdExportar.FilterIndex);
    end;
  finally
    Result := aRetorno;
  end;
end;

initialization
  gVersaoApp  := TVersaoAplicacaoController.GetInstance();
  gLicencaApp := TLicencaController.GetInstance();
  gSistema    := TSistemaController.GetInstance();
  gFormulario := TFormularios.Create;

end.
