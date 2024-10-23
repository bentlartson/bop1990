unit Events;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Menus, Globals,
  NewResrc, CrisisU, Advisory, PlanMove, StdRoutines;

type

  { TEventsForm }

  TEventsForm = class(TForm)
    NewsLabel1: TLabel;
    AdvisoryLabel1: TLabel;
    HeadlineLabel2: TLabel;
    NewsLabel2: TLabel;
    PrestigeLabel: TLabel;
    BackDownButton: TButton;
    USAInterestLabel: TLabel;
    TitleLabel: TLabel;
    HeadlineLabel1: TLabel;
    PreviousButton: TButton;
    NextButton: TButton;
    QuestionButton: TButton;
    USSRInterestLabel: TLabel;
    procedure BackDownButtonClick(Sender: TObject);
    procedure EventsFormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure WrapUpComputerReacting;
    procedure PreviousButtonClick(Sender: TObject);
    procedure QuestionButtonClick(Sender: TObject);
    procedure ResetEventsWindow;
    procedure TransNews(ThisHead: Integer; TVFlag,ForceAdvice: Boolean);
    procedure MakeFirstHead;
    procedure MakeLastHead;
    procedure ChooseHead(theItem: Integer; whichControl: Integer);
    procedure ReactNews;
  private

  public
    WhichHead:        Integer;
    theItem:          Integer;
    SaveStrng:        Str255;
    PaintBox1:        TPaintBox;
    EndButton:        TButton;
    MainMenu1:        TMainMenu;
    MainForm:         TForm;
    ScoreForm:        TForm;
  end;

var
  EventsForm: TEventsForm;

implementation

{$R *.lfm}

{ TEventsForm }

{Constructor}
procedure TEventsForm.FormCreate(Sender: TObject);
begin

end;

procedure TEventsForm.PreviousButtonClick(Sender: TObject);
begin
    EventsForm.Caption := SaveStrng;
    ChooseHead(theItem, 1);
end;

procedure TEventsForm.NextButtonClick(Sender: TObject);
begin
    EventsForm.Caption := SaveStrng;
    ChooseHead(theItem, 2);
end;

procedure TEventsForm.WrapUpComputerReacting;
begin
    EventsForm.Close;
    AdvisoryForm.Close;

    IF NOT QuitFlag THEN
        begin
            MainMove(PaintBox1);
            IF Year=1989 THEN BEGIN SaveGame; END;
            IF Year=1997 THEN BEGIN
               WinFlag:=TRUE;
               EndGame(PaintBox1);
               ScoreForm.Show;
            END;
            MainForm.Repaint;
            TwoPActF:=FALSE;
            OldVHigh:=2;
        end;
end;

procedure TEventsForm.QuestionButtonClick(Sender: TObject);
begin
    {If the computer is reacting to news, call Crisis again}
    if (ComputerReacting) then
        begin
            if (EventsForm.QuestionButton.Caption = 'OK') then
                begin
                    EventsForm.Caption := SaveStrng;
                    {Reset the crisis headline so that InitCrisis gets called next time there's a crisis}
                    CrisisHeadline := -1;
                    ReactNewsIndex := ReactNewsIndex + 1;
                    ReactNews;
                    {If the computer is done reacting after the last iteration, then close the windows}
                    if (ComputerReacting = false) then
                        WrapUpComputerReacting;
                end
            else
                begin
                    IF Subject[EventsForm.WhichHead] <= 2 THEN
                        begin
                            Crisis(EventsForm, EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton,
                                EventsForm.PrestigeLabel, EventsForm.USAInterestLabel, EventsForm.USSRInterestLabel, 1);
                            IF CrisisLevel <= 1 THEN
                                BEGIN
                                    EventsForm.Close;
                                    AdvisoryForm.Close;
                                    EndGame(EventsForm.PaintBox1);
                                    EndButton.Visible := true;
                                    MainMenu1.Items.Visible := false;
                                    exit;
                                END;
                        end
                    ELSE
                        begin
                            MinorCrisis(EventsForm, EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton,
                                EventsForm.PrestigeLabel, EventsForm.USAInterestLabel, EventsForm.USSRInterestLabel, 1);
                        end;
                end;
        end
    else
        begin
            if (EventsForm.QuestionButton.Caption = 'OK') then
                begin
                    EventsForm.Caption := SaveStrng;
                    {Reset the crisis headline so that InitCrisis gets called next time there's a crisis}
                    CrisisHeadline := -1;
                    IF CullFlag THEN EventsForm.WhichHead:=EventsForm.WhichHead-1;
                    ChooseHead(theItem, 2);
                end
            else
                begin
                    ChooseHead(theItem, 3);
                    IF ((CrisisLevel <= 1) and (Subject[EventsForm.WhichHead] <= 2)) THEN
                    BEGIN
                        EventsForm.Close;
                        AdvisoryForm.Close;
                        EndGame(EventsForm.PaintBox1);
                        EndButton.Visible := true;
                        MainMenu1.Items.Visible := false;
                        exit;
                    END;
                end;
        end;
end;

procedure TEventsForm.BackDownButtonClick(Sender: TObject);
begin
    EventsForm.Caption := SaveStrng;

    {If the computer is reacting to news, increment ReactNewsIndex and call ReactNews again}
    if (ComputerReacting) then
        begin
            ReactNewsIndex := ReactNewsIndex + 1;
            ReactNews;
            {If the computer is done reacting after the last iteration, then close the windows}
            if (ComputerReacting = false) then
                WrapUpComputerReacting;
        end
    else
        begin
            IF Subject[EventsForm.WhichHead]=Cmptr THEN
                begin
                    Crisis(EventsForm, EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton,
                        EventsForm.PrestigeLabel, EventsForm.USAInterestLabel, EventsForm.USSRInterestLabel, 2)
                end
            ELSE
                begin
                    CrisisVal[WhichHead]:=TRUE;
                end;

            ChooseHead(theItem, 2);
        end;
end;

procedure TEventsForm.EventsFormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if (BackDownButton.Visible) then
        begin
            BackDownButtonClick(Sender);
        end;
    if (AdvisoryForm.Visible) then AdvisoryForm.Close();
end;

PROCEDURE TEventsForm.MakeFirstHead;
VAR
    x,i,j,rank:     Integer;
    ly:                    LongInt;
BEGIN
    x:=StrngRat[HitCntry];
    j:=0;
    WHILE x>1 DO
        BEGIN
            x:=x div 2;
            j:=j+1;
        END;
    IF j > 12 THEN j:=12;
    rank:=(12-j) mod 4;
    i:=(12-j) div 4;
    IF j = 0 THEN rank:=7-4*StrngRat[HitCntry];
    i:=128+(16*i)+(4*((CntryRnd[HitCntry] shl 8) and 3));
    IF HitCntry=1 THEN i:=900;
    IF RebWinFlag[HitCntry] THEN i:=412;     {mask out rebel news if chg of state}
    Headline(i,rank,50,HitCntry,1,3,FALSE,EventsForm.HeadlineLabel1,EventsForm.QuestionButton);
END;

PROCEDURE TEventsForm.ResetEventsWindow;
begin
    {Clear the crisis headline and prestige/interest labels}
    EventsForm.HeadlineLabel2.Caption := '';
    EventsForm.PrestigeLabel.Caption := '';
    EventsForm.USAInterestLabel.Caption := '';
    EventsForm.USSRInterestLabel.Caption := '';

    {Reset the 'Question' button and hide the 'Back Down' button}
    EventsForm.QuestionButton.Caption := 'Question';
    EventsForm.BackDownButton.Enabled := true;
    EventsForm.BackDownButton.Visible := false;
end;

PROCEDURE TEventsForm.TransNews(ThisHead: Integer; TVFlag,ForceAdvice: Boolean);
CONST
    Margin = 222;
VAR
    i,j,k,x,y,z:    Integer;
    ScorFlag:        Boolean;
    TempStrng:    Str255;
    Base:                Integer;
    Val:                Integer;
    Max:                Integer;
    MaxVal:            Integer;
    VertPlace:    Integer;
    Sub:                Integer;
    Ver:                Integer;
    Obj:                Integer;
    New:                Integer;
    Old:                Integer;
    AdvPStr:        ARRAY[1..5] OF Str255;
    LineNum: Integer;

    PROCEDURE PostIt(IndexVal,USAPol,USSRPol:Integer);
    BEGIN
        TempStrng := GetIndString(519+IndexVal,1);
        {Write the parameter name}
            CASE LineNum OF
                1: AdvisoryForm.Param1Title.Caption := TempStrng;
                2: AdvisoryForm.Param2Title.Caption := TempStrng;
                3: AdvisoryForm.Param3Title.Caption := TempStrng;
                4: AdvisoryForm.Param4Title.Caption := TempStrng;
                5: AdvisoryForm.Param5Title.Caption := TempStrng;
                6: AdvisoryForm.Param6Title.Caption := TempStrng;
            end;
        TempStrng := GetIndString(519+IndexVal,USAPol+2);
        {Write the USA value}
            CASE LineNum OF
                1: AdvisoryForm.USAParam1.Caption := TempStrng;
                2: AdvisoryForm.USAParam2.Caption := TempStrng;
                3: AdvisoryForm.USAParam3.Caption := TempStrng;
                4: AdvisoryForm.USAParam4.Caption := TempStrng;
                5: AdvisoryForm.USAParam5.Caption := TempStrng;
                6: AdvisoryForm.USAParam6.Caption := TempStrng;
            end;
        TempStrng := GetIndString(519+IndexVal,USSRPol+2);
        {Write the USSR value}
            CASE LineNum OF
                1: AdvisoryForm.USSRParam1.Caption := TempStrng;
                2: AdvisoryForm.USSRParam2.Caption := TempStrng;
                3: AdvisoryForm.USSRParam3.Caption := TempStrng;
                4: AdvisoryForm.USSRParam4.Caption := TempStrng;
                5: AdvisoryForm.USSRParam5.Caption := TempStrng;
                6: AdvisoryForm.USSRParam6.Caption := TempStrng;
            end;
        LineNum := LineNum + 1;
    END;
BEGIN
    {Clear the parameters in the advisor panel}
    AdvisoryForm.Param1Title.Caption := '';
    AdvisoryForm.Param2Title.Caption := '';
    AdvisoryForm.Param3Title.Caption := '';
    AdvisoryForm.Param4Title.Caption := '';
    AdvisoryForm.Param5Title.Caption := '';
    AdvisoryForm.Param6Title.Caption := '';
    AdvisoryForm.USAParam1.Caption := '';
    AdvisoryForm.USAParam2.Caption := '';
    AdvisoryForm.USAParam3.Caption := '';
    AdvisoryForm.USAParam4.Caption := '';
    AdvisoryForm.USAParam5.Caption := '';
    AdvisoryForm.USAParam6.Caption := '';
    AdvisoryForm.USSRParam1.Caption := '';
    AdvisoryForm.USSRParam2.Caption := '';
    AdvisoryForm.USSRParam3.Caption := '';
    AdvisoryForm.USSRParam4.Caption := '';
    AdvisoryForm.USSRParam5.Caption := '';
    AdvisoryForm.USSRParam6.Caption := '';
    LineNum := 1;

    ResetEventsWindow;

    Sub:=Subject[ThisHead];
    Ver:=Verb[ThisHead];
    Obj:=TheObject[ThisHead];
    New:=NewNVal[ThisHead];
    Old:=OldNVal[ThisHead];
    IF TVFlag THEN
        BEGIN
            x:=Sub;
            IF ((Ver=Insg) AND (Sub<>Obj)) OR ((Ver=Destabl) AND (Sub<3)) THEN x:=Obj;
            EventsForm.TitleLabel.Caption := 'In ' + CntryNam[x] + ',';
            EventsForm.TitleLabel.Visible := true;
        END
    else
        EventsForm.TitleLabel.Visible := false;

    x:=0;
    IF New<Old THEN x:=1;
    IF New=Old THEN x:=2;
    Base:=300+4*(3*Ver+x);
    IF Sub=Obj THEN Base:=Base+100;
    IF (Base=388) OR (Base=392)  {kludge city! (handle reversed wording)}
        THEN HeadLine(Base,Old,50,Sub,Obj,Old,CrisisVal[ThisHead],EventsForm.HeadlineLabel1,EventsForm.QuestionButton)
        ELSE HeadLine(Base,New,50,Sub,Obj,Old,CrisisVal[ThisHead],EventsForm.HeadlineLabel1,EventsForm.QuestionButton);
    ScorFlag:=FALSE;
    IF (Sub=Obj) AND (Ver=Econ) THEN
        BEGIN
            x:=RevlGain[1,Sub];
            y:=RevlGain[2,Sub];
            ScorFlag:=TRUE;
        END;
    IF (Sub=Obj) AND (Ver=2) THEN
        BEGIN
            x:=CoupGain[1,Sub];
            y:=CoupGain[2,Sub];
            ScorFlag:=TRUE;
        END;
    IF (Sub>2) AND (Ver=Destabl) THEN
        BEGIN
            x:=FinlGain[1,Sub];
            y:=FinlGain[2,Sub];
            ScorFlag:=TRUE;
        END;
    IF (ScorFlag) AND (Year>1989) THEN
        BEGIN
            {ClearRect(2,248,210,260);
            MoveTo(2,260);
            DrawString('USA Gain: ');
            MyWrite(x);
            MoveTo(105,260);
            DrawString('USSR Gain: ');
            MyWrite(y);}
        END;
    IF ForceAdvice THEN AdviseFlag:=TRUE;
    IF NOT AdviseFlag THEN AdvisoryForm.Close
    ELSE
        BEGIN
            AdvisoryForm.Show;
            TempStrng:=Concat('Advisory: ',CntryNam[Obj]);
            AdvisoryForm.AdvisoryLabel.Caption := TempStrng;

            FOR i:=1 TO 4 DO
                BEGIN
                    x:=GImpt(Sub,Ver,Obj,Old,New,i,y,z);
                    IF Sub=Human THEN x:=-x;
                    x:=x div 8;
                    x:=x+1; {fudge factor};
                    IF x<-15 THEN x:=-15;
                    IF x>16 THEN x:=16;
                    x:=x+16;

                    {Wrap the text - but first we have to get rid of the quotes, since that messes up the wrapping}
                    TempStrng := GetIndString(550,x);
                    TempStrng := StringReplace(TempStrng, '''', '#', [rfReplaceAll]);
                    TempStrng := WrapText(TempStrng, 9);
                    TempStrng := StringReplace(TempStrng, '#', '''', [rfReplaceAll]);

                    FOR k:=1 TO 5 DO
                        BEGIN
                            CASE i OF
                                1: AdvisoryForm.Adv1Label.Caption := TempStrng;
                                2: AdvisoryForm.Adv2Label.Caption := TempStrng;
                                3: AdvisoryForm.Adv3Label.Caption := TempStrng;
                                4: AdvisoryForm.Adv4Label.Caption := TempStrng;
                            END;
                        END;

                END;

            x:=(((DontMess[Obj]-AveDMess)*8) div AveDMess)+6;
            IF x>12 THEN x:=12;
            IF x<0 THEN x:=0;
            TempStrng := GetIndString(633,x+2);
            AdvisoryForm.SphereLabel.Caption := TempStrng;
            IF (Ver>=2) and (Ver<=5) THEN
                BEGIN {post special information related to insurgency}
                    z:=1;
                    y:=StrngRat[Obj];
                    x:=0;
                    IF y>1 THEN x:=1;
                    IF y>7 THEN x:=2;
                    IF y>31 THEN x:=3;
                    IF y>127 THEN x:=4;
                    IF y>511 THEN x:=5;
                    IF y>2047 THEN x:=6;
                    Max:=8;
                    Val:=(GovtStrg[Obj] div ((InsgStrg[Obj] div 5)+1))
                        -(OldGStrg[Obj] div ((OldIStrg[Obj] div 5)+1))+1;
                    MaxVal:=2;
                END;
            IF (Ver=0) or (Ver=1) THEN
                BEGIN
                    z:=5;
                    x:=GPopular[Obj] div 2;
                    Max:=7;
                    Val:=3+GPopular[Obj]-OldGPopl[Obj];
                    MaxVal:=6;
                END;
            IF (Ver=6) or (Ver=7) THEN
                BEGIN
                    z:=-99;
                    x:=0;
                    y:=FinlProb[Cmptr,Obj];
                    IF y>31 THEN x:=(y-8) div 24;
                    Max:=4;
                    y:=FinlProb[Cmptr,Obj]-OldFinPb[Cmptr,Obj];
                    Val:=(y+18) div 4;
                    MaxVal:=9;
                END;
            IF x>Max THEN x:=Max;
            IF x<0 THEN x:=0;
            TempStrng := GetIndString(629+z,1);
            AdvisoryForm.StrengthTitleLabel.Caption := TempStrng;
            TempStrng := GetIndString(629+z,x+2);
            AdvisoryForm.StrengthLabel.Caption := TempStrng;
            IF Val<1 THEN Val:=1;
            IF Val>MaxVal THEN Val:=MaxVal;
            IF z=5 THEN x:=635;
            IF z=1 THEN x:=636;
            IF z=-99 THEN x:=531;
            TempStrng := GetIndString(x,Val);
            AdvisoryForm.RateLabel.Caption := TempStrng;
            x:=(DipAff[1,Obj]+127) div 28;
            IF x>8 THEN x:=8;
            y:=(DipAff[2,Obj]+127) div 28;
            IF y>8 THEN y:=8;
            PostIt(1,x,y);
            IF Level>=3 THEN PostIt(10,Treaty[1,Obj],Treaty[2,Obj]);
            IF z=1 THEN
                BEGIN {additional stuff for insurgency policies}
                    PostIt(3,MiltAid[1,Obj],MiltAid[2,Obj]);
                    PostIt(4,InsgAid[1,Obj],InsgAid[2,Obj]);
                    PostIt(5,IntvGovt[1,Obj],IntvGovt[2,Obj]);
                    PostIt(6,IntvRebl[1,Obj],IntvRebl[2,Obj]);
                END;
            IF z=5 THEN
                BEGIN {additional stuff for coup policies}
                    PostIt(7,EconAid[1,Obj],EconAid[2,Obj]);
                    PostIt(8,Destab[1,Obj],Destab[2,Obj]);
                END;
            IF z=-99 THEN PostIt(9,Pressure[1,Obj],Pressure[2,Obj]);
        END;
END;

PROCEDURE TEventsForm.MakeLastHead;
VAR i,rank,x:                 Integer;
BEGIN
    IF CntryRnd[HitCntry]>0 THEN BEGIN i:=232; x:=13*GPopular[HitCntry]; END
        ELSE BEGIN i:=216; x:=GovtWing[HitCntry]+127; END;
    IF x>255 THEN x:=255;
    i:=i+(x div 64)*4;
    rank:=(x mod 64) div 16;
    IF HitCntry = 1 THEN i:=912;
    Headline(i,rank,50,HitCntry,1,3,FALSE,EventsForm.HeadlineLabel1,EventsForm.QuestionButton);
END;

PROCEDURE TEventsForm.ChooseHead(theItem: Integer; whichControl: Integer);
CONST
    News = 1;
    USSRA = 2;
    USSRO = 3;
    USAA = 4;
    USAO = 5;
    IntNews = 6;
    PButHandle = 1;
    NButHandle = 2;
    RespHndl = 3;
VAR
    HitFlag,PrimeFlg:                            Boolean;
    x,i,FrstHead,LastHead,MaxHead:            Integer;
    ThisHead:                                LongInt;
BEGIN
    EventsForm.PreviousButton.Visible := true;
    EventsForm.NextButton.Visible := true;
    EventsForm.TitleLabel.Caption := '';

    MaxHead:=NewsQCtr;

    IF whichControl=RespHndl THEN
        BEGIN
            IF Subject[EventsForm.WhichHead]=Cmptr THEN
                begin
                    {Is this an actual new crisis and not a continuation of one already started?}
                    if ((CrisisHeadline <> EventsForm.WhichHead) or (CrisisHeadline = -1)) then
                        begin
                            {In that case, initialize it first before calling 'Crisis'}
                            CrisisHeadline := EventsForm.WhichHead;
                            InitCrisis(EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.QuestionButton, PaintBox1);
                        end;
                    QuitFlag:=Crisis(EventsForm, EventsForm.WhichHead, EventsForm.HeadlineLabel2,
                        EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.PrestigeLabel, EventsForm.USAInterestLabel,
                        EventsForm.USSRInterestLabel, 1);
                end
            ELSE
                begin
                    {Is this an actual new crisis and not a continuation of one already started?}
                    if ((CrisisHeadline <> EventsForm.WhichHead) or (CrisisHeadline = -1)) then
                        begin
                           {In that case, initialize it first before calling 'MinorCrisis'}
                           CrisisHeadline := EventsForm.WhichHead;
                           InitMinorCrisis(EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.QuestionButton, PaintBox1);
                        end;
                    MinorCrisis(EventsForm, EventsForm.WhichHead, EventsForm.HeadlineLabel2,
                        EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.PrestigeLabel, EventsForm.USAInterestLabel,
                        EventsForm.USSRInterestLabel, 1);
                end;
            exit;
        END;

    IF whichControl=PButHandle THEN
        BEGIN
            HitFlag:=FALSE;
            WHILE (EventsForm.WhichHead>0) AND (HitFlag=FALSE) DO
                BEGIN
                    EventsForm.WhichHead:=EventsForm.WhichHead-1;
                    IF EventsForm.WhichHead>0 THEN
                        BEGIN
                            CASE theItem OF
                                News: HitFlag:=((Subject[EventsForm.WhichHead]=HitCntry) OR (TheObject[EventsForm.WhichHead]=HitCntry));
                                USSRA: HitFlag:=(Subject[EventsForm.WhichHead]=2) AND (NewNVal[EventsForm.WhichHead]>OldNVal[EventsForm.WhichHead])
                                    AND (TheObject[EventsForm.WhichHead]<>2);
                                USSRO: HitFlag:=(Subject[EventsForm.WhichHead]=2) AND (NewNVal[EventsForm.WhichHead]<=OldNVal[EventsForm.WhichHead]);
                                USAA: HitFlag:=(Subject[EventsForm.WhichHead]=1) AND (NewNVal[EventsForm.WhichHead]>OldNVal[EventsForm.WhichHead])
                                    AND (TheObject[EventsForm.WhichHead]<>1);
                                USAO: HitFlag:=(Subject[EventsForm.WhichHead]=1) AND (NewNVal[EventsForm.WhichHead]<=OldNVal[EventsForm.WhichHead]);
                                IntNews: HitFlag:=(Subject[EventsForm.WhichHead]>2);
                            END; {of CASE statement}
                        END;    {of whichHead IF}
                END;            {of WHILE statement}
        END;
    IF whichControl=NButHandle THEN
        BEGIN
            HitFlag:=FALSE;
            WHILE (EventsForm.WhichHead<=MaxHead) AND (HitFlag=FALSE) DO
                BEGIN
                    EventsForm.WhichHead:=EventsForm.WhichHead+1;
                    IF EventsForm.WhichHead<=MaxHead THEN
                        BEGIN
                            CASE theItem OF
                                News: HitFlag:=((Subject[EventsForm.WhichHead]=HitCntry) OR (TheObject[EventsForm.WhichHead]=HitCntry));
                                USSRA: HitFlag:=(Subject[EventsForm.WhichHead]=2) AND (NewNVal[EventsForm.WhichHead]>OldNVal[EventsForm.WhichHead])
                                    AND (TheObject[EventsForm.WhichHead]<>2);
                                USSRO: HitFlag:=(Subject[EventsForm.WhichHead]=2) AND (NewNVal[EventsForm.WhichHead]<=OldNVal[EventsForm.WhichHead]);
                                USAA:     HitFlag:=(Subject[EventsForm.WhichHead]=1) AND (NewNVal[EventsForm.WhichHead]>OldNVal[EventsForm.WhichHead])
                                    AND (TheObject[EventsForm.WhichHead]<>1);
                                USAO: HitFlag:=(Subject[EventsForm.WhichHead]=1) AND (NewNVal[EventsForm.WhichHead]<=OldNVal[EventsForm.WhichHead]);
                                IntNews: HitFlag:=(Subject[EventsForm.WhichHead]>2);
                            END; {of CASE statement}
                        END;     {of EventsForm.WhichHead IF}
                END;             {of WHILE statement}
        END;
    IF EventsForm.WhichHead=0 THEN
        BEGIN
            AdvisoryForm.Close;
            IF theItem=1 THEN MakeFirstHead
                ELSE Headline(920,1,50,1,1,1,FALSE,EventsForm.HeadlineLabel1,EventsForm.QuestionButton);
        END;
    IF EventsForm.WhichHead=MaxHead+1 THEN
        BEGIN
            AdvisoryForm.Close;
            IF theItem=1 THEN MakeLastHead
                ELSE
                    begin
                        ResetEventsWindow;
                        Headline(908,1,50,1,1,1,FALSE,EventsForm.HeadlineLabel1,EventsForm.QuestionButton);
                    end;
        END;
    IF (EventsForm.WhichHead>0) AND (EventsForm.WhichHead<MaxHead+1) THEN
        BEGIN
            ThisHead:=EventsForm.WhichHead;
            TransNews(ThisHead,(theItem>1),FALSE);
        END;
    IF (NOT TwoPFlag) and (((theItem=USSRA) and (Human=1)) OR ((theItem=USAA) and (Human=2))) THEN
        BEGIN
            LastNews:=EventsForm.WhichHead;
            IF LastNews=0 THEN LastNews:=1;
        END;
    IF WhichHead=0
        THEN PreviousButton.Enabled := false ELSE PreviousButton.Enabled := true;
    IF WhichHead=MaxHead+1
        THEN NextButton.Enabled := false ELSE NextButton.Enabled := true;
END;

PROCEDURE TEventsForm.ReactNews;
VAR
    i,j,x,y,z:             Integer;
BEGIN
    ComputerReacting := true;
    i := ReactNewsIndex;
    WHILE i<=NewsQCtr DO
        BEGIN
            IF NOT QuitFlag THEN
                BEGIN
                    IF Subject[i]<>TheObject[i] THEN
                        BEGIN
                            IF ((Verb[i]=IntReb) OR (Verb[i]=Insg) OR (Verb[i]=Destabl) OR (Verb[i]=Pressur)) AND (Subject[i]<3) THEN
                                BEGIN
                                    Nastiness:=Nastiness+NewNVal[i]-OldNVal[i];
                                    IF Nastiness>127 THEN Nastiness:=127;
                                    IF Nastiness<1 THEN Nastiness:=1;
                                END;
                            IF (Subject[i]=Human) and (NewNVal[i]>OldNVal[i]) and NOT TwoPFlag and NOT CrisisVal[i] THEN
                                BEGIN
                                    x:=-(GImpt(Subject[i],Verb[i],TheObject[i],OldNVal[i],NewNVal[i],0,y,z));
                                    IF Cmptr=1 THEN z:=y; {correction}
                                    IF z<0 THEN x:=256;
                                    IF x<Abs(MyRandom div 1024) THEN
                                        BEGIN
                                            IF NOT WindFlag THEN
                                                BEGIN
                                                    {GagaWindow;
                                                    RespHndl:=GetNewControl(130,MyWind);
                                                    WindFlag:=TRUE;}
                                                END;
                                            IF Human=1 THEN x:=790 ELSE x:=890;
                                            EventsForm.WhichHead := i;
                                            EventsForm.TransNews(i,FALSE,TRUE);
                                            HeadLine(x,1,0,Subject[i],TheObject[i],OldNVal[i],CrisisVal[i],EventsForm.HeadlineLabel2,EventsForm.QuestionButton);
                                            CullFlag:=FALSE;
                                            CrisFlag:=TRUE;
                                            InitCrisis(EventsForm.WhichHead, EventsForm.HeadlineLabel2, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.QuestionButton, PaintBox1);
                                            QuitFlag:=Crisis(EventsForm, i, EventsForm.HeadlineLabel2, EventsForm.QuestionButton, EventsForm.BackDownButton, EventsForm.PreviousButton, EventsForm.NextButton, EventsForm.PrestigeLabel,
                                            EventsForm.USAInterestLabel, EventsForm.USSRInterestLabel, 1);
                                            EventsForm.BackDownButton.Visible := true;
                                            EventsForm.Top := MainForm.Top + FormStartY;
                                            EventsForm.Left := MainForm.Left +  FormStartX;
                                            EventsForm.Show;
                                            AdvisoryForm.Top := MainForm.Top + FormStartY;
                                            AdvisoryForm.Left := MainForm.Left +  FormStartX + EventsForm.Width;
                                            exit;
                                        END; {of x-test}
                                END    {of Subject=Human, etc test}
                            ELSE {this ELSE necessary to fix sneaky bug}
                            BEGIN
                            IF (Subject[i]>2) and (NewNVal[i]>OldNVal[i]) and (NOT TwoPFlag) and (Influence(Cmptr,Subject[i])>3) THEN
                                BEGIN {computer/minor crisis check}
                                    x:=-(GImpt(Subject[i],Verb[i],TheObject[i],OldNVal[i],NewNVal[i],0,y,z));
                                    IF Cmptr=1 THEN z:=y; {correction}
                                    IF z>Abs(MyRandom div 1024) THEN
                                        BEGIN {computer challenges minor country}
                                            CmptrCrisis(i);
                                        END;
                                END;
                            END; {of ELSE-clause}
                        END;    {of IF S<>O test}
                END;    {of QuitFlag test}
            i:=i+1;
            ReactNewsIndex := i;
        END; {of WHILE statement}
    ComputerReacting := false;
    IF NOT QuitFlag THEN
        BEGIN
            j:=0;
            x:=0;
            NewsQCtr:=0;
            IF Year>1989 THEN
                BEGIN
                    FOR i:=3 TO NoCntry DO
                        BEGIN    {calculate reactions to policy states}
                            FOR j:=1 TO 2 DO
                                BEGIN
                                    MinorRej(i,j);
                                    x:=(25*((256*(EconConv(EconAid[j,i]))) div GNP[i])) div (GPopular[i]+1)
                                        -(32*Destab[j,i])
                                        +((MiltAid[j,i]*MiltPress[i]) div 8)
                                        -(12*InsgAid[j,i])
                                        +(((IntvGovt[j,i])*MiltPress[i]) div 4)
                                        -(64*IntvRebl[j,i])
                                        -(16*Pressure[j,i])
                                        +((((Treaty[j,i]*Integrty[j]) div 128)*MiltPress[i]) div 8)
                                        +(8*(Trade[j,i]-3));
                                    x:=x div 8;
                                    ChgDipAff(i,j,x);
                                END;    {of j-loop}
                            IF Level=4 THEN
                                BEGIN
                                    FOR j:=3 TO NoCntry DO
                                        BEGIN {reactions to minor country policies}
                                            x:=((MiltAid[j,i]*MiltPress[i]) div 8)
                                                -(12*InsgAid[j,i])
                                                +(((IntvGovt[j,i])*MiltPress[i]) div 4)
                                                -(64*IntvRebl[j,i]);
                                            x:=x div 8;
                                            ChgDipAff(i,j,x);
                                        END;    {of j-loop}
                                END;
                        END; {of i-loop}
                    CalcScores;
                    WritScor(PaintBox1);
                END;    {of IF Year>1989}
        END;
END;

end.

