program BopProject;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, Init, Globals, StdRoutines, MakePolicies, Events, Advisory,
  Score, Closeup, History, About, Background;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMakePoliciesForm, MakePoliciesForm);
  Application.CreateForm(TEventsForm, EventsForm);
  Application.CreateForm(TAdvisoryForm, AdvisoryForm);
  Application.CreateForm(TScoreForm, ScoreForm);
  Application.CreateForm(TCloseupForm, CloseupForm);
  Application.CreateForm(THistoryForm, HistoryForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.

