unit CrisisU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, StdCtrls, Globals, ExtCtrls, NewResrc;

PROCEDURE InitCrisis(WhichHead: Integer; FormLabel: TLabel; PrevButton, NextButton, QuestionButton: TButton; PaintBox1: TPaintBox);
FUNCTION  Crisis(EventsForm: TForm; WhichHead: Integer; FormLabel: TLabel; QuestionButton, BackDownButton, PrevButton, NextButton: TButton; PrestigeLabel,
    USAInterestLabel, USSRInterestLabel: TLabel; whichControl: Integer): Boolean;
PROCEDURE InitMinorCrisis(WhichHead: Integer; FormLabel: TLabel; PrevButton, NextButton, QuestionButton: TButton; PaintBox1: TPaintBox);
PROCEDURE MinorCrisis(EventsForm: TForm; WhichHead: Integer; FormLabel: TLabel; QuestionButton, BackDownButton, PrevButton, NextButton: TButton; PrestigeLabel,
    USAInterestLabel, USSRInterestLabel: TLabel; whichControl: Integer);
PROCEDURE CmptrCrisis(WhichHead: Integer);

VAR
    CrisisLevel:                  Integer;
    Rand1:                        Integer;
    Rand2:                        Integer;
    ScreenPaintBox:               TPaintBox;
    AggrFlag:                     Boolean;
    FirstCrisisIteration:         Boolean;

implementation

PROCEDURE InitMinorCrisis(WhichHead: Integer; FormLabel: TLabel; PrevButton, NextButton, QuestionButton: TButton; PaintBox1: TPaintBox);
VAR
    x:                Integer;
    Victim:           Integer;
    Who:              Integer;
BEGIN
    CullFlag:=FALSE;
    Who:=Subject[WhichHead];
    Victim:=TheObject[WhichHead];
    CrisisLevel:=9;
    PrevButton.Enabled := false;
    NextButton.Enabled := false;
    IF Human=1 THEN x:=1 ELSE x:=-1;
    ChgDMess(Victim,x);
END;

PROCEDURE MinorCrisis(EventsForm: TForm; WhichHead: Integer; FormLabel: TLabel; QuestionButton, BackDownButton, PrevButton, NextButton: TButton; PrestigeLabel,
      USAInterestLabel, USSRInterestLabel: TLabel; whichControl: Integer);
VAR
    Base:             Integer;
    i:                Integer;
    SavHuman:         Integer;
    HLoss:            Integer;
    CGain:            Integer;
    x:                Integer;
    y:                Integer;
    z:                Integer;
    Who:              Integer;
    StrgHndl:         StringHandle;
    BackDown:         Boolean;
    TempStrng:        Str255;
    SaveStrng:        Str255;
    Victim:           Integer;

    PROCEDURE MinorTough;
    VAR
        x,y:    Integer;
    BEGIN
        CrisisLevel:=CrisisLevel-1;
        x:=0;
        CASE CrisisLevel OF
            2: x:=32;
            3: x:=16;
            4: x:=8;
            5: x:=4;
            6: x:=2;
            7: x:=1;
            8: x:=0;
        END;
        ChgDipAff(Who,Human,-x);
    END;
BEGIN
    Who:=Subject[WhichHead];
    Victim:=TheObject[WhichHead];
    EventsForm.Caption := 'Minor Country Crisis';
    BackDown:=FALSE;

    BackDownButton.Enabled := false;

    x:=(Abs(DontMess[Victim]-AveDMess)*Influence(Human,Who)) div 8;
    CASE CrisisLevel OF
        9: y:=1;
        8: y:=1;
        7: y:=2;
        6: y:=2;
        5: y:=4;
        4: y:=4;
        3: y:=8;
        2: y:=8;
        1: y:=16;
    END;
    IF (x*y)<4*CrisisLevel-36+Abs(MyRandom div (y*256)) THEN
        BEGIN
            MinorTough;
            x:=976-2*CrisisLevel;
            Headline(x,0,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
            BackDownButton.Visible := true;
            BackDownButton.Enabled := true;
        END
    ELSE
        BEGIN
            BackDown:=TRUE;
            HeadLine(980,0,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
            CrisisVal[WhichHead]:=TRUE;
            DoPolicy(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],TRUE);
            QuestionButton.Caption := 'OK';
            QuestionButton.Enabled := true;
            BackDownButton.Enabled := false;
        END;
    IF NOT BackDown AND (CrisisLevel>1) THEN
        BEGIN    {human consideration}
            CASE Level OF
                1: y:=2048;
                2: y:=1024;
                3: y:=512;
                4: y:=512;
            END;
        TempStrng := GetIndString(589,CrisisLevel);
        QuestionButton.Caption := TempStrng;
        QuestionButton.Enabled := true;
        MinorTough;
    END;
END;

PROCEDURE CmptrCrisis(WhichHead: Integer);
VAR
    CrisisLevel:      Integer;
    Base:             Integer;
    i:                Integer;
    SavHuman:         Integer;
    x:                Integer;
    y:                Integer;
    z:                Integer;
    Who:              Integer;
    Victim:           Integer;
    StrgHndl:         StringHandle;
    BackDown:         Boolean;
    TempStrng:        Str255;
    SaveStrng:        Str255;

    PROCEDURE Tough;
    VAR
        x,y:    Integer;
    BEGIN
        CrisisLevel:=CrisisLevel-1;
        x:=0;
        CASE CrisisLevel OF
            2: x:=32;
            3: x:=16;
            4: x:=8;
            5: x:=4;
            6: x:=2;
            7: x:=1;
            8: x:=0;
        END;
        ChgDipAff(Who,Cmptr,-x);
    END;
BEGIN
    Who:=Subject[WhichHead];
    Victim:=TheObject[WhichHead];
    BackDown:=FALSE;
    CrisisLevel:=9;
    IF Cmptr=1 THEN x:=1 ELSE x:=-1;
    ChgDMess(Victim,x);
    REPEAT
        x:=(Abs(DontMess[Victim]-AveDMess)*Influence(Cmptr,Who)) div 8;
        CASE CrisisLevel OF
            9: y:=1;
            8: y:=1;
            7: y:=2;
            6: y:=2;
            5: y:=4;
            4: y:=4;
            3: y:=8;
            2: y:=8;
            1: y:=16;
        END;
        IF (x*y)<4*CrisisLevel-36+Abs(MyRandom div (y*256)) THEN Tough
        ELSE
            BEGIN
                BackDown:=TRUE;
                CrisisVal[WhichHead]:=TRUE;
                DoPolicy(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],TRUE);
            END;
        IF NOT BackDown and (CrisisLevel>1) THEN
            BEGIN    {computer consideration}
                x:=GImpt(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead],0,y,z);
                IF Cmptr=1 THEN z:=y;
                IF z>4*CrisisLevel-36+Abs(MyRandom div 1024) THEN Tough
                ELSE
                    BEGIN
                        BackDown:=TRUE;
                        CrisisVal[WhichHead]:=TRUE;
                    END;
            END;
    UNTIL BackDown OR (CrisisLevel=1);
END;

PROCEDURE InitCrisis(WhichHead: Integer; FormLabel: TLabel; PrevButton, NextButton, QuestionButton: TButton; PaintBox1: TPaintBox);
VAR
    x:                Integer;
    Victim:           Integer;
    Who:              Integer;
BEGIN
    CullFlag:=FALSE;
    Who:=Subject[WhichHead];
    Victim:=TheObject[WhichHead];
    IF TwoPFlag THEN
        BEGIN
            IF Human=2 THEN x:=790 ELSE x:=890;
            Headline(x,1,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
        END;
    AggrFlag:=(Who=Cmptr);
    FirstCrisisIteration:=true;
    Rand1:=MyRandom;
    Rand2:=MyRandom;
    CrisisLevel:=9;
    IF AggrFlag THEN
        BEGIN
            PrevButton.Visible := true;
            NextButton.Visible := true;
            PrevButton.Enabled := false;
            NextButton.Enabled := false;
            IF Human=1 THEN x:=1 ELSE x:=-1;
            ChgDMess(Victim,x);
        END
    else
        begin
            PrevButton.Visible := false;
            NextButton.Visible := false;
        end;
    ScreenPaintBox := PaintBox1;
end;

FUNCTION Crisis(EventsForm: TForm; WhichHead: Integer; FormLabel: TLabel; QuestionButton, BackDownButton, PrevButton, NextButton: TButton; PrestigeLabel,
    USAInterestLabel, USSRInterestLabel: TLabel; whichControl: Integer): Boolean;
{Returns a value of TRUE if the missiles fly}
CONST
    RespHndl   = 1;
    BackHndl   = 2;
VAR
    SumLoser:         LongInt;
    SumWinnr:         LongInt;
    Base:             Integer;
    i:                Integer;
    HLoss:            Integer;
    CGain:            Integer;
    x:                Integer;
    y:                Integer;
    z:                Integer;
    H:                Integer;
    DAow:             Integer;
    DAol:             Integer;
    Usex:             Integer;
    Usez:             Integer;
    Victim:           Integer;
    Who:              Integer;
    StrgHndl:         StringHandle;
    BackDown:         Boolean;
    TempStrng:        Str255;

    PROCEDURE HangLoose(Loser,Winner,CrisisLevel: Integer);
    VAR
        j,t,x,y,z:    Integer;
    BEGIN
        IF CrisisLevel<8 THEN
            BEGIN {no penalty for early withdrawal}
                Pugnacty[Winner]:=Pugnacty[Winner]+((130-Pugnacty[Winner]) div 4);
                x:=Treaty[Loser,Victim];
                t:=Impt(Loser,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead]);
                Integrty[Loser]:=Integrty[Loser]-2*((Should(x)*t) div 256);
                IF Integrty[Loser]<1 THEN Integrty[Loser]:=1;
                IF Integrty[Loser]>127 THEN Integrty[Loser]:=127;
                y:=GImpt(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead],0,t,z);
                x:=(Abs(t) div CrisisLevel)+(Abs(z) div CrisisLevel)+8-CrisisLevel;
                y:=0;
                FOR j:=3 TO NoCntry DO
                    BEGIN
                        z:=x div 32;
                        y:=y+(x mod 32);
                        IF y>32 THEN BEGIN z:=z+1; y:=y-32; END;
                        ChgDipAff(j,Loser,-z);
                        ChgDipAff(j,Winner,z);
                    END;
            END; {penalty section}
        IF odd(CrisisLevel) THEN
            BEGIN
                x:=NewNVal[WhichHead];
                NewNVal[WhichHead]:=OldNVal[WhichHead];
                OldNVal[WhichHead]:=x;
                CrisisVal[WhichHead]:=TRUE;
                DoPolicy(Who,Verb[WhichHead],Victim,NewNVal[WhichHead],TRUE);
            END;
        x:=9-CrisisLevel;
        t:=Victim;
        IF x>DontMess[t] THEN x:=DontMess[t];
        IF Loser=1 THEN x:=-x;
        ChgDMess(t,x);
        CalcScores;
        WritScor(ScreenPaintBox);
    END;

    PROCEDURE HangTough(Actor: Integer; VAR CrisisLevel: Integer);
    VAR
        x,y:          Integer;
    BEGIN
        CrisisLevel:=CrisisLevel-1;
        IF CrisisLevel=7 THEN EventsForm.Caption := 'Diplomatic Crisis';
        IF CrisisLevel=5 THEN EventsForm.Caption := 'Military Crisis';
        x:=Treaty[Actor,Victim];
        y:=Impt(Actor,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead]);
        Integrty[Actor]:=Integrty[Actor]+((Should(x)*y) div 256);
        IF Integrty[Actor]<1 THEN Integrty[Actor]:=1;
        IF Integrty[Actor]>127 THEN Integrty[Actor]:=127;
        ChgDipAff(Cmptr,Human,CrisisLevel-9);
        x:=0;
        CASE CrisisLevel OF
            2: x:=16;
            3: x:=8;
            4: x:=2;
        END;
        IF DipAff[1,2]>0 THEN x:=0 ELSE x:=(x*(-DipAff[1,2])) div 64;
        y:=MyRandom div 128;
        IF x>(Abs(y)) THEN BEGIN CrisisLevel:=1; ANWFlag:=TRUE; END;
        Nastiness:=Nastiness+9-CrisisLevel;
        IF Nastiness>127 THEN Nastiness:=127;
     END;

BEGIN
    Who:=Subject[WhichHead];
    Victim:=TheObject[WhichHead];
    IF Human=1 THEN Base:=700 ELSE Base:=800;

    Crisis:=FALSE;
    BackDown:=FALSE;

    IF (FirstCrisisIteration) THEN
        BEGIN
            EventsForm.Caption := 'BackChannel';
            BackDownButton.Visible := true;
        END
    ELSE
        BEGIN    {human input}
            IF whichControl=BackHndl THEN
                BEGIN
                    BackDown:=TRUE;
                    CrisisVal[WhichHead]:=TRUE;
                    HangLoose(Human,Cmptr,CrisisLevel);
                    IF TwoPFlag THEN
                        BEGIN
                            IF Human=2 THEN Base:=700 ELSE Base:=800;
                            IF odd(CrisisLevel) THEN
                                BEGIN
                                    {SetPort(MainWind);} ExchangP(ScreenPaintBox); {SetPort(myWind);}
                                END;
                            HeadLine(Base+50+4*CrisisLevel,0,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
                            QuestionButton.Caption := 'OK';
                            QuestionButton.Enabled := true;
                            BackDownButton.Enabled := false;
                            exit;
                        END;
                END;
            IF whichControl=RespHndl THEN
                BEGIN
                    HangTough(Human,CrisisLevel);
                    IF TwoPFlag THEN
                        BEGIN
                            IF Human=2 THEN Base:=700 ELSE Base:=800;
                            x:=Abs(MyRandom div 8192);
                            Headline(Base+4*CrisisLevel,x,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
                            TempStrng := GetIndString(590,CrisisLevel);
                            QuestionButton.Caption := TempStrng;
                        END;
                END;
      end;

    IF AggrFlag AND (NOT TwoPFlag) AND (CrisisLevel>1) THEN
        BEGIN    {Cmptr considerations}
            {HiliteControl(BackHndl,255);}
            x:=GImpt(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead],0,HLoss,CGain);
            IF Who=Human THEN x:=-x;
            IF x<4*CrisisLevel-36+Abs(MyRandom div 1024) THEN
                BEGIN
                    HangTough(Cmptr,CrisisLevel);
                    IF (CrisisLevel=3) AND (x<-40) THEN z:=952 ELSE z:=Base+4*CrisisLevel;
                    y:=((CrisisLevel-1) div 4)-(x div 32);
                    IF y>4 THEN y:=4;
                    IF y<0 THEN y:=0;
                    Headline(z,y,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
                    BackDownButton.Visible := true;
                END
            ELSE
                BEGIN
                    BackDown:=TRUE;
                    HeadLine(Base+50+4*CrisisLevel,0,150,Who,Victim,OldNVal[WhichHead],CrisisVal[WhichHead],FormLabel,QuestionButton);
                    CrisisVal[WhichHead]:=TRUE;
                    HangLoose(Cmptr,Human,CrisisLevel);
                    QuestionButton.Caption := 'OK';
                    QuestionButton.Enabled := true;
                    BackDownButton.Enabled := false;
                    whichControl:=0;
              END;
        END;    {Cmptr half}
    IF (BackDown=FALSE) AND (CrisisLevel>1) THEN
        BEGIN    {human consideration}
            SumLoser:=0; SumWinnr:=0;
            IF CrisisLevel<8 THEN
                BEGIN
                    HLoss:=GImpt(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead],0,y,z);
                    x:=(Abs(y) div CrisisLevel)+(Abs(z) div CrisisLevel)+8-CrisisLevel;
                    y:=0;
                    FOR i:=3 TO NoCntry DO
                        BEGIN
                            Usez:=x div 32;
                            y:=y+(x mod 32);
                            IF y>32 THEN BEGIN Usez:=Usez+1; y:=y-32; END;
                            Usex:=-Usez;
                            DAow:=DipAff[i,Cmptr];
                            DAol:=DipAff[i,Human];
                            IF DAol+Usex>127 THEN Usex:=127-DAol;
                            IF DAol+Usex<-127 THEN Usex:=-127-DAol;
                            IF DAow+Usez>127 THEN Usez:=127-DAow;
                            IF DAow+Usez<-127 THEN Usez:=-127-DAow;
                            SumWinnr:=SumWinnr+(Usez*PrestVal[i]);
                            SumLoser:=SumLoser+(Usex*PrestVal[i]);
                        END;
                    IF SumLoser>8132352 THEN SumLoser:=8132352;
                    IF SumLoser<-8132352 THEN SumLoser:=-8132352;
                END; {penalty section}
            HLoss:=-(SumLoser div 1024);
            CGain:=-(SumWinnr div 1024);
            PrestigeLabel.Caption := 'Prestige at Risk:    ' + IntToStr(HLoss);
            CASE Level OF
                1: y:=2048;
                2: y:=1024;
                3: y:=512;
                4: y:=512;
            END;
            x:=GImpt(Who,Verb[WhichHead],Victim,OldNVal[WhichHead],NewNVal[WhichHead],0,HLoss,CGain);
            x:=((HLoss+(Rand1 div y)) div 16);
            x:=Abs(x);
            IF x>7 THEN x:=7;
            TempStrng := GetIndString(641,x+1);
            USAInterestLabel.Caption := 'USA Interest:     ' + TempStrng;
            x:=((CGain+(Rand2 div y)) div 16);
            x:=Abs(x);
            IF x>7 THEN x:=7;
            TempStrng := GetIndString(641,x+1);
            USSRInterestLabel.Caption := 'USSR Interest:     ' + TempStrng;
            TempStrng := GetIndString(590,CrisisLevel);
            QuestionButton.Caption := TempStrng;
            QuestionButton.Enabled := true;
            IF TwoPFlag THEN BEGIN {SetPort(MainWind);} ExchangP(ScreenPaintBox); {SetPort(myWind);} END;
            {HiliteControl(RespHndl,0);
            REPEAT UNTIL ReadMouse(FALSE)>0;
            ClearRect(2,248,250,295);}
        END;
    AggrFlag:=TRUE;
    FirstCrisisIteration:=false;
END;

end.

