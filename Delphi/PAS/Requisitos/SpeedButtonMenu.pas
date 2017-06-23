unit SpeedButtonMenu;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Buttons;

type
  TSpeedButtonMenu = class(TSpeedButton)
  private
    { Private declarations }
    FClicked : Boolean;
    FForm : string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOWner: TComponent); override;
    destructor Destroy; override;
    procedure setClicked(state : Boolean);
    procedure setForm(form : String);
    function getClicked : Boolean;
    function getForm : String;
  published
    { Published declarations }
    property Clicked : Boolean read FClicked write FClicked;
    property Form : String read FForm write FForm;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TSpeedButtonMenu]);
end;

{ TSpeedButtonMenu }

constructor TSpeedButtonMenu.Create(AOWner: TComponent);
begin
  inherited;
end;

destructor TSpeedButtonMenu.Destroy;
begin
  inherited;
end;

function TSpeedButtonMenu.getClicked: Boolean;
begin
   result := FClicked;
end;

function TSpeedButtonMenu.getForm: String;
begin
   result := FForm;
end;

procedure TSpeedButtonMenu.setClicked(state: Boolean);
begin
   FClicked := state;
end;

procedure TSpeedButtonMenu.setForm(form: String);
begin
   FForm := form;
end;
end.
