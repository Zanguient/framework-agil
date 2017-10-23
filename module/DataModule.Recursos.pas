(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objectivo:

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
  ClasseAgil.Formulario,

  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, cxClasses, cxLookAndFeels,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsForm, cxGraphics, dxScreenTip, cxEdit,
  dxCustomHint, cxHint;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos : TDtmRecursos;
  gVersaoApp  : TVersaoAplicacaoController;
  gLicencaApp : TLicencaController;
  gFormulario : TFormularios;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  gVersaoApp  := TVersaoAplicacaoController.GetInstance();
  gLicencaApp := TLicencaController.GetInstance();
  gFormulario := TFormularios.Create;

end.
