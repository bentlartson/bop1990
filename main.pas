unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, MakePolicies, Events, Advisory, Globals, Init, StdRoutines,
  PlanMove, NewResrc, Closeup, History, Score, About, Background;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu2: TMainMenu;
    GNPPercentagesMenuItem: TMenuItem;
    GNPMenuItem: TMenuItem;
    InvestmentSpendingMenuItem: TMenuItem;
    LiteracyMenuItem: TMenuItem;
    EnergyMenuItem: TMenuItem;
    CaloriesMenuItem: TMenuItem;
    DoctorsMenuItem: TMenuItem;
    InfantMenuItem: TMenuItem;
    AgricultureMenuItem: TMenuItem;
    IndustryMenuItem: TMenuItem;
    TwoTimesMenuItem: TMenuItem;
    OnePointFiveTimesMenuItem: TMenuItem;
    MapScaleMenuItem: TMenuItem;
    PreferencesMenuItem: TMenuItem;
    ThemeMenuItem: TMenuItem;
    ClassicMenuItem: TMenuItem;
    DarkModeMenuItem: TMenuItem;
    ServicesMenuItem: TMenuItem;
    TradeMenuItem: TMenuItem;
    TaxesMenuItem: TMenuItem;
    PublicEducationMenuItem: TMenuItem;
    PublicHealthMenuItem: TMenuItem;
    PoliticalRightsMenuITem: TMenuItem;
    CivilRightsMenuItem: TMenuItem;
    ProtestsMenuItem: TMenuItem;
    DeathsMenuItem: TMenuItem;
    RiotsMenuItem: TMenuItem;
    ArmedAttacksMenuItem: TMenuItem;
    AssassinationsMenuItem: TMenuItem;
    ExecutionsMenuItem: TMenuItem;
    PerNothingMenuItem2: TMenuItem;
    PerCapitaMenuItem2: TMenuItem;
    SchoolsMenuItem: TMenuItem;
    Separator6: TMenuItem;
    TVsMenuItem: TMenuItem;
    TelephonesMenuItem: TMenuItem;
    PerNothingMenuItem: TMenuItem;
    PerCapitaMenuItem: TMenuItem;
    PerGNPMenuItem: TMenuItem;
    PopulationMenuItem: TMenuItem;
    MilitaryPersonnelMenuItem: TMenuItem;
    MilitarySpendingMenuItem: TMenuItem;
    ConsumerSpendingMenuItem: TMenuItem;
    PoliticalMenuItem: TMenuItem;
    Separator5: TMenuItem;
    ViolenceMenuItem: TMenuItem;
    WellBeingMenuItem: TMenuItem;
    ResourcesMenuItem: TMenuItem;
    ResumeGameMenuItem: TMenuItem;
    YesResumeGameMenuItem: TMenuItem;
    NewGameButton: TButton;
    LoadOldGameButton: TButton;
    TitleScreenTimer: TTimer;
    Separator4: TMenuItem;
    StartButton: TButton;
    EndButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SideRadioGroup: TRadioGroup;
    PlayersRadioGroup: TRadioGroup;
    OptionsLabel: TLabel;
    MainMenu1: TMainMenu;
    EconomicAidPolicyMenuItem: TMenuItem;
    DestabilizeMenuItem: TMenuItem;
    BriefingMenuItem: TMenuItem;
    CloseupMenuItem: TMenuItem;
    BackgroundMenuItem: TMenuItem;
    HistoryMenuItem: TMenuItem;
    LevelRadioGroup: TRadioGroup;
    TreatyMenuItem: TMenuItem;
    DiplomaticPressurePolicyMenuItem: TMenuItem;
    TradePolicyPolicyMenuItem: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ArgentinaMenuItem: TMenuItem;
    ColombiaMenuItem: TMenuItem;
    EuropeMenuItem: TMenuItem;
    BritainMenuItem: TMenuItem;
    FranceMenuItem: TMenuItem;
    ItalyMenuItem: TMenuItem;
    CountriesMenuItem: TMenuItem;
    DiplomaticRelationshipsMenuItem: TMenuItem;
    AlgeriaMenuItem: TMenuItem;
    EthiopiaMenuItem: TMenuItem;
    GhanaMenuItem: TMenuItem;
    GuineaMenuItem: TMenuItem;
    IvoryCoastMenuItem: TMenuItem;
    KenyaMenuItem: TMenuItem;
    LibyaMenuItem: TMenuItem;
    MaliMenuItem: TMenuItem;
    MauritaniaMenuItem: TMenuItem;
    AfghanistanMenuItem: TMenuItem;
    BurmaMenuItem: TMenuItem;
    ChinaMenuItem: TMenuItem;
    IndiaMenuItem: TMenuItem;
    AustraliaMenuItem: TMenuItem;
    IndonesiaMenuItem: TMenuItem;
    JapanMenuItem: TMenuItem;
    EconomicAidMenuItem: TMenuItem;
    DestabilizationMenuItem: TMenuItem;
    MakePoliciesMenuItem: TMenuItem;
    GameMenuItem: TMenuItem;
    EventsMenuItem: TMenuItem;
    NewspaperMenuItem: TMenuItem;
    USSRActionsMenuItem: TMenuItem;
    USSROtherMenuItem: TMenuItem;
    USAActionsMenuItem: TMenuItem;
    USAOtherMenuItem: TMenuItem;
    MinorCountryNewsMenuItem: TMenuItem;
    ScoreMenuItem: TMenuItem;
    NextTurnMenuItem: TMenuItem;
    UndoLastTurnMenuItem: TMenuItem;
    ChangeSidesMenuItem: TMenuItem;
    QuitGameMenuITem: TMenuItem;
    AboutBOPMenuItem: TMenuItem;
    MilitaryAidPolicyMenuItem: TMenuItem;
    AidToInsurgentsPolicyMenuITem: TMenuItem;
    InterveneForGovtMenuItem: TMenuItem;
    InterveneForRebelsMenuItem: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    TreatiesMenuItem: TMenuItem;
    DiplomaticPressureMenuItem: TMenuItem;
    TradePolicyMenuItem: TMenuItem;
    AtWarWithMenuItem: TMenuItem;
    GoingOutMenuItem: TMenuItem;
    GoingInMenuItem: TMenuItem;
    PhilippinesMenuItem: TMenuItem;
    TaiwanMenuItem: TMenuItem;
    NKoreaMenuItem: TMenuItem;
    SKoreaMenuItem: TMenuItem;
    ThailandMenuItem: TMenuItem;
    VietnamMenuItem: TMenuItem;
    TurkeyMenuItem: TMenuItem;
    IsraelMenuItem: TMenuItem;
    IranMenuItem: TMenuItem;
    IraqMenuItem: TMenuItem;
    JordanMenuItem: TMenuItem;
    LebanonMenuItem: TMenuItem;
    PakistanMenuItem: TMenuItem;
    SaudiArabiaMenuItem: TMenuItem;
    SyriaMenuItem: TMenuItem;
    MoroccoMenuItem: TMenuItem;
    MozambiqueMenuItem: TMenuItem;
    AngolaMenuItem: TMenuItem;
    NigerMenuItem: TMenuItem;
    NigeriaMenuItem: TMenuItem;
    SouthAfricaMenuItem: TMenuItem;
    SudanMenuItem: TMenuItem;
    TanzaniaMenuItem: TMenuItem;
    TunisiaMenuItem: TMenuItem;
    ZaireMenuItem: TMenuItem;
    ZambiaMenuItem: TMenuItem;
    ZimbabweMenuItem: TMenuItem;
    BotswanaMenuItem: TMenuItem;
    BurkinaFasoMenuItem: TMenuItem;
    CameroonMenuItem: TMenuItem;
    CentralAfricaMenuItem: TMenuItem;
    ChadMenuItem: TMenuItem;
    CongoMenuItem: TMenuItem;
    EgyptMenuItem: TMenuItem;
    MilitaryAidMenuItem: TMenuItem;
    AidToInsurgentsMenuItem: TMenuItem;
    InterventionsForGovtMenuItem: TMenuItem;
    InterventionsForRebelsMenuItem: TMenuItem;
    RelationsMenuItem: TMenuItem;
    SpheresOfInfluenceMenuItem: TMenuItem;
    MajorEventsMenuItem: TMenuItem;
    PrestigeValueMenuItem: TMenuItem;
    InsurgencyMenuItem: TMenuItem;
    CoupDetatMenuItem: TMenuItem;
    FinlandUSAMenuItem: TMenuItem;
    FinlandUSSRMenuItem: TMenuItem;
    CountriesAtWarMenuItem: TMenuItem;
    WGermanyMenuItem: TMenuItem;
    CzechoslovakiaMenuItem: TMenuItem;
    EGermanyMenuItem: TMenuItem;
    GreeceMenuItem: TMenuItem;
    PolandMenuItem: TMenuItem;
    RomaniaMenuItem: TMenuItem;
    USSRMenuItem: TMenuItem;
    YugoslaviaMenuItem: TMenuItem;
    Separator1: TMenuItem;
    SpainMenuItem: TMenuItem;
    SwedenMenuItem: TMenuItem;
    PeruMenuItem: TMenuItem;
    VenezuelaMenuItem: TMenuItem;
    BoliviaMenuItem: TMenuItem;
    BrazilMenuItem: TMenuItem;
    ChileMenuItem: TMenuItem;
    NorthAmericaMenuItem: TMenuItem;
    CubaMenuItem: TMenuItem;
    ElSalvadorMenuItem: TMenuItem;
    GuatemalaMenuItem: TMenuItem;
    HondurasMenuItem: TMenuItem;
    MexicoMenuItem: TMenuItem;
    NicaraguaMenuItem: TMenuItem;
    PanamaMenuItem: TMenuItem;
    USAMenuItem: TMenuItem;
    SouthAmericaMenuItem: TMenuItem;
    AfricaMenuItem: TMenuItem;
    MidEastMenuItem: TMenuItem;
    FarEastMenuItem: TMenuItem;
    PacificMenuItem: TMenuItem;
    CanadaMenuItem: TMenuItem;
    CostaRicaMenuItem: TMenuItem;
    PaintBox1: TPaintBox;

    procedure AboutBOPMenuItemClick(Sender: TObject);
    procedure AfghanistanMenuItemClick(Sender: TObject);
    procedure AgricultureMenuItemClick(Sender: TObject);
    procedure AidToInsurgentsMenuItemClick(Sender: TObject);
    procedure AidToInsurgentsPolicyMenuITemClick(Sender: TObject);
    procedure AlgeriaMenuItemClick(Sender: TObject);
    procedure AngolaMenuItemClick(Sender: TObject);
    procedure ArmedAttacksMenuItemClick(Sender: TObject);
    procedure AssassinationsMenuItemClick(Sender: TObject);
    procedure AtWarWithMenuItemClick(Sender: TObject);
    procedure AustraliaMenuItemClick(Sender: TObject);
    procedure BackgroundMenuItemClick(Sender: TObject);
    procedure BotswanaMenuItemClick(Sender: TObject);
    procedure BurkinaFasoMenuItemClick(Sender: TObject);
    procedure BurmaMenuItemClick(Sender: TObject);
    procedure CaloriesMenuItemClick(Sender: TObject);
    procedure CameroonMenuItemClick(Sender: TObject);
    procedure CentralAfricaMenuItemClick(Sender: TObject);
    procedure ChadMenuItemClick(Sender: TObject);
    procedure ChangeSidesMenuItemClick(Sender: TObject);
    procedure ChinaMenuItemClick(Sender: TObject);
    procedure CivilRightsMenuItemClick(Sender: TObject);
    procedure ClassicMenuItemClick(Sender: TObject);
    procedure CloseupMenuItemClick(Sender: TObject);
    procedure CongoMenuItemClick(Sender: TObject);
    procedure ConsumerSpendingMenuItemClick(Sender: TObject);
    procedure DarkModeMenuItemClick(Sender: TObject);
    procedure DeathsMenuItemClick(Sender: TObject);
    procedure DestabilizationMenuItemClick(Sender: TObject);
    procedure DestabilizeMenuItemClick(Sender: TObject);
    procedure DiplomaticPressureMenuItemClick(Sender: TObject);
    procedure DiplomaticPressurePolicyMenuItemClick(Sender: TObject);
    procedure DoctorsMenuItemClick(Sender: TObject);
    procedure EconomicAidMenuItemClick(Sender: TObject);
    procedure EconomicAidPolicyMenuItemClick(Sender: TObject);
    procedure EgyptMenuItemClick(Sender: TObject);
    procedure EndButtonClick(Sender: TObject);
    procedure EnergyMenuItemClick(Sender: TObject);
    procedure EthiopiaMenuItemClick(Sender: TObject);
    procedure ExecutionsMenuItemClick(Sender: TObject);
    procedure GhanaMenuItemClick(Sender: TObject);
    procedure GNPMenuItemClick(Sender: TObject);
    procedure GoingInMenuItemClick(Sender: TObject);
    procedure GoingOutMenuItemClick(Sender: TObject);
    procedure GuineaMenuItemClick(Sender: TObject);
    procedure HistoryMenuItemClick(Sender: TObject);
    procedure IndiaMenuItemClick(Sender: TObject);
    procedure IndonesiaMenuItemClick(Sender: TObject);
    procedure IndustryMenuItemClick(Sender: TObject);
    procedure InfantMenuItemClick(Sender: TObject);
    procedure InterveneForGovtMenuItemClick(Sender: TObject);
    procedure InterveneForRebelsMenuItemClick(Sender: TObject);
    procedure InterventionsForGovtMenuItemClick(Sender: TObject);
    procedure InterventionsForRebelsMenuItemClick(Sender: TObject);
    procedure InvestmentSpendingMenuItemClick(Sender: TObject);
    procedure IranMenuItemClick(Sender: TObject);
    procedure IraqMenuItemClick(Sender: TObject);
    procedure IsraelMenuItemClick(Sender: TObject);
    procedure IvoryCoastMenuItemClick(Sender: TObject);
    procedure JapanMenuItemClick(Sender: TObject);
    procedure JordanMenuItemClick(Sender: TObject);
    procedure KenyaMenuItemClick(Sender: TObject);
    procedure LebanonMenuItemClick(Sender: TObject);
    procedure LibyaMenuItemClick(Sender: TObject);
    procedure LiteracyMenuItemClick(Sender: TObject);
    procedure LoadOldGameButtonClick(Sender: TObject);
    procedure MaliMenuItemClick(Sender: TObject);
    procedure MauritaniaMenuItemClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MilitaryAidMenuItemClick(Sender: TObject);
    procedure MilitaryAidPolicyMenuItemClick(Sender: TObject);
    procedure MilitaryPersonnelMenuItemClick(Sender: TObject);
    procedure MilitarySpendingMenuItemClick(Sender: TObject);
    procedure MinorCountryNewsMenuItemClick(Sender: TObject);
    procedure MoroccoMenuItemClick(Sender: TObject);
    procedure MozambiqueMenuItemClick(Sender: TObject);
    procedure NewGameButtonClick(Sender: TObject);
    procedure NewspaperMenuItemClick(Sender: TObject);
    procedure NextTurnMenuItemClick(Sender: TObject);
    procedure DrawTitle;
    procedure OnePointFiveTimesMenuItemClick(Sender: TObject);
    procedure OnTimer(Sender: TObject);
    procedure PerCapitaMenuItem2Click(Sender: TObject);
    procedure PerCapitaMenuItemClick(Sender: TObject);
    procedure PerGNPMenuItemClick(Sender: TObject);
    procedure PerNothingMenuItem2Click(Sender: TObject);
    procedure PerNothingMenuItemClick(Sender: TObject);
    procedure PoliticalRightsMenuITemClick(Sender: TObject);
    procedure PopulationMenuItemClick(Sender: TObject);
    procedure ProtestsMenuItemClick(Sender: TObject);
    procedure PublicEducationMenuItemClick(Sender: TObject);
    procedure PublicHealthMenuItemClick(Sender: TObject);
    procedure QuitGameMenuITemClick(Sender: TObject);
    procedure SetClassicTheme;
    procedure SetDarkModeTheme;
    procedure SetEndGameButtonPosition;
    procedure SetOnePointFiveTimesScale;
    procedure SetTwoTimesScale;
    procedure RiotsMenuItemClick(Sender: TObject);
    procedure SchoolsMenuItemClick(Sender: TObject);
    procedure ScoreMenuItemClick(Sender: TObject);
    procedure ServicesMenuItemClick(Sender: TObject);
    procedure SetPolicy(Item: Integer);
    procedure NextTurn;
    procedure GiveInfo(theItem: INTEGER);
    procedure GameAction(theItem: Integer);
    procedure ClrHitCntry;
    procedure ReviseMenu;
    procedure DoSaveGamePrompt;

    procedure CountriesAtWarMenuItemClick(Sender: TObject);
    procedure CoupDetatMenuItemClick(Sender: TObject);
    procedure DiplomaticRelationshipsMenuItemClick(Sender: TObject);
    procedure FinlandUSAMenuItemClick(Sender: TObject);
    procedure FinlandUSSRMenuItemClick(Sender: TObject);
    procedure InsurgencyMenuItemClick(Sender: TObject);
    procedure MajorEventsMenuItemClick(Sender: TObject);
    procedure NigeriaMenuItemClick(Sender: TObject);
    procedure NigerMenuItemClick(Sender: TObject);
    procedure NKoreaMenuItemClick(Sender: TObject);
    procedure PakistanMenuItemClick(Sender: TObject);
    procedure PhilippinesMenuItemClick(Sender: TObject);
    procedure PrestigeValueMenuItemClick(Sender: TObject);
    procedure SaudiArabiaMenuItemClick(Sender: TObject);
    procedure ReviseTheMap;
    procedure SelectCountry(i: Integer);
    procedure ArgentinaMenuItemClick(Sender: TObject);
    procedure BoliviaMenuItemClick(Sender: TObject);
    procedure BrazilMenuItemClick(Sender: TObject);
    procedure BritainMenuItemClick(Sender: TObject);
    procedure ChileMenuItemClick(Sender: TObject);
    procedure ColombiaMenuItemClick(Sender: TObject);
    procedure CostaRicaMenuItemClick(Sender: TObject);
    procedure CubaMenuItemClick(Sender: TObject);
    procedure CzechoslovakiaMenuItemClick(Sender: TObject);
    procedure EGermanyMenuItemClick(Sender: TObject);
    procedure ElSalvadorMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FranceMenuItemClick(Sender: TObject);
    procedure GreeceMenuItemClick(Sender: TObject);
    procedure GuatemalaMenuItemClick(Sender: TObject);
    procedure HondurasMenuItemClick(Sender: TObject);
    procedure ItalyMenuItemClick(Sender: TObject);
    procedure MexicoMenuItemClick(Sender: TObject);
    procedure NicaraguaMenuItemClick(Sender: TObject);
    procedure CanadaMenuItemClick(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PanamaMenuItemClick(Sender: TObject);
    procedure PeruMenuItemClick(Sender: TObject);
    procedure PolandMenuItemClick(Sender: TObject);
    procedure RomaniaMenuItemClick(Sender: TObject);
    procedure SKoreaMenuItemClick(Sender: TObject);
    procedure SouthAfricaMenuItemClick(Sender: TObject);
    procedure SpainMenuItemClick(Sender: TObject);
    procedure SpheresOfInfluenceMenuItemClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure SudanMenuItemClick(Sender: TObject);
    procedure SwedenMenuItemClick(Sender: TObject);
    procedure SyriaMenuItemClick(Sender: TObject);
    procedure TaiwanMenuItemClick(Sender: TObject);
    procedure TanzaniaMenuItemClick(Sender: TObject);
    procedure TaxesMenuItemClick(Sender: TObject);
    procedure TelephonesMenuItemClick(Sender: TObject);
    procedure ThailandMenuItemClick(Sender: TObject);
    procedure TradeMenuItemClick(Sender: TObject);
    procedure TradePolicyMenuItemClick(Sender: TObject);
    procedure TradePolicyPolicyMenuItemClick(Sender: TObject);
    procedure TreatiesMenuItemClick(Sender: TObject);
    procedure TreatyMenuItemClick(Sender: TObject);
    procedure TunisiaMenuItemClick(Sender: TObject);
    procedure TurkeyMenuItemClick(Sender: TObject);
    procedure TVsMenuItemClick(Sender: TObject);
    procedure TwoTimesMenuItemClick(Sender: TObject);
    procedure UndoLastTurnMenuItemClick(Sender: TObject);
    procedure USAActionsMenuItemClick(Sender: TObject);
    procedure USAMenuItemClick(Sender: TObject);
    procedure USAOtherMenuItemClick(Sender: TObject);
    procedure USSRActionsMenuItemClick(Sender: TObject);
    procedure USSRMenuItemClick(Sender: TObject);
    procedure USSROtherMenuItemClick(Sender: TObject);
    procedure VenezuelaMenuItemClick(Sender: TObject);
    procedure VietnamMenuItemClick(Sender: TObject);
    procedure WGermanyMenuItemClick(Sender: TObject);
    procedure YesResumeGameMenuItemClick(Sender: TObject);

    procedure YugoslaviaMenuItemClick(Sender: TObject);
    procedure ZaireMenuItemClick(Sender: TObject);
    procedure ZambiaMenuItemClick(Sender: TObject);
    procedure ZimbabweMenuItemClick(Sender: TObject);
  private
    Old1: Integer;
    Old2: Integer;
    Old3: Integer;
    PicturNum: Integer;
    OnTitleScreen: Boolean;
    OnOptionsScreen: Boolean;
    OnBackgroundScreen: Boolean;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{Constructor}
procedure TMainForm.FormCreate(Sender: TObject);
begin
    Randomize;

    GameOver := false;
    OnTitleScreen := true;
    SaveGameFilename := '';
    ReactNewsIndex := 1;
    DisplayScale := 1.5;
    HitCntry := 0;

    Old1 := -1;
    Old2 := -1;
    Old3 := -1;
    PicturNum := -1;

    SelectedTheme := 1;
    SelectedMapScale := 1;
    SetClassicTheme;
    ReviseMenu;
end;

{Game logic functions/procedures}

PROCEDURE TMainForm.SetPolicy(Item: Integer);
{for Human player to set his policy with a dialog box}
VAR
    ItemHit:          Integer;
    theType:          Integer;
    OldCntrl:         Integer;
    i,x,max,Sum:      Integer;
    MaxHIntv:         Integer;
    MaxHMAid:         Integer;
    AvlResrc:         Integer;
    LocalVerb:        Integer;
    TitStrng:         Str255;
    LongAvl:          LongInt;
    NumString:        Str255;

BEGIN
    CASE Item OF
        1: LocalVerb:=Miltry;
        2: LocalVerb:=Insg;
        3: LocalVerb:=IntGov;
        4: LocalVerb:=IntReb;
        5: LocalVerb:=Econ;
        6: LocalVerb:=Destabl;
        7: LocalVerb:=Treato;
        8: LocalVerb:=Pressur;
        9: LocalVerb:=Trado;
    END;

    {Set the country name in the dialog and set all radio buttons to enabled}
    MakePoliciesForm.MakePoliciesCountryLabel.Caption := CntryNam[HitCntry];
    MakePoliciesForm.MakePoliciesRadioButton1.Enabled := true;
    MakePoliciesForm.MakePoliciesRadioButton2.Enabled := true;
    MakePoliciesForm.MakePoliciesRadioButton3.Enabled := true;
    MakePoliciesForm.MakePoliciesRadioButton4.Enabled := true;
    MakePoliciesForm.MakePoliciesRadioButton5.Enabled := true;
    MakePoliciesForm.MakePoliciesRadioButton6.Enabled := true;

    max:=5;
    x:=DipAff[Human,HitCntry];
    CASE LocalVerb OF
        Miltry:
            BEGIN
                OldCntrl:=MiltAid[Human,HitCntry];
                max:=MilMax(x);
                x:=5;
                AvlResrc:=(MiltSpnd[Human] div 8)+GovtAid[Human];
                FOR i:=4 DOWNTO 0 DO IF MAidConv(i+1)>AvlResrc THEN x:=i;
                IF x<max THEN max:=x;
                AvlResrc:=2*AvlResrc;
            END;
        Insg:
            BEGIN
                OldCntrl:=InsgAid[Human,HitCntry];
                x:=0;
                IF StrngRat[HitCntry]<512 THEN x:=1;
                IF StrngRat[HitCntry]<128 THEN x:=2;
                IF StrngRat[HitCntry]<32     THEN x:=3;
                IF StrngRat[HitCntry]<8     THEN x:=4;
                IF StrngRat[HitCntry]<2     THEN x:=5;
                max:=x;
                x:=InsgAMax(Human,HitCntry);
                IF x<max THEN max:=x;
                AvlResrc:=(MiltSpnd[Human] div 8)+GovtAid[Human];
                FOR i:=4 DOWNTO 0 DO IF MAidConv(i+1)>AvlResrc THEN x:=i;
                IF x<max THEN max:=x;
                AvlResrc:=2*AvlResrc;
            END;
        IntGov:
            BEGIN
                OldCntrl:=IntvGovt[Human,HitCntry];
                max:=IntvGMax(Treaty[Human,HitCntry],x); x:=5;
                AvlResrc:=(MilMen[Human] div 4)-TotlIntv[Human];
                FOR i:=4 DOWNTO 0 DO IF IntvConv(i+1)>AvlResrc THEN x:=i;
                IF x<max THEN max:=x;
            END;
        IntReb:
            BEGIN
                OldCntrl:=IntvRebl[Human,HitCntry];
                max:=InsgIMax(Human,HitCntry); x:=5;
                AvlResrc:=(MilMen[Human] div 4)-TotlIntv[Human];
                FOR i:=4 DOWNTO 0 DO IF IntvConv(i+1)>AvlResrc THEN x:=i;
                IF x<max THEN max:=x;
            END;
        Econ:
            BEGIN
                OldCntrl:=EconAid[Human,HitCntry];
                max:=EconAMax(x);
                Sum:=0;
                FOR i:=3 TO NoCntry DO Sum:=Sum+EconConv(EconAid[Human,i]);
                x:=5;
                AvlResrc:=(GNP[Human] div 44)-(2*Sum);
                FOR i:=4 DOWNTO 0 DO
                    IF EconConv(i+1)>((AvlResrc div 2)+EconConv(OldCntrl)) THEN x:=i;
                IF x<max THEN max:=x;
            END;
        Destabl: OldCntrl:=Destab[Human,HitCntry];
        Treato:
            BEGIN
                OldCntrl:=Treaty[Human,HitCntry];
                max:=TreatMax(Integrty[Human]+x-Pugnacty[Human]);
                IF max<=Treaty[Human,HitCntry] THEN max:=Treaty[Human,HitCntry];
                IF Treaty[Human,HitCntry]>0 THEN
                    BEGIN
                        FOR i:=0 TO Treaty[Human,HitCntry]-1 DO
                            BEGIN
                                CASE i OF
                                    0: MakePoliciesForm.MakePoliciesRadioButton1.Enabled := false;
                                    1: MakePoliciesForm.MakePoliciesRadioButton2.Enabled := false;
                                    2: MakePoliciesForm.MakePoliciesRadioButton3.Enabled := false;
                                    3: MakePoliciesForm.MakePoliciesRadioButton4.Enabled := false;
                                    4: MakePoliciesForm.MakePoliciesRadioButton5.Enabled := false;
                                    5: MakePoliciesForm.MakePoliciesRadioButton6.Enabled := false;
                                end;
                            END;
                    END;
            END;
        Pressur: OldCntrl:=Pressure[Human,HitCntry];
        Trado: OldCntrl:=Trade[Human,HitCntry];
    END;

    {Save the originally selected item and verb in the form member data}
    MakePoliciesForm.OrigItem := OldCntrl;
    MakePoliciesForm.Verb := LocalVerb;

    IF max<5 THEN
        BEGIN
            FOR i:=max+1 TO 5 DO
                BEGIN
                    CASE i OF
                        1: MakePoliciesForm.MakePoliciesRadioButton2.Enabled := false;
                        2: MakePoliciesForm.MakePoliciesRadioButton3.Enabled := false;
                        3: MakePoliciesForm.MakePoliciesRadioButton4.Enabled := false;
                        4: MakePoliciesForm.MakePoliciesRadioButton5.Enabled := false;
                        5: MakePoliciesForm.MakePoliciesRadioButton6.Enabled := false;
                    end;
                END;
        END;
    IF (OldCntrl>0) AND (LocalVerb<>Treato) THEN
        BEGIN
            FOR i:=0 TO MakePoliciesForm.OrigItem DO
                BEGIN
                    CASE i OF
                        0: MakePoliciesForm.MakePoliciesRadioButton1.Enabled := true;
                        1: MakePoliciesForm.MakePoliciesRadioButton2.Enabled := true;
                        2: MakePoliciesForm.MakePoliciesRadioButton3.Enabled := true;
                        3: MakePoliciesForm.MakePoliciesRadioButton4.Enabled := true;
                        4: MakePoliciesForm.MakePoliciesRadioButton5.Enabled := true;
                        5: MakePoliciesForm.MakePoliciesRadioButton6.Enabled := true;
                    end;
                END;
        END;
    IF Item<6 THEN
        BEGIN {Available resource write}
            TitStrng := GetIndString(596,Item);
            LongAvl:=AvlResrc;
            NumString := IntToStr(LongAvl);
            TitStrng:=Concat(NumString,TitStrng);
            MakePoliciesForm.AvailableLabel.Visible := true;
            MakePoliciesForm.AvailableAmountLabel.Caption := TitStrng;
        END
    else
        begin
            MakePoliciesForm.AvailableLabel.Visible := false;
            MakePoliciesForm.AvailableAmountLabel.Caption := '';
        end;

    {Set the dialog header}
    MakePoliciesForm.MakePoliciesHeader.Caption := GetMakePoliciesDialogHeader(128+LocalVerb);
    {Set the dialog text}
    MakePoliciesForm.MakePoliciesRadioButton1.Caption := GetMakePoliciesDialogText(128+LocalVerb, 1);
    MakePoliciesForm.MakePoliciesRadioButton2.Caption := GetMakePoliciesDialogText(128+LocalVerb, 2);
    MakePoliciesForm.MakePoliciesRadioButton3.Caption := GetMakePoliciesDialogText(128+LocalVerb, 3);
    MakePoliciesForm.MakePoliciesRadioButton4.Caption := GetMakePoliciesDialogText(128+LocalVerb, 4);
    MakePoliciesForm.MakePoliciesRadioButton5.Caption := GetMakePoliciesDialogText(128+LocalVerb, 5);
    MakePoliciesForm.MakePoliciesRadioButton6.Caption := GetMakePoliciesDialogText(128+LocalVerb, 6);
    {Set the dialog selection}
    CASE OldCntrl OF
        0: MakePoliciesForm.MakePoliciesRadioButton1.Checked := true;
        1: MakePoliciesForm.MakePoliciesRadioButton2.Checked := true;
        2: MakePoliciesForm.MakePoliciesRadioButton3.Checked := true;
        3: MakePoliciesForm.MakePoliciesRadioButton4.Checked := true;
        4: MakePoliciesForm.MakePoliciesRadioButton5.Checked := true;
        5: MakePoliciesForm.MakePoliciesRadioButton6.Checked := true;
    end;
end;

PROCEDURE TMainForm.NextTurn;
VAR
    i,j,k,d,x,y,Who:  Integer;
    temp,delta:       LongInt;
BEGIN
    PrePlanMove;
    CrisisHeadline := -1;
    EventsForm.ReactNews;
    if (ComputerReacting = false) then
        begin
            IF NOT QuitFlag THEN
                begin
                    MainMove(PaintBox1);
                    IF Year=1989 THEN BEGIN SaveGame; END;
                    IF NOT QuitFlag THEN
                        BEGIN
                            IF Year=1997 THEN BEGIN
                               WinFlag:=TRUE;
                               EndGame(PaintBox1);
                               ScoreForm.Show;
                            END;
                            TwoPActF:=FALSE;
                            OldVHigh:=2;
                        END;
                    Repaint;
                end;
        end;
END;

PROCEDURE TMainForm.GiveInfo(theItem: INTEGER);
{response to information menu command}
CONST
    News       = 1;
    USSRA      = 2;
    USSRO      = 3;
    USAA       = 4;
    USAO       = 5;
    IntNews    = 6;
VAR
    i,j,x,y,Max,MaxPol:                       Integer;
    Flag,HitFlag,JkFlag:                      Boolean;
    AdjectStr,RigtStr:                        Str32;
    CaptlStr,LeadrStr,LeftStr,NameStr:        Str32;
    TempStrng:                                Str255;
    whichControl:                             Integer;

BEGIN
    {Save the current 'Events' menu type and headline counter in the form member data}
    EventsForm.theItem := theItem;
    EventsForm.WhichHead := 0;

    TempStrng := GetIndString(597,theItem);
    EventsForm.Caption := TempStrng;
    EventsForm.SaveStrng := TempStrng;

    IF (NOT TwoPFlag) AND
        (((theItem=USSRA) AND (Human=1)) OR ((theItem=USAA) AND (Human=2)))
        THEN EventsForm.WhichHead:=LastNews-1;

    IF theItem=News THEN
        begin
            GetLabels(HitCntry,AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr);
            EventsForm.NewsLabel1.Caption := 'The ' + AdjectStr;
            EventsForm.NewsLabel1.Visible := true;
            EventsForm.NewsLabel2.Caption := 'Yearly News ' + IntToStr(Year);
            EventsForm.NewsLabel2.Visible := true;
            EventsForm.ResetEventsWindow;
            EventsForm.ChooseHead(theItem, 0);
        end
    else
        begin
            EventsForm.NewsLabel1.Visible := false;
            EventsForm.NewsLabel2.Visible := false;
            EventsForm.ChooseHead(theItem, 2);
        end;
END;

PROCEDURE TMainForm.GameAction(theItem: Integer);
     {responds to game menu}
CONST
    ScoreG = 1;
    NTurn = 2;
    LoadG = 3;
    ChangeS = 4;
    QuitGame = 6;
VAR
    x:    Integer;
BEGIN
    CASE theItem OF
        NTurn:
            BEGIN
                NoUndoFlag:=FALSE;
                IF Year>1988 THEN begin DoSaveGamePrompt;SaveGame; end;
                NextTurn;
            END;
        LoadG:
            BEGIN
                LoadGame;
                NoUndoFlag:=TRUE;
                if HitCntry <> 0 then
                    SelectCountry(HitCntry);
                if SelectedTheme = 1 then
                    SetClassicTheme
                else
                    SetDarkModeTheme;
                if SelectedMapScale = 1 then
                    SetOnePointFiveTimesScale
                else
                    SetTwoTimesScale;
                ReviseTheMap;
                DrawMap(PaintBox1);
            END;
        QuitGame:
            BEGIN
                QuitFlag:=TRUE;
                IF QuitFlag THEN
                    BEGIN
                        x := MessageDlg('Balance of Power: The 1990 Edition', 'Are you sure you want to quit this game?', mtConfirmation, [mbYes, mbNo], 0);
                        QuitFlag:=(x=mrYes);
                        IF QuitFlag THEN
                            BEGIN
                                QuitFlag:=FALSE;
                                SaveGame;
                                QuitFlag:=TRUE;
                                Halt;
                            END;
                    END;
            END;
    end;
end;

PROCEDURE TMainForm.ClrHitCntry;
BEGIN
    IF HitCntry>0 THEN
        BEGIN
            FillCntry(HitCntry,CountryBackgroundColor);

            {Clear any existing country name}
            PaintBox1.Canvas.Brush.Color := BackgroundColor;
            PaintBox1.Canvas.Pen.Width := 1;
            PaintBox1.Canvas.Pen.Color := BackgroundColor;
            PaintBox1.Canvas.Rectangle(0,0,round(512 * DisplayScale), round(30 * DisplayScale));

            OldHit:=HitCntry;
            HitCntry:=0;
        END;
END;

procedure TMainForm.ReviseTheMap;
CONST
	WhoDipRel = 9;
    WhoEcon   = 14;
    WhoTrade  = 18;
	WhoAtWar 	= 19;
begin
	IF (OldVHigh>=WhoDipRel) and (OldVHigh<=WhoAtWar) THEN
		IF (HitCntry=0) or ((HitCntry>2) and (Level<4)) THEN OldVHigh:=0;
    IF (OldVHigh>=WhoEcon) and (OldVHigh<=WhoTrade) THEN
        BEGIN
            GoingOut:=(HitCntry<3);
        END;
    GoingOutMenuItem.Checked := GoingOut;
    GoingInMenuItem.Checked := not GoingOut;
    ReviseMap(TRUE, PaintBox1);
end;

procedure TMainForm.SelectCountry(i: Integer);
VAR
    ts:               TTextStyle;
begin
    ClrHitCntry;
    FillCntry(i, CountrySelectionColor);

    {Draw the country name}
    PaintBox1.Canvas.Font.Color := OutlineColor;
    PaintBox1.Canvas.Brush.Color := BackgroundColor;
    PaintBox1.Canvas.Font.Size := round(14 * DisplayScale);
    ts := PaintBox1.Canvas.TextStyle;
    ts.Alignment := taCenter;
    ts.Layout := tlTop;
    PaintBox1.Canvas.TextRect(Rect(round(62 * DisplayScale), 0, round(450 * DisplayScale), round(25 * DisplayScale)), 0, 0, CntryNam[i], ts);

    if (OnBackgroundScreen) then
        begin
            HitCntry := i;
            DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
            DrawMap(PaintBox1);
        end
    else
        begin
            HitCntry := i;
            ReviseTheMap;
            DrawMap(PaintBox1);
            ReviseMenu;
        end;
end;

procedure TMainForm.ReviseMenu;
begin
    {If we're in two player mode, then only enable the Next Turn menu item after both sides have played}
	IF TwoPFlag THEN
		BEGIN
			ChangeSidesMenuItem.Enabled := true;
			IF TwoPActF THEN NextTurnMenuItem.Enabled := true ELSE NextTurnMenuItem.Enabled := false;
		END
    ELSE
        begin
            ChangeSidesMenuItem.Enabled := false;
        end;

    {If we're playing below Multipolar level, then disable the Multipolar level menu items, otherwise enable them}
    if (Level < 4) then
        begin
            CountriesAtWarMenuItem.Enabled := false;
            TradePolicyMenuItem.Enabled := false;
            AtWarWithMenuItem.Enabled := false;
            TradePolicyPolicyMenuItem.Enabled := false;
            GoingOutMenuItem.Enabled := true;
            GoingInMenuItem.Enabled := false;
        end
    else
        begin
            CountriesAtWarMenuItem.Enabled := true;
            TradePolicyMenuItem.Enabled := true;
            AtWarWithMenuItem.Enabled := true;
            TradePolicyPolicyMenuItem.Enabled := true;
        end;
    {If we're playing below Expert level, then disable the Expert level menu items, otherwise enable them}
    if (Level < 3) then
        begin
            FinlandUSAMenuItem.Enabled := false;
            FinlandUSSRMenuItem.Enabled := false;
            TreatiesMenuItem.Enabled := false;
            DiplomaticPressureMenuItem.Enabled := false;
            TreatyMenuItem.Enabled := false;
            DiplomaticPressurePolicyMenuItem.Enabled := false;
        end
    else
        begin
            FinlandUSAMenuItem.Enabled := true;
            FinlandUSSRMenuItem.Enabled := true;
            TreatiesMenuItem.Enabled := true;
            DiplomaticPressureMenuItem.Enabled := true;
            TreatyMenuItem.Enabled := true;
            DiplomaticPressurePolicyMenuItem.Enabled := true;
        end;
    {If we're playing below Intermediate level, then disable the Intermediate level menu items, otherwise enable them}
    if (Level < 2) then
        begin
            CoupDetatMenuItem.Enabled := false;
            EconomicAidMenuItem.Enabled := false;
            DestabilizationMenuItem.Enabled := false;
            EconomicAidPolicyMenuItem.Enabled := false;
            DestabilizeMenuItem.Enabled := false;
        end
    else
        begin
            CoupDetatMenuItem.Enabled := true;
            EconomicAidMenuItem.Enabled := true;
            DestabilizationMenuItem.Enabled := true;
            EconomicAidPolicyMenuItem.Enabled := true;
            DestabilizeMenuItem.Enabled := true;
        end;

    {Enable Newspaper, Closeup, and History if a country is selected, otherwise disable them}
    if (HitCntry > 0) then
        begin
            NewspaperMenuItem.Enabled := true;
            CloseupMenuItem.Enabled := true;
            HistoryMenuItem.Enabled := true;
        end
    else
        begin
            NewspaperMenuItem.Enabled := false;
            CloseupMenuItem.Enabled := false;
            HistoryMenuItem.Enabled := false;
        end;
    {Enable the Relations menu if USA or USSR is selected OR if any country is selected and we're on Multipolar level, otherwise disable it}
    if ((HitCntry > 0) and ((HitCntry < 3) or (Level = 4))) then
        begin
            RelationsMenuItem.Enabled := true;
        end
    else
        begin
            RelationsMenuItem.Enabled := false;
        end;
    {Disable the advanced Relations menu items if we're on Multipolar level and a country other than USA or USSR is selected}
    if ((HitCntry > 2) and (Level = 4)) then
        begin
           EconomicAidMenuItem.Enabled := false;
           DestabilizationMenuItem.Enabled := false;
           TreatiesMenuItem.Enabled := false;
           DiplomaticPressureMenuItem.Enabled := false;
           TradePolicyMenuItem.Enabled := false;
        end;
    {Disable the Make Policies menu if USA, USSR, or no country is selected, otherwise enable it}
    if ((HitCntry = 0) or (HitCntry < 3)) then
        begin
            MakePoliciesMenuItem.Enabled := false;
        end
    else
        begin
            MakePoliciesMenuItem.Enabled := true;
        end;

    IF (Year<1990) OR NoUndoFlag THEN UndoLastTurnMenuItem.Enabled := false ELSE UndoLastTurnMenuItem.Enabled := true;
    IF WinFlag THEN
        begin
            ScoreMenuItem.Enabled := false;
            NextTurnMenuItem.Enabled := false;
            ChangeSidesMenuItem.Enabled := false;
            MakePoliciesMenuItem.Enabled := false;
            EventsMenuItem.Enabled := false;
        end;

    IF (SelectedTheme = 1) then
        begin
            ClassicMenuItem.Checked := true;
            DarkModeMenuItem.Checked := false;
        end
    else
        begin
            ClassicMenuItem.Checked := false;
            DarkModeMenuItem.Checked := true;
        end;

    if (SelectedMapScale = 1) then
        begin
            OnePointFiveTimesMenuItem.Checked := true;
            TwoTimesMenuItem.Checked := false;
        end
    else
        begin
            OnePointFiveTimesMenuItem.Checked := false;
            TwoTimesMenuItem.Checked := true;
        end;
end;

procedure TMainForm.DoSaveGamePrompt;
begin
    if (SaveGameFilename = '') then
        begin
            if SaveDialog1.Execute then
                begin
                    SaveGameFilename := SaveDialog1.Filename;
                end;
        end;
end;

{Title screen onclick handlers}
procedure TMainForm.NewGameButtonClick(Sender: TObject);
begin
    DoSaveGamePrompt;

    if (SaveGameFilename <> '') then
        begin
            {Hide all of the title screen items}
            NewGameButton.Visible := false;
            LoadOldGameButton.Visible := false;

            {Show all of the options screen items}
            OptionsLabel.Visible := true;
            Label1.Visible := true;
            Label2.Visible := true;
            Label3.Visible := true;
            Label4.Visible := true;
            LevelRadioGroup.Visible := true;
            SideRadioGroup.Visible := true;
            PlayersRadioGroup.Visible := true;
            StartButton.Visible := true;

            {Initialize the options screen}
            OnTitleScreen := false;
            OnOptionsScreen := true;
        end;
end;

procedure TMainForm.LoadOldGameButtonClick(Sender: TObject);
begin
    if OpenDialog1.Execute then
        begin
            SaveGameFilename := OpenDialog1.Filename;

            {Hide all of the title screen items}
            NewGameButton.Visible := false;
            LoadOldGameButton.Visible := false;

            {Show the menubar and the main canvas area}
            PaintBox1.Visible := true;
            MainForm.Menu := MainMenu1;

            {Initialize the game}
            OnTitleScreen := false;
            GameAction(3);
            OldVHigh:=2;
            if HitCntry <> 0 then
               SelectCountry(HitCntry);
            WritScor(PaintBox1);
        end;
end;

{Options screen Start Button click handler}
procedure TMainForm.StartButtonClick(Sender: TObject);
begin
    {Hide all of the options screen items}
    OptionsLabel.Visible := false;
    Label1.Visible := false;
    Label2.Visible := false;
    Label3.Visible := false;
    Label4.Visible := false;
    LevelRadioGroup.Visible := false;
    SideRadioGroup.Visible := false;
    PlayersRadioGroup.Visible := false;
    StartButton.Visible := false;

    {Show the menubar and the main canvas area}
    PaintBox1.Visible := true;
    MainForm.Menu := MainMenu1;

    Level := LevelRadioGroup.ItemIndex + 1;
    if (SideRadioGroup.ItemIndex = 0) then
        begin
            Human:=1;         {Human plays USA}
            Cmptr:=2; {Cmptr plays Russia}
        end
    else
        begin
            Human:=2;
            Cmptr:=1;
        end;
    if (PlayersRadioGroup.ItemIndex = 0) then
       TwoPFlag := false
    else
       TwoPFlag := true;

    {Initialize the game}
    OnOptionsScreen := false;
    EndDummy:=InitGame(PaintBox1);
    GameAction(EndDummy);
    OldVHigh := 2;
    ReviseMenu;
end;

{'Game' menu onclick handlers}
procedure TMainForm.NextTurnMenuItemClick(Sender: TObject);
begin
    EventsForm.PaintBox1 := PaintBox1;
    EventsForm.EndButton := EndButton;
    EventsForm.MainMenu1 := MainMenu1;
    EventsForm.MainForm := MainForm;
    EventsForm.ScoreForm := ScoreForm;
    WindFlag:=FALSE;
    CrisFlag:=FALSE;
    ReactNewsIndex:=1;
    GameAction(2);
    ReviseMenu;

    OldVHigh:=2;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.DrawTitle;
var
    TitleString: String;
begin
    TitleString := 'Balance of Power';

    {Draw the title}
    PaintBox1.Canvas.Brush.Style := bsClear;
    PaintBox1.Canvas.Font.Size := 40;
    PaintBox1.Canvas.Font.Style := [fsBold];
    PaintBox1.Canvas.Font.Name := 'Courier New';
    PaintBox1.Canvas.Font.Color := clBlack;
    PaintBox1.Canvas.TextOut(127, 64, TitleString);
    PaintBox1.Canvas.Font.Color := clWhite;
    PaintBox1.Canvas.TextOut(131, 64, TitleString);
    PaintBox1.Canvas.TextOut(133, 64, TitleString);
    PaintBox1.Canvas.TextOut(132, 63, TitleString);
    PaintBox1.Canvas.TextOut(132, 65, TitleString);
    PaintBox1.Canvas.Font.Color := clGray;
    PaintBox1.Canvas.TextOut(132, 64, TitleString);

    {Reset the font}
    PaintBox1.Canvas.Font.Name := 'default';
    PaintBox1.Canvas.Font.Style := [];
    PaintBox1.Canvas.Font.Color := clBlack;
end;

procedure TMainForm.OnTimer(Sender: TObject);
var
    png:  TPortableNetworkGraphic;
    x, y: Integer;
begin
  if (OnTitleScreen) then
      begin
          Old3:=Old2;
          Old2:=Old1;
          Old1:=PicturNum;
          REPEAT PicturNum:=Random(24);
          UNTIL (PicturNum<>Old1) AND (PicturNum<>Old2) AND (PicturNum<>Old3);
          x := Random(PaintBox1.Width - 117);
          y := Random(PaintBox1.Height - 88);

          png:=TPortableNetworkGraphic.Create;
          try
              CASE PicturNum OF
                  0: Png.LoadFromLazarusResource('b52');
                  1: Png.LoadFromLazarusResource('baldeagle');
                  2: Png.LoadFromLazarusResource('button');
                  3: Png.LoadFromLazarusResource('capitol');
                  4: Png.LoadFromLazarusResource('chopper');
                  5: Png.LoadFromLazarusResource('earth');
                  6: Png.LoadFromLazarusResource('flags');
                  7: Png.LoadFromLazarusResource('hammerandsickle');
                  8: Png.LoadFromLazarusResource('kissinger');
                  9: Png.LoadFromLazarusResource('lenin');
                  10: Png.LoadFromLazarusResource('maskedman');
                  11: Png.LoadFromLazarusResource('missile');
                  12: Png.LoadFromLazarusResource('mushroomcloud');
                  13: Png.LoadFromLazarusResource('negotiators');
                  14: Png.LoadFromLazarusResource('protestor');
                  15: Png.LoadFromLazarusResource('resistancesymbol');
                  16: Png.LoadFromLazarusResource('revolutionaries');
                  17: Png.LoadFromLazarusResource('seal');
                  18: Png.LoadFromLazarusResource('soldier');
                  19: Png.LoadFromLazarusResource('sr71');
                  20: Png.LoadFromLazarusResource('submarine');
                  21: Png.LoadFromLazarusResource('tank');
                  22: Png.LoadFromLazarusResource('tankcrew');
                  23: Png.LoadFromLazarusResource('target');
             end;
             PaintBox1.Canvas.Draw(x, y, png);
         finally
            Png.Free;
         end;

         DrawTitle;

      end;
end;

procedure TMainForm.UndoLastTurnMenuItemClick(Sender: TObject);
VAR
    x:    Integer;
begin
    x := MessageDlg('Are you sure you want to undo the last turn?', mtConfirmation, [mbYes, mbNo], 0);
    IF x=mrYes THEN
        BEGIN
            NoUndoFlag:=TRUE;
            GameAction(3);
            OldVHigh:=2;
            ReviseTheMap;
            DrawMap(PaintBox1);
            WritScor(PaintBox1);
            ReviseMenu;
        END;
end;

procedure TMainForm.ChangeSidesMenuItemClick(Sender: TObject);
begin
    ExchangP(PaintBox1);
    TwoPActF:=TRUE;
    ReviseMenu;
end;

procedure TMainForm.QuitGameMenuITemClick(Sender: TObject);
begin
    GameAction(6);
end;

procedure TMainForm.SetClassicTheme;
begin
    BackgroundColor := clMenuBar;
    OutlineColor := clBlack;
    CountryBackgroundColor := clWhite;
    CountrySelectionColor := clBlack;
    LowValueColor := TColor(LightGrayRGB);
    MediumValueColor := TColor(MediumGrayRGB);
    HighValueColor := TColor(DarkGrayRGB);
    Repaint;
end;

procedure TMainForm.SetDarkModeTheme;
begin
    BackgroundColor := TColor($202020);
    OutlineColor := TColor($F8F8F8);
    CountryBackgroundColor := clBlack;
    CountrySelectionColor := TColor($F8F8F8);
    LowValueColor := TColor(VDarkGrayRGB);
    MediumValueColor := TColor(MedDkGrayRGB);
    HighValueColor := TColor(LtMedGrayRGB);
    Repaint;
end;

procedure TMainForm.SetEndGameButtonPosition;
begin
    {Set the button location}
    EndButton.Left := Round(256 * DisplayScale) - 26;
    EndButton.Top := Round(344 * DisplayScale) - 37;
end;

procedure TMainForm.SetOnePointFiveTimesScale;
begin
    if (DisplayScale = 2.0) then Left := Left + 128;
    DisplayScale := 1.5;
    SetEndGameButtonPosition;
    Repaint;
end;

procedure TMainForm.SetTwoTimesScale;
begin
    if (DisplayScale = 1.5) then Left := Left - 128;
    DisplayScale := 2.0;
    SetEndGameButtonPosition;
    Repaint;
end;

procedure TMainForm.ScoreMenuItemClick(Sender: TObject);
begin
    ScoreForm.Show;
end;

procedure TMainForm.ClassicMenuItemClick(Sender: TObject);
begin
    SelectedTheme := 1;
    SetClassicTheme;
    ReviseMenu;
end;

procedure TMainForm.DarkModeMenuItemClick(Sender: TObject);
begin
    SelectedTheme := 2;
    SetDarkModeTheme;
    ReviseMenu;
end;

procedure TMainForm.OnePointFiveTimesMenuItemClick(Sender: TObject);
begin
    SelectedMapScale := 1;
    SetOnePointFiveTimesScale;
    ReviseMenu;
end;

procedure TMainForm.TwoTimesMenuItemClick(Sender: TObject);
begin
    SelectedMapScale := 2;
    SetTwoTimesScale;
    ReviseMenu;
end;

procedure TMainForm.AboutBOPMenuItemClick(Sender: TObject);
begin
    AboutForm.Show;
end;

{'Countries' menu onclick handlers}
procedure TMainForm.SpheresOfInfluenceMenuItemClick(Sender: TObject);
begin
    OldVHigh:=1;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.MajorEventsMenuItemClick(Sender: TObject);
begin
    OldVHigh:=2;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.PrestigeValueMenuItemClick(Sender: TObject);
begin
    OldVHigh:=3;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.InsurgencyMenuItemClick(Sender: TObject);
begin
    OldVHigh:=4;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.CoupDetatMenuItemClick(Sender: TObject);
begin
    OldVHigh:=5;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.FinlandUSAMenuItemClick(Sender: TObject);
begin
    OldVHigh:=6;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.FinlandUSSRMenuItemClick(Sender: TObject);
begin
    OldVHigh:=7;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.CountriesAtWarMenuItemClick(Sender: TObject);
begin
    OldVHigh:=8;
    ClrHitCntry;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

{'Relations' menu onclick handlers}
procedure TMainForm.DiplomaticRelationshipsMenuItemClick(Sender: TObject);
begin
    OldVHigh:=9;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.MilitaryAidMenuItemClick(Sender: TObject);
begin
    OldVHigh:=10;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.AidToInsurgentsMenuItemClick(Sender: TObject);
begin
    OldVHigh:=11;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.InterventionsForGovtMenuItemClick(Sender: TObject);
begin
    OldVHigh:=12;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.InterventionsForRebelsMenuItemClick(Sender: TObject);
begin
    OldVHigh:=13;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.EconomicAidMenuItemClick(Sender: TObject);
begin
    OldVHigh:=14;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.DestabilizationMenuItemClick(Sender: TObject);
begin
    OldVHigh:=15;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.TreatiesMenuItemClick(Sender: TObject);
begin
    OldVHigh:=16;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.DiplomaticPressureMenuItemClick(Sender: TObject);
begin
    OldVHigh:=17;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.TradePolicyMenuItemClick(Sender: TObject);
begin
    OldVHigh:=18;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.AtWarWithMenuItemClick(Sender: TObject);
begin
    OldVHigh:=19;
    ReviseTheMap;
    DrawMap(PaintBox1);
end;

procedure TMainForm.GoingOutMenuItemClick(Sender: TObject);
begin
    IF NOT GoingOut THEN
        BEGIN
            GoingOut:=TRUE;
            ReviseTheMap;
            DrawMap(PaintBox1);
        END;
end;

procedure TMainForm.GoingInMenuItemClick(Sender: TObject);
begin
    IF GoingOut THEN
        BEGIN
            GoingOut:=FALSE;
            ReviseTheMap;
            DrawMap(PaintBox1);
        END;
end;

{Make Policies onclick handlers}
procedure TMainForm.MilitaryAidPolicyMenuItemClick(Sender: TObject);
begin
    SetPolicy(1);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.AidToInsurgentsPolicyMenuITemClick(Sender: TObject);
begin
    SetPolicy(2);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.InterveneForGovtMenuItemClick(Sender: TObject);
begin
    SetPolicy(3);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.InterveneForRebelsMenuItemClick(Sender: TObject);
begin
    SetPolicy(4);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.EconomicAidPolicyMenuItemClick(Sender: TObject);
begin
    SetPolicy(5);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.DestabilizeMenuItemClick(Sender: TObject);
begin
    SetPolicy(6);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.TreatyMenuItemClick(Sender: TObject);
begin
    SetPolicy(7);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.DiplomaticPressurePolicyMenuItemClick(Sender: TObject);
begin
    SetPolicy(8);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

procedure TMainForm.TradePolicyPolicyMenuItemClick(Sender: TObject);
begin
    SetPolicy(9);
    MakePoliciesForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    MakePoliciesForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    MakePoliciesForm.Show;
end;

{Events onclick handlers}
procedure TMainForm.NewspaperMenuItemClick(Sender: TObject);
begin
    CrisisHeadline := -1;
    EventsForm.PaintBox1 := PaintBox1;
    EventsForm.EndButton := EndButton;
    EventsForm.MainMenu1 := MainMenu1;
    EventsForm.MainForm := MainForm;
    EventsForm.ScoreForm := ScoreForm;
    GiveInfo(1);
    EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    EventsForm.Show;
    AdvisoryForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    AdvisoryForm.Left := MainForm.Left + Round(FormStartX * DisplayScale) + EventsForm.Width;
end;

procedure TMainForm.USSRActionsMenuItemClick(Sender: TObject);
begin
     CrisisHeadline := -1;
     EventsForm.PaintBox1 := PaintBox1;
     EventsForm.EndButton := EndButton;
     EventsForm.MainMenu1 := MainMenu1;
     EventsForm.MainForm := MainForm;
     EventsForm.ScoreForm := ScoreForm;
     GiveInfo(2);
     EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
     EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
     EventsForm.Show;
     AdvisoryForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
     AdvisoryForm.Left := MainForm.Left + Round(FormStartX * DisplayScale) + EventsForm.Width;
end;

procedure TMainForm.USSROtherMenuItemClick(Sender: TObject);
begin
    EventsForm.PaintBox1 := PaintBox1;
    GiveInfo(3);
    EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    EventsForm.Show;
end;

procedure TMainForm.USAActionsMenuItemClick(Sender: TObject);
begin
    CrisisHeadline := -1;
    EventsForm.PaintBox1 := PaintBox1;
    EventsForm.EndButton := EndButton;
    EventsForm.MainMenu1 := MainMenu1;
    EventsForm.MainForm := MainForm;
    EventsForm.ScoreForm := ScoreForm;
    GiveInfo(4);
    EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    EventsForm.Show;
    AdvisoryForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    AdvisoryForm.Left := MainForm.Left + Round(FormStartX * DisplayScale) + EventsForm.Width;
end;

procedure TMainForm.USAOtherMenuItemClick(Sender: TObject);
begin
    EventsForm.PaintBox1 := PaintBox1;
    GiveInfo(5);
    EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    EventsForm.Show;
end;

procedure TMainForm.MinorCountryNewsMenuItemClick(Sender: TObject);
begin
    EventsForm.PaintBox1 := PaintBox1;
    GiveInfo(6);
    EventsForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    EventsForm.Left := MainForm.Left + Round(FormStartX * DisplayScale);
    EventsForm.Show;
    AdvisoryForm.Top := MainForm.Top + Round(FormStartY * DisplayScale) + FormTopOffset;
    AdvisoryForm.Left := MainForm.Left + Round(FormStartX * DisplayScale) + EventsForm.Width;
end;

{Briefing onclick handlers}
procedure TMainForm.CloseupMenuItemClick(Sender: TObject);
begin
    DoCloseUp;
    CloseupForm.Show;
end;

procedure TMainForm.BackgroundMenuItemClick(Sender: TObject);
begin
    MainForm.Menu := MainMenu2;
    OnBackgroundScreen := true;
    InitBackGd(PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.HistoryMenuItemClick(Sender: TObject);
begin
    HistoryForm.Show;
end;

{Background onclick handlers}
procedure TMainForm.YesResumeGameMenuItemClick(Sender: TObject);
begin
    MainForm.Menu := MainMenu1;
    OnBackgroundScreen := false;
    ReviseTheMap;
    DrawMap(PaintBox1);
    ReviseMenu;
end;

procedure TMainForm.GNPMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 1, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.MilitarySpendingMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 2, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.ConsumerSpendingMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 3, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.InvestmentSpendingMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 4, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.PopulationMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 5, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.MilitaryPersonnelMenuItemClick(Sender: TObject);
begin
    DoBackGd(11, 6, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.PerNothingMenuItemClick(Sender: TObject);
begin
    Background.CurPerVal := 8;
    DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
    DrawMap(PaintBox1);
    PerNothingMenuItem.Checked := true;
    PerCapitaMenuItem.Checked := false;
    PerGNPMenuItem.Checked := false;
end;

procedure TMainForm.PerCapitaMenuItemClick(Sender: TObject);
begin
    Background.CurPerVal := 9;
    DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
    DrawMap(PaintBox1);
    PerNothingMenuItem.Checked := false;
    PerCapitaMenuItem.Checked := true;
    PerGNPMenuItem.Checked := false;
end;

procedure TMainForm.PerGNPMenuItemClick(Sender: TObject);
begin
    Background.CurPerVal := 10;
    DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
    DrawMap(PaintBox1);
    PerNothingMenuItem.Checked := false;
    PerCapitaMenuItem.Checked := false;
    PerGNPMenuItem.Checked := true;
end;

procedure TMainForm.LiteracyMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 1, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.EnergyMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 2, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.CaloriesMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 3, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.DoctorsMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 4, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.InfantMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 5, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.SchoolsMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 6, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.TVsMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 7, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.TelephonesMenuItemClick(Sender: TObject);
begin
    DoBackGd(12, 8, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.ProtestsMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 1, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.DeathsMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 2, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.RiotsMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 3, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.ArmedAttacksMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 4, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.AssassinationsMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 5, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.ExecutionsMenuItemClick(Sender: TObject);
begin
    DoBackGd(13, 6, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.PerNothingMenuItem2Click(Sender: TObject);
begin
    Background.CurVioln := 8;
    DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
    DrawMap(PaintBox1);
    PerNothingMenuItem2.Checked := true;
    PerCapitaMenuItem2.Checked := false;
end;

procedure TMainForm.PerCapitaMenuItem2Click(Sender: TObject);
begin
    Background.CurVioln := 9;
    DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
    DrawMap(PaintBox1);
    PerNothingMenuItem2.Checked := false;
    PerCapitaMenuItem2.Checked := true;
end;

procedure TMainForm.PoliticalRightsMenuITemClick(Sender: TObject);
begin
    DoBackGd(14, 1, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.CivilRightsMenuItemClick(Sender: TObject);
begin
    DoBackGd(14, 2, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.AgricultureMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 1, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.IndustryMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 2, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.ServicesMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 3, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.TradeMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 4, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.TaxesMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 5, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.PublicEducationMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 6, PaintBox1);
    DrawMap(PaintBox1);
end;

procedure TMainForm.PublicHealthMenuItemClick(Sender: TObject);
begin
    DoBackGd(15, 7, PaintBox1);
    DrawMap(PaintBox1);
end;

{End Game onclick handler}
procedure TMainForm.EndButtonClick(Sender: TObject);
begin
    Halt;
end;

{North America onclick handlers}
procedure TMainForm.CostaRicaMenuItemClick(Sender: TObject);
begin
    SelectCountry(65);
end;

procedure TMainForm.CubaMenuItemClick(Sender: TObject);
begin
    SelectCountry(7);
end;

procedure TMainForm.ElSalvadorMenuItemClick(Sender: TObject);
begin
    SelectCountry(64);
end;

procedure TMainForm.GuatemalaMenuItemClick(Sender: TObject);
begin
    SelectCountry(63);
end;

procedure TMainForm.HondurasMenuItemClick(Sender: TObject);
begin
    SelectCountry(4);
end;

procedure TMainForm.MexicoMenuItemClick(Sender: TObject);
begin
    SelectCountry(3);
end;

procedure TMainForm.NicaraguaMenuItemClick(Sender: TObject);
begin
    SelectCountry(5);
end;

procedure TMainForm.CanadaMenuItemClick(Sender: TObject);
begin
    SelectCountry(14);
end;

procedure TMainForm.PanamaMenuItemClick(Sender: TObject);
begin
    SelectCountry(6);
end;

procedure TMainForm.USAMenuItemClick(Sender: TObject);
begin
    SelectCountry(1);
end;

{South America onclick handlers}
procedure TMainForm.ArgentinaMenuItemClick(Sender: TObject);
begin
    SelectCountry(8);
end;

procedure TMainForm.BoliviaMenuItemClick(Sender: TObject);
begin
    SelectCountry(80);
end;

procedure TMainForm.BrazilMenuItemClick(Sender: TObject);
begin
    SelectCountry(12);
end;

procedure TMainForm.ChileMenuItemClick(Sender: TObject);
begin
    SelectCountry(13);
end;

procedure TMainForm.ColombiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(9);
end;

procedure TMainForm.PeruMenuItemClick(Sender: TObject);
begin
    SelectCountry(10);
end;

procedure TMainForm.VenezuelaMenuItemClick(Sender: TObject);
begin
    SelectCountry(11);
end;

{Europe onclick handlers}
procedure TMainForm.BritainMenuItemClick(Sender: TObject);
begin
    SelectCountry(17);
end;

procedure TMainForm.FranceMenuItemClick(Sender: TObject);
begin
    SelectCountry(18);
end;

procedure TMainForm.ItalyMenuItemClick(Sender: TObject);
begin
    SelectCountry(22);
end;

procedure TMainForm.SpainMenuItemClick(Sender: TObject);
begin
    SelectCountry(19);
end;

procedure TMainForm.SwedenMenuItemClick(Sender: TObject);
begin
    SelectCountry(16);
end;

procedure TMainForm.PolandMenuItemClick(Sender: TObject);
begin
    SelectCountry(24);
end;

procedure TMainForm.RomaniaMenuItemClick(Sender: TObject);
begin
    SelectCountry(21);
end;

procedure TMainForm.WGermanyMenuItemClick(Sender: TObject);
begin
    SelectCountry(20);
end;

procedure TMainForm.CzechoslovakiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(25);
end;

procedure TMainForm.EGermanyMenuItemClick(Sender: TObject);
begin
    SelectCountry(23);
end;

procedure TMainForm.GreeceMenuItemClick(Sender: TObject);
begin
    SelectCountry(15);
end;

procedure TMainForm.YugoslaviaMenuItemClick(Sender: TObject);
begin
    SelectCountry(26);
end;

procedure TMainForm.USSRMenuItemClick(Sender: TObject);
begin
    SelectCountry(2);
end;

{Africa onclick handlers}
procedure TMainForm.AlgeriaMenuItemClick(Sender: TObject);
begin
    SelectCountry(31);
end;

procedure TMainForm.AngolaMenuItemClick(Sender: TObject);
begin
    SelectCountry(42);
end;

procedure TMainForm.BotswanaMenuItemClick(Sender: TObject);
begin
    SelectCountry(77);
end;

procedure TMainForm.BurkinaFasoMenuItemClick(Sender: TObject);
begin
    SelectCountry(69);
end;

procedure TMainForm.CameroonMenuItemClick(Sender: TObject);
begin
    SelectCountry(73);
end;

procedure TMainForm.CentralAfricaMenuItemClick(Sender: TObject);
begin
    SelectCountry(74);
end;

procedure TMainForm.ChadMenuItemClick(Sender: TObject);
begin
    SelectCountry(72);
end;

procedure TMainForm.CongoMenuItemClick(Sender: TObject);
begin
    SelectCountry(75);
end;

procedure TMainForm.EgyptMenuItemClick(Sender: TObject);
begin
    SelectCountry(28);
end;

procedure TMainForm.EthiopiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(36);
end;

procedure TMainForm.GhanaMenuItemClick(Sender: TObject);
begin
    SelectCountry(70);
end;

procedure TMainForm.GuineaMenuItemClick(Sender: TObject);
begin
    SelectCountry(67);
end;

procedure TMainForm.IvoryCoastMenuItemClick(Sender: TObject);
begin
    SelectCountry(68);
end;

procedure TMainForm.KenyaMenuItemClick(Sender: TObject);
begin
    SelectCountry(37);
end;

procedure TMainForm.LibyaMenuItemClick(Sender: TObject);
begin
    SelectCountry(32);
end;

procedure TMainForm.MaliMenuItemClick(Sender: TObject);
begin
    SelectCountry(33);
end;

procedure TMainForm.MauritaniaMenuItemClick(Sender: TObject);
begin
    SelectCountry(66);
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin

end;

procedure TMainForm.MoroccoMenuItemClick(Sender: TObject);
begin
    SelectCountry(30);
end;

procedure TMainForm.MozambiqueMenuItemClick(Sender: TObject);
begin
    SelectCountry(40);
end;

procedure TMainForm.NigerMenuItemClick(Sender: TObject);
begin
    SelectCountry(71);
end;

procedure TMainForm.NigeriaMenuItemClick(Sender: TObject);
begin
    SelectCountry(34);
end;

procedure TMainForm.SouthAfricaMenuItemClick(Sender: TObject);
begin
    SelectCountry(27);
end;

procedure TMainForm.SudanMenuItemClick(Sender: TObject);
begin
    SelectCountry(35);
end;

procedure TMainForm.TanzaniaMenuItemClick(Sender: TObject);
begin
    SelectCountry(39);
end;

procedure TMainForm.TunisiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(29);
end;

procedure TMainForm.ZaireMenuItemClick(Sender: TObject);
begin
    SelectCountry(38);
end;

procedure TMainForm.ZambiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(41);
end;

procedure TMainForm.ZimbabweMenuItemClick(Sender: TObject);
begin
    SelectCountry(76);
end;

{Mid East onclick handlers}
procedure TMainForm.AfghanistanMenuItemClick(Sender: TObject);
begin
    SelectCountry(56);
end;

procedure TMainForm.IsraelMenuItemClick(Sender: TObject);
begin
    SelectCountry(51);
end;

procedure TMainForm.IranMenuItemClick(Sender: TObject);
begin
    SelectCountry(55);
end;

procedure TMainForm.IraqMenuItemClick(Sender: TObject);
begin
    SelectCountry(53);
end;

procedure TMainForm.JordanMenuItemClick(Sender: TObject);
begin
    SelectCountry(78);
end;

procedure TMainForm.LebanonMenuItemClick(Sender: TObject);
begin
    SelectCountry(79);
end;

procedure TMainForm.PakistanMenuItemClick(Sender: TObject);
begin
    SelectCountry(57);
end;

procedure TMainForm.SaudiArabiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(54);
end;

procedure TMainForm.SyriaMenuItemClick(Sender: TObject);
begin
    SelectCountry(50);
end;

procedure TMainForm.TurkeyMenuItemClick(Sender: TObject);
begin
    SelectCountry(49);
end;

{Far East onclick handlers}
procedure TMainForm.BurmaMenuItemClick(Sender: TObject);
begin
    SelectCountry(59);
end;

procedure TMainForm.ChinaMenuItemClick(Sender: TObject);
begin
    SelectCountry(47);
end;

procedure TMainForm.IndiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(58);
end;

procedure TMainForm.NKoreaMenuItemClick(Sender: TObject);
begin
    SelectCountry(44);
end;

procedure TMainForm.SKoreaMenuItemClick(Sender: TObject);
begin
    SelectCountry(45);
end;

procedure TMainForm.ThailandMenuItemClick(Sender: TObject);
begin
    SelectCountry(60);
end;

procedure TMainForm.VietnamMenuItemClick(Sender: TObject);
begin
    SelectCountry(48);
end;

{Pacific onclick handlers}
procedure TMainForm.AustraliaMenuItemClick(Sender: TObject);
begin
    SelectCountry(46);
end;

procedure TMainForm.IndonesiaMenuItemClick(Sender: TObject);
begin
    SelectCountry(61);
end;

procedure TMainForm.JapanMenuItemClick(Sender: TObject);
begin
    SelectCountry(43);
end;

procedure TMainForm.PhilippinesMenuItemClick(Sender: TObject);
begin
    SelectCountry(62);
end;

procedure TMainForm.TaiwanMenuItemClick(Sender: TObject);
begin
    SelectCountry(52);
end;

{Form handlers}
procedure TMainForm.PaintBox1Click(Sender: TObject);
var
    Point:            TPoint;
    Polygon:          TPointArr;
    i, j:             Integer;
    CountryClicked:   Boolean;
begin
    if (not (GameOver or OnTitleScreen or OnOptionsScreen)) then
        begin
            CountryClicked := false;

            Point:=Mouse.CursorPos;
            Point := ScreenToClient(Point);

            xMapClick := Point.x;
            yMapClick := Point.y;

            FOR i:=1 TO NoCntry DO
                begin
                    FOR j:=1 TO 5 DO
                        begin
                            Polygon := CntryPolygons[j,i];
                            if (IsPointInPolygon(xMapClick, yMapClick, Polygon)) then
                                begin
                                    SelectCountry(i);
                                    CountryClicked := true;
                                end;
                        end;
                end;

            if (not CountryClicked) then
               begin
                  if (OnBackgroundScreen) then
                      begin
                          ClrHitCntry;
                          DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
                          DrawMap(PaintBox1);
                      end
                  else
                      begin
                          ClrHitCntry;
                          ReviseTheMap;
                          DrawMap(PaintBox1);
                          ReviseMenu;
                      end;
               end;
        end;
end;

procedure TMainForm.PaintBox1Paint(Sender: TObject);
begin
    if (OnTitleScreen) then
        begin
            MainForm.Menu := nil;
            {MainForm.PaintBox1.Visible := false;}
            OptionsLabel.Visible := false;
            Label1.Visible := false;
            Label2.Visible := false;
            Label3.Visible := false;
            Label4.Visible := false;
            LevelRadioGroup.Visible := false;
            SideRadioGroup.Visible := false;
            PlayersRadioGroup.Visible := false;
            StartButton.Visible := false;

            {Draw the title text}
            DrawTitle;

            {Draw the subtitle text}
            PaintBox1.Canvas.Pen.Color := clBlack;
            PaintBox1.Canvas.Brush.Color := clMenuBar;
            PaintBox1.Canvas.Font.Size := 19;
            PaintBox1.Canvas.TextOut(round(196 * DisplayScale), round(77 * DisplayScale), 'The 1990 Edition');
            PaintBox1.Canvas.Font.Size := 13;
            PaintBox1.Canvas.TextOut(round(212 * DisplayScale), round(102 * DisplayScale), 'by Chris Crawford');
            PaintBox1.Canvas.Font.Size := 10;
            PaintBox1.Canvas.TextOut(round(149 * DisplayScale), round(122 * DisplayScale), 'Copyright (c) 1988 Chris Crawford.  All Rights Reserved.');
        end
    else if (OnOptionsScreen) then
        begin
            MainForm.Menu := nil;
            MainForm.PaintBox1.Visible := false;
            TitleScreenTimer.Enabled := false;
        end
    else if (OnBackgroundScreen) then
        begin
            PaintBox1.Width :=  Width;
            PaintBox1.Height :=  Height;
            if HitCntry <> 0 then
                SelectCountry(HitCntry);
            DoBackGd(Background.SelectedMenu, Background.SelectedItem, PaintBox1);
            DrawMap(PaintBox1);
        end
    else if (GameOver) then
        begin
            EndGame(PaintBox1);
        end
    else
        begin
            Width := round(512 * DisplayScale);
            Height := round(358 * DisplayScale);
            PaintBox1.Width :=  Width;
            PaintBox1.Height :=  Height;
            PaintBox1.Canvas.Pen.Color := BackgroundColor;
            PaintBox1.Canvas.Brush.Color := BackgroundColor;
            PaintBox1.Canvas.Rectangle(0, 0, PaintBox1.Width, PaintBox1.Height);
            if HitCntry <> 0 then
                SelectCountry(HitCntry);
            ReviseTheMap;
            DrawMap(PaintBox1);
            ReviseMenu;
        end;
end;

end.

