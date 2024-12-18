unit PlanMove;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  Globals;

PROCEDURE PrePlanMove;
PROCEDURE MinorRej(i,j: Integer);
PROCEDURE DevelopC;
PROCEDURE MainMove(PaintBox1: TPaintBox);

implementation

PROCEDURE PrePlanMove;
VAR
    i,j,k,x:    Integer;
    temp:        LongInt;
BEGIN
    Year:=Year+1;
    FOR i:=1 TO NoCntry DO
        BEGIN
            OldGStrg[i]:=GovtStrg[i];
            OldIStrg[i]:=InsgStrg[i];
            OldGPopl[i]:=GPopular[i];
            FOR j:=1 TO 2 DO
                BEGIN
                    RevlGain[j,i]:=0;
                    CoupGain[j,i]:=0;
                    FinlGain[j,i]:=0;
                    OldFinPb[j,i]:=FinlProb[j,i];
                    EconAOld[j,i]:=EconAid[j,i];
                    DestaOld[j,i]:=Destab[j,i];
                    TreatOld[j,i]:=Treaty[j,i];
                    PressOld[j,i]:=Pressure[j,i];
                END;
            FOR j:=1 TO CntryCount DO
                BEGIN
                    MiltAOld[j,i]:=MiltAid[j,i];
                    InsgAOld[j,i]:=InsgAid[j,i];
                    IntvGOld[j,i]:=IntvGovt[j,i];
                    IntvROld[j,i]:=IntvRebl[j,i];
                END;
            IF GovtStrg[i]=0 THEN GovtStrg[i]:=1;
            IF InsgStrg[i]>GovtStrg[i] THEN InsgStrg[i]:=GovtStrg[i];
            temp:=InsgStrg[i];
            x:=(6400*temp) div GovtStrg[i];
            IF x<1 THEN x:=1;
            IF x>6400 THEN x:=6400;
            temp:=x;
            SqrtStrg[i]:=Round(Sqrt(temp));
            {------------------------check for USA-USSR battles--------------------}
            IF ((IntvGovt[1,i]>0) AND (IntvRebl[2,i]>0)) OR ((IntvGovt[2,i]>0) AND (IntvRebl[1,i]>0)) THEN
                 BEGIN    {USA fights with USSR}
                     DipAff[1,2]:=-127;
                     DipAff[2,1]:=-127;
                     Nastiness:=127;
                     Pugnacty[1]:=127;
                     Pugnacty[2]:=127;
                 END;
            IF Level=4 THEN
                BEGIN {check for minor country battles}
                    FOR j:=3 TO NoCntry DO
                        BEGIN
                            IF IntvGovt[i,j]>0 THEN
                                BEGIN
                                    FOR k:=1 TO NoCntry DO IF IntvRebl[k,j]>0 THEN
                                        BEGIN
                                            ChgDipAff(k,i,-Nastiness div 8);
                                            ChgDipAff(i,k,-Nastiness div 8);
                                        END;
                                END;
                            IF IntvRebl[i,j]>0 THEN
                                BEGIN
                                    FOR k:=1 TO NoCntry DO IF IntvGovt[k,j]>0 THEN
                                        BEGIN
                                            ChgDipAff(k,i,-Nastiness div 8);
                                            ChgDipAff(i,k,-Nastiness div 8);
                                        END;
                                END;
                        END;
                END;
        END;
END;

PROCEDURE MinorRej(i,j: Integer);
VAR
    x,Value,Treatz,MiltAidz,IntvGovtz:        Integer;
BEGIN
    x:=DipAff[j,i]+2*Pugnacty[j];
    Value:=TreatMax(x+Integrty[j]);
    Treatz:=Treaty[j,i];
    IF Value<Treatz THEN
        BEGIN
            InsrtNews(i,Treato,j,Treatz,Value,i,FALSE);
            Treatz:=Value;
        END;
    IntvGovtz:=IntvGovt[j,i];
    Value:=IntvGMax(Treatz,x);
    IF Value<IntvGovtz THEN
        BEGIN
            TotlIntv[j]:=TotlIntv[j]-IntvConv(IntvGovtz)+IntvConv(Value);
            InsrtNews(j,IntGov,i,IntvGovtz,Value,i,FALSE);
            IntvGovt[j,i]:=Value;
        END;
    Value:=EconAMax(x);
    IF EconAid[j,i]>Value THEN
        BEGIN
            InsrtNews(j,Econ,i,EconAid[j,i],Value,i,FALSE);
            EconAid[j,i]:=Value;
        END;
    MiltAidz:=MiltAid[j,i];
    Value:=MilMax(x);
    IF Value<MiltAidz THEN
        BEGIN
            GovtAid[i]:=GovtAid[i]-MAidConv(MiltAidz)+MAidConv(Value);
            GovtAid[j]:=GovtAid[j]+MAidConv(MiltAidz)-MAidConv(Value);
            InsrtNews(j,Miltry,i,MiltAidz,Value,i,FALSE);
            MiltAid[j,i]:=Value;
        END;
    Treaty[j,i]:=Treatz;
END;

PROCEDURE DoFinliz(i: Integer);
VAR
    j,x,y,Who,NotWho:             Integer;
    temp:                         LongInt;
    SelfPowr,ProjPowr:            ARRAY[1..2] OF Integer;
BEGIN
    IF Level>=3 THEN
        BEGIN
            y:=MilPowr[i]-InsgPowr[i];
            FOR j:=1 TO 2 DO
                BEGIN
                    x:=InsgIMax(j,i);
                    ProjPowr[j]:=(IntvConv(x)*MilPowr[j]) div MilMen[j];
                    x:=Treaty[3-j,i];
                    x:=(Should(x)*MilPowr[3-j]) div 128;
                    SelfPowr[j]:=y+(x*Integrty[3-j]) div 128;
                    IF SelfPowr[j]<1 THEN SelfPowr[j]:=1;
                    temp:=(((Adventur[j]-DipAff[j,i])*ProjPowr[j]*(Pressure[j,i]+4)) div SelfPowr[j]);
                    IF temp<0 THEN temp:=0;
                    IF temp>2048 THEN temp:=2048;
                    FinlProb[j,i]:=temp div 8;
                END;
            x:=FinlProb[Cmptr,i];
            y:=FinlProb[Human,i];
            IF (x>127) OR (y>127) THEN {finlandize}
                BEGIN
                    IF x>y
                        THEN BEGIN Who:=Cmptr; NotWho:=Human; END
                        ELSE BEGIN Who:=Human; NotWho:=Cmptr; END;
                    FinlFlag[i]:=TRUE;
                    GovtWing[i]:=GovtWing[i]+(GovtWing[Who]-GovtWing[i]) div 4;
                    IF ((GovtWing[i]*InsgWing[i])>0)
                        THEN BEGIN InsgWing[i]:=-GovtWing[i]; LeftPowr[i]:=(GovtWing[i]<0); END;
                    FinlGain[Who,i]:=(32*PrestVal[i]) div 1024;
                    FinlGain[NotWho,i]:=(-32*PrestVal[i]) div 1024;
                    ChgDipAff(i,Who,32);
                    ChgDipAff(i,NotWho,-32);
                    InsrtNews(i,Destabl,Who,0,0,0,FALSE);
                    FOR j:=1 TO 2 DO
                        BEGIN    {recalculate Finland probabilities}
                            temp:=(((Adventur[j]-DipAff[j,i])*ProjPowr[j]*(Pressure[j,i]+4)) div SelfPowr[j]);
                            IF temp<0 THEN temp:=0; IF temp>2048 THEN temp:=2048;
                            FinlProb[j,i]:=temp div 16;
                        END;
                END;
        END;
END;

PROCEDURE Revolution(i: Integer);
VAR
    d,j,k,x,y:        Integer;
BEGIN
    RebWinFlag[i]:=TRUE;
    Virgin[i]:=FALSE;
    d:=GovtWing[i];
    GovtWing[i]:=InsgWing[i];
    InsgWing[i]:=d;
    IF (IntvRebl[1,i]+IntvRebl[2,i]>0) THEN
        IF IntvRebl[1,i]>IntvRebl[2,i]
            THEN GovtWing[i]:=(GovtWing[1]+GovtWing[i]) div 2
            ELSE GovtWing[i]:=(GovtWing[2]+GovtWing[i]) div 2;
    LeftPowr[i]:=(GovtWing[i]<0);
    GPopular[i]:=10+(128-Abs(GovtWing[i])) div 8;
    GovtStrg[i]:=InsgStrg[i];
    InsgStrg[i]:=1;
    InsgPowr[i]:=1;
    StrngRat[i]:=GovtStrg[i] div InsgStrg[i];
    IF CntryRnd[i]>0 THEN InsrtNews(i,Econ,i,4,0,i,FALSE) ELSE InsrtNews(i,Econ,i,0,4,i,FALSE);
    GovtAid[i]:=0;
    FOR k:=1 TO CntryCount DO IF k<>i THEN
        BEGIN
            IF k<3 THEN
                BEGIN
                    x:=(128-Should(Treaty[k,i]));
                    Integrty[k]:=(Integrty[k]*x) div 128;
                    x:=InsgWing[i]-GovtWing[k];
                    y:=GovtWing[i]-GovtWing[k];
                    x:=(Abs(x)-Abs(y)) div 2;
                    x:=x+8*(InsgAid[k,i]+2*IntvRebl[k,i]-MiltAid[k,i]-2*IntvGovt[k,i]);
                    x:=x-8*(InsgAid[3-k,i]+2*IntvRebl[3-k,i]-MiltAid[3-k,i]-2*IntvGovt[3-k,i]);
                    IF x>127 THEN x:=127;
                    IF x<-127 THEN x:=-127;
                    RevlGain[k,i]:=((x-DipAff[k,i])*PrestVal[i]) div 1024;
                    Treaty[k,i]:=0;
                    EconAid[k,i]:=0;
                END
            ELSE x:=8*(InsgAid[k,i]+2*IntvRebl[k,i]-MiltAid[k,i]-2*IntvGovt[k,i]);
            IF x>127 THEN x:=127;
            IF x<-127 THEN x:=-127;
            DipAff[k,i]:=x;
            DipAff[i,k]:=x;
            x:=MiltAid[k,i];
            MiltAid[k,i]:=InsgAid[k,i];
            InsgAid[k,i]:=x;
            x:=IntvGovt[k,i];
            IntvGovt[k,i]:=IntvRebl[k,i];
            IntvRebl[k,i]:=x;
            IF k<3 THEN
                BEGIN
                    FOR j:=0 TO 4 DO
                         IF IntvGMax(j,DipAff[k,i])<IntvGovt[k,i] THEN Treaty[k,i]:=j+1;
                END;
        END;
END;    {of revolutionary adjustments}

PROCEDURE DevelopC;
VAR
    i,j,k,d,x,y,Who,NotWho,PseudGNP:          Integer;
    temp,OldConsS,delta:                      LongInt;
    Sum,Pot,ConsPress,InvtPress:              Integer;
    CullFlag:        Boolean;

    FUNCTION Arf1(Who,SuperPower: Integer): Integer;
    VAR
      Temp1:    Integer;
    BEGIN
      Temp1:=IntvConv(IntvGovt[SuperPower,Who]);
      Arf1:=((Temp1*MilPowr[SuperPower]) div MilMen[SuperPower]);
    END;

    FUNCTION Arf2(Who,SuperPower: Integer): Integer;
    VAR
      Temp1:    Integer;
    BEGIN
      Temp1:=IntvConv(IntvRebl[SuperPower,Who]);
      Arf2:=((Temp1*MilPowr[SuperPower]) div MilMen[SuperPower]);
    END;
BEGIN
    FOR i:=1 TO NoCntry DO
        BEGIN
            FinlFlag[i]:=FALSE;
            CoupFlag[i]:=FALSE;
            RebWinFlag[i]:=FALSE;
            x:=MilMen[i];
            temp:=(MiltSpnd[i]+GovtAid[i]) div 2;
            IF temp<1 THEN temp:=1;
            y:=Arf1(i,1)+Arf1(i,2);
            MilPowr[i]:=((4*temp*x) div (temp+x))+y;

            IF (i>2) and (Level=4) THEN
                BEGIN
                    FOR j:=3 TO NoCntry DO IF DipAff[i,j]=-127 THEN
                        BEGIN {minor country war fighting}
                            MilPowr[i]:=MilPowr[i]-(MilPowr[j] div 4);
                            GNP[i]:=GNP[i]-(MilPowr[j] div 4);
                            IF GNP[i]<1 THEN GNP[i]:=1;
                            IF MilPowr[i]<1 THEN
                                BEGIN {surrender}
                                    FOR k:=1 TO NoCntry DO
                                        IF DipAff[j,k]<=-127 THEN DipAff[i,k]:=-120 ELSE DipAff[i,k]:=DipAff[j,k];
                                    GovtWing[i]:=GovtWing[j];
                                    InsgWing[i]:=-GovtWing[j];
                                    InsrtNews(i,6,j,2,1,i,FALSE);
                                    DipAff[i,j]:=0;
                                    DipAff[j,i]:=0;
                                    DipAff[i,i]:=127;
                                    IF i>j THEN
                                        BEGIN {clean up previous 'fight to death' message}
                                            CullFlag:=FALSE;
                                            k:=1;
                                            WHILE (k<=NewsQCtr) and NOT CullFlag DO
                                                BEGIN
                                                    IF (Subject[k]=j) and (Verb[k]=6) and (TheObject[k]=i) and (NewNVal[k]=1) and (OldNVal[k]=1) THEN
                                                        BEGIN
                                                            FOR d:=k TO NewsQCtr-1 DO
                                                                BEGIN
                                                                    Subject[d]:=Subject[d+1];
                                                                    Verb[d]:=Verb[d+1];
                                                                    TheObject[d]:=TheObject[d+1];
                                                                    OldNVal[d]:=OldNVal[d+1];
                                                                    NewNVal[d]:=NewNVal[d+1];
                                                                    Host[d]:=Host[d+1];
                                                                    CrisisVal[d]:=CrisisVal[d+1];
                                                                    NewsWorth[d]:=NewsWorth[d+1];
                                                                END;
                                                            NewsQCtr:=NewsQCtr-1;
                                                            CullFlag:=TRUE;
                                                            IF k<LastNews THEN LastNews:=LastNews-1;
                                                        END;
                                                    k:=k+1;
                                                END;
                                        END;
                                END
                            ELSE
                                BEGIN
                                    InsrtNews(i,6,j,1,1,i,TRUE);
                                    DipAff[j,i]:=-127;
                                END;
                        END;
                END;

            x:=((((256-Maturity[i])*Popln[i] div 256)*SqrtStrg[i]) div 80);
            temp:=0;
            FOR j:=1 TO CntryCount DO temp:=temp+2*MAidConv(InsgAid[j,i]);
            IF temp<((x div 8)+1) THEN temp:=((x div 8)+1);
            y:=Arf2(i,1)+Arf2(i,2);
            InsgPowr[i]:=((4*temp*x) div (temp+x))+y;
            IF i<3 THEN InsgPowr[i]:=1;
            MilPowr[i]:=MilPowr[i]-(InsgPowr[i] div 4);
            IF MilPowr[i]<1 THEN MilPowr[i]:=1;
            InsgPowr[i]:=InsgPowr[i]-(MilPowr[i] div 4);
            IF InsgPowr[i]<1 THEN InsgPowr[i]:=1;
            GovtStrg[i]:=MilPowr[i];
            InsgStrg[i]:=InsgPowr[i];
            StrngRat[i]:=GovtStrg[i] div InsgStrg[i];
            IF (InsgStrg[i]=1) AND (GovtStrg[i]<8192) THEN StrngRat[i]:=4*StrngRat[i];
            IF StrngRat[i]<1 THEN Revolution(i);

            {economics adjustments}
            ConsPress:=(20-GPopular[i])*10;
            IF ConsPress<1 THEN ConsPress:=1;
            InvtPress:=(80-InvtFrac[i])*2;
            IF InvtPress<1 THEN InvtPress:=1;
            MiltPress[i]:=SqrtStrg[i]+FinlProb[1,i]+FinlProb[2,i];
            IF MiltPress[i]<1 THEN MiltPress[i]:=1;
            Sum:=ConsPress+InvtPress+MiltPress[i];
            Pot:=0;
            IF ConsFrac[i]>16 THEN BEGIN ConsFrac[i]:=ConsFrac[i]-8; Pot:=8;    END;
            IF InvtFrac[i]>16 THEN BEGIN InvtFrac[i]:=InvtFrac[i]-8; Pot:=Pot+8; END;
            IF MiltFrac[i]>16 THEN BEGIN MiltFrac[i]:=MiltFrac[i]-8; Pot:=Pot+8; END;
            InvtFrac[i]:=InvtFrac[i]+((InvtPress*Pot) div Sum);
            MiltFrac[i]:=MiltFrac[i]+((MiltPress[i]*Pot) div Sum);
            ConsFrac[i]:=255-InvtFrac[i]-MiltFrac[i];
            OldConsS:=(ConsSpnd[i]*255) div Popln[i];
            x:=EconConv(EconAid[1,i])+EconConv(EconAid[2,i]);
            PseudGNP:=GNP[i]+x;
            temp:=PseudGNP*2*(InvtFrac[i]-30);
            GNP[i]:=GNP[i]+(temp div 1000);
            PseudGNP:=GNP[i]+x;
            x:=30-(OldConsS div 40); IF x<1 THEN x:=1;    {Population growth}
            temp:=Popln[i]*x;
            IF temp<1000 THEN temp:=1000;
            Popln[i]:=Popln[i]+(temp div 1000);
            MilMen[i]:=(Popln[i]*DrafFrac[i]) div 256;
            ConsSpnd[i]:=(ConsFrac[i]*PseudGNP) div 256;
            InvtSpnd[i]:=(InvtFrac[i]*PseudGNP) div 256;
            IF InvtSpnd[i]<1 THEN InvtSpnd[i]:=1;
            MiltSpnd[i]:=(PseudGNP-ConsSpnd[i]-InvtSpnd[i])*10;
            IF MiltSpnd[i]<1 THEN MiltSpnd[i]:=1;

            {fix negative available resource bug}
            IF i<3 THEN
                BEGIN
                    x:=(MiltSpnd[i] div 8)+GovtAid[i];
                    WHILE x<0 DO
                        BEGIN
                            ConsFrac[i]:=ConsFrac[i]-1;
                            MiltFrac[i]:=MiltFrac[i]+1;
                            ConsSpnd[i]:=(ConsFrac[i]*PseudGNP) div 256;
                            MiltSpnd[i]:=(PseudGNP-ConsSpnd[i]-InvtSpnd[i])*10;
                            x:=(MiltSpnd[i] div 8)+GovtAid[i];
                        END;
                END;

            temp:=(ConsFrac[i]*PseudGNP) div Popln[i];
            delta:=((temp-OldConsS)*100) div (OldConsS+1);
            GPopular[i]:=GPopular[i]+delta+(Abs(GovtWing[i]) div 64)-3;
            IF GPopular[i]<0 THEN GPopular[i]:=0;
            IF i<3 THEN GPopular[i]:=20;
            IF (GPopular[i]<=(Destab[1,i]+Destab[2,i])) AND (Level>1) THEN
                BEGIN {coupdetat}
                    CoupFlag[i]:=TRUE;
                    Virgin[i]:=FALSE;
                    x:=GovtWing[i];
                    GovtWing[i]:=InsgWing[i];
                    InsgWing[i]:=x;
                    LeftPowr[i]:=(GovtWing[i]<0);
                    GPopular[i]:=10+(128-Abs(GovtWing[i])) div 8;
                    GovtStrg[i]:=GovtStrg[i]-(GovtStrg[i] div 8);
                    InsrtNews(i,2,i,0,(Maturity[i] div 64)+1,i,FALSE);
                    FOR j:=1 TO 2 DO
                        BEGIN
                            x:=Should(Treaty[j,i])-(Maturity[i] div 2);
                            IF x>128 THEN x:=128;
                            IF x<0 THEN x:=0;
                            Integrty[j]:=(Integrty[j]*(128-x)) div 128;
                            x:=InsgWing[i]-GovtWing[j];
                            y:=GovtWing[i]-GovtWing[j];
                            x:=(Abs(x)-Abs(y)) div 2;
                            CoupGain[j,i]:=(x*PrestVal[i]) div 1024;
                            ChgDipAff(i,j,x);
                            MinorRej(i,j);
                        END;
                END;
            {----------------------------foreign policy AI-----------------------------------}
            CntryRnd[i]:=MyRandom;
            x:=(6400*InsgStrg[i]) div GovtStrg[i];
            IF x<1 THEN x:=1;
            IF x>6400 THEN x:=6400;
            temp:=x;
            SqrtStrg[i]:=Trunc(Sqrt(temp));
            IF i>2 THEN DoFinliz(i);
            FOR j:=1 TO 2 DO
                BEGIN
                    Pressure[j,i]:=0;
                    Destab[j,i]:=0;
                END;
            FOR j:=1 TO CntryCount DO
                BEGIN
                    x:=InsgAMax(j,i);
                    y:=InsgIMax(j,i);
                    IF InsgAid[j,i]>x THEN InsgAid[j,i]:=x;
                    IF IntvRebl[j,i]>y THEN IntvRebl[j,i]:=y;
                    IF j<3 THEN MinorRej(i,j);
                END;
        END; {of i-loop}
END;

PROCEDURE CompuAI;
VAR
    i,j,k,DAij,x,y,z,zz,Need,max,Sum,Obligatn,MaxCMAid:   Integer;
    MaxCIntv,MaxCEcon,HFinProb,ProjPowr,OldVal,NewVal:    Integer;
BEGIN
    MaxPolcy(Cmptr,MaxCIntv,MaxCMAid);
    Sum:=0;
    FOR i:=3 TO NoCntry DO Sum:=Sum+EconConv(EconAid[Cmptr,i]);
    MaxCEcon:=5;
    y:=(GNP[Cmptr] div 44)-2*Sum;
    FOR i:=4 DOWNTO 0 DO IF EconConv(i+1)>y THEN MaxCEcon:=i;
    FOR j:=3 TO NoCntry DO
        BEGIN
            HFinProb:=FinlProb[Human,j];
            DAij:=DipAff[Cmptr,j];
            Obligatn:=DAij+Should(Treaty[Cmptr,j])-DipAff[Human,j];
            IF Obligatn<0 THEN Obligatn:=(Obligatn*Nastiness) div 32;
            IF Obligatn>128 THEN Obligatn:=128;
            IF Obligatn=0 THEN Obligatn:=1;
            FOR k:=0 TO 7 DO
                BEGIN
                    CASE k OF
                        Econ:
                            BEGIN
                                Need:=(22-GPopular[j]) div 3;
                                IF Need<0 THEN Need:=0;
                                max:=EconAMax(DAij);
                                IF max>MaxCEcon THEN max:=MaxCEcon;
                                OldVal:=EconAid[Cmptr,j];
                                IF Level=1 THEN Need:=0;
                            END;
                        Miltry:
                            BEGIN
                                OldVal:=MiltAid[Cmptr,j];
                                Need:=(SqrtStrg[j]+HFinProb) div 8;
                                max:=MilMax(DAij);
                                IF max>MaxCMaid THEN max:=MaxCMAid;
                            END; {of Miltry case}
                        Insg:
                            BEGIN
                                Need:=-10;
                                OldVal:=InsgAid[Cmptr,j];
                                max:=InsgAMax(Cmptr,j);
                                IF max>MaxCMaid THEN max:=MaxCMAid;
                                x:=StrngRat[j];
                                y:=0;
                                IF x<128 THEN y:=1;
                                IF x<64     THEN y:=2;
                                IF x<32     THEN y:=3;
                                IF x<8     THEN y:=4;
                                IF x<2     THEN y:=5;
                                IF y<max THEN max:=y;
                            END;
                        IntGov:
                            BEGIN
                                OldVal:=IntvGovt[Cmptr,j];
                                max:=IntvGMax(Treaty[Cmptr,j],DAij);
                                Need:=(SqrtStrg[j]+HFinProb) div 8;
                                Sum:=0;
                                FOR i:=3 TO NoCntry DO
                                    IF (i<>j) and Contigus[i,j] and (NOT Contigus[Cmptr,i]) and (DipAff[Cmptr,i]<0)
                                        THEN Sum:=Sum+128-DipAff[Cmptr,i];
                                Need:=Need+(Sum div 64);
                                {IF Need<OldVal THEN Need:=OldVal;}
                                IF max>MaxCIntv THEN max:=MaxCIntv;
                            END;
                        IntReb:
                            BEGIN
                                OldVal:=IntvRebl[Cmptr,j];
                                NewVal:=0;
                                max:=5;
                                IF DAij<((Nastiness div 2)-64) THEN
                                    BEGIN
                                        max:=InsgIMax(Cmptr,j);
                                        ProjPowr:=(IntvConv(max)*MilPowr[Cmptr]) div MilMen[Cmptr];
                                        IF max>MaxCIntv THEN max:=MaxCIntv;
                                        IF ProjPowr>MilPowr[j] THEN
                                            BEGIN
                                                NewVal:=max;
                                                x:=GImpt(Cmptr,k,j,OldVal,NewVal,0,zz,z);
                                                IF x>(MyRandom div 1024) THEN NewVal:=OldVal;
                                            END;
                                    END;
                            END;
                        Pressur:
                            BEGIN
                                x:=-(144-FinlProb[Cmptr,j]) div 16;
                                IF x>0 THEN x:=0; IF x<-5 THEN x:=0;
                                Need:=x;
                                max:=5;
                                OldVal:=0;
                                IF Level<3 THEN Need:=0;
                            END;
                        Treato:
                            BEGIN
                                OldVal:=Treaty[Cmptr,j];
                                x:=1+(HFinProb div 16)-(SqrtStrg[j] div 24) -((20-GPopular[j]) div 8);
                                IF x<0 THEN x:=0;
                                IF Level<3 THEN x:=0;
                                Need:=OldVal+x;
                                max:=TreatMax(Integrty[Cmptr]+DAij-Pugnacty[Cmptr]);
                                IF max<OldVal THEN max:=OldVal;
                            END;
                        Destabl:
                            BEGIN
                                OldVal:=Destab[Cmptr,j];
                                Need:=(GPopular[j]-20) div 2;
                                IF Need>0 THEN Need:=0;
                                IF Level=1 THEN Need:=0;
                                max:=5;
                            END;
                    END; {of CASE statement}
                    IF k<>IntReb THEN
                        BEGIN
                            IF (k<>Treato) and (k<>Pressur) and (k<>IntGov) THEN Need:=(Need*Obligatn) div 128;
                            IF Need>max THEN Need:=max;
                            IF Need<0 THEN Need:=0;
                            NewVal:=Need;
                            IF NewVal>OldVal THEN
                                WHILE (GImpt(Cmptr,k,j,OldVal,NewVal,0,z,zz)>Abs(MyRandom div 512)) and (NewVal>OldVal)
                                   DO NewVal:=NewVal-1;
                        END;
                    IF (NewVal<OldVal) and (k=Treato) THEN NewVal:=OldVal;
                    IF NewVal<>OldVal THEN
                        BEGIN
                            DoPolicy(Cmptr,k,j,NewVal,(NewVal<OldVal));
                            MaxPolcy(Cmptr,MaxCIntv,MaxCMAid);
                        END;
                END; {of k-loop}
      END; {of j-IF}
END;

PROCEDURE MinorAI;
VAR
    i,j,k,SRat,ResrcFrac,FornResrc,Weight,kk,x:                       Integer;
    Troops,NewTroops,NewWeapons,Weapons,Who,Temp,MaxStuff,Influe:     Integer;
    WeightArr,IDArr:                                                  IntArr;
    LongSum:                                                          LongInt;
BEGIN
    FOR i:=3 TO NoCntry DO
        BEGIN
            Influe:=Influence(1,i)-Influence(2,i);
            FOR j:=3 TO NoCntry DO IF (i<>j) and MinorSph[i,j] and (DipAff[i,j]<>-127) THEN
                BEGIN {first zero out all policies}
                    IF MiltAid[i,j]>0 THEN DoPolicy(i,Miltry,j,0,FALSE);
                    IF InsgAid[i,j]>0 THEN DoPolicy(i,Insg,j,0,FALSE);
                    IF IntvGovt[i,j]>0 THEN DoPolicy(i,IntGov,j,0,FALSE);
                    IF IntvRebl[i,j]>0 THEN DoPolicy(i,IntReb,j,0,FALSE);
                END;
            SRat:=StrngRat[i];
            FOR j:=3 TO NoCntry DO IF DipAff[i,j]=-127 THEN SRat:=0;
            ResrcFrac:=0;
            IF SRat>64  THEN ResrcFrac:=10;
            IF SRat>128 THEN ResrcFrac:=20;
            IF SRat>256 THEN ResrcFrac:=30;
            IF SRat>512 THEN ResrcFrac:=40;
            IF ResrcFrac>0 THEN
                BEGIN {explore foreign policy options}
                    ResrcFrac:=ResrcFrac+((Adventur[1]+Adventur[2]+Nastiness) div 8);
                    FOR j:=1 TO NoCntry DO BEGIN WeightArr[j]:=0; IDArr[j]:=0; END;
                    FOR j:=3 TO NoCntry DO IF (j<>i) and MinorSph[i,j] THEN
                        BEGIN
                            LongSum:=0;
                            FOR k:=1 TO NoCntry DO
                                LongSum:=LongSum-(DipAff[k,j]*DipAff[i,k]);
                            Weight:=Abs((DipAff[i,j]*LongSum) div 16383);
                            x:=DontMess[j]-AveDMess;
                            Weight:=Weight+(x*Influe);
                            IF Weight<1 THEN Weight:=1;
                            k:=1;
                            WHILE Weight<WeightArr[k] DO k:=k+1;
                            FOR kk:=NoCntry-1 DOWNTO k DO
                                BEGIN
                                    WeightArr[kk+1]:=WeightArr[kk];
                                    IDArr[kk+1]:=IDArr[kk];
                                END;
                            WeightArr[k]:=Weight;
                            IDArr[k]:=j;
                        END;
                    LongSum:=0;
                    FOR j:=1 TO NoCntry DO LongSum:=LongSum+WeightArr[j];
                    FOR j:=1 TO NoCntry-2 DO IF WeightArr[j]>1 THEN
                        BEGIN {allocate resources}
                            Who:=IDArr[j];
                            {ClearRect(200,20,400,40); MoveTo(200,40); MyWrite(j);
                            DrawString(' '); MyWrite(WeightArr[j]);
                            DrawString(' '); MyWrite(ResrcFrac);
                            DrawString(' '); MyWrite(MiltSpnd[i]);}
                            Weapons:=((WeightArr[j]-1)*ResrcFrac*MiltSpnd[i]) div (LongSum*100);
                            NewWeapons:=0;
                            IF Weapons>1 THEN NewWeapons:=1;
                            IF Weapons>5 THEN NewWeapons:=2;
                            IF Weapons>20 THEN NewWeapons:=3;
                            IF Weapons>50 THEN NewWeapons:=4;
                            IF Weapons>100 THEN NewWeapons:=5;
                            MaxStuff:=0;
                            IF StrngRat[Who]<256 THEN MaxStuff:=1;
                            IF StrngRat[Who]<128 THEN MaxStuff:=2;
                            IF StrngRat[Who]<64 THEN MaxStuff:=3;
                            IF StrngRat[Who]<16 THEN MaxStuff:=4;
                            IF StrngRat[Who]<4 THEN MaxStuff:=5;
                            Troops:=((WeightArr[j]-1)*ResrcFrac*MilMen[i]) div (LongSum*100);
                            NewTroops:=0;
                            IF Troops>1 THEN NewTroops:=1;
                            IF Troops>5 THEN NewTroops:=2;
                            IF Troops>20 THEN NewTroops:=3;
                            IF Troops>50 THEN NewTroops:=4;
                            IF Troops>100 THEN NewTroops:=5;
                            IF DipAff[i,Who]>0 THEN
                                BEGIN
                                    Temp:=MilMax(DipAff[Who,i]);
                                    IF Temp>MaxStuff THEN Temp:=MaxStuff;
                                    IF NewWeapons>Temp THEN NewWeapons:=Temp;
                                    DoPolicy(i,Miltry,Who,NewWeapons,TRUE);
                                    Temp:=IntvGMax(5,DipAff[Who,i]);
                                    IF Temp>MaxStuff THEN Temp:=MaxStuff;
                                    IF NewTroops>Temp THEN NewTroops:=Temp;
                                    DoPolicy(i,IntGov,Who,NewTroops,TRUE);
                                END
                            ELSE
                                BEGIN
                                    Temp:=InsgAMax(i,Who);
                                    IF Temp>MaxStuff THEN Temp:=MaxStuff;
                                    IF NewWeapons>Temp THEN NewWeapons:=Temp;
                                    DoPolicy(i,Insg,Who,NewWeapons,TRUE);
                                    Temp:=InsgIMax(i,Who);
                                    IF Temp>MaxStuff THEN Temp:=MaxStuff;
                                    IF NewTroops>Temp THEN NewTroops:=Temp;
                                    DoPolicy(i,IntReb,Who,NewTroops,TRUE);
                                END;
                        END;
                END; {ResrcFrac>0 test}
        END; {i-loop}
END;

PROCEDURE MainMove(PaintBox1: TPaintBox);
VAR
    i,j,k,x:          Integer;
    temp,delta:       LongInt;
    ChalName:         Str255;
    RefNum:           Integer;
    DataStr:          Str255;
    ItemType:         Integer;
    CounterSign:      Str255;
    GoodAnswer:       Boolean;
    TempStr:          Str255;
    RawDatA:          PACKED ARRAY[1..4096] OF Char;
    RawDatB:          PACKED ARRAY[1..4096] OF Char;
    CHA,CHB,CHC:      LongInt;
BEGIN

    FOR i:=1 TO NoCntry DO
        BEGIN
            MAidDum[1,i]:=MiltAid[1,i];
            MAidDum[2,i]:=MiltAid[2,i];
            IAidDum[1,i]:=InsgAid[1,i];
            IAidDum[2,i]:=InsgAid[2,i];
            IntvGDum[1,i]:=IntvGovt[1,i];
            IntvGDum[2,i]:=IntvGovt[2,i];
            IntvIDum[1,i]:=IntvRebl[1,i];
            IntvIDum[2,i]:=IntvRebl[2,i];
            DipAffDum[1,i]:=DipAff[1,i];
            DipAffDum[2,i]:=DipAff[2,i];
        END;

    {Save history}
    i := Year-1988;
    FOR j:=1 TO NoCntry DO
        BEGIN
            LeftPowrHistory[i,j] := LeftPowr[j];
            FinlFlagHistory[i,j] := FinlFlag[j];
            CoupFlagHistory[i,j] := CoupFlag[j];
            RebWinFlagHistory[i,j] := RebWinFlag[j];
            GPopularHistory[i,j] := GPopular[j];
            MiltPressHistory[i,j] := MiltPress[j];
            SqrtStrgHistory[i,j] := SqrtStrg[j];
        end;
    FOR j:=1 TO 2 DO
        BEGIN
            FOR k:=1 TO NoCntry DO
                BEGIN
                    PressureHistory[i,j,k] := Pressure[j,k];
                    TreatyHistory[i,j,k] := Treaty[j,k];
                    FinlProbHistory[i,j,k] := FinlProb[j,k];
                    DestabHistory[i,j,k] := Destab[j,k];
                    EconAidHistory[i,j,k] := EconAid[j,k];
                    DipAffHistory[i,j,k] := DipAff[j,k];
                    IntvIHistory[i,j,k] := IntvRebl[j,k];
                    IAidHistory[i,j,k] := InsgAid[j,k];
                    IntvGHistory[i,j,k] := IntvGovt[j,k];
                    MAidHistory[i,j,k] := MiltAid[j,k];
                end;
        end;

    DevelopC;

    IF NOT TwoPFlag THEN CompuAI;
    IF Level=4 THEN MinorAI;
    Nastiness:=Nastiness-4;
    IF Nastiness<0 THEN Nastiness:=0;
    LastNews:=1;
    FOR j:=1 TO 2 DO
        BEGIN
            Pugnacty[j]:=Pugnacty[j]-4;
            Adventur[j]:=Pugnacty[j]+Nastiness-Pugnacty[3-j]-MiltFrac[j]+32;
            IF Adventur[j]<1 THEN Adventur[j]:=1;
            Integrty[j]:=Integrty[j]+5;
            IF Integrty[j]>127 THEN Integrty[j]:=127;
        END;

    CalcScores;
    IF Year=1989 THEN
        BEGIN
            IUSAStrng:=USAStrng;
            IUSSRStrng:=USSRStrng;
            FOR i:=1 TO NoCntry DO
                BEGIN
                    OldGStrg[i]:=GovtStrg[i];
                    OldIStrg[i]:=InsgStrg[i];
                    OldGPopl[i]:=GPopular[i];
                    OldFinPb[1,i]:=FinlProb[1,i];
                    OldFinPb[2,i]:=FinlProb[2,i];
                END;
        END;
    OldAScor:=USAStrng;
    OldRScor:=USSRStrng;
    USAScor[Year-1988]:=USAStrng-IUSAStrng;
    USSRScor[Year-1988]:=USSRStrng-IUSSRStrng;
    WriteYear(PaintBox1);
    WritScor(PaintBox1);
end;

end.

