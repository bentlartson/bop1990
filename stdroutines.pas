unit StdRoutines;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Globals, NewResrc, Closeup;

PROCEDURE ReviseMap(NewNdxFlag: Boolean; PaintBox1: TPaintBox);
PROCEDURE DoCloseUp;
PROCEDURE LoadGame;
PROCEDURE SaveGame;

implementation

PROCEDURE ReviseMap(NewNdxFlag: Boolean; PaintBox1: TPaintBox);
{main routine for revising the map under new circumstances}
CONST
    ClrMap     = 0;
    Spheres    = 1;
    MEvents    = 2;
    MPower     = 3;
    Turmoil    = 4;
    Support    = 5;
    USAFinl    = 6;
    USSRFinl   = 7;
    Wars       = 8;
    WhoDipRel  = 9;
    WhoMilAid  = 10;
    WhoInsg    = 11;
    WhoIntG    = 12;
    WhoIntR    = 13;
    WhoEcon    = 14;
    WhoDest    = 15;
    WhoTret    = 16;
    WhoPres    = 17;
    WhoTrade   = 18;
    WhoAtWar   = 19;
VAR
    i,j,k,x,y,Scale1,Scale2,Scale3:           Integer;
    TempStrng,SmlStrng:                       Str255;
    SortArr:                                  IntArr;
    StrHandle:                                StringHandle;
BEGIN
    PaintBox1.Canvas.Pen.Width := 1;

    Scale1:=1;
    Scale2:=3;
    Scale3:=4;
    FOR i:=1 TO NoCntry DO SortArr[i]:=0;
    CASE OldVHigh OF
        Spheres:
            BEGIN
                FOR i:=1 TO NoCntry DO
                    SortArr[i]:=-(DontMess[i]*NoCntry*5) div SumDMess;
                Scale1:=-6;
                Scale2:=-5;
                Scale3:=-2;
            END;
        MEvents:
            BEGIN
                FOR i:=1 TO NoCntry DO
                    BEGIN
                        SortArr[i]:=1;
                        IF FinlFlag[i] THEN SortArr[i]:=3;
                        IF CoupFlag[i] THEN SortArr[i]:=5;
                        IF RebWinFlag[i] THEN SortArr[i]:=7;
                    END;
                Scale1:=2;
                Scale2:=4;
                Scale3:=6;
            END;
        MPower:
            BEGIN
                FOR i:=1 TO NoCntry DO SortArr[i]:=PrestVal[i];
                Scale1:=60;
                Scale2:=300;
                Scale3:=1500;
            END;
        Turmoil:
            BEGIN
                FOR i:=1 TO NoCntry DO SortArr[i]:=-(StrngRat[i]);
                Scale1:=-511;
                Scale2:=-31;
                Scale3:=-1;
            END;
        Support:
            BEGIN
                FOR i:=1 TO NoCntry DO SortArr[i]:=-GPopular[i];
                Scale1:=-11;
                Scale2:=-7;
                Scale3:=-3;
            END;
        USAFinl:
            BEGIN
                FOR i:=1 TO NoCntry DO SortArr[i]:=FinlProb[1,i];
                Scale1:=56;
                Scale2:=80;
                Scale3:=104;
            END;
        USSRFinl:
            BEGIN
                FOR i:=1 TO NoCntry DO SortArr[i]:=FinlProb[2,i];
                Scale1:=56;
                Scale2:=80;
                Scale3:=104;
            END;
        Wars:
            BEGIN
                FOR i:=3 TO NoCntry DO
                    BEGIN
                        FOR j:=3 TO NoCntry DO IF DipAff[i,j]=-127 THEN SortArr[i]:=5;
                    END;
            END;
        WhoDipRel:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO SortArr[i]:=-DipAff[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO NoCntry DO SortArr[i]:=-DipAff[i,HitCntry];
                    END;
                Scale1:=-42;
                Scale2:=0;
                Scale3:=42;
            END;
        WhoMilAid:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=MiltAid[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=MiltAid[i,HitCntry];
                    END;
            END;
        WhoInsg:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=InsgAid[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=InsgAid[i,HitCntry];
                    END;
            END;
        WhoIntG:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=IntvGovt[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=IntvGovt[i,HitCntry];
                    END;
            END;
        WhoIntR:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=IntvRebl[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=IntvRebl[i,HitCntry];
                    END;
            END;
        WhoEcon:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=EconAid[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO 2 DO
                            SortArr[i]:=EconAid[i,HitCntry];
                    END;
            END;
        WhoDest:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=Destab[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO 2 DO
                            SortArr[i]:=Destab[i,HitCntry];
                    END;
            END;
        WhoTret:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=Treaty[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO 2 DO
                            SortArr[i]:=Treaty[i,HitCntry];
                    END;
            END;
        WhoPres:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=Pressure[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO 2 DO
                            SortArr[i]:=Pressure[i,HitCntry];
                    END;
            END;
        WhoTrade:
            BEGIN
                IF GoingOut THEN
                    BEGIN
                        FOR i:=1 TO NoCntry DO
                            SortArr[i]:=-Trade[HitCntry,i];
                    END
                ELSE
                    BEGIN
                        FOR i:=1 TO 2 DO SortArr[i]:=-Trade[i,HitCntry];
                        FOR i:=3 TO NoCntry DO SortArr[i]:=-5;
                    END;
                Scale1:=-3;
                Scale2:=-2;
                Scale3:=-1;
            END;
        WhoAtWar:
            BEGIN
                IF HitCntry>2 THEN FOR i:=3 TO NoCntry DO
                    IF (DipAff[HitCntry,i]=-127) or (DipAff[i,HitCntry]=-127) THEN SortArr[i]:=5;
            END;
    END;     {of huge CASE statement}
    FOR i:=1 TO NoCntry DO
        BEGIN
            x:=HighValueColor;
            IF SortArr[i]<Scale3 THEN x:=MediumValueColor;
            IF SortArr[i]<Scale2 THEN x:=LowValueColor;
            IF SortArr[i]<Scale1 THEN x:=CountryBackgroundColor;
            IF i=HitCntry THEN x:=CountrySelectionColor;
            FillCntry(i,x);
        END;
    WritScor(PaintBox1);
    IF NewNdxFlag THEN
        BEGIN
            WriteYear(PaintBox1);
            {Clear any old rectangles, legend text, and bottom text}
            PaintBox1.Canvas.Brush.Color := BackgroundColor;
            PaintBox1.Canvas.Pen.Color := BackgroundColor;
            PaintBox1.Canvas.Rectangle(round(326 * DisplayScale), round(220 * DisplayScale), round(434 * DisplayScale), round(298 * DisplayScale));
            PaintBox1.Canvas.Rectangle(round(200 * DisplayScale), round(300 * DisplayScale), round(512 * DisplayScale), round(320 * DisplayScale));

            IF OldVHigh>0 THEN
                BEGIN
                    x:=OldVHigh+505;
                    IF (OldVHigh>=WhoDipRel) and NOT GoingOut THEN x:=x+16;
                    StrHandle:=GetString(x);
                    j:=1;
                    k:=1;
                    REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
                    TempStrng:=Copy(StrHandle,j,k-j);
                    SmlStrng:=' ';
                    IF (OldVHigh>=WhoDipRel) and (OldVHigh<=WhoAtWar) THEN SmlStrng:=Concat(' ',CntryNam[HitCntry]);
                    TempStrng:=Concat(TempStrng,SmlStrng);

                    {Draw the bottom text}
                    PaintBox1.Canvas.Pen.Color := OutlineColor;
                    PaintBox1.Canvas.Font.Color := OutlineColor;
                    PaintBox1.Canvas.Font.Size := 10;
                    PaintBox1.Canvas.Rectangle(round(200 * DisplayScale), round(300 * DisplayScale), round(512 * DisplayScale), round(320 * DisplayScale));
                    PaintBox1.Canvas.TextOut(round(205 * DisplayScale), round(310 * DisplayScale) - 10, TempStrng);

                    FOR i:=1 TO 4 DO     {draw and label map key}
                        BEGIN
                            CASE i OF
                                1: PaintBox1.Canvas.Brush.Color := CountryBackgroundColor;
                                2: PaintBox1.Canvas.Brush.Color := LowValueColor;
                                3: PaintBox1.Canvas.Brush.Color := MediumValueColor;
                                4: PaintBox1.Canvas.Brush.Color := HighValueColor;
                            END;

                            {Draw the rectangles}
                            PaintBox1.Canvas.Pen.Color := OutlineColor;
                            PaintBox1.Canvas.Rectangle(round(326 * DisplayScale), round((200+20*i) * DisplayScale), round(338 * DisplayScale), round((215+20*i) * DisplayScale));

                            k:=k+1;
                            j:=k;
                            REPEAT k:=k+1; UNTIL StrHandle[k] = '*';
                            TempStrng:=Copy(StrHandle,j,k-j);
                            IF NOT ((OldVHigh=MEvents) and (i>1) and ((5-Level)>i)) THEN
                                begin
                                    {Draw the rectangle legend text}
                                    PaintBox1.Canvas.Brush.Color := BackgroundColor;
                                    PaintBox1.Canvas.Font.Color := OutlineColor;
                                    PaintBox1.Canvas.TextOut(round(342 * DisplayScale), round((208+20*i) * DisplayScale) - 10, TempStrng);
                                end;
                        END;
                END;
        END;
end;

PROCEDURE DoCloseUp;
VAR
    i,j,k,x,y,yy:     Integer;
    SumIntvG:         Integer;
    SumIntvR:         Integer;
    SumMiltG:         Integer;
    SumMiltR:         Integer;
    MaxIntv:          Integer;
    MaxMAid:          Integer;
    Sum:              Integer;
    MaxNum:           Integer;
    DAij:             Integer;
    MaxVal:           Integer;
    Val:              Integer;
    SumEconA:         Integer;
    OldVal:           Integer;
    Count:            Integer;
    Column:           Integer;
    Who:              Integer;
    Max:              Integer;
    VertCord:         Integer;
    TempStrng:        Str255;
    JunkFlag:         Boolean;
    ClickFlg:         Boolean;
    StrHandle:        StringHandle;
    LongX:            LongInt;
    AvlResrc:         Integer;
BEGIN
    CloseupForm.USARelationship.Caption := '';
    CloseupForm.USSRRelationship.Caption := '';
    CloseupForm.USAPrestige.Caption := '';
    CloseupForm.USSRPrestige.Caption := '';
    CloseupForm.USAEconomicAid.Caption := '';
    CloseupForm.USSREconomicAid.Caption := '';
    CloseupForm.USADestabilization.Caption := '';
    CloseupForm.USSRDestabilization.Caption := '';
    CloseupForm.USAPressure.Caption := '';
    CloseupForm.USSRPressure.Caption := '';
    CloseupForm.USATreaty.Caption := '';
    CloseupForm.USSRTreaty.Caption := '';
    CloseupForm.USAFinlandization.Caption := '';
    CloseupForm.USSRFinlandization.Caption := '';
    CloseupForm.USAAnnualChange.Caption := '';
    CloseupForm.USSRAnnualChange.Caption := '';
    CloseupForm.PrestigeMax.Caption := '';

    if (Level < 4) then
        begin
            CloseupForm.TotalsLabel.Caption := '';
            CloseupForm.MilitaryAidTotals.Caption := '';
            CloseupForm.InsurgencyAidTotals.Caption := '';
            CloseupForm.InterveneGovtTotals.Caption := '';
            CloseupForm.InterveneRebTotals.Caption := '';
        end;
    if (Level < 3) then
        begin
             CloseupForm.PressureLabel.Caption := '';
             CloseupForm.TreatyLabel.Caption := '';
             CloseupForm.FinlandizationLabel.Caption := '';
             CloseupForm.AnnualChangeLabel.Caption := '';
             CloseupForm.ValuesLabel.Top := 160;
        end;
    if (Level < 2) then
        begin
             CloseupForm.EconomicAidLabel.Caption := '';
             CloseupForm.DestabilizationLabel.Caption := '';
             CloseupForm.GovtStabilityLabel.Caption := '';
             CloseupForm.GovtStabilityValueLabel.Caption := '';
             CloseupForm.ValuesLabel.Top := 128;
        end;

    TempStrng:=ConCat('Closeup: ',CntryNam[HitCntry]);
    CloseupForm.Caption := TempStrng;
    CASE Level OF
            1: Count:=6;
            2: Count:=8;
            3: Count:=12;
            4: Count:=12;
    END;
    IF (HitCntry=Human) OR (HitCntry=Cmptr)
        THEN
            BEGIN
                CloseupForm.USALabel.Caption := 'Net Sent';
                CloseupForm.USSRLabel.Caption := 'Amount Remaining';
            END
        ELSE
            BEGIN
                CloseupForm.USALabel.Caption := 'USA Value';
                CloseupForm.USSRLabel.Caption := 'USSR Value';
            END;
    FOR Column:=1 TO 2 DO
        BEGIN
            Who:=Column;
            IF HitCntry>2 THEN
                BEGIN
                    MaxVal:=5;
                    MaxNum:=5;
                    MaxPolcy(Who,MaxIntv,MaxMAid);
                    DAij:=DipAff[Who,HitCntry];
                    FOR j:=1 TO Count DO
                        BEGIN
                            CASE j OF
                                    1: BEGIN Val:=(DAij+127) div 28; MaxNum:=8; MaxVal:=128; OldVal:=Val; END;
                                    2: Val:=(DAij*PrestVal[HitCntry]) div 1024;
                                    3: BEGIN
                                        Val:=MiltAid[Who,HitCntry];
                                        MaxVal:=MilMax(DAij);
                                        IF MaxMAid<MaxVal THEN MaxVal:=MaxMAid;
                                        OldVal:=MiltAOld[Who,HitCntry];
                                       END;
                                    4: BEGIN
                                        Val:=InsgAid[Who,HitCntry];
                                        MaxVal:=MaxMAid;
                                        x:=0;
                                        IF StrngRat[HitCntry]<512 THEN x:=1;
                                        IF StrngRat[HitCntry]<128 THEN x:=2;
                                        IF StrngRat[HitCntry]<32     THEN x:=3;
                                        IF StrngRat[HitCntry]<8     THEN x:=4;
                                        IF StrngRat[HitCntry]<2     THEN x:=5;
                                        IF x<MaxVal THEN MaxVal:=x;
                                        x:=InsgAMax(Who,HitCntry);
                                        IF x<MaxVal THEN MaxVal:=x;
                                        OldVal:=InsgAOld[Who,HitCntry];
                                       END;
                                    5: BEGIN
                                        Val:=IntvGovt[Who,HitCntry];
                                        x:=Treaty[Who,HitCntry];
                                        OldVal:=IntvGOld[Who,HitCntry];
                                        MaxVal:=IntvGMax(x,DAij);
                                        IF MaxIntv<MaxVal THEN MaxVal:=MaxIntv;
                                       END;
                                    6: BEGIN
                                        Val:=IntvRebl[Who,HitCntry];
                                        OldVal:=IntvROld[Who,HitCntry];
                                        MaxVal:=MaxIntv;
                                        x:=InsgIMax(Who,HitCntry);
                                        IF x<MaxVal THEN MaxVal:=x;
                                       END;
                                    7: BEGIN
                                        Val:=EconAid[Who,HitCntry];
                                        OldVal:=EconAOld[Who,HitCntry];
                                        MaxVal:=EconAMax(DAij);
                                        Sum:=0;
                                        FOR i:=3 TO NoCntry DO Sum:=Sum+EconConv(EconAid[Who,i]);
                                        x:=5;
                                        y:=(GNP[Who] div 44)-(2*Sum);
                                        FOR i:=4 DOWNTO 0 DO IF EconConv(i+1)>y THEN x:=i;
                                        IF x<MaxVal THEN MaxVal:=x;
                                       END;
                                    8: BEGIN
                                        Val:=Destab[Who,HitCntry];
                                        OldVal:=DestaOld[Who,HitCntry];
                                        MaxVal:=5;
                                       END;
                                    9: BEGIN
                                        Val:=Pressure[Who,HitCntry];
                                        OldVal:=PressOld[Who,HitCntry];
                                        MaxVal:=5;
                                       END;
                                    10: BEGIN
                                        Val:=Treaty[Who,HitCntry];
                                        OldVal:=TreatOld[Who,HitCntry];
                                        MaxVal:=TreatMax(Integrty[Who]+DAij-Pugnacty[Who]);
                                        END;
                                    11: BEGIN
                                        Val:=0;
                                        OldVal:=Val;
                                        y:=FinlProb[Who,HitCntry];
                                        IF y>31 THEN Val:=(y-8) div 24;
                                        MaxNum:=4;
                                        MaxVal:=99;
                                        OldVal:=Val;
                                        END;
                                    12: BEGIN
                                        y:=FinlProb[Who,HitCntry]-OldFinPb[Who,HitCntry];
                                        Val:=(y+18) div 4;
                                        OldVal:=Val;
                                        MaxNum:=9;
                                        MaxVal:=99;
                                       END;
                            end;
                            IF j=2 THEN
                                BEGIN
                                    CASE Column OF
                                        1: CloseupForm.USAPrestige.Caption := IntToStr(Val);
                                        2: CloseupForm.USSRPrestige.Caption := IntToStr(Val);
                                    END;
                                END
                            ELSE
                                BEGIN
                                    IF Val>MaxNum THEN Val:=MaxNum;
                                    IF Val<0 THEN Val:=0;
                                    TempStrng := GetIndString(519+j,Val+2);
                                    IF MaxVal<=Val THEN TempStrng := '{' + TempStrng + '}';
                                    IF (j>2) AND (j<10) THEN
                                        BEGIN
                                            IF Val>OldVal THEN TempStrng := '▲ ' + TempStrng
                                            ELSE IF Val<OldVal THEN TempStrng := '▼ ' + TempStrng
                                            ELSE TempStrng := '  ' + TempStrng;
                                        END;
                                    CASE Column OF
                                        1:
                                            CASE j OF
                                                1: CloseupForm.USARelationship.Caption := TempStrng;
                                                3: CloseupForm.USAMilitaryAid.Caption := TempStrng;
                                                4: CloseupForm.USAInsurgencyAid.Caption := TempStrng;
                                                5: CloseupForm.USAInterveneGovt.Caption := TempStrng;
                                                6: CloseupForm.USAInterveneReb.Caption := TempStrng;
                                                7: CloseupForm.USAEconomicAid.Caption := TempStrng;
                                                8: CloseupForm.USADestabilization.Caption := TempStrng;
                                                9: CloseupForm.USAPressure.Caption := TempStrng;
                                                10: CloseupForm.USATreaty.Caption := TempStrng;
                                                11: CloseupForm.USAFinlandization.Caption := TempStrng;
                                                12: CloseupForm.USAAnnualChange.Caption := TempStrng;
                                            END;
                                        2:
                                            CASE j OF
                                                1: CloseupForm.USSRRelationship.Caption := TempStrng;
                                                3: CloseupForm.USSRMilitaryAid.Caption := TempStrng;
                                                4: CloseupForm.USSRInsurgencyAid.Caption := TempStrng;
                                                5: CloseupForm.USSRInterveneGovt.Caption := TempStrng;
                                                6: CloseupForm.USSRInterveneReb.Caption := TempStrng;
                                                7: CloseupForm.USSREconomicAid.Caption := TempStrng;
                                                8: CloseupForm.USSRDestabilization.Caption := TempStrng;
                                                9: CloseupForm.USSRPressure.Caption := TempStrng;
                                                10: CloseupForm.USSRTreaty.Caption := TempStrng;
                                                11: CloseupForm.USSRFinlandization.Caption := TempStrng;
                                                12: CloseupForm.USSRAnnualChange.Caption := TempStrng;
                                            END;
                                    END;
                                END; {of j=2 test}
                        END; {of j-loop}
                    x:=PrestVal[HitCntry] div 8;
                    CloseupForm.PrestigeMax.Caption := '{' + IntToStr(x) + '}'
                END; {of Who<>HitCntry test}
        END; {of monster Column loop}

    IF (Level=4) and (HitCntry>2) THEN
        BEGIN {compute and write totals}
            FOR j:=1 TO 4 DO
                BEGIN
                    CASE j OF
                        1: BEGIN
                            Sum:=0;
                            FOR k:=1 TO NoCntry DO
                                Sum:=Sum+MAidConv(MiltAid[k,HitCntry]);
                           END;
                        2: BEGIN
                            Sum:=0;
                            FOR k:=1 TO NoCntry DO
                                Sum:=Sum+MAidConv(InsgAid[k,HitCntry]);
                           END;
                        3: BEGIN
                            Sum:=0;
                            FOR k:=1 TO NoCntry DO
                                Sum:=Sum+IntvConv(IntvGovt[k,HitCntry]);
                           END;
                        4: BEGIN
                            Sum:=0;
                            FOR k:=1 TO NoCntry DO
                                Sum:=Sum+IntvConv(IntvRebl[k,HitCntry]);
                           END;
                    END;
                    TempStrng := '';
                    IF (j<3) THEN
                        BEGIN
                            TempStrng := '$';
                            IF Sum<1638 THEN Sum:=Sum*20 ELSE Sum:=32767;
                        END;
                        TempStrng := TempStrng + IntToStr(Sum);
                    IF (j>2) THEN
                        BEGIN
                            IF Sum>0 THEN TempStrng := TempStrng + ',000 troops' ELSE TempStrng := TempStrng + ' troops';
                        END
                    ELSE TempStrng := TempStrng + ' million';
                        CASE j OF
                            1: CloseupForm.MilitaryAidTotals.Caption := TempStrng;
                            2: CloseupForm.InsurgencyAidTotals.Caption := TempStrng;
                            3: CloseupForm.InterveneGovtTotals.Caption := TempStrng;
                            4: CloseupForm.InterveneRebTotals.Caption := TempStrng;
                        END;
                END;
        END;

    IF HitCntry<3 THEN
        BEGIN
            SumIntvG:=0;
            SumIntvR:=0;
            SumMiltG:=0;
            SumMiltR:=0;
            SumEconA:=0;
            FOR i:=3 TO NoCntry DO
                BEGIN
                    SumIntvG:=SumIntvG+IntvConv(IntvGovt[HitCntry,i]);
                    SumIntvR:=SumIntvR+IntvConv(IntvRebl[HitCntry,i]);
                    SumMiltG:=SumMiltG+MAidConv(MiltAid[HitCntry,i]);
                    SumMiltR:=SumMiltR+MAidConv(InsgAid[HitCntry,i]);
                    SumEconA:=SumEconA+EconConv(EconAid[HitCntry,i]);
                END;
            FOR j:=3 TO Count DO
                BEGIN
                    CASE j OF
                        3: BEGIN
                            y:=2*SumMiltG;
                            AvlResrc:=2*((MiltSpnd[HitCntry] div 8)+GovtAid[HitCntry]);
                           END;
                        4: BEGIN
                            y:=2*SumMiltR;
                            AvlResrc:=2*((MiltSpnd[HitCntry] div 8)+GovtAid[HitCntry]);
                           END;
                        5: BEGIN
                            y:=SumIntvG;
                            AvlResrc:=(MilMen[HitCntry] div 4)-TotlIntv[HitCntry];
                           END;
                        6: BEGIN
                            y:=SumIntvR;
                            AvlResrc:=(MilMen[HitCntry] div 4)-TotlIntv[HitCntry];
                           END;
                        7: BEGIN
                            y:=2*SumEconA;
                            AvlResrc:=(GNP[HitCntry] div 44)-y;
                           END;
                    END; {of CASE statement}
                IF j<8 THEN
                    BEGIN
                        TempStrng := '  ' + IntToStr(y);
                        IF ((j=3) OR (j=4)) AND (y<>0) THEN TempStrng := TempStrng + '0 million$';
                        IF ((j=5) OR (j=6)) AND (y<>0) THEN TempStrng := TempStrng + ',000 troops';
                        IF (j=7) AND (y<>0) THEN TempStrng := TempStrng + '00 million$';

                        CASE j OF
                            3: CloseupForm.USAMilitaryAid.Caption := TempStrng;
                            4: CloseupForm.USAInsurgencyAid.Caption := TempStrng;
                            5: CloseupForm.USAInterveneGovt.Caption := TempStrng;
                            6: CloseupForm.USAInterveneReb.Caption := TempStrng;
                            7: CloseupForm.USAEconomicAid.Caption := TempStrng;
                        end;

                        TempStrng := IntToStr(AvlResrc);
                        IF ((j=3) OR (j=4)) AND (AvlResrc<>0) THEN TempStrng := TempStrng + '0 million$';
                        IF ((j=5) OR (j=6)) AND (AvlResrc<>0) THEN TempStrng := TempStrng + ',000 troops';
                        IF (j=7) AND (AvlResrc<>0) THEN TempStrng := TempStrng + '00 million$';

                        CASE j OF
                            3: CloseupForm.USSRMilitaryAid.Caption := TempStrng;
                            4: CloseupForm.USSRInsurgencyAid.Caption := TempStrng;
                            5: CloseupForm.USSRInterveneGovt.Caption := TempStrng;
                            6: CloseupForm.USSRInterveneReb.Caption := TempStrng;
                            7: CloseupForm.USSREconomicAid.Caption := TempStrng;
                        end;
                    END;
                END; {of j-loop -- now enter domestic information}

        END; {of test for superpowers}
    Count:=4;
    IF Level>1 THEN Count:=5;
    FOR j:=1 TO Count DO
        BEGIN
            CASE j OF
                1: BEGIN
                    y:=StrngRat[HitCntry]; x:=0;
                    IF y>1 THEN x:=1;
                    IF y>7 THEN x:=2;
                    IF y>31 THEN x:=3;
                    IF y>127 THEN x:=4;
                    IF y>511 THEN x:=5;
                    IF y>2047 THEN x:=6;
                    Max:=8;
                    Val:=(GovtStrg[HitCntry] div ((InsgStrg[HitCntry] div 5)+1))
                        -(OldGStrg[HitCntry] div ((OldIStrg[HitCntry] div 5)+1))+1;
                    MaxVal:=2;
                   END;
                2: BEGIN x:=(GovtWing[HitCntry]+128) div 16; Max:=15; END;
                3: BEGIN
                    x:=0;
                    y:=MilPowr[HitCntry];
                    IF y>20 THEN x:=1;
                    IF y>40 THEN x:=2;
                    IF y>100 THEN x:=3;
                    IF y>200 THEN x:=4;
                    IF y>500 THEN x:=5;
                    IF y>1000 THEN x:=6;
                    IF y>2000 THEN x:=7;
                    Max:=7;
                   END;
              4: BEGIN x:=(((DontMess[HitCntry]-AveDMess)*8) div AveDMess)+6; Max:=12; END;
              5: BEGIN
                  x:=GPopular[HitCntry] div 2; Max:=7;
                  Val:=3+GPopular[HitCntry]-OldGPopl[HitCntry]; MaxVal:=6;
                 END;
            END;
            IF x>Max THEN x:=Max;
            IF x<0 THEN x:=0;
            TempStrng := GetIndString(629+j,x+2);
            IF (j=5) OR (j=1) THEN
                BEGIN
                    IF Val<1 THEN Val:=1; IF Val>MaxVal THEN Val:=MaxVal;
                    TempStrng := TempStrng + ' -- ';
                    IF j=5 THEN x:=635 ELSE x:=636;
                    TempStrng := TempStrng + GetIndString(x,Val);
                END;
            CASE j OF
                1: CloseupForm.InsurgencyValueLabel.Caption := TempStrng;
                2: CloseupForm.GovtPhilosophyValueLabel.Caption := TempStrng;
                3: CloseupForm.MilitaryPowerValueLabel.Caption := TempStrng;
                4: CloseupForm.SphereOfInfluenceValueLabel.Caption := TempStrng;
                5: CloseupForm.GovtStabilityValueLabel.Caption := TempStrng;
            END;
        END; {of j-loop}
    StrHandle:=GetString(1000+HitCntry);
    j:=1;     i:=1;
    REPEAT i:=i+1; UNTIL StrHandle[i] = '*';
    i:=i+1;    j:=i;
    REPEAT i:=i+1; UNTIL StrHandle[i] = '*';
    TempStrng:=Copy(StrHandle,j,i-j);
    CloseupForm.CapitalValueLabel.Caption := TempStrng;
    i:=i+1;    j:=i;
    REPEAT i:=i+1; UNTIL StrHandle[i] = '*';
    i:=i+1;    j:=i;
    REPEAT i:=i+1; UNTIL StrHandle[i] = '*';
    IF LeftPowr[HitCntry] THEN
        BEGIN
            i:=i+1;    j:=i;
            REPEAT i:=i+1; UNTIL StrHandle[i] = '*';
        END;
    TempStrng:=Copy(StrHandle,j,i-j);
    CloseupForm.InsurgencyGroupValueLabel.Caption := TempStrng;
end;

PROCEDURE LoadGame;
VAR
    Stream:           TMemoryStream;
    i:                Integer;
BEGIN
    Stream := TMemoryStream.Create;
    try
        Stream.LoadFromFile(SaveGameFilename);

        Stream.Read(Level, SizeOf(Level));
        Stream.Read(Human, SizeOf(Human));
        Stream.Read(Cmptr, SizeOf(Cmptr));
        Stream.Read(TwoPFlag, SizeOf(TwoPFlag));

        Stream.Read(CntryNam, SizeOf(CntryNam));
        Stream.Read(Popln, SizeOf(Popln));
        Stream.Read(GNP, SizeOf(GNP));
        Stream.Read(GovtWing, SizeOf(GovtWing));
        Stream.Read(InsgWing, SizeOf(InsgWing));
        Stream.Read(GovtAid, SizeOf(GovtAid));
        Stream.Read(PrestVal, SizeOf(PrestVal));
        Stream.Read(ConsFrac, SizeOf(ConsFrac));
        Stream.Read(MiltFrac, SizeOf(MiltFrac));
        Stream.Read(InvtFrac, SizeOf(InvtFrac));

        Stream.Read(ConsSpnd, SizeOf(ConsSpnd));
        Stream.Read(MiltSpnd, SizeOf(MiltSpnd));
        Stream.Read(InvtSpnd, SizeOf(InvtSpnd));
        Stream.Read(MilPowr, SizeOf(MilPowr));
        Stream.Read(MilMen, SizeOf(MilMen));
        Stream.Read(DrafFrac, SizeOf(DrafFrac));
        Stream.Read(DontMess, SizeOf(DontMess));
        Stream.Read(Maturity, SizeOf(Maturity));
        Stream.Read(StrngRat, SizeOf(StrngRat));
        Stream.Read(CntryCol, SizeOf(CntryCol));

        Stream.Read(CntryRnd, SizeOf(CntryRnd));
        Stream.Read(GovtStrg, SizeOf(GovtStrg));
        Stream.Read(InsgStrg, SizeOf(InsgStrg));
        Stream.Read(InsgPowr, SizeOf(InsgPowr));
        Stream.Read(DebgArr1, SizeOf(DebgArr1));
        Stream.Read(DebgArr2, SizeOf(DebgArr2));
        Stream.Read(DebgArr3, SizeOf(DebgArr3));
        Stream.Read(DebgArr4, SizeOf(DebgArr4));
        Stream.Read(RevlGain, SizeOf(RevlGain));
        Stream.Read(CoupGain, SizeOf(CoupGain));

        Stream.Read(FinlGain, SizeOf(FinlGain));
        Stream.Read(HistDum2, SizeOf(HistDum2));
        Stream.Read(LeftPowr, SizeOf(LeftPowr));
        Stream.Read(FinlFlag, SizeOf(FinlFlag));
        Stream.Read(CoupFlag, SizeOf(CoupFlag));
        Stream.Read(RebWinFlag, SizeOf(RebWinFlag));
        Stream.Read(Pressure, SizeOf(Pressure));
        Stream.Read(Treaty, SizeOf(Treaty));
        Stream.Read(FinlProb, SizeOf(FinlProb));
        Stream.Read(Destab, SizeOf(Destab));

        Stream.Read(EconAid, SizeOf(EconAid));
        Stream.Read(GPopular, SizeOf(GPopular));
        Stream.Read(MiltPress, SizeOf(MiltPress));
        Stream.Read(DipAffDum, SizeOf(DipAffDum));
        Stream.Read(IntvIDum, SizeOf(IntvIDum));
        Stream.Read(IAidDum, SizeOf(IAidDum));
        Stream.Read(IntvGDum, SizeOf(IntvGDum));
        Stream.Read(MAidDum, SizeOf(MAidDum));
        Stream.Read(SqrtStrg, SizeOf(SqrtStrg));
        Stream.Read(HistDum1, SizeOf(HistDum1));

        Stream.Read(Virgin, SizeOf(Virgin));
        Stream.Read(OldFinPb, SizeOf(OldFinPb));
        Stream.Read(EconAOld, SizeOf(EconAOld));
        Stream.Read(DestaOld, SizeOf(DestaOld));
        Stream.Read(TreatOld, SizeOf(TreatOld));
        Stream.Read(PressOld, SizeOf(PressOld));
        Stream.Read(Trade, SizeOf(Trade));
        Stream.Read(OldGStrg, SizeOf(OldGStrg));
        Stream.Read(OldIStrg, SizeOf(OldIStrg));
        Stream.Read(OldGPopl, SizeOf(OldGPopl));

        Stream.Read(QuitFlag, SizeOf(QuitFlag));
        Stream.Read(TwoPActF, SizeOf(TwoPActF));
        Stream.Read(WinFlag, SizeOf(WinFlag));
        Stream.Read(DemoFlag, SizeOf(DemoFlag));
        Stream.Read(ANWFlag, SizeOf(ANWFlag));
        Stream.Read(CullFlag, SizeOf(CullFlag));
        Stream.Read(NoUndoFlag, SizeOf(NoUndoFlag));
        Stream.Read(HitCntry, SizeOf(HitCntry));
        Stream.Read(Year, SizeOf(Year));
        Stream.Read(OldVHigh, SizeOf(OldVHigh));

        Stream.Read(GoingOut, SizeOf(GoingOut));
        Stream.Read(NewsQCtr, SizeOf(NewsQCtr));
        Stream.Read(Pugnacty, SizeOf(Pugnacty));
        Stream.Read(Integrty, SizeOf(Integrty));
        Stream.Read(Adventur, SizeOf(Adventur));
        Stream.Read(TotlIntv, SizeOf(TotlIntv));
        Stream.Read(Nastiness, SizeOf(Nastiness));
        Stream.Read(CntryCount, SizeOf(CntryCount));
        Stream.Read(OldHit, SizeOf(OldHit));
        Stream.Read(SumDMess, SizeOf(SumDMess));

        Stream.Read(AveDMess, SizeOf(AveDMess));
        Stream.Read(IUSAStrng, SizeOf(IUSAStrng));
        Stream.Read(IUSSRStrng, SizeOf(IUSSRStrng));
        Stream.Read(OldAScor, SizeOf(OldAScor));
        Stream.Read(OldRScor, SizeOf(OldRScor));
        Stream.Read(USAStrng, SizeOf(USAStrng));
        Stream.Read(USSRStrng, SizeOf(USSRStrng));
        Stream.Read(LastNews, SizeOf(LastNews));
        Stream.Read(USAScor, SizeOf(USAScor));
        Stream.Read(USSRScor, SizeOf(USSRScor));

        Stream.Read(TimeOfHit, SizeOf(TimeOfHit));
        Stream.Read(Contigus, SizeOf(Contigus));
        Stream.Read(ReplayFlag, SizeOf(ReplayFlag));
        Stream.Read(Host, SizeOf(Host));
        Stream.Read(Subject, SizeOf(Subject));
        Stream.Read(Verb, SizeOf(Verb));
        Stream.Read(TheObject, SizeOf(TheObject));
        Stream.Read(NewNVal, SizeOf(NewNVal));
        Stream.Read(OldNVal, SizeOf(OldNVal));
        Stream.Read(NewsWorth, SizeOf(NewsWorth));

        Stream.Read(CrisisVal, SizeOf(CrisisVal));
        Stream.Read(GlobSubj, SizeOf(GlobSubj));
        Stream.Read(GlobVerb, SizeOf(GlobVerb));
        Stream.Read(GlobObj, SizeOf(GlobObj));
        Stream.Read(GlobOldV, SizeOf(GlobOldV));
        Stream.Read(GlobNewV, SizeOf(GlobNewV));
        Stream.Read(GlobHost, SizeOf(GlobHost));
        Stream.Read(GlobCris, SizeOf(GlobCris));
        Stream.Read(DipAff, SizeOf(DipAff));
        Stream.Read(MiltAid, SizeOf(MiltAid));

        Stream.Read(IntvGovt, SizeOf(IntvGovt));
        Stream.Read(InsgAid, SizeOf(InsgAid));
        Stream.Read(IntvRebl, SizeOf(IntvRebl));
        Stream.Read(MiltAOld, SizeOf(MiltAOld));
        Stream.Read(InsgAOld, SizeOf(InsgAOld));
        Stream.Read(IntvGOld, SizeOf(IntvGOld));
        Stream.Read(IntvROld, SizeOf(IntvROld));
        Stream.Read(MinorSph, SizeOf(MinorSph));
        Stream.Read(AdviseFlag, SizeOf(AdviseFlag));

        FOR i:=1 TO 9 DO
            BEGIN
                Stream.Read(LeftPowrHistory[i], SizeOf(LeftPowrHistory[i]));
                Stream.Read(FinlFlagHistory[i], SizeOf(FinlFlagHistory[i]));
                Stream.Read(CoupFlagHistory[i], SizeOf(CoupFlagHistory[i]));
                Stream.Read(RebWinFlagHistory[i], SizeOf(RebWinFlagHistory[i]));
                Stream.Read(PressureHistory[i], SizeOf(PressureHistory[i]));
                Stream.Read(TreatyHistory[i], SizeOf(TreatyHistory[i]));
                Stream.Read(FinlProbHistory[i], SizeOf(FinlProbHistory[i]));
                Stream.Read(DestabHistory[i], SizeOf(DestabHistory[i]));
                Stream.Read(EconAidHistory[i], SizeOf(EconAidHistory[i]));
                Stream.Read(GPopularHistory[i], SizeOf(GPopularHistory[i]));
                Stream.Read(MiltPressHistory[i], SizeOf(MiltPressHistory[i]));
                Stream.Read(DipAffHistory[i], SizeOf(DipAffHistory[i]));
                Stream.Read(IntvIHistory[i], SizeOf(IntvIHistory[i]));
                Stream.Read(IAidHistory[i], SizeOf(IAidHistory[i]));
                Stream.Read(IntvGHistory[i], SizeOf(IntvGHistory[i]));
                Stream.Read(MAidHistory[i], SizeOf(MAidHistory[i]));
                Stream.Read(SqrtStrgHistory[i], SizeOf(SqrtStrgHistory[i]));
            END;

        Stream.Read(SelectedTheme, SizeOf(SelectedTheme));
        Stream.Read(SelectedMapScale, SizeOf(SelectedMapScale));

    finally
        Stream.Free;
    end;
end;

PROCEDURE SaveGame;
VAR
    Stream:           TMemoryStream;
    i:                Integer;
BEGIN
    Stream := TMemoryStream.Create;
    try
        Stream.Write(Level, SizeOf(Level));
        Stream.Write(Human, SizeOf(Human));
        Stream.Write(Cmptr, SizeOf(Cmptr));
        Stream.Write(TwoPFlag, SizeOf(TwoPFlag));

        Stream.Write(CntryNam, SizeOf(CntryNam));
        Stream.Write(Popln, SizeOf(Popln));
        Stream.Write(GNP, SizeOf(GNP));
        Stream.Write(GovtWing, SizeOf(GovtWing));
        Stream.Write(InsgWing, SizeOf(InsgWing));
        Stream.Write(GovtAid, SizeOf(GovtAid));
        Stream.Write(PrestVal, SizeOf(PrestVal));
        Stream.Write(ConsFrac, SizeOf(ConsFrac));
        Stream.Write(MiltFrac, SizeOf(MiltFrac));
        Stream.Write(InvtFrac, SizeOf(InvtFrac));

        Stream.Write(ConsSpnd, SizeOf(ConsSpnd));
        Stream.Write(MiltSpnd, SizeOf(MiltSpnd));
        Stream.Write(InvtSpnd, SizeOf(InvtSpnd));
        Stream.Write(MilPowr, SizeOf(MilPowr));
        Stream.Write(MilMen, SizeOf(MilMen));
        Stream.Write(DrafFrac, SizeOf(DrafFrac));
        Stream.Write(DontMess, SizeOf(DontMess));
        Stream.Write(Maturity, SizeOf(Maturity));
        Stream.Write(StrngRat, SizeOf(StrngRat));
        Stream.Write(CntryCol, SizeOf(CntryCol));

        Stream.Write(CntryRnd, SizeOf(CntryRnd));
        Stream.Write(GovtStrg, SizeOf(GovtStrg));
        Stream.Write(InsgStrg, SizeOf(InsgStrg));
        Stream.Write(InsgPowr, SizeOf(InsgPowr));
        Stream.Write(DebgArr1, SizeOf(DebgArr1));
        Stream.Write(DebgArr2, SizeOf(DebgArr2));
        Stream.Write(DebgArr3, SizeOf(DebgArr3));
        Stream.Write(DebgArr4, SizeOf(DebgArr4));
        Stream.Write(RevlGain, SizeOf(RevlGain));
        Stream.Write(CoupGain, SizeOf(CoupGain));

        Stream.Write(FinlGain, SizeOf(FinlGain));
        Stream.Write(HistDum2, SizeOf(HistDum2));
        Stream.Write(LeftPowr, SizeOf(LeftPowr));
        Stream.Write(FinlFlag, SizeOf(FinlFlag));
        Stream.Write(CoupFlag, SizeOf(CoupFlag));
        Stream.Write(RebWinFlag, SizeOf(RebWinFlag));
        Stream.Write(Pressure, SizeOf(Pressure));
        Stream.Write(Treaty, SizeOf(Treaty));
        Stream.Write(FinlProb, SizeOf(FinlProb));
        Stream.Write(Destab, SizeOf(Destab));

        Stream.Write(EconAid, SizeOf(EconAid));
        Stream.Write(GPopular, SizeOf(GPopular));
        Stream.Write(MiltPress, SizeOf(MiltPress));
        Stream.Write(DipAffDum, SizeOf(DipAffDum));
        Stream.Write(IntvIDum, SizeOf(IntvIDum));
        Stream.Write(IAidDum, SizeOf(IAidDum));
        Stream.Write(IntvGDum, SizeOf(IntvGDum));
        Stream.Write(MAidDum, SizeOf(MAidDum));
        Stream.Write(SqrtStrg, SizeOf(SqrtStrg));
        Stream.Write(HistDum1, SizeOf(HistDum1));

        Stream.Write(Virgin, SizeOf(Virgin));
        Stream.Write(OldFinPb, SizeOf(OldFinPb));
        Stream.Write(EconAOld, SizeOf(EconAOld));
        Stream.Write(DestaOld, SizeOf(DestaOld));
        Stream.Write(TreatOld, SizeOf(TreatOld));
        Stream.Write(PressOld, SizeOf(PressOld));
        Stream.Write(Trade, SizeOf(Trade));
        Stream.Write(OldGStrg, SizeOf(OldGStrg));
        Stream.Write(OldIStrg, SizeOf(OldIStrg));
        Stream.Write(OldGPopl, SizeOf(OldGPopl));

        Stream.Write(QuitFlag, SizeOf(QuitFlag));
        Stream.Write(TwoPActF, SizeOf(TwoPActF));
        Stream.Write(WinFlag, SizeOf(WinFlag));
        Stream.Write(DemoFlag, SizeOf(DemoFlag));
        Stream.Write(ANWFlag, SizeOf(ANWFlag));
        Stream.Write(CullFlag, SizeOf(CullFlag));
        Stream.Write(NoUndoFlag, SizeOf(NoUndoFlag));
        Stream.Write(HitCntry, SizeOf(HitCntry));
        Stream.Write(Year, SizeOf(Year));
        Stream.Write(OldVHigh, SizeOf(OldVHigh));

        Stream.Write(GoingOut, SizeOf(GoingOut));
        Stream.Write(NewsQCtr, SizeOf(NewsQCtr));
        Stream.Write(Pugnacty, SizeOf(Pugnacty));
        Stream.Write(Integrty, SizeOf(Integrty));
        Stream.Write(Adventur, SizeOf(Adventur));
        Stream.Write(TotlIntv, SizeOf(TotlIntv));
        Stream.Write(Nastiness, SizeOf(Nastiness));
        Stream.Write(CntryCount, SizeOf(CntryCount));
        Stream.Write(OldHit, SizeOf(OldHit));
        Stream.Write(SumDMess, SizeOf(SumDMess));

        Stream.Write(AveDMess, SizeOf(AveDMess));
        Stream.Write(IUSAStrng, SizeOf(IUSAStrng));
        Stream.Write(IUSSRStrng, SizeOf(IUSSRStrng));
        Stream.Write(OldAScor, SizeOf(OldAScor));
        Stream.Write(OldRScor, SizeOf(OldRScor));
        Stream.Write(USAStrng, SizeOf(USAStrng));
        Stream.Write(USSRStrng, SizeOf(USSRStrng));
        Stream.Write(LastNews, SizeOf(LastNews));
        Stream.Write(USAScor, SizeOf(USAScor));
        Stream.Write(USSRScor, SizeOf(USSRScor));

        Stream.Write(TimeOfHit, SizeOf(TimeOfHit));
        Stream.Write(Contigus, SizeOf(Contigus));
        Stream.Write(ReplayFlag, SizeOf(ReplayFlag));
        Stream.Write(Host, SizeOf(Host));
        Stream.Write(Subject, SizeOf(Subject));
        Stream.Write(Verb, SizeOf(Verb));
        Stream.Write(TheObject, SizeOf(TheObject));
        Stream.Write(NewNVal, SizeOf(NewNVal));
        Stream.Write(OldNVal, SizeOf(OldNVal));
        Stream.Write(NewsWorth, SizeOf(NewsWorth));

        Stream.Write(CrisisVal, SizeOf(CrisisVal));
        Stream.Write(GlobSubj, SizeOf(GlobSubj));
        Stream.Write(GlobVerb, SizeOf(GlobVerb));
        Stream.Write(GlobObj, SizeOf(GlobObj));
        Stream.Write(GlobOldV, SizeOf(GlobOldV));
        Stream.Write(GlobNewV, SizeOf(GlobNewV));
        Stream.Write(GlobHost, SizeOf(GlobHost));
        Stream.Write(GlobCris, SizeOf(GlobCris));
        Stream.Write(DipAff, SizeOf(DipAff));
        Stream.Write(MiltAid, SizeOf(MiltAid));

        Stream.Write(IntvGovt, SizeOf(IntvGovt));
        Stream.Write(InsgAid, SizeOf(InsgAid));
        Stream.Write(IntvRebl, SizeOf(IntvRebl));
        Stream.Write(MiltAOld, SizeOf(MiltAOld));
        Stream.Write(InsgAOld, SizeOf(InsgAOld));
        Stream.Write(IntvGOld, SizeOf(IntvGOld));
        Stream.Write(IntvROld, SizeOf(IntvROld));
        Stream.Write(MinorSph, SizeOf(MinorSph));
        Stream.Write(AdviseFlag, SizeOf(AdviseFlag));

        FOR i:=1 TO 9 DO
            BEGIN
                Stream.Write(LeftPowrHistory[i], SizeOf(LeftPowrHistory[i]));
                Stream.Write(FinlFlagHistory[i], SizeOf(FinlFlagHistory[i]));
                Stream.Write(CoupFlagHistory[i], SizeOf(CoupFlagHistory[i]));
                Stream.Write(RebWinFlagHistory[i], SizeOf(RebWinFlagHistory[i]));
                Stream.Write(PressureHistory[i], SizeOf(PressureHistory[i]));
                Stream.Write(TreatyHistory[i], SizeOf(TreatyHistory[i]));
                Stream.Write(FinlProbHistory[i], SizeOf(FinlProbHistory[i]));
                Stream.Write(DestabHistory[i], SizeOf(DestabHistory[i]));
                Stream.Write(EconAidHistory[i], SizeOf(EconAidHistory[i]));
                Stream.Write(GPopularHistory[i], SizeOf(GPopularHistory[i]));
                Stream.Write(MiltPressHistory[i], SizeOf(MiltPressHistory[i]));
                Stream.Write(DipAffHistory[i], SizeOf(DipAffHistory[i]));
                Stream.Write(IntvIHistory[i], SizeOf(IntvIHistory[i]));
                Stream.Write(IAidHistory[i], SizeOf(IAidHistory[i]));
                Stream.Write(IntvGHistory[i], SizeOf(IntvGHistory[i]));
                Stream.Write(MAidHistory[i], SizeOf(MAidHistory[i]));
                Stream.Write(SqrtStrgHistory[i], SizeOf(SqrtStrgHistory[i]));
            END;

        Stream.Write(SelectedTheme, SizeOf(SelectedTheme));
        Stream.Write(SelectedMapScale, SizeOf(SelectedMapScale));

        Stream.SaveToFile(SaveGameFilename);
    finally
        Stream.Free;
    end;
END;

end.

