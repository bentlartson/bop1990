unit MakePolicies;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Globals;

type

  { TMakePoliciesForm }

  TMakePoliciesForm = class(TForm)
    EnactButton: TButton;
    AvailableLabel: TLabel;
    AvailableAmountLabel: TLabel;
    MakePoliciesRadioButton1: TRadioButton;
    MakePoliciesRadioButton2: TRadioButton;
    MakePoliciesRadioButton3: TRadioButton;
    MakePoliciesRadioButton4: TRadioButton;
    MakePoliciesRadioButton5: TRadioButton;
    MakePoliciesRadioButton6: TRadioButton;
    MakePoliciesCountryLabel: TLabel;
    MakePoliciesHeader: TLabel;
    procedure EnactButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    Verb:             Integer;
    OrigItem:         Integer;
  end;

var
  MakePoliciesForm: TMakePoliciesForm;

implementation

{$R *.lfm}

{ TMakePoliciesForm }

procedure TMakePoliciesForm.FormCreate(Sender: TObject);
begin

end;

procedure TMakePoliciesForm.EnactButtonClick(Sender: TObject);
VAR
	ItemHit:          Integer;
begin
    if (MakePoliciesRadioButton1.Checked) then ItemHit := 0;
    if (MakePoliciesRadioButton2.Checked) then ItemHit := 1;
    if (MakePoliciesRadioButton3.Checked) then ItemHit := 2;
    if (MakePoliciesRadioButton4.Checked) then ItemHit := 3;
    if (MakePoliciesRadioButton5.Checked) then ItemHit := 4;
    if (MakePoliciesRadioButton6.Checked) then ItemHit := 5;

    IF OrigItem <> ItemHit THEN
        DoPolicy(Human, Verb, HitCntry, ItemHit, (ItemHit <= OrigItem));
    Close;
end;

end.

