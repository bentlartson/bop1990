unit History;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Globals, NewResrc;

type

  { THistoryForm }

  THistoryForm = class(TForm)
    EventsLabel: TLabel;
    HistoryPaintBox: TPaintBox;
    WhoLabel: TLabel;
    WhatLabel: TLabel;

    PROCEDURE DoHistory;
    procedure HistoryPaintBoxPaint(Sender: TObject);
  private

  public

  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.lfm}

PROCEDURE THistoryForm.DoHistory;
VAR
    x,w,Turn,i,j,k,OrgX,OrgY,DotType,Scale1,Scale2,Vert,Val,Max,DType,StartX,StartY: Integer;
    y,z,Count:                    LongInt;
    ClickFlg,JunkFlag:            Boolean;
    TempStrng:                    Str255;
    StrHandle:                    StringHandle;
    Kludge:                       Integer;
BEGIN
    HistoryPaintBox.Canvas.Brush.Style := bsSolid;
    HistoryPaintBox.Canvas.Brush.Color := clMenuBar;
    HistoryPaintBox.Canvas.Pen.Width := 1;
    HistoryPaintBox.Canvas.Pen.Color := clBlack;
    HistoryPaintBox.Canvas.Font.Size := 8;

    TempStrng:=ConCat('History of ',CntryNam[HitCntry]);
    HistoryForm.Caption := TempStrng;
    StrHandle:=GetString(1200);
    FOR i:=0 to 2 DO
        BEGIN {draw and label axes}
            FOR j:=0 TO 2 DO IF (j=2) OR (Level>i) THEN
                BEGIN
                    HistoryPaintBox.Canvas.Line(40+160*i, 96*j+15, 40+160*i, 95+96*j);
                    HistoryPaintBox.Canvas.Line(40+160*i, 95+96*j, 176+160*i, 95+96*j);
                    FOR Turn:=0 TO 8 DO
                        BEGIN
                            HistoryPaintBox.Canvas.Line(40+160*i+17*Turn, 95+96*j, 40+160*i+17*Turn, 97+96*j);
                            IF Turn<8 THEN HistoryPaintBox.Canvas.TextOut(42+160*i+17*Turn, 96+96*j, IntToSTr(Turn+89));
                        END;
                    IF j>0 THEN
                        BEGIN
                            FOR Turn:=1 TO 5 DO
                                BEGIN
                                    HistoryPaintBox.Canvas.Line(39+160*i, 95+96*j-14*Turn, 41+160*i, 95+96*j-14*Turn);
                                END;
                        END;
                    w:=24*i+8*j+1;
                    FOR k:=w TO w+7 DO
                        BEGIN
                            HistoryPaintBox.Canvas.TextOut(28+160*i, 96*j+11*(k-w+2)-8, StrHandle[k]);
                        END;
                END;
        END;

    CASE Level OF
        1: j:=12;
        2: j:=17;
        3,4: j:=23;
    END;
    FOR i:=1 TO j DO
        BEGIN
            Scale1:=14; Scale2:=1;
            CASE i OF
                1: BEGIN OrgX:=40; OrgY:=95; DotType:=1; Scale1:=1; Val:=SqrtStrg[HitCntry]; END;
                2: BEGIN OrgX:=40; OrgY:=191; DotType:=4; Val:=MiltAid[1,HitCntry]; END;
                3: BEGIN OrgX:=40; OrgY:=191; DotType:=2; Val:=MiltAid[2,HitCntry]; END;
                4: BEGIN OrgX:=40; OrgY:=287; DotType:=4; Val:=IntvGovt[1,HitCntry]; END;
                5: BEGIN OrgX:=40; OrgY:=287; DotType:=2; Val:=IntvGovt[2,HitCntry]; END;
                6: BEGIN OrgX:=40; OrgY:=191; DotType:=5; Val:=InsgAid[1,HitCntry]; END;
                7: BEGIN OrgX:=40; OrgY:=191; DotType:=3; Val:=InsgAid[2,HitCntry]; END;
                8: BEGIN OrgX:=40; OrgY:=287; DotType:=5; Val:=IntvRebl[1,HitCntry]; END;
                9: BEGIN OrgX:=40; OrgY:=287; DotType:=3; Val:=IntvRebl[2,HitCntry]; END;
                10: BEGIN OrgX:=200; OrgY:=287; DotType:=4; Scale1:=5; Scale2:=16; Val:=DipAff[1,HitCntry]; END;
                11: BEGIN OrgX:=200; OrgY:=287; DotType:=2; Scale1:=5; Scale2:=16; Val:=DipAff[2,HitCntry]; END;
                12: BEGIN OrgX:=360; OrgY:=287; DotType:=1; Scale1:=1; Scale2:=3; Val:=MiltPress[HitCntry]; END;
                13: BEGIN OrgX:=200; OrgY:=95; DotType:=1; Scale1:=4; Val:=GPopular[HitCntry]; END;
                14: BEGIN OrgX:=200; OrgY:=191; DotType:=4; Val:=EconAid[1,HitCntry]; END;
                15: BEGIN OrgX:=200; OrgY:=191; DotType:=2; Val:=EconAid[2,HitCntry]; END;
                16: BEGIN OrgX:=200; OrgY:=191; DotType:=5; Val:=Destab[1,HitCntry]; END;
                17: BEGIN OrgX:=200; OrgY:=191; DotType:=3; Val:=Destab[2,HitCntry]; END;
                18: BEGIN OrgX:=360; OrgY:=95; DotType:=4; Scale1:=5; Scale2:=8; Val:=FinlProb[1,HitCntry]; END;
                19: BEGIN OrgX:=360; OrgY:=95; DotType:=2; Scale1:=5; Scale2:=8; Val:=FinlProb[2,HitCntry]; END;
                20: BEGIN OrgX:=360; OrgY:=191; DotType:=4; Val:=Treaty[1,HitCntry]; END;
                21: BEGIN OrgX:=360; OrgY:=191; DotType:=2; Val:=Treaty[2,HitCntry]; END;
                22: BEGIN OrgX:=360; OrgY:=191; DotType:=5; Val:=Pressure[1,HitCntry]; END;
                23: BEGIN OrgX:=360; OrgY:=191; DotType:=3; Val:=Pressure[2,HitCntry]; END;
            END;
            StartX := OrgX;
            StartY := OrgY;
            FOR Turn:=1 TO Year-1988 DO
                BEGIN
                    DType:=DotType;
                    IF Turn=Year-1988 THEN HistDum1:=Val
                    ELSE
                        BEGIN
                            CASE i OF
                                1: HistDum1 := SqrtStrgHistory[Turn+1,HitCntry];
                                2: HistDum1 := MAidHistory[Turn,1,HitCntry];
                                3: HistDum1 := MAidHistory[Turn,2,HitCntry];
                                4: HistDum1 := IntvGHistory[Turn,1,HitCntry];
                                5: HistDum1 := IntvGHistory[Turn,2,HitCntry];
                                6: HistDum1 := IAidHistory[Turn,1,HitCntry];
                                7: HistDum1 := IAidHistory[Turn,2,HitCntry];
                                8: HistDum1 := IntvIHistory[Turn,1,HitCntry];
                                9: HistDum1 := IntvIHistory[Turn,2,HitCntry];
                                10: HistDum1 := DipAffHistory[Turn,1,HitCntry];
                                11: HistDum1 := DipAffHistory[Turn,2,HitCntry];
                                12: HistDum1 := MiltPressHistory[Turn+1,HitCntry];
                                13: HistDum1 := GPopularHistory[Turn,HitCntry];
                                14: HistDum1 := EconAidHistory[Turn,1,HitCntry];
                                15: HistDum1 := EconAidHistory[Turn,2,HitCntry];
                                16: HistDum1 := DestabHistory[Turn,1,HitCntry];
                                17: HistDum1 := DestabHistory[Turn,2,HitCntry];
                                18: HistDum1 := FinlProbHistory[Turn,1,HitCntry];
                                19: HistDum1 := FinlProbHistory[Turn,2,HitCntry];
                                20: HistDum1 := TreatyHistory[Turn,1,HitCntry];
                                21: HistDum1 := TreatyHistory[Turn,2,HitCntry];
                                22: HistDum1 := PressureHistory[Turn,1,HitCntry];
                                23: HistDum1 := PressureHistory[Turn,2,HitCntry];
                            END;
                        END;
                    IF (i=10) OR (i=11) THEN HistDum1:=HistDum1+128; {wotta kluge!}
                    Vert:=(HistDum1*Scale1) div Scale2;
                    IF Vert>80 THEN Vert:=80;
                    IF Vert<0 THEN Vert:=0;
                    x:=OrgX+17*Turn;
                    w:=OrgY-Vert;
                    IF (DotType=1) OR (Scale2=8) OR (Scale2=16) THEN    {top graph -- lines}
                        BEGIN
                            IF i=1 THEN
                                BEGIN
                                    Count:=1;
                                    HistDum1:=0;
                                    IF (Turn=(Year-1988))
                                        THEN BEGIN IF LeftPowr[HitCntry] THEN HistDum1:=256; END
                                        ELSE HistDum1 := integer(LeftPowrHistory[Turn+1,HitCntry]);
                                    IF HistDum1=0 THEN DType:=4 ELSE DType:=2;
                                    Count:=1;
                                    HistDum1:=0;
                                    IF (Turn=(Year-1988))
                                        THEN BEGIN IF RebWinFlag[HitCntry] THEN HistDum1:=256; END
                                        ELSE HistDum1 := integer(RebWinFlagHistory[Turn+1,HitCntry]);
                                    IF HistDum1<>0 THEN
                                        BEGIN
                                            x:=x-17;
                                            HistoryPaintBox.Canvas.Line(StartX, StartY, x, OrgY-80);
                                            CASE DType OF
                                                2: BEGIN
                                                    HistoryPaintBox.Canvas.Brush.Color := clWhite;
                                                    HistoryPaintBox.Canvas.Rectangle(x-2, OrgY-82, x+3, OrgY-77);
                                                   END;
                                                4: BEGIN
                                                    HistoryPaintBox.Canvas.Brush.Color := clBlack;
                                                    HistoryPaintBox.Canvas.Rectangle(x-2, OrgY-82, x+3, OrgY-77);
                                                   END;
                                            END;
                                            StartX := x;
                                            StartY := OrgY-80;
                                            x:=x+17;
                                        END;
                                END;
                            IF i=13 THEN
                                BEGIN
                                    Count:=1;
                                    HistDum1:=0;
                                    IF (Turn=(Year-1988))
                                        THEN BEGIN IF CoupFlag[HitCntry] THEN HistDum1:=256; END
                                        ELSE HistDum1 := integer(CoupFlagHistory[Turn,HitCntry]);
                                    IF HistDum1<>0 THEN
                                        BEGIN
                                            x:=x-17;
                                            HistoryPaintBox.Canvas.Line(StartX, StartY, x, OrgY);
                                            HistoryPaintBox.Canvas.Line(x, OrgY-2, x, OrgY+2);
                                            HistoryPaintBox.Canvas.Line(x-2, OrgY, x+2, OrgY);
                                            StartX := x;
                                            StartY := OrgY;
                                            x:=x+17;
                                        END;
                                END;

                            x:=x-17; {kludge for shift}
                            HistoryPaintBox.Canvas.Line(StartX, StartY, x, w);
                            CASE DType OF
                                1: BEGIN
                                    HistoryPaintBox.Canvas.Line(x, w-2, x, w+2);
                                    HistoryPaintBox.Canvas.Line(x-2, w, x+2, w);
                                   END;
                                2: BEGIN
                                    HistoryPaintBox.Canvas.Brush.Color := clBlack;
                                    HistoryPaintBox.Canvas.Rectangle(x-2, w-2, x+3, w+3);
                                   END;
                                4: BEGIN
                                    HistoryPaintBox.Canvas.Brush.Color := clWhite;
                                    HistoryPaintBox.Canvas.Rectangle(x-2, w-2, x+3, w+3);
                                   END;
                            END;
                            StartX := x+2;
                            StartY := w;
                        END
                    ELSE    {lower graph -- bars}
                        BEGIN
                            IF Turn<9 THEN
                                BEGIN
                                    CASE DotType OF
                                        2: HistoryPaintBox.Canvas.Brush.Color := clBlack;
                                        3: HistoryPaintBox.Canvas.Brush.Color := TColor(DarkGrayRGB);
                                        4: HistoryPaintBox.Canvas.Brush.Color := clWhite;
                                        5: HistoryPaintBox.Canvas.Brush.Color := TColor(LightGrayRGB);
                                    END;
                                    HistoryPaintBox.Canvas.Rectangle(x-4*(DotType-1), w, x-4*(DotType-2)+1, OrgY+1);
                                END;
                        END;
                END; {of TURN-loop}
        END;    {of i-loop}
    FOR i:=1 TO Level DO IF i<4 THEN
        BEGIN
            FOR Turn:=0 TO Year-1988 DO
                BEGIN
                    Count:=1;
                    HistDum1:=0;
                    IF (Turn=(Year-1988)) THEN
                        BEGIN
                            CASE i OF
                                1: IF RebWinFlag[HitCntry] THEN HistDum1:=255;
                                2: IF CoupFlag[HitCntry] THEN HistDum1:=255;
                                3: IF FinlFlag[HitCntry] THEN HistDum1:=255;
                            END;
                        END
                    ELSE
                        BEGIN
                            CASE i OF
                                1: IF RebWinFlagHistory[Turn+1,HitCntry] THEN HistDum1:=255;
                                2: IF CoupFlagHistory[Turn+1,HitCntry] THEN HistDum1:=255;
                                3: IF FinlFlagHistory[Turn+1,HitCntry] THEN HistDum1:=255;
                            END;

                        END;
                    IF HistDum1<>0 THEN
                        BEGIN
                            x:=21+160*(i-1)+17*Turn;
                            HistoryPaintBox.Canvas.Line(x, 95, x, 15);
                            x:=x+4;
                            HistoryPaintBox.Canvas.Line(x, 95, x, 15);
                        END;
                END;
        END;
end;

procedure THistoryForm.HistoryPaintBoxPaint(Sender: TObject);
begin
    DoHistory;
end;

end.

