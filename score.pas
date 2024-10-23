unit Score;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Globals, NewResrc;

type

  { TScoreForm }

  TScoreForm = class(TForm)
    GainThisYearLabel: TLabel;
    GainToDateLabel: TLabel;
    HistoryPaintBox: TPaintBox;
    USSRGainTD: TLabel;
    USAGainY: TLabel;
    USAGainTD: TLabel;
    USSRGainY: TLabel;
    USSRLabel: TLabel;
    USALabel: TLabel;
    ScoresLabel: TLabel;
    SubHeaderLabel: TLabel;
    LevelLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure HistoryPaintBoxPaint(Sender: TObject);
  private

  public

  end;

var
  ScoreForm: TScoreForm;

implementation

{$R *.lfm}

{ TScoreForm }

procedure TScoreForm.FormCreate(Sender: TObject);
begin

end;

procedure TScoreForm.HistoryPaintBoxPaint(Sender: TObject);
VAR
    i,j,t,x,y,z:      Integer;
    TempStrng:        Str255;
begin
    if (WinFlag) then
        begin
            ScoreForm.Caption := 'End of Game';
            ScoreForm.SubHeaderLabel.Caption := 'You have kept the peace.';
            ScoreForm.ScoresLabel.Visible := true;
        end
    else
        begin
            ScoreForm.SubHeaderLabel.Caption := 'Scores for ' + IntToStr(Year);
            ScoreForm.ScoresLabel.Visible := false;
        end;

    CalcScores;
    x:=Level;
    TempStrng := GetIndString(640,x);
    TempStrng:=Concat(TempStrng,' Level');
    ScoreForm.LevelLabel.Caption := TempStrng;

    ScoreForm.USAGainY.Caption := IntToStr(USAStrng-OldAScor);
    ScoreForm.USSRGainY.Caption := IntToStr(USSRStrng-OldRScor);
    ScoreForm.USAGainTD.Caption := IntToStr(USAStrng-IUSAStrng);
    ScoreForm.USSRGainTD.Caption := IntToStr(USSRStrng-IUSSRStrng);

    GrafScor(HistoryPaintBox);
end;

end.

