unit Controller.Licenca;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Licenca,
  Controller.Mensagem,

  System.Classes, System.SysUtils, System.StrUtils, System.Math,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TLicencaController = class(TInterfacedObject, IController)
    private
      class var aInstance : TLicencaController;
      aModel : TLicenca;
      function GetModel : TLicenca;
    protected
      constructor Create;
      procedure FreeFieldsReadOnly(const aDataSet: TDataSet);
    public
      class function GetInstance: TLicencaController;
      destructor Destroy; override;
      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Edit(const aDataSet: TDataSet) : Boolean;
      function Delete(const aDataSet: TDataSet) : Boolean;
      function Save(const aDataSet: TDataSet) : Boolean;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject; overload;
    published
      property Model : TLicenca read GetModel;
  end;

implementation

{ TLicencaController }

constructor TLicencaController.Create;
begin
  inherited Create;
  aModel := TLicenca.Create;
  //aModel := TLicenca.Criar;
end;

function TLicencaController.Delete(const aDataSet: TDataSet): Boolean;
begin
  Result := False;
end;

destructor TLicencaController.Destroy;
begin
  aModel.Free;
  inherited;
end;

function TLicencaController.Save(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TLicencaController.Edit(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TLicencaController.Cancel(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TLicencaController.Find(ID: String; const aDataSet: TDataSet): TBaseObject;
begin
  Result := aModel;
end;

procedure TLicencaController.FreeFieldsReadOnly(const aDataSet: TDataSet);
begin
  ;
end;

class function TLicencaController.GetInstance: TLicencaController;
begin
  if not Assigned(aInstance) then
    aInstance := TLicencaController.Create;
  Result := aInstance;
end;

function TLicencaController.GetModel: TLicenca;
begin
  Result := aModel;
end;

procedure TLicencaController.Load(const aDataSet: TDataSet);
begin
  aModel.Carregada := True;
  aModel.Notify;
end;

procedure TLicencaController.New(const aDataSet: TDataSet);
begin
  ;
end;

function TLicencaController.New: TBaseObject;
begin
  aModel := TLicenca.Create;
  Result := aModel;
end;

procedure TLicencaController.Refresh(const aDataSet: TDataSet);
begin
  ;
end;

procedure TLicencaController.RefreshRecord(const aDataSet: TDataSet);
begin
  ;
end;

end.
