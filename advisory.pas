unit Advisory;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, LResources;

type

  { TAdvisoryForm }

  TAdvisoryForm = class(TForm)
    Adv3Label: TLabel;
    Adv2Label: TLabel;
    Adv4Label: TLabel;
    AdvisoryLabel: TLabel;
    Adv1Label: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Param6Title: TLabel;
    USAParam1: TLabel;
    USAParam2: TLabel;
    Param1Title: TLabel;
    USAParam3: TLabel;
    Param2Title: TLabel;
    Param3Title: TLabel;
    Param4Title: TLabel;
    Param5Title: TLabel;
    USALabel: TLabel;
    USAParam4: TLabel;
    USAParam5: TLabel;
    USAParam6: TLabel;
    USSRParam1: TLabel;
    USSRLabel: TLabel;
    RateLabel: TLabel;
    StrengthTitleLabel: TLabel;
    StrengthLabel: TLabel;
    RateOfChangeTitleLabel: TLabel;
    SphereOfInfluenceTitleLabel: TLabel;
    SphereLabel: TLabel;
    USSRParam2: TLabel;
    USSRParam3: TLabel;
    USSRParam4: TLabel;
    USSRParam5: TLabel;
    USSRParam6: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  AdvisoryForm: TAdvisoryForm;

implementation

{$R *.lfm}

{ TAdvisoryForm }

procedure TAdvisoryForm.FormCreate(Sender: TObject);
var
    png:TPortableNetworkGraphic;
begin
    png:=TPortableNetworkGraphic.Create;
    try
        Png.LoadFromLazarusResource('Advisor1');
        Image1.Picture.Graphic := Png;
        Png.LoadFromLazarusResource('Advisor2');
        Image2.Picture.Graphic := Png;
        Png.LoadFromLazarusResource('Advisor3');
        Image3.Picture.Graphic := Png;
        Png.LoadFromLazarusResource('Advisor4');
        Image4.Picture.Graphic := Png;
    finally
        Png.Free;
    end;
end;

initialization

{$I images.lrs}

end.

