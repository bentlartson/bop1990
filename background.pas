unit Background;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Globals, NewResrc, Graphics;

VAR
    CurResrc,CurPerVal,CurArchv,CurVioln:     Integer;
    SelectedMenu, SelectedItem:               Integer;

PROCEDURE InitBackGd(PaintBox1: TPaintBox);
PROCEDURE DoBackGd(theMenu: Integer; theItem: Integer; PaintBox1: TPaintBox);

implementation

PROCEDURE NewRevMap(Resource,Divisor,Archive,Violence: Integer; NewNdxFlag: Boolean; PaintBox1: TPaintBox);
{main routine for revising the map under new circumstances}
CONST
    GStrng     = 'GNP ';
    perStrng   = ' per ';
    CStrng     = 'capita';
    ClrMap     = 0;
    GNPC       = 1;
    MiltryS    = 2;
    ConsS      = 3;
    InvtS      = 4;
    Populn     = 5;
    MilPersn   = 6;
VAR
    i,ii,j,x,y,SaveID,SaveVal:                Integer;
    IColor,NoZeros,Mantissa:                  Integer;
    NumZeros,DenZeros,IDNumber:               Integer;
    Arg,Count,DecPnt,Pwr10:                   Integer;
    Denomntr,Numeratr,Attempt:                LongInt;
    Coeff,BigstVal:                           LongInt;
    OutStrng,TempStrng,TempStrng2,TitStrng:   Str255;
    IDArr,SortArr:                            IntArr;
    StrHandle:                                StringHandle;
    LZFlag,DPFlag,CommaFlg:                   Boolean;
    HexString:                                String;
BEGIN
    IF NewNdxFlag THEN
        BEGIN
          PaintBox1.Canvas.Brush.Color := BackgroundColor;
          PaintBox1.Canvas.Pen.Color := OutlineColor;
          PaintBox1.Canvas.Font.Size := 10;
          PaintBox1.Canvas.Rectangle(round(200 * DisplayScale), round(300 * DisplayScale), round(512 * DisplayScale), round(335 * DisplayScale));
        END;
    IF Archive>0 THEN
        BEGIN
            StrHandle := GetString(1099+Archive);
            {Iterate through the 2 strings, converting from 4-digit hex to 16-bit integers}
            FOR i:=0 TO 61 DO
                BEGIN
                    j := i * 4 + 1;
                    HexString := '0x' + Copy(StrHandle, j, 4);
                    SortArr[i + 1] := StrToInt(HexString);
                END;
            StrHandle := GetString(1149+Archive);
            FOR i:=0 TO 17 DO
                BEGIN
                    j := i * 4 + 1;
                    HexString := '0x' + Copy(StrHandle, j, 4);
                    SortArr[i + 63] := StrToInt(HexString);
                END;
            Resource:=Archive+6;
            IF (Archive>8) AND (Archive<15) THEN Divisor:=Violence ELSE Divisor:=8;
        END
    ELSE
        BEGIN
            CASE Resource OF
                ClrMap: FOR i:=1 TO NoCntry DO SortArr[i]:=0;
                GNPC: FOR i:=1 TO NoCntry DO SortArr[i]:=GNP[i];
                MiltryS: FOR i:=1 TO NoCntry DO SortArr[i]:=MiltSpnd[i];
                ConsS: FOR i:=1 TO NoCntry DO SortArr[i]:=ConsSpnd[i];
                InvtS: FOR i:=1 TO NoCntry DO SortArr[i]:=InvtSpnd[i];
                Populn: FOR i:=1 TO NoCntry DO SortArr[i]:=Popln[i];
                MilPersn: FOR i:=1 TO NoCntry DO SortArr[i]:=MilMen[i];
            END;     {of CASE statement}
            OutStrng:='';
        END;
    IF HitCntry>0 THEN Mantissa:=SortArr[HitCntry];

    BigstVal:=0;
    FOR i:=1 TO NoCntry DO
        BEGIN
            Numeratr:=SortArr[i]*100;
            CASE Divisor OF
                8: Denomntr:=100;
                9: Denomntr:=Popln[i];
                10: Denomntr:=GNP[i];
            END;
            Coeff:=(Numeratr div Denomntr)+1;
            IF Coeff>BigstVal THEN BigstVal:=Coeff;
        END;
    Coeff:=3276700 div BigstVal;

    FOR i:=1 TO NoCntry DO
        BEGIN
            Numeratr:=SortArr[i]*Coeff;
            CASE Divisor OF
                8: Denomntr:=Coeff;
                9: Denomntr:=Popln[i];
                10: Denomntr:=GNP[i];
            END;
            SortArr[i]:=Numeratr div Denomntr;
        END;
    IF HitCntry>0 THEN
        BEGIN    {relative rankings}
            IF NewNdxFlag THEN OutStrng := GetIndString(591,2);
            FOR i:=1 TO NoCntry DO
                BEGIN
                    IF i<>HitCntry THEN
                        BEGIN
                            IF SortArr[i]>SortArr[HitCntry] THEN IColor:=HighValueColor ELSE Icolor:=LowValueColor;
                            FillCntry(i,IColor);
                        END;
                END;
            TempStrng2 := '(' + CntryNam[HitCntry] + ': ';
            CASE Divisor OF
                8: BEGIN Denomntr:=1; DenZeros:=0; TempStrng:=''; END;
                9: BEGIN
                    Denomntr:=Popln[HitCntry]; DenZeros:=5; TempStrng:='/person'; END;
                10: BEGIN
                    Denomntr:=GNP[HitCntry]*2; DenZeros:=8; TempStrng:='/GNP$'; END;
            END;    {of CASE statement}
            x:=1;
            NumZeros:=0;
            CASE Resource OF
                1: BEGIN x:=2; NumZeros:=8; END;
                2: BEGIN x:=1; NumZeros:=7; END;
                3: BEGIN x:=2; NumZeros:=8; END;
                4: BEGIN x:=2; NumZeros:=8; END;
                5: BEGIN x:=1; NumZeros:=5; END;
                6: BEGIN x:=1; NumZeros:=3; END;
                13: BEGIN x:=1; NumZeros:=-1; END;
                14: BEGIN x:=1; NumZeros:=-1; END;
                16: BEGIN x:=1; NumZeros:=2; END;
                28,29: BEGIN x:=1; NumZeros:=-1; END;
            END;    {of CASE statement}
            Numeratr:=Mantissa*x;
            TitStrng := GetIndString(593,Resource);
            NoZeros:=NumZeros-DenZeros;
            IF Numeratr=0 THEN Numeratr:=1;
            IF Denomntr=0 THEN Denomntr:=1;
            WHILE Numeratr div Denomntr < 1000 DO
                BEGIN
                    Numeratr:=Numeratr*10;
                    NoZeros:=NoZeros-1;
                END;
            WHILE Numeratr div Denomntr > 10000 DO
                BEGIN
                    Numeratr:=Numeratr div 10;
                    NoZeros:=NoZeros+1;
                END;
            Mantissa:=Numeratr div Denomntr;
            {-----------------------write floating point value---------------------------}
            LZFlag:=FALSE;
            DPFlag:=FALSE;
            CommaFlg:=TRUE;
            DecPnt:=NoZeros+5;
            IF DecPnt<1 THEN
                BEGIN
                    TempStrng2 := TempStrng2 + '.';
                    FOR i:= 0 DOWNTO DecPnt DO TempStrng2 := TempStrng2 + '0';
                    DPFlag:=TRUE;
                END;
            Pwr10:=10000;
            FOR Count:=4 DOWNTO 0 DO
                BEGIN
                    IF NOT DPFlag THEN
                        BEGIN
                            IF DecPnt=0 THEN BEGIN TempStrng2 := TempStrng2 + '.'; DPFlag:=TRUE; END;
                        END;
                    Arg:=0;
                    WHILE Mantissa>=0 DO
                        BEGIN
                            Mantissa:=Mantissa-Pwr10;
                            Arg:=Arg+1;
                        END;
                    Mantissa:=Mantissa+Pwr10;
                    Arg:=Arg-1;
                    IF LZFlag OR (Arg<>0) THEN
                        BEGIN
                            IF (DecPnt>0) AND (DecPnt mod 3 = 0) AND LZFlag AND CommaFlg THEN TempStrng2 := TempStrng2 + ',';
                            TempStrng2 := TempStrng2 + chr(Arg+48);
                            LZFlag:=TRUE;
                        END;
                    DecPnt:=DecPnt-1;
                    Pwr10:=Pwr10 div 10;
                END;
            WHILE DecPnt>0 DO
                BEGIN
                    IF (DecPnt>0) AND (DecPnt mod 3 = 0) THEN TempStrng2 := TempStrng2 + ',';
                    TempStrng2 := TempStrng2 + '0';
                    DecPnt:=DecPnt-1;
                END;
            {---------------------------end of write---------------------------------}
            TitStrng:=Concat(TitStrng,TempStrng);
            TempStrng2 := TempStrng2 + ' ' + TitStrng + ')';
            {Draw the bottom text}
            PaintBox1.Canvas.Font.Color := OutlineColor;
            PaintBox1.Canvas.TextOut(round(205 * DisplayScale), round(323.5 * DisplayScale) - 10, TempStrng2);
        END
    ELSE
        BEGIN {absolute rankings}
            {sort the array}
            IF NewNdxFlag THEN OutStrng := GetIndString(591,1);
            FOR i:=1 TO NoCntry DO IDArr[i]:=i;
            FOR i:=2 TO NoCntry DO
                BEGIN
                    j:=i;
                    WHILE SortArr[j] > SortArr[j-1] DO
                        BEGIN
                            SaveVal:=SortArr[j];
                            SortArr[j]:=SortArr[j-1];
                            SortArr[j-1]:=SaveVal;
                            SaveID:=IDArr[j];
                            IDArr[j]:=IDArr[j-1];
                            IDArr[j-1]:=SaveID;
                            IF j > 2 THEN j:=j-1;
                        END;
                END;    {end of sort}
            IColor:=HighValueColor;
            FOR i:=1 TO NoCntry DO
                BEGIN
                    IF i > 15 THEN IColor:=MediumValueColor;
                    IF i > 31 THEN IColor:=LowValueColor;
                    IF i > 47 THEN IColor:=CountryBackgroundColor;
                    IF SortArr[i] = 0 THEN IColor:=CountryBackgroundColor;
                    IF i<>HitCntry THEN FillCntry(IDARR[i],IColor);
                END;
        END;    {of ELSE condition and IF HitCntry statement}
    IF NewNdxFlag THEN
        BEGIN
            TempStrng := GetIndString(591,3);
            OutStrng:=Concat(OutStrng,' ',TempStrng);
            TempStrng := GetIndString(601,Resource);
            OutStrng:=Concat(OutStrng,' ',TempStrng);
            CASE Divisor OF
                9: OutStrng:=Concat(OutStrng,perStrng,CStrng);
                10: OutStrng:=Concat(OutStrng,perStrng,GStrng);
            END;
            {Clear any old rectangles and legend text}
            PaintBox1.Canvas.Brush.Color := BackgroundColor;
            PaintBox1.Canvas.Pen.Color := BackgroundColor;
            PaintBox1.Canvas.Rectangle(round(326 * DisplayScale), round(220 * DisplayScale), round(434 * DisplayScale), round(298 * DisplayScale));

            {Draw the bottom text}
            PaintBox1.Canvas.Font.Color := OutlineColor;
            PaintBox1.Canvas.TextOut(round(205 * DisplayScale), round(310 * DisplayScale) - 10, OutStrng);

            IF HitCntry>0 THEN
                BEGIN
                    FOR i:=1 TO 2 DO
                        BEGIN
                            CASE i OF
                                1: BEGIN PaintBox1.Canvas.Brush.Color := LowValueColor; TitStrng:='Lower Value'; END;
                                2: BEGIN PaintBox1.Canvas.Brush.Color := HighValueColor;  TitStrng:='Higher Value'; END;
                            END;
                            {Draw the rectangles}
                            PaintBox1.Canvas.Pen.Color := OutlineColor;
                            PaintBox1.Canvas.Rectangle(round(326 * DisplayScale), round((200+20*i) * DisplayScale), round(338 * DisplayScale), round((215+20*i) * DisplayScale));
                            {Draw the rectangle legend text}
                            PaintBox1.Canvas.Brush.Color := BackgroundColor;
                            PaintBox1.Canvas.Font.Color := OutlineColor;
                            PaintBox1.Canvas.TextOut(round(342 * DisplayScale), round((208+20*i) * DisplayScale) - 10, TitStrng);
                        END;
                END
            ELSE
                BEGIN
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
                            OutStrng := GetIndString(600,i);
                            {Draw the rectangle legend text}
                            PaintBox1.Canvas.Brush.Color := BackgroundColor;
                            PaintBox1.Canvas.Font.Color := OutlineColor;
                            PaintBox1.Canvas.TextOut(round(342 * DisplayScale), round((208+20*i) * DisplayScale) - 10, OutStrng);
                        END;
                END;
        END; {of new index display}
END;

PROCEDURE InitBackGd(PaintBox1: TPaintBox);
begin
    CurResrc:=1;
    CurPerVal:=8;
    CurArchv:=0;
    CurVioln:=8;
    SelectedMenu := 11;
    SelectedItem := 1;
    NewRevMap(CurResrc,CurPerVal,CurArchv,CurVioln,TRUE,PaintBox1);
end;

PROCEDURE DoBackGd(theMenu: Integer; theItem: Integer; PaintBox1: TPaintBox);
CONST
    ExitMenu   = 10;
    RescMenu   = 11;
    ArkMenu    = 12;
    VioMenu    = 13;
    PolMenu    = 14;
    EcoMenu    = 15;
VAR
    i,SaveHitC:                   Integer;
    MenuVal:                      LongInt;
    JunkFlag,ExitFlag,ChgFlag:    Boolean;
BEGIN
    SelectedMenu := theMenu;
    SelectedItem := theItem;
    CASE theMenu OF
        RescMenu:
            BEGIN
                IF (theItem<7) AND (theItem>0) THEN
                    BEGIN
                        CurResrc:=theItem; CurArchv:=0;
                    END;
                IF theItem>7 THEN
                    BEGIN
                        CurArchv:=0;
                    END;
            END;
        ArkMenu:
            IF (theItem<>CurArchv) AND (theItem>0) THEN
                BEGIN
                    CurArchv:=theItem;
                END;
        VioMenu:
            BEGIN
                IF (theItem+8<>CurArchv) AND (theItem>0) THEN
                    BEGIN
                        CurArchv:=theItem+8;
                    END;
            END;
        PolMenu:
            IF (theItem+14<>CurArchv) AND (theItem>0) THEN
                BEGIN
                    CurArchv:=theItem+14;
                END;
        EcoMenu:
            IF (theItem+16<>CurArchv) AND (theItem>0) THEN
                BEGIN
                    CurArchv:=theItem+16;
                END;
            END;
    NewRevMap(CurResrc,CurPerVal,CurArchv,CurVioln,TRUE,PaintBox1);
END;

end.

