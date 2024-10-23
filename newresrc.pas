unit NewResrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

FUNCTION GetString(i: Integer): String;
FUNCTION GetIndString(i: Integer; j: Integer): String;
FUNCTION GetMakePoliciesDialogHeader(i: Integer): String;
FUNCTION GetMakePoliciesDialogText(i: Integer; j: Integer): String;

implementation

FUNCTION GetString(i: Integer): String;
BEGIN
    GetString := '*';
    CASE i OF
        128: GetString := '0*Two old women*Small groups*Large gatherings*Huge crowds*';
        129: GetString := '0* protest* march* wave signs, carry banners* demonstrate*';
        130: GetString := '0* in @* at a political rally* during the &''s speech* in the streets*';
        131: GetString := '3*. *';
        132: GetString := '0*Students*Thousands of citizens*Frustrated workers*Crowds of young*';
        133: GetString := '1* present petition* demand action* demonstrate angrily* riot in the streets*';
        134: GetString := '0* against high food prices* against police behavior* against government policies* against low wages*';
        135: GetString := '3*. *';
        136: GetString := '1*Two dissidents*Top critics of the government*Groups of demonstrators*Thousands of government opponents*';
        137: GetString := '0* escorted to meeting with &* harassed* thrown in jail* executed*';
        138: GetString := '0* by police* by government agents* by / soldiers* by security men*';
        139: GetString := '3*. *';
        140: GetString := '0*Factory workers*Laborers*Union members*Workers*';
        141: GetString := '0* go on strike;* walk off jobs;* lay down tools;* declare strike;*';
        142: GetString := '1* march peacefully* little violence* some fighting reported* ---\"A bloody day\"*';
        143: GetString := '3*. *';
        144: GetString := '0*Anti-government terrorists*Members of the %*Insurgents*Radical elements*';
        145: GetString := '0* claim responsibility for* announce* carry out* are suspected of complicity in*';
        146: GetString := '1* the kidnapping of an American businessman* the recent airport bombing* the attack on oil storage tanks* the assassination of the minister of defense*';
        147: GetString := '3*. *';
        148: GetString := '0*The minister of defense*An official spokesman*The &*A high official*';
        149: GetString := '0* denounces* blames* blasts* criticizes*';
        150: GetString := '0* anti-government terrorists* members of the %* insurgents* radical elements*';
        151: GetString := '0* for the bombing of a school.* for the current wave of political murders.* for the attack on the American Embassy in @.* for the bloody attack on a bus.*';
        152: GetString := '0*% terrorists*Members of the %*Radicals*% extremists*';
        153: GetString := '0* bomb* detonate bombs on* blow up* use car bomb against*';
        154: GetString := '1* power lines;* bridge;* busy intersection;* &''s residence;*';
        155: GetString := '0* damage quickly repaired.* nobody killed.* "...a shambles..."* two die.*';
        156: GetString := '0*Anti-terrorist*Anti-%*Government security*Internal security*';
        157: GetString := '0* sweeps* searches* operations* activities*';
        158: GetString := '1* will remain low-key,* to be boosted,* a necessary measure,* will become all-out effort,*';
        159: GetString := '0* & promises.* / official claims.* observers say.* insurgents vow to carry on fight.*';
        160: GetString := '0*Anti-government guerrillas*Forces opposed to the government*% fighters*Members of the %*';
        161: GetString := '0* launch a series of attacks on* fight with government troops in* carry out attacks on* take control of*';
        162: GetString := '1* isolated villages* several remote towns* two provincial capitals* the outskirts of @*';
        163: GetString := '3*. *';
        164: GetString := '0*Army units*Government forces*Government troops*Soldiers loyal to the regime*';
        165: GetString := '0* carry out a sweep for guerrillas* attack % positions* battle guerilla forces* hunt % fighters*';
        166: GetString := '1*, scoring spectacular success* inflicting heavy losses* with some success* but accomplish little*';
        167: GetString := '3*. *';
        168: GetString := '0*guerrilla leader*Spokesman for %*Commander of the %*Top guerilla*';
        169: GetString := '0* predicts* vows* promises* pledges*';
        170: GetString := '1* \"long, valiant struggle\"* new attacks* big guerrilla offensive* overwhelming victory*';
        171: GetString := '0* in Fallaci interview.* to eager audience.*; see page 10.* in store.*';
        172: GetString := '0*Reports show*Reporter claims*Fact-finding group asserts that*Study reveals*';
        173: GetString := '0* peasants* country dwellers* rural people* villagers*';
        174: GetString := '0* endure* experience* work in atmosphere of* undergo*';
        175: GetString := '1* some insecurity.* occasional combat.* constant battle.* daily terror.*';
        176: GetString := '0*Rebel forces*% soldiers*Anti-government troops*% forces*';
        177: GetString := '0* launch attacks on* overrun* fire rockets at* besiege*';
        178: GetString := '1* several government patrols* army outposts* large army base* @*';
        179: GetString := '3*. *';
        180: GetString := '0*Army forces*Government units*Government soldiers*Troops loyal to the regime*';
        181: GetString := '0* stage major offensive* fight rebel elements* pound enemy positions* slug it out with % fighters*';
        182: GetString := '1*;heavy guerrilla losses* scoring minor success* without result* but suffer heavy casualties*';
        183: GetString := '3*. *';
        184: GetString := '0*/ spokesman*The &*Highly-placed official*Government source*';
        185: GetString := '0* claims* declares* asserts* reveals*';
        186: GetString := '1* total victory* big victory* some success* encouraging signs*';
        187: GetString := '0* in recent battle with rebels.* in civil war.* after fierce battle.* against %.*';
        188: GetString := '0*Rebel forces*Anti-government soldiers*Troops of %*% units*';
        189: GetString := '0* ambush* shoot up* surround* destroy*';
        190: GetString := '1* army patrols* government outposts* army battalion* entire division*';
        191: GetString := '';

        216: GetString := '0*Government*&*Secretary of Industry*Economics minister*';
        217: GetString := '0* announces* declares* unveils* releases*';
        218: GetString := '0* new* revised* updated* modified*';
        219: GetString := '0* five-year plan.* economic plan.* economic program.* 10-year program.*';
        220: GetString := '0*Government*@*&*Government*';
        221: GetString := '0* takes control of* nationalizes* takes over* buys out*';
        222: GetString := '0* more* additional* privately-owned* foreign-owned*';
        223: GetString := '0* mines.* steel mills.* petroleum facilities.* banks.*';
        224: GetString := '0*New tax plan*Tax overhaul*Reformed tax code*Tax reform bill*';
        225: GetString := '0* presented to* considered by* debated by* passed by*';
        226: GetString := '0* legislators* legislative body* legislature* lawmakers*';
        227: GetString := '3*. *';
        228: GetString := '0*&*&*&*&*';
        229: GetString := '0* promises* pledges* vows* guarantees*';
        230: GetString := '0* continued* to maintain* to preserve* to extend*';
        231: GetString := '0* free trade.* unhindered business atmosphere.* laissez-faire economic policies.* free and open marketplace.*';
        232: GetString := '0*Sullen*Frightened*Quiet*Small*';
        233: GetString := '0* crowds* groups of people* assemblages* knots of people*';
        234: GetString := '0* attend* present at* seen at* reported at*';
        235: GetString := '0* &''s speech.* anniversary of revolution.* government parade.* ''spontaneous celebration''.*';
        236: GetString := '0*Low*Small*Unimpressive*Disappointing*';
        237: GetString := '0* turnout* participation* popular support* popular involvement*';
        238: GetString := '0* in latest* in recent* in government* in yesterday''s*';
        239: GetString := '0* plebiscite.* meaningless elections.* showpiece vote.* plebiscite.*';
        240: GetString := '0*Support for*Popularity of*Support for*Popularity of*';
        241: GetString := '0* government* &* leadership* &*';
        242: GetString := '0* reportedly* said to be* estimated to be* shown to be*';
        243: GetString := '0* moderate.* fairly high.* good.* improving.*';
        244: GetString := '3*&*';
        245: GetString := '0* mobbed by* met by* greeted by* addresses*';
        246: GetString := '0* adulatory* happy* cheering* singing*';
        247: GetString := '0* citizens.* crowds.* people.* population.*';

        300: GetString := '0*!*^*> +*!*';
        301: GetString := '0* accuses ? of* castigates ? for* complains that ? is* presents evidence that ? is*';
        302: GetString := '1* minding his own business* assisting dissidents* funding the opposition* inciting riots* encouraging assassinations* plotting a coup*';
        303: GetString := '3*.*';
        304: GetString := '0*!*^*> +*!*';
        305: GetString := '3* reports that ?*';
        306: GetString := '3* destabilization activities*';
        307: GetString := '3* have decreased.*';
        308: GetString := '0*/ &*& of ?*/ spokesman*/ &*';
        309: GetString := '0* praises* seeks closer ties with* promises better relations with* edges closer to*';
        310: GetString := '0* !* ^* !* ^*';
        311: GetString := '0* in press statement.* in speech.* in year-end address.* after conference with > +.*';
        312: GetString := '0*/ aid package for !*Foreign aid from ? to !*/ economic assistance for !*/ grants and credits to !*';
        313: GetString := '0* upped to* increased to* totals* tops*';
        314: GetString := '1* nothing* $200 million* $400 million* $1 billion* $2 billion* $4 billion*';
        315: GetString := '3*. *';
        316: GetString := '0*?*/ &*@*/ government*';
        317: GetString := '0* slashes* announces cuts in* reduces* trims*';
        318: GetString := '0* aid for ! to* economic assistance for ! to* aid package for ! to* foreign aid outlays for ! to*';
        319: GetString := '1* nothing.* $200 million.* $400 million.* $1 billion.* $2 billion.* $4 billion.*';
        320: GetString := '0*?*/ &*/ government*@*';
        321: GetString := '0* cites diplomatic factors* claims deteriorating relations* refers to ''diplomatic difficulties''* angry with ^*';
        322: GetString := '0*, rejects > aid package*, spurns economic aid from !*, refuses part of > economic aid*, returns part of > aid*';
        323: GetString := '3*.*';
        324: GetString := '0*?*/ &*/ government*@*';
        325: GetString := '0* provides !* offers !* rushes !* gives !*';
        326: GetString := '1* nothing* $20 million* $100 million* $400 million* $1 billion* $2 billion*';
        327: GetString := '0* in weapons package.* worth of military hardware.* in military aid.* in military assistance.*';
        328: GetString := '0*/ military aid to !*Military aid from ? to !*/ military assistance for !*/ weapons outlays for !*';
        329: GetString := '0* decreased to* declines to* trimmed to* slashed to*';
        330: GetString := '1* nothing* $20 million* $100 million* $400 million* $1 billion* $2 billion*';
        331: GetString := '3*. *';
        332: GetString := '0*@*/ spokesman*/ &*/ government*';
        333: GetString := '0* declares* maintains* announces* reports*';
        334: GetString := '0* ''? cannot accept''* refusal of* rejection of* ''? will not take''*';
        335: GetString := '0* full complement of > military equipment.* entire package of > military assistance.* complete > weapons aid.* all weapons offered by !*';
        336: GetString := '0*!*^*> +*!*';
        337: GetString := '0* accuses ? of* castigates ? for* complains that ? is* presents evidence that ? is*';
        338: GetString := '1* harboring* assisting* supporting* shipping weapons to* bankrolling* providing massive assistance to*';
        339: GetString := '0* # elements.* fighters in the #.* the # underground.* the #.*';
        340: GetString := '0*/ government*/ &*@*?*';
        341: GetString := '0* agrees to* promises to* vows to* accepts plan to*';
        342: GetString := '1* eliminate* slash* roll back* cut* reduce* curtail*';
        343: GetString := '0* aid to the > #.* funds for the > #.* assistance to the > #.* weapons shipments to the > #.*';

        348: GetString := '0*?*/ government*@*/ &*';
        349: GetString := '0* dispatches* sends* rushes* commits*';
        350: GetString := '1* nobody* military advisors* first combat troops* several military units* large military forces* massive military power*';
        351: GetString := '0* in support of > government.* to help > government.* at request of > +.* to assist > regime.*';
        352: GetString := '0*/ troops*/ military forces*/ soldiers*/ combat forces*';
        353: GetString := '0* in !* supporting > regime* stationed in !* based in !*';
        354: GetString := '1* pulled out* greatly reduced* scaled down* cut* reduced* trimmed*';
        355: GetString := '3*. *';
        356: GetString := '1*Last > military personnel*Last > military personnel*Most > troops*Many > soldiers*Some military forces from !*';
        357: GetString := '0* ejected* thrown out* forced home* asked to leave*';
        358: GetString := '0* by ?* by / &* by @* by / government*';
        359: GetString := '3*. *';
        360: GetString := '1*Nobody*Military advisors*Combat troops*Military units*Large military forces*Massive military forces*';
        361: GetString := '0* from ?* sent by / &* dispatched by @* from ?*';
        362: GetString := '0* intervene in support of rebels* invade > territory for rebels* attack > army units* enter > territory in support of rebels*';
        363: GetString := '0* in > conflict.* in civil war in !.* in > civil war.* in > war.*';
        364: GetString := '0*/ government*/ &*@*?*';
        365: GetString := '0* pulls out* recalls* brings home* disengages*';
        366: GetString := '1* all / troops* all but military advisors* most / forces* many / troops* half of invading force*';
        367: GetString := '0* from !.* from > war.* from > territory.* from !.*';
        368: GetString := '3*/ &*';
        369: GetString := '3* surrenders*';
        370: GetString := '3* to *';
        371: GetString := '3*> +.*';
        372: GetString := '0*/ &*& of ?*/ &*& of ?*';
        373: GetString := '1* consults with* publicly condemns* calls on other nations to condemn* pressures* exerts intense pressure on* wages diplomatic offensive against*';
        374: GetString := '0* > government* !* government of !* !*';
        375: GetString := '3*. *';
        376: GetString := '3*/ &*';
        377: GetString := '3* surrenders*';
        378: GetString := '3* to *';
        379: GetString := '3*> +.*';
        380: GetString := '3*/ &*';
        381: GetString := '3* vows to prosecute war*';
        382: GetString := '3* with ^*';
        383: GetString := '3* to the death.*';
        384: GetString := '0*/ &*& of ?*?*?*';
        385: GetString := '0* inks* signs* concludes* agrees to*';
        386: GetString := '1* no treaty* diplomatic relations concord* trade agreement* military bases concord* mutual defense pact* "total defense" agreement*';
        387: GetString := '0* with !.* with + of !.* with > +.* with + of !.*';
        388: GetString := '0*@*/ &*/ foreign minister*/ representative*';
        389: GetString := '0* cancels* tears up* voids* terminates*';
        390: GetString := '1* * diplomatic relations agreement* trade pact* military bases treaty* mutual defense concord* nuclear defence treaty* all relations*';
        391: GetString := '0* with !.* with !.* with > government.* with > government.*';
        392: GetString := '0*Angry / &*/ government*& of ?*@*';
        393: GetString := '0* cancels* voids* kills* terminates*';
        394: GetString := '4* * diplomatic relations treaty* trade agreement* military bases concord* mutual defense concord* nuclear defence treaty*';
        395: GetString := '0* with > government.* with > government.* with !.* with !.*';
        396: GetString := '0*/ &*& of ?*?*?*';
        397: GetString := '0* announces* declares* clears the way for* agrees to*';
        398: GetString := '1* a trade embargo against* restrictions on high-tech trade with* trade quotas on* tariffs against* normal trade relations with* favorable trade status for*';
        399: GetString := '3* !.*';
        400: GetString := '0*@*/ &*/ foreign minister*/ representative*';
        401: GetString := '0* declares* announces* declares* announces*';
        402: GetString := '3* trade restrictions*';
        403: GetString := '0* on !.* against !.* against > government.* on > government.*';

        412: GetString := '0*% soldiers*Small groups of citizens*Smiling crowds*Wildly cheering people*';
        413: GetString := '0* greet* turn out for* line parade route of* attend installation of*';
        414: GetString := '0* new &* new &* new &* new &*';
        415: GetString := '0* in @.* in capital.* and his inner circle.* and wife.*';
        416: GetString := '0*% forces*% soldiers*% fighters*% troops*';
        417: GetString := '0* triumphantly* jubilantly* exultantly*, flashing ''V'' sign,*';
        418: GetString := '0* occupy* move into* take control of* take charge of*';
        419: GetString := '0* @.* &''s residence.* / government buildings.* last government stronghold.*';

        424: GetString := '0*New regime*New &*New government*New leadership*';
        425: GetString := '1* executes* jails* ousts* replaces* takes over from*';
        426: GetString := '0* former &* previous &* former leader* previous leader*';
        427: GetString := '3*. *';

        492: GetString := '3*And*';
        493: GetString := '3* that''s*';
        494: GetString := '3* the*';
        495: GetString := '3* news.*';

        505: GetString := ' * * * * *';
        506: GetString := 'Spheres of Influence*USA solid*USA weak*USSR weak*USSR solid*';
        507: GetString := 'Major Events*None*Finlandization*Coup d''Etat*Revolution*';
        508: GetString := 'Prestige Value*Very little*Some*Much*Very much*';
        509: GetString := 'Insurgency*Peace*Terrorism*Guerrilla War*Civil War*';
        510: GetString := 'Likelihood of Coup d''Etat*Low*Moderate*High*Very High*';
        511: GetString := 'Likelihood of Finlandizing to USA*Low*Moderate*High*Very High*';
        512: GetString := 'Likelihood of Finlandizing to USSR*Low*Moderate*High*Very High*';
        513: GetString := 'Countries at War*At Peace* * *At War*';
        514: GetString := 'Diplomatic Attitudes of*Warm*Cordial*Cool*Hostile*';
        515: GetString := 'Military Aid Sent Out Of*None*$20-$100 million*$400 million*$1-$2 billion*';
        516: GetString := 'Aid to Insurgents Sent Out of*None*$20-$100 million*$400 million*$1-$2 billion*';
        517: GetString := 'Troops For Govts Sent Out Of*none*1,000-5,000 troops*20,000 troops*100,000-500,000 troops*';
        518: GetString := 'Troops For Rebels Sent Out Of*none*1,000-5,000 troops*20,000 troops*100,000-500,000 troops*';
        519: GetString := 'Economic Aid Sent Out of*None*$200-$400 million*$1 billion*$2-$4 billion*';
        520: GetString := 'Destabilization Efforts by*None*Minor*Significant*Major*';
        521: GetString := 'Treaty Relationships With*None*Relations*Military bases*Mutual Defense*';
        522: GetString := 'Pressure Applied by*None*Minor*Significant*Major*';
        523: GetString := 'Trade Policies of*Normal/Favored*Tariffs*Quotas*Embargo/No High-Tech*';
        524: GetString := 'Countries at War With*At peace* * *At war*';

        530: GetString := 'Diplomatic Attitudes Toward*Warm*Cordial*Cool*Hostile*';
        531: GetString := 'Military Aid Sent Into*None*$20-$100 million*$400 million*$1-$2 billion*';
        532: GetString := 'Aid to Insurgents Sent Into*None*$20-$100 million*$400 million*$1-$2 billion*';
        533: GetString := 'Troops For Govt Sent Into*none*1,000-5,000 troops*20,000 troops*100,000-500,000 troops*';
        534: GetString := 'Troops For Rebels Sent Into*none*1,000-5,000 troops*20,000 troops*100,000-500,000 troops*';
        535: GetString := 'Economic Aid Sent Into*None*$200-$400 million*$1 billion*$2-$4 billion*';
        536: GetString := 'Destabilization Against*None*Minor*Significant*Major*';
        537: GetString := 'Treaty Relationships With*None*Relations*Military bases*Mutual Defense*';
        538: GetString := 'Pressure Applied Against*None*Minor*Significant*Major*';
        539: GetString := 'Trade Policies Toward*Normal/Favored*Tariffs*Quotas*Embargo/No High-Tech*';
        540: GetString := 'Countries at War With*At Peace* * *At War*';

        700: GetString := '2*We*We*We*We*';
        701: GetString := '2* reject* reject* reject* reject*';
        702: GetString := '2* your* your* your* your*';
        703: GetString := '2* objection.* objection.* objection.* objection.*';
        704: GetString := '2*The Soviet*Our*The official*Our*';
        705: GetString := '2* response* reply* answer* reaction*';
        706: GetString := '2* is coming* is being sent* is on its way* will arrive*';
        707: GetString := '2* via the North Pole.* over your northern border.* by ICBM.* by missile courier.*';
        708: GetString := '2*The Soviet people*The USSR*The Soviet Union*Our forces*';
        709: GetString := '2* will defend* will protect* will fight for* will exert themselves for*';
        710: GetString := '2* this principle* this affair* Soviet rights* this matter*';
        711: GetString := '1* but would prefer a peaceful outcome.* if necessary.* regardless of cost.* to the last breath.* and emerge victorious.*';
        712: GetString := '2*This issue*The matter* This affair* Our policy*';
        713: GetString := '2* is* remains* is considered to be* is declared to be*';
        714: GetString := '1* of some significance* of great concern* of great importance* of extreme importance* absolutely vital*';
        715: GetString := '2* to the Soviet government.* to our government.* to our interests.* to our people.*';
        716: GetString := '2*The Soviet Union*The Soviet government*The USSR*The Soviet leadership*';
        717: GetString := '1* has considered and rejects the* will not countenance* is immune to* is invulnerable to* contemptuously rejects this*';
        718: GetString := '2* empty* hollow* desperate* imperialist*';
        719: GetString := '2* threats.* intimidation.* verbal abuse.* American rhetoric.*';
        720: GetString := '2*Your action*American aggression*This criminal activity*Such behavior*';
        721: GetString := '2* forces the USSR* requires us* leaves us no choice but* impels our government*';
        722: GetString := '2* to take* to resort to* to respond with* to execute*';
        723: GetString := '1* unambiguous steps.* strong measures.* decisive action.* our military options.* use of military force.*';
        724: GetString := '2*This matter*This affair*Our action*The Soviet policy*';
        725: GetString := '1* is thought to be outside the sphere of* is rightfully not subject to* does not defer to* will never be subject to* is absolutely not subject to*';
        726: GetString := '2* American* imperialist* capitalist* warmongering*';
        727: GetString := '2* meddling.* interference.* involvement.* intrusion.*';
        728: GetString := '2*The Soviet Union*The USSR*The Soviet government*The General Secretary*';
        729: GetString := '1* is disappointed with* deplores* condemns* will not tolerate* is outraged by*';
        730: GetString := '2* the American* this imperialist* this criminal* this capitalist*';
        731: GetString := '2* action.* behavior.* aggression.* provocation.*';
        732: GetString := '2*The Soviet Union*The USSR*The Soviet government*The Politburo*';
        733: GetString := '1* does not wish* sees no reason* has no intention* refuses* categorically refuses*';
        734: GetString := '2* to change* to modify* to alter* to reverse*';
        735: GetString := '2* its current course.* its present policy.* its course of action.* this policy.*';

        750: GetString := '2*We*We*We*We*';
        751: GetString := '2* acquiesce* acquiesce* acquiesce* acquiesce*';
        752: GetString := '2* to your* to your* to your* to your*';
        753: GetString := '2* objection.* objection.* objection.* objection.*';

        758: GetString := '2*The peace-loving USSR*The Soviet government*The Soviet Union*The General Secretary*';
        759: GetString := '2* has no desire to* refuses to* will not* is not willing to*';
        760: GetString := '2* start* initiate* begin* launch*';
        761: GetString := '2* a nuclear war.* a nuclear holocaust.* the end of the world.* a suicidal war.*';
        762: GetString := '2*The Soviet Union*The Soviet government*The General Secretary*The USSR*';
        763: GetString := '2* will appease* will yield to* accepts the demands of* responds to*';
        764: GetString := '2* American warmongers* imperialist aggressors* American provocateurs* capitalist warmongers*';
        765: GetString := '2* with this gesture of peace.* with a peaceful response.* with an act of cooperation.* with a cooperative initiative.*';
        766: GetString := '2*We*The Soviet people*Our leaders*The Soviet leaders*';
        767: GetString := '2* temporarily withdraw* defer* postpone* shelve*';
        768: GetString := '2* this legitimate* our just* this justified* our rightful*';
        769: GetString := '2* complaint.* grievance.* protest.* demand.*';
        770: GetString := '2*The Soviet leadership*The Soviet Union*Our government*The USSR*';
        771: GetString := '2* will redeploy* will refocus* will reconcentrate* will rearrange*';
        772: GetString := '2* its attentions* its efforts* its concerns* its activities*';
        773: GetString := '2* elsewhere.* to another area.* to another region.* to other sectors.*';
        774: GetString := '2*In the interests of peace,*In the interests of harmony,*As a peace-loving nation,*Despite American obstinacy,*';
        775: GetString := '2* the Soviet Union* the Soviet government* the USSR* the Soviet Union*';
        776: GetString := '2* will submit its complaint to* will present its case to* will make its rightful protest before* will ask for justice from*';
        777: GetString := '2* the United Nations.* the UN.* world opinion.* the United Nations.*';
        778: GetString := '2*The USSR*The Soviet people*The Soviet government*The Soviet Union*';
        779: GetString := '2* will honor* will respect* will accede to* will comply with*';
        780: GetString := '2* your* the American* the imperialist* this*';
        781: GetString := '2* request.* protest.* petition.* diplomatic note.*';
        782: GetString := '2*This matter*This affair*This policy*This action*';
        783: GetString := '2* is not vital to* does not directly impact* is not central to* is only peripheral to*';
        784: GetString := '2* Soviet* our* the USSR''s* Soviet*';
        785: GetString := '2* interests.* sphere of influence.* concerns.* correlation of forces.*';
        786: GetString := '2*We*Our leaders*Our government*Our leadership*';
        787: GetString := '2* did not mean* did not intend* did not wish* had no desire*';
        788: GetString := '2* to threaten* to violate* to intrude upon* to infringe upon*';
        789: GetString := '2* your vital interests.* American concerns.* your sphere of influence.* American interests.*';
        790: GetString := '2*The Soviet Union*The USSR*The Soviet government*The government of the USSR*';
        791: GetString := '1* requests reconsideration of* deplores* protests* demands reversal of*';
        792: GetString := '2* this action* this policy* this activity* this outrage*';
        793: GetString := '3*. *';

        804: GetString := '2*The American government*The President*The government*The President*';
        805: GetString := '2* sends* transmits* offers* expresses*';
        806: GetString := '2* condolences* regrets* consolation* sympathy*';
        807: GetString := '2* for your demise.* for the destruction of the USSR.* to the Russian people.* to the Soviet leadership.*';
        808: GetString := '2*American forces*US military forces*American military forces*Our military personnel*';
        809: GetString := '2* have been placed on* have moved to* are now on* have moved up to*';
        810: GetString := '2* maximum* the highest* a state of extreme* the maximum*';
        811: GetString := '2* alert.* preparedness.* defensive posture.* readiness.*';
        812: GetString := '2*The President*The United States government*The government of the US*The President*';
        813: GetString := '1* accepts the need* is prepared* is willing* will not hesitate* eagerly awaits the opportunity*';
        814: GetString := '2* to use* to employ* to bring to bear* to resort to*';
        815: GetString := '2* nuclear weaponry.* its full military power.* its most powerful weapons.* its nuclear arsenal.*';
        816: GetString := '2*Abusive rhetoric*Idle threats*Irresponsible talk*Ugly messages*';
        817: GetString := '2* will not intimidate* cannot sway* will have no effect on* will not deter*';
        818: GetString := '2* the government* the leaders* the President* the leadership*';
        819: GetString := '2* of the United States.* of the USA.* of this country.* of our nation.*';
        820: GetString := '2*We*The President*The United States*America*';
        821: GetString := '2* will respond* will react* will respond* will react*';
        822: GetString := '1* resolutely* vigorously* with determination* with forcefulness* militarily*';
        823: GetString := '2* to this Soviet aggression.* to this irresponsible behavior.* to Soviet terrorism.* to this brutal act of aggression.*';
        824: GetString := '2*Our government*The President*The United States*The US government*';
        825: GetString := '2* regards* considers* sees* views*';
        826: GetString := '2* this matter as* this policy as* this event as* this action as*';
        827: GetString := '1* having some importance.* a crucial concern.* important to US security.* critical to American security.* totally non-negotiable.*';
        828: GetString := '2* this matter as* this policy as* this event as* this action as*';
        829: GetString := '1* is concerned over* is disappointed by* deplores* denounces* condemns*';
        830: GetString := '2* this irresponsible* this dangerous* this high-handed* this unjustifiable*';
        831: GetString := '2* action.* policy.* behavior.* activity.*';
        832: GetString := '2*The United States of America*The US President*The US government*The USA*';
        833: GetString := '1* does not understand* regretfully denies* will not honor* refuses to consider* absolutely rejects*';
        834: GetString := '2* the Soviet* your government''s* this diplomatic note''s* this unjustified*';
        835: GetString := '2* objection.* reaction.* challenge.* request.*';

        858: GetString := '2*The United States*The President*America*This government*';
        859: GetString := '2* will not* refuses to* shall not* will not*';
        860: GetString := '2* drag the world into* initiate* touch off* launch*';
        861: GetString := '2* a thermonuclear war.* Armageddon.* a nuclear holocaust.* nuclear destruction.*';
        862: GetString := '2*America*The government*The President*The United States*';
        863: GetString := '2* will yield to* will accept* will acquiesce to* will honor*';
        864: GetString := '2* this outrageous* this irresponsible* this unfair* this heavy-handed*';
        865: GetString := '2* demand.* ultimatum.* claim.* message.*';
        866: GetString := '2*We*The USA*The President*The National Security Council*';
        867: GetString := '2* will refer* will take* will present* will submit*';
        868: GetString := '2* this outrage* this affair* this matter* this dispute*';
        869: GetString := '2* to the United Nations.* to the UN.* to the court of world opinion.* to the General Assembly.*';
        870: GetString := '2*This dispute*This disagreement*This conflict*This misunderstanding*';
        871: GetString := '2* is not vital to* is not a major factor in* does not directly bear on* will not directly affect*';
        872: GetString := '2* the security of* the interests of* the concerns of* the sphere the influence of*';
        873: GetString := '2* the United States government.* the USA.* America.* the United States.*';
        874: GetString := '2*The United States*The President*The US government*The USA*';
        875: GetString := '2* will overlook* will not act on* will tolerate* will accept*';
        876: GetString := '2* this* this* this* this*';
        877: GetString := '2* action.* policy.* behavior.* activity.*';
        878: GetString := '2*The USA*The US government*The President*The United States*';
        879: GetString := '2* will honor* will abide by* accepts* responds favorably to*';
        880: GetString := '2* the Soviet* the USSR''s* the General Secretary''s* the Soviet*';
        881: GetString := '2* request.* message.* diplomatic note.* communication.*';
        882: GetString := '2*The USA*The US government*The President*The United States*';
        883: GetString := '2* understands* respects* accepts* honors*';
        884: GetString := '2* the Soviet* the USSR''s* the General Secretary''s* the Soviet*';
        885: GetString := '2* concerns.* message.* diplomatic note.* communication.*';
        886: GetString := '2*This matter*This action*Our policy*Our action*';
        887: GetString := '2* was not meant to* should not* must not* was not intended to*';
        888: GetString := '2* come between* heighten tensions between* cause difficulties between* generate problems for*';
        889: GetString := '2* our two nations.* the two superpowers.* the USA and the USSR.* the two of us.*';
        890: GetString := '2*The USA*The United States*The President*The US government*';
        891: GetString := '2* requests reconsideration of* deplores* protests* demands reversal of*';
        892: GetString := '2* this* this* this* this*';
        893: GetString := '2* policy.* activity.* action.* behavior.*';

        900: GetString := '0*Farrah*Jackie Onassis*Liz Taylor*Michael Jackson*';
        901: GetString := '0* predicts future* dying of cancer, claims* searching for* abducted by flying saucers, reveals*';
        902: GetString := '0* cure for cancer in sex* impending earthquake in California* reincarnation of Elvis* revolutionary diet plan*';
        903: GetString := '3*. *';

        908: GetString := '3*End*';
        909: GetString := '3* of*';
        910: GetString := '3* folder*';
        911: GetString := '3*.*';

        912: GetString := '0*Market share of*Demand for*Critics'' praise for*Public reaction to*';
        913: GetString := '3* Trust and Betrayal*';
        914: GetString := '0* skyrockets;* sets new records;* goes through the ceiling;* exceeds all predictions;*';
        915: GetString := '0* Mindscape buys Wall Street.* economy boosted.* analysts jubilant.* President declares day of thanksgiving.*';

        920: GetString := '3*Beginning*';
        921: GetString := '3* of*';
        922: GetString := '3* folder*';
        923: GetString := '3*.*';

        952: GetString := '3*Go ahead,*';
        953: GetString := '3* make*';
        954: GetString := '3* my*';
        955: GetString := '3* day.*';

        960: GetString := '2*Our leaders*We*Our leaders*We*';
        961: GetString := '2* will retain* have decided to preserve* will stand by* will retain*';
        962: GetString := '2* this* our* this* our*';
        963: GetString := '2* policy.* action.* decision.* policy.*';
        964: GetString := '2*We*Our leaders*We*Our leaders*';
        965: GetString := '2* will not abandon* do not regret* will not yield on* will not revoke*';
        966: GetString := '2* our* this* this* our*';
        967: GetString := '2* policy.* action.* decision.* course of action.*';
        968: GetString := '2*This policy*Our action*Our decision*This action*';
        969: GetString := '2* is not subject to* does not defer to* will not be deterred by* is immune to*';
        970: GetString := '2* superpower* foreign* your* superpower*';
        971: GetString := '2* whims.* pressures.* objections.* objections.*';
        972: GetString := '2*Your*Your*Your*Your*';
        973: GetString := '2* protest* objection* protest* objection*';
        974: GetString := '2* has been* will be* has been* has been*';
        975: GetString := '2* noted without action.* recorded.* rejected.* duly observed, but not heeded.';
        976: GetString := '2* superpower* foreign* your* superpower*';
        977: GetString := '2* will not* shall not* will not* shall not*';
        978: GetString := '2* yield to* acquiesce to* defer to* submit to*';
        979: GetString := '2* your objection.* your insistence.* your demands.* your importunations.*';
        980: GetString := '2*We*We*We*We*';
        981: GetString := '2* acquiesce* acquiesce* acquiesce* acquiesce*';
        982: GetString := '2* to your* to your* to your* to your*';
        983: GetString := '2* objection.* objection.* objection.* objection.*';

        1001: GetString := 'American*Washington*President*Republican party*Democratic party*DuckBush*';
        1002: GetString := 'Soviet*Moscow*General Secretary*Communist party*human-rights activist*Gorbachev*';
        1003: GetString := 'Mexican*Mexico City*President*insurgency*insurgency*de la Madrid*';
        1004: GetString := 'Honduran*Tegucigalpa*President*insurgency*Miskito*Cordoba*';
        1005: GetString := 'Nicaraguan*Managua*President*Sandinista*Contra*Ortega*';
        1006: GetString := 'Panamanian*Panama City*President*insurgency*insurgency*Noriega*';
        1007: GetString := 'Cuban*Havana*President*Castroite movement*insurgency*Castro*';
        1008: GetString := 'Argentinian*Buenos Aires*President*insurgency*Peronista*Alfonsin*';
        1009: GetString := 'Colombian*Bogota*President*M-19*insurgency*Cuartas*';
        1010: GetString := 'Peruvian*Lima*President*Sendero Luminoso*insurgency*Perez*';
        1011: GetString := 'Venezuelan*Caracas*President*insurgency*insurgency*Lusinchi*';
        1012: GetString := 'Brazilian*Brasilia*President*insurgency*insurgency*Sarney*';
        1013: GetString := 'Chilean*Santiago*President*MRPF*insurgency*Pinochet*';
        1014: GetString := 'Canadian*Ottawa*Prime Minister*Quebecois*insurgency*Mulroney*';
        1015: GetString := 'Greek*Athens*Prime Minister*\"November 17\" group*insurgency*Papandreu*';
        1016: GetString := 'Swedish*Stockholm*Prime Minister*insurgency*insurgency*Svenson*';
        1017: GetString := 'British*London*Prime Minister*IRA*insurgency*Thatcher*';
        1018: GetString := 'French*Paris*President*Direct Action*insurgency*Mitterand*';
        1019: GetString := 'Spanish*Madrid*Prime Minister*FP-25*insurgency*Gonzales*';
        1020: GetString := 'West German*Bonn*Prime Minister*Red Army*insurgency*Kohl*';
        1021: GetString := 'Romanian*Bucharest*President*insurgency*counter-revolutionary*Ceasescu*';
        1022: GetString := 'Italian*Rome*Prime Minister*Red Brigade*insurgency*Craxi*';
        1023: GetString := 'East German*East Berlin*Party Leader*insurgency*insurgency*Honecker*';
        1024: GetString := 'Polish*Warsaw*Military Commander*insurgency*Solidarity*Jaruzelski*';
        1025: GetString := 'Czechoslovakian*Prague*General Secretary*Communist party*insurgency*Husak*';
        1026: GetString := 'Yugoslavian*Belgrade*President*Communist party*Albanikos*Spiljak*';
        1027: GetString := 'South African*Pretoria*Prime Minister*African National Congress*insurgency*Botha*';
        1028: GetString := 'Egyptian*Cairo*President*Moslem fundamentalist*insurgency*Mubarek*';
        1029: GetString := 'Tunisian*Tunis*President*insurgency*insurgency*Mzali*';
        1030: GetString := 'Moroccan*Rabat*King*Polisario*insurgency*Hassan*';
        1031: GetString := 'Algerian*Algiers*President*Kabylian*insurgency*Chadli*';
        1032: GetString := 'Libyan*Tripoli*Military Leader*Alborkan*insurgency*Khaddafi*';
        1033: GetString := 'Malian*Bamako*President*insurgency*insurgency*Traore*';
        1034: GetString := 'Nigerian*Lagos*President*insurgency*insurgency*Bagangida*';
        1035: GetString := 'Sudanese*Khartoum*General*Anya-Nya*insurgency* al Dahab*';
        1036: GetString := 'Ethiopian*Addis Ababa*Colonel*Eritrean LF*insurgency*Mengistu*';
        1037: GetString := 'Kenyan*Nairobi*President*insurgency*insurgency*Moi*';
        1038: GetString := 'Zairian*Kinshasa*President*FNLC*insurgency*Mobutu*';
        1039: GetString := 'Tanzanian*Dar es Salaam*President*insurgency*insurgency*Nyerere*';
        1040: GetString := 'Mozambiquean*Maputo*President*Makonde*insurgency*Machel*';
        1041: GetString := 'Zambian*Lusaka*President*insurgency*insurgency*Kaunda*';
        1042: GetString := 'Angolan*Luanda*President*insurgency*UNITA*dos Santos*';
        1043: GetString := 'Japanese*Tokyo*Prime Minister*Red Army*insurgency*Nakasone*';
        1044: GetString := 'North Korean*Pyongyang*President*insurgency*insurgency*Kim il Sung*';
        1045: GetString := 'South Korean*Seoul*General*Communist party*insurgency*Chon doo Huan*';
        1046: GetString := 'Australian*Canberra*Prime Minister*Aborigine Liberation Front*Black Koala Movement*Hawke*';
        1047: GetString := 'Chinese*Beijing*Party Secretary*Communist party*counter-revolutionary movement*Deng*';
        1048: GetString := 'VietNamese*Hanoi*Party Chairman*Khmer Rouge*insurgency*Le Duan*';
        1049: GetString := 'Turkish*Ankara*President*insurgency*insurgency*Ozal*';
        1050: GetString := 'Syrian*Damascus*President*Muslim Brotherhood*insurgency*Assad*';
        1051: GetString := 'Israeli*Jerusalem*Prime Minister*PLO*insurgency*Peres*';
        1052: GetString := 'Taiwanese*Taipei*President*Communist party*insurgency*Ching-kuo*';
        1053: GetString := 'Iraqi*Baghdad*President*Sunni sect*insurgency*Hussein*';
        1054: GetString := 'Saudi*Riyadh*King*Shiite extremist group*insurgency*Fahd*';
        1055: GetString := 'Iranian*Teheran*Ayatollah*Tudeh*insurgency*Khomeini*';
        1056: GetString := 'Afghan*Kabul*President*Communist party*Mujahedin*Najibullah*';
        1057: GetString := 'Pakistani*Islamabad*President*Pushtun*insurgency*Zia*';
        1058: GetString := 'Indian*New Delhi*Prime Minister*Sikh movement*insurgency*Ghandi*';
        1059: GetString := 'Burmese*Rangoon*President*Kachin tribe*insurgency* U San Yu*';
        1060: GetString := 'Thai*Bangkok*President*insurgents*insurgency*Tinsulananda*';
        1061: GetString := 'Indonesian*Jakarta*President*Communist party*insurgency*Suharto*';
        1062: GetString := 'Filipino*Manila*President*New People''s Army*insurgency*Aquino*';
        1063: GetString := 'Guatemalan*Guatemala City*General*insurgency*insurgency*Victores*';
        1064: GetString := 'Salvadoran*San Salvador*President*PLF*insurgency*Duarte*';
        1065: GetString := 'Costa Rican*San Jose*President*insurgency*insurgency*Arias*';
        1066: GetString := 'Mauritanian*Nouakchott*President*insurgency*insurgency*Taya*';
        1067: GetString := 'Guinean*Conakry*Colonel*insurgency*insurgency*Konte*';
        1068: GetString := 'Ivory Coast*Abidjan*President*insurgency*insurgency*Houphouet-Boigny*';
        1069: GetString := 'Burkina-be*Ouagadougou*President*insurgency*insurgency*Smith*';
        1070: GetString := 'Ghanan*Accra*President*insurgency*insurgency*Rawlings*';
        1071: GetString := 'Nigeran*Niamey*General*insurgency*insurgency*Kountche*';
        1072: GetString := 'Chadian*N''Djamena*President*insurgency*insurgency*Habre*';
        1073: GetString := 'Cameroonian*Yaounde*President*insurgency*insurgency*Biya*';
        1074: GetString := 'Central African*Bangui*General*insurgency*insurgency*Kolingba*';
        1075: GetString := 'Congoan*Brazzaville*Colonel*insurgency*insurgency*N''Guesso*';
        1076: GetString := 'Zimbabwean*Harare*President*ZAPU*insurgency*Mugabe*';
        1077: GetString := 'Botswanan*Gaborone*President*insurgency*insurgency*Masire*';
        1078: GetString := 'Jordanian*Amman*King*insurgency*insurgency*Hussein*';
        1079: GetString := 'Lebanese*Beirut*President*insurgency*insurgency*Gemayel*';
        1080: GetString := 'Bolivian*La Paz*President*insurgency*insurgency*Estenssoro*';

        1200: GetString := 'INSURGCYWEAPONS INTRVENESTABILTYCOUP PCYDIP RELNFINLAND?FINL PCYINSECRTY';
    end;
end;

FUNCTION GetIndString(i: Integer; j: Integer): String;
BEGIN
    GetIndString := '';
    CASE i OF
        520:
            CASE j OF
                1: GetIndString := 'Relationship:';
                2: GetIndString := 'Enemy';
                3: GetIndString := 'Hostile';
                4: GetIndString := 'Cold';
                5: GetIndString := 'Cool';
                6: GetIndString := 'Neutral';
                7: GetIndString := 'Cordial';
                8: GetIndString := 'Friendly';
                9: GetIndString := 'Warm';
                10: GetIndString := 'Close';
            end;
        522:
            CASE j OF
                1: GetIndString := 'Military Aid:';
                2: GetIndString := '$0 million';
                3: GetIndString := '$20 million';
                4: GetIndString := '$100 million';
                5: GetIndString := '$400 million';
                6: GetIndString := '$1 billion';
                7: GetIndString := '$2 billion';
            end;
        523:
            CASE j OF
                1: GetIndString := 'Insurgency Aid:';
                2: GetIndString := '$0 million';
                3: GetIndString := '$20 million';
                4: GetIndString := '$100 million';
                5: GetIndString := '$400 million';
                6: GetIndString := '$1 billion';
                7: GetIndString := '$2 billion';
            end;
        524:
            CASE j OF
                1: GetIndString := 'Intervene--govt:';
                2: GetIndString := '0 troops';
                3: GetIndString := '1,000 troops';
                4: GetIndString := '5,000 troops';
                5: GetIndString := '20,000 troops';
                6: GetIndString := '100,000 troops';
                7: GetIndString := '500,000 troops';
            end;
        525:
            CASE j OF
                1: GetIndString := 'Intervene--rebs:';
                2: GetIndString := '0 troops';
                3: GetIndString := '1,000 troops';
                4: GetIndString := '5,000 troops';
                5: GetIndString := '20,000 troops';
                6: GetIndString := '100,000 troops';
                7: GetIndString := '500,000 troops';
            end;
        526:
            CASE j OF
                1: GetIndString := 'Economic Aid:';
                2: GetIndString := '$0 million';
                3: GetIndString := '$200 million';
                4: GetIndString := '$400 million';
                5: GetIndString := '$1 billion';
                6: GetIndString := '$2 billion';
                7: GetIndString := '$4 billion';
            end;
        527:
            CASE j OF
                1: GetIndString := 'Destabilization:';
                2: GetIndString := 'No activity';
                3: GetIndString := 'Help dissidents';
                4: GetIndString := 'Fund opposition';
                5: GetIndString := 'Incite riots';
                6: GetIndString := 'Assassinations';
                7: GetIndString := 'Support coup';
            end;
        528:
            CASE j OF
                1: GetIndString := 'Pressure:';
                2: GetIndString := 'None';
                3: GetIndString := 'Quiet Diplomacy';
                4: GetIndString := 'Public Posturing';
                5: GetIndString := 'Moderate Pressure';
                6: GetIndString := 'Intense Pressure';
                7: GetIndString := 'Diplomatic Offensive';
            end;
        529:
            CASE j OF
                1: GetIndString := 'Treaty:';
                2: GetIndString := 'No relations';
                3: GetIndString := 'Diplomatic relns';
                4: GetIndString := 'Trade relations';
                5: GetIndString := 'Military bases';
                6: GetIndString := 'Convtnl defense';
                7: GetIndString := 'Nuclear defense';
            end;
        530:
            CASE j OF
                1: GetIndString := 'Finlandization?';
                2: GetIndString := 'Invulnerable';
                3: GetIndString := 'Low';
                4: GetIndString := 'Moderate';
                5: GetIndString := 'High';
                6: GetIndString := 'Very High';
            end;
        531:
            CASE j OF
                1: GetIndString := 'Annual Change:';
                2: GetIndString := 'Huge decrease';
                3: GetIndString := 'Large decrease';
                4: GetIndString := 'Moderate decrease';
                5: GetIndString := 'Small decrease';
                6: GetIndString := 'Tiny decrease';
                7: GetIndString := 'Tiny increase';
                8: GetIndString := 'Small increase';
                9: GetIndString := 'Moderate increase';
                10: GetIndString := 'Large increase';
                11: GetIndString := 'Huge increase';
            end;
        550:
            CASE j OF
                1: GetIndString := 'They will ream us on this one!';
                2: GetIndString := 'They''ve got a lock on this one.';
                3: GetIndString := 'Give it up; it''s hopeless.';
                4: GetIndString := 'Don''t touch this one.';
                5: GetIndString := 'They''ve got us cold.';
                6: GetIndString := 'Back down.';
                7: GetIndString := 'This one is theirs.';
                8: GetIndString := 'We''ve got no case here.';
                9: GetIndString := 'Not this time.';
                10: GetIndString := 'We can''t win this.';
                11: GetIndString := 'They won''t back down.';
                12: GetIndString := 'This is not worth fighting over.';
                13: GetIndString := 'I don''t think we can win this.';
                14: GetIndString := 'This is a fight I''d rather avoid.';
                15: GetIndString := 'This is a touch risky.';
                16: GetIndString := 'We can go either way here.';
                17: GetIndString := 'This is a very close judgment call.';
                18: GetIndString := 'Perhaps we should give it a whirl.';
                19: GetIndString := 'I think we can win this.';
                20: GetIndString := 'Don''t be afraid.';
                21: GetIndString := 'I think we should go for it.';
                22: GetIndString := 'We can win this one.';
                23: GetIndString := 'They''ll back down.';
                24: GetIndString := 'They''re out of line here.';
                25: GetIndString := 'Stand firm on this.';
                26: GetIndString := 'We''ve got them cold.';
                27: GetIndString := 'They really goofed this time.';
                28: GetIndString := 'This one is ours.';
                29: GetIndString := 'Don''t let them get away with this.';
                30: GetIndString := 'Jump all over them.';
                31: GetIndString := 'Stick it to ''em!';
                32: GetIndString := 'Nuke ''em!';
            end;
        589:
            CASE j OF
                1: GetIndString := 'Error1';
                2: GetIndString := 'Insist';
                3: GetIndString := 'Error2';
                4: GetIndString := 'Protest';
                5: GetIndString := 'Error3';
                6: GetIndString := 'Press';
                7: GetIndString := 'Error4';
                8: GetIndString := 'Implore';
                9: GetIndString := 'Error5';
                10: GetIndString := 'Question';
            end;
        590:
            CASE j OF
                1: GetIndString := 'Too Late';
                2: GetIndString := 'DefCon 1';
                3: GetIndString := 'DefCon 2';
                4: GetIndString := 'DefCon 3';
                5: GetIndString := 'DefCon 4';
                6: GetIndString := 'Threaten';
                7: GetIndString := 'Refuse';
                8: GetIndString := 'Challenge';
                9: GetIndString := 'Reject';
                10: GetIndString := 'Question';
            end;
        596:
            CASE j OF
                1: GetIndString := '0 million$';
                2: GetIndString := '0 million$';
                3: GetIndString := ',000 men';
                4: GetIndString := ',000 men';
                5: GetIndString := '00 million$';
            end;
        597:
            CASE j OF
                1: GetIndString := 'Newspaper';
                2: GetIndString := 'USSR Actions';
                3: GetIndString := 'USSR Other';
                4: GetIndString := 'USA Actions';
                5: GetIndString := 'USA Other';
                6: GetIndString := 'Minor Country News';
                7: GetIndString := 'Last Year';
                8: GetIndString := 'Last Year';
           end;
        630:
            CASE j OF
                1: GetIndString := 'Insurgency:';
                2: GetIndString := 'Civil war';
                3: GetIndString := 'Major guerrilla war';
                4: GetIndString := 'Minor guerrilla war';
                5: GetIndString := 'Rampant terrorism';
                6: GetIndString := 'Minor terrorism';
                7: GetIndString := 'Slight unrest';
                8: GetIndString := 'Peaceful';
            end;
        631:
            CASE j OF
                1: GetIndString := 'Govt Philosophy:';
                2: GetIndString := 'Extreme left';
                3: GetIndString := 'Extreme left';
                4: GetIndString := 'Far left';
                5: GetIndString := 'Very left';
                6: GetIndString := 'Left';
                7: GetIndString := 'Moderate left';
                8: GetIndString := 'Slight left';
                9: GetIndString := 'Centrist';
                10: GetIndString := 'Slight right';
                11: GetIndString := 'Moderate right';
                12: GetIndString := 'Right';
                13: GetIndString := 'Very right';
                14: GetIndString := 'Far right';
                15: GetIndString := 'Extreme right';
                16: GetIndString := 'Extreme right';
                17: GetIndString := 'Extreme right';
            end;
        632:
            CASE j OF
                1: GetIndString := 'Military Power:';
                2: GetIndString := 'Insignificant';
                3: GetIndString := 'Very weak';
                4: GetIndString := 'Weak';
                5: GetIndString := 'Minor';
                6: GetIndString := 'Moderate';
                7: GetIndString := 'Strong';
                8: GetIndString := 'Very strong';
                9: GetIndString := 'SuperPower';
            end;
        633:
            CASE j OF
                1: GetIndString := 'Sphere of Influence:';
                2: GetIndString := 'Absolutely USSR';
                3: GetIndString := 'Very strongly USSR';
                4: GetIndString := 'Strongly USSR';
                5: GetIndString := 'Moderately USSR';
                6: GetIndString := 'Fairly USSR';
                7: GetIndString := 'Slightly USSR';
                8: GetIndString := 'Neither';
                9: GetIndString := 'Slightly USA';
                10: GetIndString := 'Fairly USA';
                11: GetIndString := 'Moderately USA';
                12: GetIndString := 'Strongly USA';
                13: GetIndString := 'Very Strongly USA';
                14: GetIndString := 'Absolutely USA';
            end;
        634:
            CASE j OF
                1: GetIndString := 'Govt Stability:';
                2: GetIndString := 'About to fall';
                3: GetIndString := 'Very shaky';
                4: GetIndString := 'Shaky';
                5: GetIndString := 'Weak';
                6: GetIndString := 'Fair';
                7: GetIndString := 'Stable';
                8: GetIndString := 'Strong';
                9: GetIndString := 'Very strong';
            end;
        635:
            CASE j OF
                1: GetIndString := 'Weakening quickly';
                2: GetIndString := 'Weakening';
                3: GetIndString := 'Weakening slowly';
                4: GetIndString := 'Strengthening slowly';
                5: GetIndString := 'Strengthening';
                6: GetIndString := 'Strengthening quickly';
            end;
        636:
            CASE j OF
                1: GetIndString := 'Insurgency growing';
                2: GetIndString := 'Insurgency weakening';
            end;
        640:
            CASE j OF
                1: GetIndString := 'Beginner';
                2: GetIndString := 'Intermediate';
                3: GetIndString := 'Expert';
                4: GetIndString := 'Multipolar';
            end;
        641:
            CASE j OF
                1: GetIndString := 'Insignificant';
                2: GetIndString := 'Very low';
                3: GetIndString := 'Low';
                4: GetIndString := 'Moderate';
                5: GetIndString := 'Considerable';
                6: GetIndString := 'High';
                7: GetIndString := 'Very high';
                8: GetIndString := 'Utmost';
            end;
    end;
end;

FUNCTION GetMakePoliciesDialogHeader(i: Integer): String;
BEGIN
    GetMakePoliciesDialogHeader := '';
    CASE i OF
        128: GetMakePoliciesDialogHeader := 'Destabilize';
        129: GetMakePoliciesDialogHeader := 'Economic Aid To';
        130: GetMakePoliciesDialogHeader := 'Military Aid To';
        131: GetMakePoliciesDialogHeader := 'Aid to Insurgents in';
        132: GetMakePoliciesDialogHeader := 'Intervene for Govt of';
        133: GetMakePoliciesDialogHeader := 'Intervene for Rebels in';
        134: GetMakePoliciesDialogHeader := 'Diplomatic pressure:';
        135: GetMakePoliciesDialogHeader := 'Treaty with';
        136: GetMakePoliciesDialogHeader := 'Trade Policy with';
    end;
end;

FUNCTION GetMakePoliciesDialogText(i: Integer; j: Integer): String;
BEGIN
    GetMakePoliciesDialogText := '';
    CASE i OF
        128:
            CASE j OF
                1: GetMakePoliciesDialogText := 'No activity';
                2: GetMakePoliciesDialogText := 'Encourage dissidents';
                3: GetMakePoliciesDialogText := 'Fund opposition';
                4: GetMakePoliciesDialogText := 'Incite riots';
                5: GetMakePoliciesDialogText := 'Provoke assassinations';
                6: GetMakePoliciesDialogText := 'Support coup d''etat';
            end;
        129:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Nothing';
                2: GetMakePoliciesDialogText := '$200 million';
                3: GetMakePoliciesDialogText := '$400 million';
                4: GetMakePoliciesDialogText := '$1 billion';
                5: GetMakePoliciesDialogText := '$2 billion';
                6: GetMakePoliciesDialogText := '$4 billion';
            end;
        130:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Nothing';
                2: GetMakePoliciesDialogText := '$20 million';
                3: GetMakePoliciesDialogText := '$100 million';
                4: GetMakePoliciesDialogText := '$400 million';
                5: GetMakePoliciesDialogText := '$1 billion';
                6: GetMakePoliciesDialogText := '$2 billion';
            end;
        131:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Nothing';
                2: GetMakePoliciesDialogText := '$20 million';
                3: GetMakePoliciesDialogText := '$100 million';
                4: GetMakePoliciesDialogText := '$400 million';
                5: GetMakePoliciesDialogText := '$1 billion';
                6: GetMakePoliciesDialogText := '$2 billion';
            end;
        132:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Nothing';
                2: GetMakePoliciesDialogText := '1,000 troops';
                3: GetMakePoliciesDialogText := '5,000 troops';
                4: GetMakePoliciesDialogText := '20,000 troops';
                5: GetMakePoliciesDialogText := '100,000 troops';
                6: GetMakePoliciesDialogText := '500,000 troops';
            end;
        133:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Nothing';
                2: GetMakePoliciesDialogText := '1,000 troops';
                3: GetMakePoliciesDialogText := '5,000 troops';
                4: GetMakePoliciesDialogText := '20,000 troops';
                5: GetMakePoliciesDialogText := '100,000 troops';
                6: GetMakePoliciesDialogText := '500,000 troops';
            end;
        134:
            CASE j OF
                1: GetMakePoliciesDialogText := 'None';
                2: GetMakePoliciesDialogText := 'Quiet diplomacy';
                3: GetMakePoliciesDialogText := 'Public posturing';
                4: GetMakePoliciesDialogText := 'Moderate pressure';
                5: GetMakePoliciesDialogText := 'Intense pressure';
                6: GetMakePoliciesDialogText := 'Diplomatic offensive';
            end;
        135:
            CASE j OF
                1: GetMakePoliciesDialogText := 'No relations';
                2: GetMakePoliciesDialogText := 'Diplomatic relations';
                3: GetMakePoliciesDialogText := 'Trade relations';
                4: GetMakePoliciesDialogText := 'Military bases';
                5: GetMakePoliciesDialogText := 'Conventional defense';
                6: GetMakePoliciesDialogText := 'Nuclear defense';
            end;
        136:
            CASE j OF
                1: GetMakePoliciesDialogText := 'Embargo';
                2: GetMakePoliciesDialogText := 'No high-tech items';
                3: GetMakePoliciesDialogText := 'Trade Quotas';
                4: GetMakePoliciesDialogText := 'Stiff tariffs';
                5: GetMakePoliciesDialogText := 'Normal trade';
                6: GetMakePoliciesDialogText := 'Favored trade';
            end;
    end;
end;

end.

