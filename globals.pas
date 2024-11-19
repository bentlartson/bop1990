unit Globals;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Menus, NewResrc;

CONST
    NoCntry    = 80;
    Iwhite     = 0;
    Iltgray    = 1;
    Igray      = 2;
    Idkgray    = 3;
    Iblack     = 4;
    MaxNews    = 128;
    Destabl    = 0;
    Econ       = 1;
    Miltry     = 2;
    Insg       = 3;
    IntGov     = 4;
    IntReb     = 5;
    Pressur    = 6;
    Treato     = 7;
    Trado      = 8;

    LightGrayRGB  = $E0E0E0;
    MediumGrayRGB = $A0A0A0;
    DarkGrayRGB   = $606060;

    LtMedGrayRGB  = $C0C0C0;
    MedDkGrayRGB  = $808080;
    VDarkGrayRGB  = $404040;

    FormStartX    = 17;
    FormStartY    = 17;
    FormTopOffset = 44;

TYPE
    NamArr        = ARRAY[1..NoCntry] OF String[16];
    IntArr        = ARRAY[1..NoCntry] OF Integer;
    DIntArr       = ARRAY[1..2] OF IntArr;
    LongIntArr    = ARRAY[1..NoCntry] OF LongInt;
    NewsType      = ARRAY[1..MaxNews] OF LongInt;
    Str32         = string[32];
    NewStrArr     = ARRAY[1..5] OF String[255];
    FlagArr       = ARRAY[1..NoCntry] OF BOOLEAN;
    ShortIArr     = ARRAY[1..8] OF Integer;
    PixelArr      = ARRAY[1..576] OF Integer;
    PageArr       = ARRAY[0..255] OF Integer;
    DorkArr       = ARRAY [0..271] OF Integer;
    ScoreArr      = ARRAY [1..10] OF Integer;
    DInteger      = ARRAY [1..2] OF Integer;
    TwoDArr       = ARRAY[1..80] OF ARRAY[1..80] OF Integer;
    TwoFArr       = ARRAY[1..80] OF ARRAY[1..80] OF Boolean;

    Str255        = String;
    StringHandle  = String;
    TColorArr     = ARRAY[1..NoCntry] OF TColor;
    TPointArr     = ARRAY of TPoint;

VAR
    StartDummy:       Integer;
    Level:            Integer;
    Human:            Integer;
    Cmptr:            Integer;
    TwoPFlag:         Boolean;
    MidDummy:         Integer;
    CntryNam:         NamArr;
    Popln:            IntArr;
    GNP:              IntArr;
    GovtWing:         IntArr;
    InsgWing:         IntArr;
    GovtAid:          IntArr;
    PrestVal:         IntArr;
    ConsFrac:         IntArr;
    MiltFrac:         IntArr;
    InvtFrac:         IntArr;
    ConsSpnd:         IntArr;
    MiltSpnd:         IntArr;
    InvtSpnd:         IntArr;
    MilPowr:          IntArr;
    MilMen:           IntArr;
    DrafFrac:         IntArr;
    DontMess:         IntArr;
    Maturity:         IntArr;
    StrngRat:         IntArr;
    CntryCol:         TColorArr;
    CntryRnd:         IntArr;
    GovtStrg:         IntArr;
    InsgStrg:         IntArr;
    InsgPowr:         IntArr;
    DebgArr1:         IntArr;
    DebgArr2:         IntArr;
    DebgArr3:         IntArr;
    DebgArr4:         IntArr;
    RevlGain:         DIntArr;
    CoupGain:         DIntArr;
    FinlGain:         DIntArr;
    HistDum2:         Integer;
    LeftPowr:         FlagArr;
    FinlFlag:         FlagArr;
    CoupFlag:         FlagArr;
    RebWinFlag:       FlagArr;
    Pressure:         DIntArr;
    Treaty:           DIntArr;
    FinlProb:         DIntArr;
    Destab:           DIntArr;
    EconAid:          DIntArr;
    GPopular:         IntArr;
    MiltPress:        IntArr;
    DipAffDum:        DIntArr;
    IntvIDum:         DIntArr;
    IAidDum:          DIntArr;
    IntvGDum:         DIntArr;
    MAidDum:          DIntArr;
    SqrtStrg:         IntArr;
    HistDum1:         Integer;
    Virgin:           FlagArr;
    OldFinPb:         DIntArr;
    EconAOld:         DIntArr;
    DestaOld:         DIntArr;
    TreatOld:         DIntArr;
    PressOld:         DIntArr;
    Trade:            DIntArr;
    OldGStrg:         IntArr;
    OldIStrg:         IntArr;
    OldGPopl:         IntArr;
    QuitFlag:         Boolean;
    TwoPActF:         Boolean;
    WinFlag:          Boolean;
    DemoFlag:         Boolean;
    ANWFlag:          Boolean;
    CullFlag:         Boolean;
    NoUndoFlag:       Boolean;
    HitCntry:         Integer;
    Year:             Integer;
    OldVHigh:         Integer;
    GoingOut:         Boolean;
    NewsQCtr:         Integer;
    Pugnacty:         DInteger;
    Integrty:         DInteger;
    Adventur:         DInteger;
    TotlIntv:         IntArr;
    Nastiness:        Integer;
    CntryCount:       Integer;
    OldHit:           Integer;
    SumDMess:         Integer;
    AveDMess:         Integer;
    IUSAStrng:        Integer;
    IUSSRStrng:       Integer;
    OldAScor:         Integer;
    OldRScor:         Integer;
    USAStrng:         Integer;
    USSRStrng:        Integer;
    LastNews:         Integer;
    USAScor:          ScoreArr;
    USSRScor:         ScoreArr;
    TimeOfHit:        LongInt;
    Contigus:         ARRAY[1..NoCntry] OF PACKED ARRAY[1..NoCntry] OF Boolean;
    ReplayFlag:       Boolean;
    Host:             ARRAY[1..MaxNews] OF Integer;
    Subject:          ARRAY[1..MaxNews] OF Integer;
    Verb:             ARRAY[1..MaxNews] OF Integer;
    TheObject:        ARRAY[1..MaxNews] OF Integer;
    NewNVal:          ARRAY[1..MaxNews] OF Integer;
    OldNVal:          ARRAY[1..MaxNews] OF Integer;
    NewsWorth:        ARRAY[1..MaxNews] OF Integer;
    CrisisVal:        ARRAY[1..MaxNews] OF Boolean;
    GlobSubj:         Integer;
    GlobVerb:         Integer;
    GlobObj:          Integer;
    GlobOldV:         Integer;
    GlobNewV:         Integer;
    GlobHost:         Integer;
    GlobCris:         Boolean;
    DipAff:           TwoDArr;
    MiltAid:          TwoDArr;
    IntvGovt:         TwoDArr;
    InsgAid:          TwoDArr;
    IntvRebl:         TwoDArr;
    MiltAOld:         TwoDArr;
    InsgAOld:         TwoDArr;
    IntvGOld:         TwoDArr;
    IntvROld:         TwoDArr;
    MinorSph:         TwoFArr;
    AdviseFlag:       Boolean;
    EndDummy:         Integer;

    {History}
    LeftPowrHistory:        ARRAY[1..9] OF FlagArr;
    FinlFlagHistory:        ARRAY[1..9] OF FlagArr;
    CoupFlagHistory:        ARRAY[1..9] OF FlagArr;
    RebWinFlagHistory:      ARRAY[1..9] OF FlagArr;
    PressureHistory:        ARRAY[1..9] OF DIntArr;
    TreatyHistory:          ARRAY[1..9] OF DIntArr;
    FinlProbHistory:        ARRAY[1..9] OF DIntArr;
    DestabHistory:          ARRAY[1..9] OF DIntArr;
    EconAidHistory:         ARRAY[1..9] OF DIntArr;
    GPopularHistory:        ARRAY[1..9] OF IntArr;
    MiltPressHistory:       ARRAY[1..9] OF IntArr;
    DipAffHistory:          ARRAY[1..9] OF DIntArr;
    IntvIHistory:           ARRAY[1..9] OF DIntArr;
    IAidHistory:            ARRAY[1..9] OF DIntArr;
    IntvGHistory:           ARRAY[1..9] OF DIntArr;
    MAidHistory:            ARRAY[1..9] OF DIntArr;
    SqrtStrgHistory:        ARRAY[1..9] OF IntArr;

    {New globals}
    xMapClick:              Integer;
    yMapClick:              Integer;
    PolygonArray:           TPointArr;
    CntryPolygons:          ARRAY[1..5] of ARRAY[1..80] of TPointArr;
    DisplayScale:           Real;
    ReactNewsIndex:         Integer;
    CrisisHeadline:         Integer;
    WindFlag,CrisFlag:      Boolean;
    ComputerReacting:       Boolean;
    SaveGameFilename:       String;
    GameOver:               Boolean;

    SelectedTheme:          Integer;
    SelectedMapScale:       Integer;

    {Theme globals}
    BackgroundColor:        Integer;
    OutlineColor:           Integer;
    CountryBackgroundColor: Integer;
    CountrySelectionColor:  Integer;
    LowValueColor:          Integer;
    MediumValueColor:       Integer;
    HighValueColor:         Integer;

FUNCTION  EconConv(Value: Integer): Integer;
FUNCTION  MAidConv(Value: Integer): Integer;
FUNCTION  IntvConv(Value: Integer): Integer;
FUNCTION  EconAMax(x: Integer): Integer;
FUNCTION  MilMax(x: Integer): Integer;
FUNCTION  IntvGMax(x,DAij: Integer): Integer;
FUNCTION  TreatMax(x: Integer): Integer;
PROCEDURE MaxPolcy(Giver: Integer; VAR MaxIntv: Integer; VAR MaxInsg: Integer);
FUNCTION  InsgAMax(SuprPowr,MinrPowr: Integer): Integer;
FUNCTION  InsgIMax(SuprPowr,MinrPowr: Integer): Integer;
FUNCTION  Should(Treata: Integer): Integer;
PROCEDURE ChgDipAff(i,j,delta: Integer);
PROCEDURE WritScor(PaintBox1: TPaintBox);
PROCEDURE WriteActivePlayerInfo(PaintBox1: TPaintBox);
PROCEDURE FillCntry(i: Integer; IColor: TColor);
PROCEDURE CalcScores;
PROCEDURE TimeMesg(OutString: Str255; PaintBox1: TPaintBox);
PROCEDURE InsrtNews(Sub,Ver,Obj,Old,New,Hos: Integer; Cri: Boolean);
PROCEDURE DoPolicy(Sub,Ver,Obj,New: Integer; Cri: Boolean);
FUNCTION  Impt(ToWhom,Ver,Obj,Old,New: Integer): Integer;
FUNCTION  GImpt(Sub,Ver,Obj,Old,New,Bias: Integer; VAR USAImpt: Integer; VAR USSRImpt: Integer): Integer;
FUNCTION  Hurt(Ver,Obj,Old,New: Integer): Integer;
PROCEDURE Headline(Base,rank,Vert,LoclSubj,LoclObj,Old: Integer; LoclCris: Boolean; FormLabel: TLabel; QuestionButton: TButton);
PROCEDURE GetLabels(Cntry: Integer; VAR AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr: Str32);
PROCEDURE GrafScor(PaintBox1: TPaintBox);
PROCEDURE EndGame(PaintBox1: TPaintBox);
PROCEDURE ExchangP(PaintBox1: TPaintBox);
FUNCTION  Influence(SuperPower,Minor: Integer): Integer;
PROCEDURE ChgDMess(Who,HowMuch: Integer);
PROCEDURE WriteYear(PaintBox1: TPaintBox);
FUNCTION  MyRandom: Integer;
function  IsPointInPolygon(AX, AY: Integer; APolygon: array of TPoint): Boolean;

implementation

FUNCTION EconConv(Value: Integer): Integer;
BEGIN
    CASE Value OF
        0: EconConv:=0;
        1: EconConv:=1;
        2: EconConv:=2;
        3: EconConv:=5;
        4: EconConv:=10;
        5: EconConv:=20;
    END;
END;

FUNCTION MAidConv(Value: Integer): Integer;
BEGIN
    CASE Value OF
        0: MAidConv:=0;
        1: MAidConv:=1;
        2: MAidConv:=5;
        3: MAidConv:=20;
        4: MAidConv:=50;
        5: MAidConv:=100;
    END;
END;

FUNCTION IntvConv(Value: Integer): Integer;
BEGIN
    CASE Value OF
        0: IntvConv:=0;
        1: IntvConv:=1;
        2: IntvConv:=5;
        3: IntvConv:=20;
        4: IntvConv:=100;
        5: IntvConv:=500;
    END;
END;

FUNCTION EconAMax(x: Integer): Integer;
BEGIN
    EconAMax:=0;
    IF x> -60 THEN EconAMax:=1;
    IF x> -40 THEN EconAMax:=2;
    IF x> -20 THEN EconAMax:=3;
    IF x>     0    THEN EconAMax:=4;
    IF x>     20 THEN EconAMax:=5;
END;


FUNCTION MilMax(x: Integer): Integer;
BEGIN
    MilMax:=0;
    IF x>-40 THEN MilMax:=1;
    IF x>-20 THEN MilMax:=2;
    IF x>     0 THEN MilMax:=3;
    IF x> 20 THEN MilMax:=4;
    IF x> 40 THEN MilMax:=5;
END;

FUNCTION IntvGMax(x,DAij: Integer): Integer;
{x is treaty level, DAij is diplomatic affinity}
BEGIN
    IF Level>=3
        THEN
            BEGIN
                IntvGMax:=0;
                IF x=3 THEN IntvGMax:=2;
                IF x=4 THEN IntvGMax:=4;
                IF x=5 THEN IntvGMax:=5;
            END
        ELSE
            BEGIN
                IntvGMax:=0;
                IF DAij>0 THEN IntvGMax:=1;
                IF DAij>20 THEN IntvGMax:=2;
                IF DAij>40 THEN IntvGMax:=3;
                IF DAij>60 THEN IntvGMax:=4;
                IF DAij>80 THEN IntvGMax:=5;
            END;
END;

FUNCTION TreatMax(x: Integer): Integer;
{x is integrity plus diplomatic affinity minus pugnacity}
BEGIN
    TreatMax:=0;
    IF x>-60 THEN TreatMax:=1;
    IF x>0 THEN TreatMax:=2;
    IF x>40 THEN TreatMax:=3;
    IF x>60 THEN TreatMax:=4;
    IF x>100 THEN TreatMax:=5;
    IF Level<3 THEN TreatMax:=5;
END;

PROCEDURE MaxPolcy(Giver: Integer; VAR MaxIntv: Integer; VAR MaxInsg: Integer);
VAR
    i,SumIntv,SumMilt,Men,Spnd: Integer;
BEGIN
    SumIntv:=TotlIntv[Giver];
    SumMilt:=GovtAid[Giver];
    Men:=MilMen[Giver];
    Spnd:=MiltSpnd[Giver];
    MaxIntv:=5; MaxInsg:=5;
    FOR i:=4 DOWNTO 0 DO IF MAidConv(i+1)>((Spnd div 8)+SumMilt) THEN MaxInsg:=i;
    FOR i:=4 DOWNTO 0 DO IF IntvConv(i+1)>((Men div 4)-SumIntv) THEN MaxIntv:=i;
END;

FUNCTION InsgAMax(SuprPowr,MinrPowr: Integer): Integer;
VAR
    i,x,max:          Integer;
BEGIN
    max:=1;
    IF Contigus[SuprPowr,MinrPowr] THEN max:=5 ELSE
        BEGIN
            FOR i:=3 TO NoCntry DO
                BEGIN
                    IF Contigus[i,MinrPowr] THEN
                        BEGIN
                            x:=IntvGovt[SuprPowr,i];
                            IF x<5 THEN x:=x+1;
                            IF x>max THEN max:=x;
                        END;
                END;
        END;
    InsgAMax:=max;
END;

FUNCTION InsgIMax(SuprPowr,MinrPowr: Integer): Integer;
VAR
    i,x,y:            Integer;
BEGIN
    y:=2;
    IF Contigus[SuprPowr,MinrPowr] THEN y:=5 ELSE
        BEGIN
            FOR i:=3 TO NoCntry DO
                BEGIN
                    IF Contigus[i,MinrPowr] THEN
                        BEGIN
                            x:=IntvGovt[SuprPowr,i];
                            IF x<5 THEN x:=x+1;
                            IF x>y THEN y:=x;
                        END;
                END;
        END;
    InsgIMax:=y;
END;

FUNCTION Should(Treata: Integer): Integer;
BEGIN
    CASE Treata OF
        0: Should:=0;
        1: Should:=16;
        2: Should:=32;
        3: Should:=64;
        4: Should:=96;
        5: Should:=128;
    END;
END;

PROCEDURE ChgDipAff(i,j,delta: Integer);
VAR
    x:    Integer;
BEGIN
    x:=DipAff[i,j]+delta;
    IF x>127 THEN x:=127;
    IF x<-127 THEN x:=-127;
    DipAff[i,j]:=x;
    DipAff[j,i]:=x;
END;

PROCEDURE WriteActivePlayerInfo(PaintBox1: TPaintBox);
VAR
    TempStrng: String;
BEGIN
	IF TwoPFlag THEN
		  BEGIN
			  IF Human = 1 THEN TempStrng := 'USA holds mouse    '
                  ELSE TempStrng := 'USSR holds mouse';
              PaintBox1.Canvas.Font.Color := OutlineColor;
              PaintBox1.Canvas.Brush.Color := BackgroundColor;
              PaintBox1.Canvas.Font.Size := 10;
              PaintBox1.Canvas.TextOut(round(90 * DisplayScale), round(320 * DisplayScale), TempStrng);
		  END;
END;

PROCEDURE WritScor(PaintBox1: TPaintBox);
BEGIN
    WriteActivePlayerInfo(PaintBox1);

    PaintBox1.Canvas.Brush.Color := BackgroundColor;
    PaintBox1.Canvas.Pen.Width := 1;
    PaintBox1.Canvas.Pen.Color := BackgroundColor;
    PaintBox1.Canvas.Rectangle(round(200 * DisplayScale), round(320 * DisplayScale), round(512 * DisplayScale), round(340 * DisplayScale));

    PaintBox1.Canvas.Font.Color := OutlineColor;
    PaintBox1.Canvas.Font.Size := 10;
    PaintBox1.Canvas.TextOut(round(230 * DisplayScale), round(327 * DisplayScale) - 10, 'USA Score:       ' + IntToStr(USAStrng-IUSAStrng) +
        '                USSR Score:       ' + IntToStr(USSRStrng-IUSSRStrng));
END;

PROCEDURE FillCntry(i: Integer; IColor: TColor);
{fills a country region with the specified color}
BEGIN
    IF CntryCol[i]<>IColor THEN
        BEGIN
            CntryCol[i]:=IColor;
        END;
END;

PROCEDURE CalcScores;
VAR
    i:                Integer;
    Sum1,Sum2:        LongInt;
BEGIN
    Sum1:=0;
    Sum2:=0;
    FOR i:=3 TO NoCntry DO
        BEGIN
            Sum1:=Sum1+DipAff[i,1]*PrestVal[i];
            Sum2:=Sum2+DipAff[i,2]*PrestVal[i];
        END;
    USAStrng:=Sum1 div 1024;
    USSRStrng:=Sum2 div 1024;
END;

PROCEDURE TimeMesg(OutString: Str255; PaintBox1: TPaintBox);
BEGIN
    PaintBox1.Canvas.Brush.Color := clMenuBar;
    PaintBox1.Canvas.Pen.Color := clMenuBar;
    PaintBox1.Canvas.Rectangle(round(10 * DisplayScale), round(20 * DisplayScale), round(219 * DisplayScale), round(36 * DisplayScale));

    PaintBox1.Canvas.Pen.Color := clBlack;
    PaintBox1.Canvas.Font.Size := 10;
    PaintBox1.Canvas.TextOut(round(10 * DisplayScale), round(32 * DisplayScale), OutString);

END;

PROCEDURE InsrtNews(Sub,Ver,Obj,Old,New,Hos: Integer; Cri: Boolean);
VAR
    i,j:              Integer;
    LowI:             Integer;
    Lowest:           Integer;
    Import:           Integer;
    Worth:            Integer;
    LoclOld:          Integer;
    LoclCri:          Boolean;
BEGIN
    IF Sub=Obj THEN
        BEGIN
            CASE Ver OF
                Destabl:        Import:=5;     {no apparent meaning any longer}
                Econ:                Import:=14; {rebels win}
                Miltry:            Import:=10; {executive transfer}
                Insg:                Import:=2;    {undefined}
                IntGov:            Import:=2;    {undefined}
                IntReb:            Import:=2;    {undefined}
                Pressur:        Import:=2;    {undefined}
                Treato:            Import:=0;    {"That's the News"}
            END;
        END
    ELSE
        BEGIN
            CASE Ver OF
                Destabl:        Import:=4;
                Econ:                Import:=3;
                Miltry:            Import:=5;
                Insg:                Import:=5;
                IntGov:            Import:=10;
                IntReb:            Import:=10;
                Pressur:        IF New>Old THEN Import:=2 ELSE Import:=12;
                Treato:            Import:=5;
                Trado:            Import:=2;
            END;
        END;
    {Calculate the importance of the news item based on how different the new value is from the old one (i.e. troops, money)}
    Import:=Import*(1+Abs(New-Old));
    IF Old>New THEN Import:=Import-1;
    Import:=Round(Sqrt(((Round(Sqrt(PrestVal[Sub]*PrestVal[Obj])))+1)*Import));
    IF Import<1 THEN Import:=1;

    CullFlag:=FALSE;
    LoclOld:=Old;
    LoclCri:=Cri;
    i:=1;
    WHILE (i<=NewsQCtr) and NOT CullFlag DO
        BEGIN
            {Is the current news item the same subject, verb, and action as the new one?}
            IF (Subject[i]=Sub) and (Verb[i]=Ver) and (TheObject[i]=Obj) THEN
                BEGIN
                    LoclOld:=OldNVal[i];
                    LoclCri:=(New<=LoclOld);
                    j:=i;
                    {If so, delete the news item by iterating through everything after it and copying it into the previous item}
                    WHILE j<NewsQCtr DO
                        BEGIN
                            Subject[j]:=Subject[j+1];
                            Verb[j]:=Verb[j+1];
                            TheObject[j]:=TheObject[j+1];
                            OldNVal[j]:=OldNVal[j+1];
                            NewNVal[j]:=NewNVal[j+1];
                            Host[j]:=Host[j+1];
                            CrisisVal[j]:=CrisisVal[j+1];
                            NewsWorth[j]:=NewsWorth[j+1];
                            j:=j+1;
                        END;
                    {Decrement the total number of news items}
                    NewsQCtr:=NewsQCtr-1;
                    CullFlag:=TRUE;
                    IF i<LastNews THEN LastNews:=LastNews-1;
                END;
            i:=i+1;
        END;
    IF NOT CullFlag OR (LoclOld<>New) THEN
        BEGIN
            {Default to adding the new news item at the end of the list}
            LowI:=NewsQCtr;
            NewsQCtr:=NewsQCtr+1;
            IF NewsQCtr>MaxNews THEN NewsQCtr:=MaxNews;
            Lowest:=Import;
            {Iterate through the list backwards until we find an item of equal or greater newsworthiness}
            WHILE (LowI>1) and (NewsWorth[LowI]<Lowest) DO LowI:=LowI-1;
            IF (LowI>0) and (NewsWorth[LowI]<Lowest) THEN LowI:=0;
            IF LowI<MaxNews THEN
                BEGIN
                    IF (LowI<(MaxNews-1)) and ((LowI+1)<=(NewsQCtr-1)) THEN
                        FOR i:=NewsQCtr-1 DOWNTO LowI+1 DO
                            BEGIN
                                Subject[i+1]:=Subject[i];
                                Verb[i+1]:=Verb[i];
                                TheObject[i+1]:=TheObject[i];
                                OldNVal[i+1]:=OldNVal[i];
                                NewNVal[i+1]:=NewNVal[i];
                                Host[i+1]:=Host[i];
                                CrisisVal[i+1]:=CrisisVal[i];
                                NewsWorth[i+1]:=NewsWorth[i];
                            END;
                    Subject[LowI+1]:=Sub;
                    Verb[LowI+1]:=Ver;
                    TheObject[LowI+1]:=Obj;
                    OldNVal[LowI+1]:=LoclOld;
                    NewNVal[LowI+1]:=New;
                    Host[LowI+1]:=Hos;
                    CrisisVal[LowI+1]:=LoclCri;
                    NewsWorth[LowI+1]:=Import;
                    IF LowI<LastNews THEN LastNews:=LastNews+1;
                END;
        END;
END;

PROCEDURE DoPolicy(Sub,Ver,Obj,New: Integer; Cri: Boolean);
{executes a policy declaration by a superpower only, not its results}
VAR
    OldVal:           Integer;
BEGIN
    CASE Ver OF
        Destabl:
            BEGIN
                OldVal:=Destab[Sub,Obj];
                Destab[Sub,Obj]:=New;
            END;
        Econ:
            BEGIN
                OldVal:=EconAid[Sub,Obj];
                EconAid[Sub,Obj]:=New;
            END;
        Miltry:
            BEGIN
                OldVal:=MiltAid[Sub,Obj];
                MiltAid[Sub,Obj]:=New;
                GovtAid[Obj]:=GovtAid[Obj]-MAidConv(OldVal)+MAidConv(New);
                GovtAid[Sub]:=GovtAid[Sub]+MAidConv(OldVal)-MAidConv(New);
            END;
        Insg:
            BEGIN
                OldVal:=InsgAid[Sub,Obj];
                InsgAid[Sub,Obj]:=New;
                GovtAid[Sub]:=GovtAid[Sub]+MAidConv(OldVal)-MAidConv(New);
            END;
        IntGov:
            BEGIN
                OldVal:=IntvGovt[Sub,Obj];
                IntvGovt[Sub,Obj]:=New;
                TotlIntv[Sub]:=TotlIntv[Sub]-IntvConv(OldVal)+IntvConv(New);
            END;
        IntReb:
            BEGIN
                OldVal:=IntvRebl[Sub,Obj];
                IntvRebl[Sub,Obj]:=New;
                TotlIntv[Sub]:=TotlIntv[Sub]-IntvConv(OldVal)+IntvConv(New);
            END;
        Pressur:
            BEGIN
                OldVal:=Pressure[Sub,Obj];
                Pressure[Sub,Obj]:=New;
            END;
        Treato:
            BEGIN
                OldVal:=Treaty[Sub,Obj];
                Treaty[Sub,Obj]:=New;
            END;
        Trado:
            BEGIN
                OldVal:=Trade[Sub,Obj];
                Trade[Sub,Obj]:=New;
                Cri:=FALSE;
            END;
    END;
    IF (OldVal<>New) or (Sub=Human) THEN InsrtNews(Sub,Ver,Obj,OldVal,New,Obj,Cri);
END;

FUNCTION Hurt(Ver,Obj,Old,New: Integer): Integer;
VAR
    x:                Integer;
BEGIN
    CASE Ver OF
        Destabl:     x:=16*(New-Old);
        Econ:
            BEGIN
                x:=-((1024*(EconConv(New)-EconConv(Old))) div GNP[Obj]) div (GPopular[Obj]+1);
                IF x=0 THEN x:=Old-New;
            END;
        Miltry:
            BEGIN
                x:=((Old-New)*MiltPress[Obj]) div 4;
                IF x=0 THEN x:=Old-New;
            END;
        Insg:             x:=12*(New-Old);
        IntGov:
            BEGIN
                x:=((Old-New)*MiltPress[Obj]) div 2;
                IF x=0 THEN x:=Old-New;
            END;
        IntReb:         x:=25*(New-Old);
        Pressur:        x:=8*New;
        Treato:
            BEGIN
                x:=((Old-New)*MiltPress[Obj]) div 4;
                IF x=0 THEN x:=Old-New;
            END;
    END;
    IF x>127 THEN x:=127;
    IF x<-127 THEN x:=-127;
    Hurt:=x;
END;

FUNCTION Impt(ToWhom,Ver,Obj,Old,New: Integer): Integer;
BEGIN
    Impt:=(Hurt(Ver,Obj,Old,New)*DipAff[ToWhom,Obj]) div 128;
END;

FUNCTION GImpt(Sub,Ver,Obj,Old,New,Bias: Integer; VAR USAImpt: Integer; VAR USSRImpt: Integer): Integer;
CONST
    MaxLongVal = 134144000;
VAR
    i:                Integer;
    x,y,z,t,v:        Integer;
    Lx,Ly,Lz:         LongInt;
BEGIN
    FOR i:=1 TO 2 DO
        BEGIN
            x:=DipAff[i,Obj] div 4;
            IF x=0 THEN x:=1;
            y:=(Should(Treaty[i,Obj]) div 4)+1;
            z:=(DontMess[Obj]*1280) div SumDMess;
            IF z>32 THEN z:=32;
            IF z<1 THEN z:=1;
            IF i=2 THEN z:=33-z;
            t:=Adventur[i] div 2;
            IF t>32 THEN t:=32;
            IF t<1 THEN t:=1;
            v:=Hurt(Ver,Obj,Old,New);
            IF (Sub=(3-i)) and ((Ver=Miltry) or (Ver=IntGov) or (Ver=Treato)) and (DipAff[i,Obj]>0) THEN v:=-v;
            CASE Bias OF
                0: BEGIN END;
                1: BEGIN x:=x*Round(Sqrt(Abs(x))); y:=Round(Sqrt(y)); END;
                2: BEGIN y:=y*Round(Sqrt(y)); z:=Round(Sqrt(z)); END;
                3: BEGIN z:=z*Round(Sqrt(z)); t:=Round(Sqrt(t)); END;
                4: BEGIN
                    t:=t*Round(Sqrt(t));
                    IF x>0 THEN x:=Round(Sqrt(x)) ELSE x:=-Round(Sqrt(Abs(x)));
                   END;
            END;
            Lx:=((z*x*y*t*v) div 64)*PrestVal[Obj];

            IF i=1 THEN Ly:=Lx ELSE Lz:=Lx;
            IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
            IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
            Lx:=Lx div 4096;
            IF i=1 THEN USAImpt:=Lx ELSE USSRImpt:=Lx;
        END;
    Lx:=Ly+Lz;
    IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
    IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
    GImpt:=Lx div 4096;
END;

PROCEDURE GetLabels(Cntry: Integer; VAR AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr: Str32);
VAR
    StrHandle:        StringHandle;
    j,k:              Integer;
BEGIN
    StrHandle:=GetString(1000+Cntry);
    j:=1;     k:=1;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    AdjectStr:=Copy(StrHandle,j,k-j);
    k:=k+1;    j:=k;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    CaptlStr:=Copy(StrHandle,j,k-j);
    k:=k+1;    j:=k;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    LeadrStr:=Copy(StrHandle,j,k-j);
    k:=k+1;    j:=k;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    LeftStr:=Copy(StrHandle,j,k-j);
    k:=k+1;    j:=k;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    RigtStr:=Copy(StrHandle,j,k-j);
    k:=k+1;    j:=k;
    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
    NameStr:=Copy(StrHandle,j,k-j);
END;

PROCEDURE Headline(Base,rank,Vert,LoclSubj,LoclObj,Old: Integer; LoclCris: Boolean; FormLabel: TLabel; QuestionButton: TButton);
{write a headline specified by Base, rank, LoclSubj, and object}
CONST
    adject     = '/';
    leader     = '&';
    insgnm     = '%';
    capitl     = '@';
    Sname      = '?';
    OAdject    = '>';
    OLeader    = '+';
    OInsgnm    = '#';
    OCapitl    = '^';
    OName      = '!';
    LineWidth  = 30;
VAR
    i,j,k,x:          Integer;
    StrHandle:        StringHandle;
    Flag:             Boolean;
    insrtflg:         Boolean;
    AdjectStr:        Str32;
    CaptlStr:         Str32;
    LeadrStr:         Str32;
    LeftStr:          Str32;
    RigtStr:          Str32;
    NameStr:          Str32;
    OAdjectSt:        Str32;
    OCaptlSt:         Str32;
    OLeadrSt:         Str32;
    OLeftStr:         Str32;
    ORigtStr:         Str32;
    ONameStr:         Str32;
    insrtstr:         str255;
    savestr:          str255;
    HeadLn:           str255;
    NewsPStr:         NewStrArr;
    SubFlag:          Boolean;
    MinorFlag:        Boolean;
    TempString:       String;
BEGIN
    HeadLn:='';
    x:=0;
    FOR i:=0 TO 3 DO
        BEGIN
            StrHandle:=GetString(Base+i);
            CASE StrHandle[1] OF
                '0': x:=(((CntryRnd[LoclSubj] div 2)+(CntryRnd[LoclObj] div 2) shr (2*i+1)) and 3);
                '1': x:=rank;
                '2': x:=(MyRandom and 3);
                '3': x:=0;
                '4': x:=Old;
            END;
            j:=2;
            WHILE (x>0) AND (j<240) DO
                BEGIN
                    j:=j+1;
                    IF StrHandle[j]='*' THEN x:=x-1;
                END;
            j:=j+1;
            k:=j;
            REPEAT k:=k+1; UNTIL (StrHandle[k]='*') OR (k=250);
            HeadLn:=Concat(HeadLn,Copy(StrHandle,j,k-j));
        END;
    GetLabels(LoclSubj,AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr);
    GetLabels(LoclObj,OAdjectSt,OCaptlSt,OLeadrSt,OLeftStr,ORigtStr,ONameStr);
    FOR i:=length(HeadLn) DOWNTO 1 DO
        BEGIN
            insrtflg:=TRUE;
            CASE HeadLn[i] OF
                adject: insrtstr:=AdjectStr;
                leader:
                    BEGIN
                        insrtstr:=LeadrStr;
                        IF Virgin[LoclSubj] THEN
                            BEGIN
                                insrtstr:=Concat(insrtstr,' ');
                                insrtstr:=Concat(insrtstr,NameStr);
                            END;
                    END;
                insgnm:
                    BEGIN
                        IF LeftPowr[LoclSubj] THEN insrtstr:=RigtStr ELSE insrtstr:=LeftStr;
                        IF Base=416 THEN {wotta kluge, wotta kluge!}
                            IF LeftPowr[LoclSubj] THEN
                                insrtstr:=LeftStr ELSE insrtstr:=RigtStr;
                            END;
                capitl: insrtstr:=CaptlStr;
                SName: insrtstr:=CntryNam[LoclSubj];
                Oadject: insrtstr:=OAdjectSt;
                OLeader:
                    BEGIN
                        insrtstr:=OLeadrSt;
                        IF Virgin[LoclSubj] THEN
                            BEGIN
                                insrtstr:=Concat(insrtstr,' ');
                                insrtstr:=Concat(insrtstr,ONameStr);
                            END;
                    END;
                Oinsgnm: IF LeftPowr[LoclObj] THEN insrtstr:=ORigtStr ELSE insrtstr:=OLeftStr;
                OCapitl: insrtstr:=OCaptlSt;
                OName: insrtstr:=CntryNam[LoclObj];
                otherwise insrtflg:=FALSE;
            END;
            IF insrtflg THEN
                BEGIN
                    savestr:=Copy(HeadLn,i+1,length(HeadLn)-i);
                    Delete(HeadLn,i,length(HeadLn)-i+1);
                    HeadLn:=Concat(HeadLn,insrtstr,savestr);
                END;
        END;    {of FOR statement}

    {capitalize first letter if necessary}
    IF ord(HeadLn[1])>96 THEN HeadLn[1]:=Chr(ord(HeadLn[1])-32);

    FOR i:=1 TO 5 DO NewsPStr[i]:='';
    j:=LineWidth;
    i:=1;
    x:=1;
    WHILE (j < length(HeadLn)) AND (x < 5)    DO
        BEGIN
            REPEAT j:=j-1; UNTIL HeadLn[j] = ' ';
            NewsPStr[x]:=Copy(HeadLn,i,j-i);
            i:=j+1;
            x:=x+1;
            j:=j+LineWidth;
        END;
    NewsPStr[x]:=Copy(Headln,i,length(Headln)-i+1);

    TempString := '';
    FOR i:=1 TO 5 DO
        BEGIN
            TempString := TempString +  NewsPStr[i] + ' ';
        END;

    {Wrap the text - but first we have to get rid of the quotes, since that messes up the wrapping}
    TempString := StringReplace(TempString, '''', '#', [rfReplaceAll]);
    TempString := WrapText(TempString, 45);
    TempString := StringReplace(TempString, '#', '''', [rfReplaceAll]);
    FormLabel.Caption := TempString;

    SubFlag:=(((Base>=300) and (Base<400)) or ((Base>=700) and (Base<800)));
    MinorFlag:=(LoclSubj<>Cmptr) and (LoclSubj<>Human) and (LoclSubj<>LoclObj)
        and (Influence(Human,LoclSubj)>3) and (rank>Old);
    IF ((LoclSubj=Cmptr) and (LoclSubj<>LoclObj) and NOT LoclCris and SubFlag) or MinorFlag
        THEN BEGIN QuestionButton.Enabled := true; AdviseFlag:=TRUE; END
        ELSE BEGIN QuestionButton.Enabled := false; AdviseFlag:=FALSE; END;
END;

PROCEDURE GrafScor(PaintBox1: TPaintBox);
CONST
    ScoreFormDisplayScale = 1.5;
VAR
    i,j,t,x,y,z,StartX,StartY:    Integer;
    TempStrng:                    Str255;
BEGIN
    PaintBox1.Canvas.Brush.Style := bsSolid;
    PaintBox1.Canvas.Brush.Color := clMenuBar;
    PaintBox1.Canvas.Pen.Width := 1;
    PaintBox1.Canvas.Pen.Color := clBlack;
    PaintBox1.Canvas.Font.Size := 10;

    x:=40;
    y:=160;
    PaintBox1.Canvas.Line(Round(x * ScoreFormDisplayScale), Round((y-140) * ScoreFormDisplayScale), Round(x * ScoreFormDisplayScale), Round(y * ScoreFormDisplayScale));
    PaintBox1.Canvas.Line(Round(x * ScoreFormDisplayScale), Round(y * ScoreFormDisplayScale), Round((x+136) * ScoreFormDisplayScale), Round(y * ScoreFormDisplayScale));
    FOR i:=0 TO 8 DO
        BEGIN
            PaintBox1.Canvas.Line(Round((x+17*i) * ScoreFormDisplayScale), Round((y-1) * ScoreFormDisplayScale), Round((x+17*i) * ScoreFormDisplayScale), Round((y+1) * ScoreFormDisplayScale));
            IF i<8 THEN PaintBox1.Canvas.TextOut(Round((x+17*i) * ScoreFormDisplayScale), Round((y+2) * ScoreFormDisplayScale), IntToSTr(i+89));
        END;
    PaintBox1.Canvas.Line(Round((x-1) * ScoreFormDisplayScale), Round((y-70) * ScoreFormDisplayScale), Round((x+1) * ScoreFormDisplayScale), Round((y-70) * ScoreFormDisplayScale));
    PaintBox1.Canvas.TextOut(Round((x-12) * ScoreFormDisplayScale), Round((y-77) * ScoreFormDisplayScale), '0');
    PaintBox1.Canvas.Line(Round((x-1) * ScoreFormDisplayScale), Round((y-140) * ScoreFormDisplayScale), Round((x+1) * ScoreFormDisplayScale), Round((y-140) * ScoreFormDisplayScale));
    PaintBox1.Canvas.TextOut(Round((x-32) * ScoreFormDisplayScale), Round((y-147) * ScoreFormDisplayScale), '+700');
    PaintBox1.Canvas.Line(Round((x-1) * ScoreFormDisplayScale), Round(y * ScoreFormDisplayScale), Round((x+1) * ScoreFormDisplayScale), Round(y * ScoreFormDisplayScale));
    PaintBox1.Canvas.TextOut(Round((x-32) * ScoreFormDisplayScale), Round((y-7) * ScoreFormDisplayScale), '-700');
    FOR j:=1 TO 2 DO
        BEGIN
            StartX := x;
            StartY := y;
            FOR i:=1 TO Year-1988 DO
                BEGIN
                    IF j=1 THEN t:=USAScor[i] ELSE t:=USSRScor[i];
                    z:=(-t div 10)-70;
                    IF z>0 THEN z:=0; IF z<-140 THEN z:=-140;
                    PaintBox1.Canvas.Line(Round(StartX * ScoreFormDisplayScale), Round(StartY * ScoreFormDisplayScale), Round((x+17*(i-1)) * ScoreFormDisplayScale), Round((y+z) * ScoreFormDisplayScale));
                    IF j=1 THEN BEGIN PaintBox1.Canvas.Brush.Color := clWhite; END
                    ELSE PaintBox1.Canvas.Brush.Color := clBlack;
                    PaintBox1.Canvas.Rectangle(Round((x+17*(i-1)-2) * ScoreFormDisplayScale), Round((y+z-2) * ScoreFormDisplayScale), Round((x+17*(i-1)+3) * ScoreFormDisplayScale), Round((y+z+3) * ScoreFormDisplayScale));
                    StartX := x+17*(i-1)+2;
                    StartY := y+z;
                END;
        END;
END;

PROCEDURE ExchangP(PaintBox1: TPaintBox);
VAR
	x:                Integer;
BEGIN
	x:=Human;
	Human:=Cmptr;
	Cmptr:=x;
	WriteActivePlayerInfo(PaintBox1);
END;

PROCEDURE EndGame(PaintBox1: TPaintBox);
VAR
    i,x,XPos:         Integer;
    EndFlag:          Boolean;
    TempStrng:        Str255;
    ts:               TTextStyle;
BEGIN
    IF WinFlag THEN
        BEGIN
            CalcScores;
            WritScor(PaintBox1);
        END
    ELSE
        BEGIN
            GameOver := true;

            {Black out the screen}
            PaintBox1.Canvas.Brush.Color := clBlack;
            PaintBox1.Canvas.Pen.Color := clBlack;
            PaintBox1.Canvas.FillRect(0, 0, PaintBox1.Width, PaintBox1.Height);

            TempStrng:='You have ignited';

            IF ANWFlag THEN
                begin
                    XPos := 75;
                    TempStrng:=Concat(TempStrng,' an accidental')
                end
            ELSE
                begin
                    XPos := 125;
                    TempStrng:=Concat(TempStrng,' a');
                end;

            TempStrng:=Concat(TempStrng,' nuclear war.');

            {Draw the text}
            PaintBox1.Canvas.Brush.Color := clBlack;
            PaintBox1.Canvas.Font.Size := round(14 * DisplayScale);
            PaintBox1.Canvas.Font.Color := clWhite;
            PaintBox1.Canvas.TextOut(round(XPos * DisplayScale), round(53 * DisplayScale), TempStrng);
            TempStrng:='And no, there is no animated display of a mushroom cloud';
            PaintBox1.Canvas.TextOut(round(15 * DisplayScale), round(105 * DisplayScale), TempStrng);
            TempStrng:='with parts of bodies flying through the air.';
            PaintBox1.Canvas.TextOut(round(80 * DisplayScale), round(131 * DisplayScale), TempStrng);
            TempStrng:='We do not reward failure.';
            PaintBox1.Canvas.TextOut(round(150 * DisplayScale), round(183 * DisplayScale), TempStrng);
        END;
END;

FUNCTION Influence(SuperPower,Minor: Integer): Integer;
VAR
    x:    Integer;
BEGIN
    x:=Treaty[SuperPower,Minor]
        +EconAid[SuperPower,Minor]
        +MiltAid[SuperPower,Minor]
        +2*IntvGovt[SuperPower,Minor]
        -2*Destab[SuperPower,Minor]
        -2*InsgAid[SuperPower,Minor]
        -4*IntvRebl[SuperPower,Minor];
    IF x<0 THEN x:=0;
    Influence:=x;
END;

PROCEDURE ChgDMess(Who,HowMuch: Integer);
BEGIN
    DontMess[Who]:=DontMess[Who]+HowMuch;
    SumDMess:=SumDMess+HowMuch;
    IF SumDMess<1 THEN SumDMess:=1;
    AveDMess:=SumDMess div NoCntry;
END;

PROCEDURE WriteYear(PaintBox1: TPaintBox);
BEGIN
    {Clear the year and redraw it}
    PaintBox1.Canvas.Brush.Color := BackgroundColor;
    PaintBox1.Canvas.Pen.Color := BackgroundColor;
    PaintBox1.Canvas.Rectangle(round(450 * DisplayScale), round(0 * DisplayScale), round(500 * DisplayScale), round(20 * DisplayScale));
    PaintBox1.Canvas.Font.Color := OutlineColor;
    PaintBox1.Canvas.Font.Size := round(9 * DisplayScale);
    PaintBox1.Canvas.TextOut(round(450 * DisplayScale), round(0 * DisplayScale), IntToStr(Year));
end;

FUNCTION MyRandom: Integer;
BEGIN
    MyRandom := Random(65535)-32768;
END;

function IsPointInPolygon(AX, AY: Integer; APolygon: array of TPoint): Boolean;
var
    xnew, ynew:       Cardinal;
    xold,yold:        Cardinal;
    x1,y1:            Cardinal;
    x2,y2:            Cardinal;
    i, npoints:       Integer;
    inside:           Integer = 0;
begin
    IsPointInPolygon := False;
    npoints := Length(APolygon);
    if (npoints < 3) then Exit;
    xold := APolygon[npoints-1].X;
    yold := APolygon[npoints-1].Y;
    for i := 0 to npoints - 1 do
        begin
            xnew := APolygon[i].X;
            ynew := APolygon[i].Y;
            if (xnew > xold) then
                begin
                    x1:=xold;
                    x2:=xnew;
                    y1:=yold;
                    y2:=ynew;
                end
            else
                begin
                    x1:=xnew;
                    x2:=xold;
                    y1:=ynew;
                    y2:=yold;
                end;
            if (((xnew < AX) = (AX <= xold))         // edge "open" at left end
                and ((AY-y1)*(x2-x1) < (y2-y1)*(AX-x1))) then
                begin
                    inside := not inside;
                end;
            xold:=xnew;
            yold:=ynew;
        end;
    IsPointInPolygon := inside <> 0;
end;

end.

