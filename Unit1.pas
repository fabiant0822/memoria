unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Menus, ExtDlgs,consts,
  Spin;

type
  Tfrm1 = class(TForm)
    pC: TPageControl;
    tbJatek: TTabSheet;
    TabSheet2: TTabSheet;
    Menu: TMainMenu;
    mJatek: TMenuItem;
    mKilepes: TMenuItem;
    mBeallitasok: TMenuItem;
    OpenP: TOpenPictureDialog;
    pKepek: TPanel;
    lKepek: TListBox;
    Panel1: TPanel;
    ITesztnezet: TImage;
    tEltuntet: TTimer;
    pPontKiir: TPanel;
    mInfo: TMemo;
    pKepcsere: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    sMag: TSpinEdit;
    Label3: TLabel;
    sSzel: TSpinEdit;
    GroupBox2: TGroupBox;
    pJ1P: TPanel;
    GroupBox3: TGroupBox;
    pProba: TPanel;
    lJ1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    PROCEDURE ImgClick(Sender:TObject);
    FUNCTION Lap(tagsorszam:integer;Tag:boolean):TImage;
    PROCEDURE KepAd(Mibe:TImage;mit:string);
    procedure bTorolClick(Sender: TObject);
    procedure lKepekClick(Sender: TObject);
    procedure mJatekClick(Sender: TObject);
    procedure tEltuntetTimer(Sender: TObject);
    procedure mBeallitasokClick(Sender: TObject);
    procedure pKepcsereClick(Sender: TObject);
    procedure mKilepesClick(Sender: TObject);
    procedure lKepekDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1: Tfrm1;
  db:word;
  i,j:integer;
  fnev:string;
  utolso,
  utolsoelotti:string;
implementation

{$R *.dfm}

FUNCTION Tfrm1.Lap(tagsorszam:integer;Tag:boolean):TImage;
var i,j:integer;
begin
  Result:=NIL;
  j:=tbJatek.ComponentCount;
  i:=0;
  while(i<j)and(Result=NIL)do
  begin
    if(tbJatek.Components[i] is TImage)then
      if(((tbJatek.Components[i] as TImage).Tag=tagsorszam)and(Tag=True))
      or
      (((tbJatek.Components[i] as TImage).Hint=IntToStr(tagsorszam))and(Tag=False))
      then
        Result:=(tbJatek.Components[i] as TImage);
    Inc(i);
  end;
end;

PROCEDURE Tfrm1.KepAd(Mibe:TImage;mit:string);
var sr:TSearchRec; mit1:integer;
begin
  mit1:=StrToInt(mit);
  if(mit1<=lKepek.Items.Count-1)then
  if(FindFirst(lKepek.Items[mit1],faAnyFile,sr)=0)then
    Mibe.Picture.LoadFromFile(lKepek.Items[mit1])
  else
   MessageDlg('Egy vagy t�bb k�p�llom�ny nem tal�lhat�!'+#13#10+'N�zd v�gig a "Szerepl� k�pek" list�t, �s cser�ld azt, ami nem tal�lhat�!',mtWarning,[mbOk],0);
end;

procedure Tfrm1.FormClose(Sender: TObject; var Action: TCloseAction);
var i,j:integer;
begin

  i:=0;
  j:=tbJatek.ComponentCount;
  while(i<j)do
  begin
   if(tbJatek.Components[i] is TImage)then
   begin
     TImage(tbJatek.Components[i]).Free;
     Dec(j);
   end;{if(tbJatek.Components[i] is TImage)}
   Inc(i);
  end;{while}

  lKepek.Items.SaveToFile(fnev+'kepek.txt');
end;

procedure Tfrm1.FormCreate(Sender: TObject);
var sr:TSearchRec; Img:TImage; i,j:integer; hiba:boolean;
begin
  Randomize;
  fnev:=ExtractFileDir(ParamStr(0))+'\';
  if(FindFirst(fnev+'kepek.txt',faAnyFile,sr)=0)then
  lKepek.Items.LoadFromFile(fnev+'kepek.txt')
  else
  begin
    MessageDlg('Nem tal�lhat� a k�peket tartalmaz� "kepek.txt" �llom�ny!'+#13#10+'A k�peket tartalmaz� list�t felt�lt�ttem a szabv�nyos nevekkel,'+#13#10+'de val�sz�n�leg cser�lgetni kell a rendelkez�sre �ll�kkal!',mtWarning,[mbOk],0);
    for i:=1to 19do
    lKepek.Items.Add(IntToStr(i)+'.bmp');
  end;{if(FindFirst(fnev+'kepek.txt',faAnyFile,sr)<>0)}

  j:=lKepek.Items.Count;
  i:=0;
  hiba:=False;
  while(i<j)and(hiba=False)do
  begin
    if(FindFirst(lKepek.Items[i],faAnyFile,sr)<>0)then hiba:=True;
    Inc(i);
  end;{while}
  if(hiba=True)then
  begin
    MessageDlg('Egy vagy t�bb k�p�llom�ny nem tal�lhat�!'+#13#10+'N�zd v�gig a "Szerepl� k�pek" list�t, �s cser�ld azt, ami nem tal�lhat�!',mtWarning,[mbOk],0);
  end;
  mJatek.Enabled:=not(hiba);

  db:=0;
  for i:=0to 5do
  for j:=0to 5do
  begin
    Img:=TImage.Create(tbJatek);
    Img.Parent:=tbJatek;
    Img.Width:=0;
    Img.Height:=0;
    Img.Left:=0; Img.Top:=0;
    Img.Stretch:=True;
    Img.OnClick:=ImgClick;
    Img.Cursor:=crHandPoint;
    Img.Tag:=db;
    Img.Hint:='';
    Img.ShowHint:=False;
    Img.Visible:=False;
    Inc(db);
    Img.Center:=True;
  end;{for j}

  tbjatek.DoubleBuffered:=True;

end;

PROCEDURE Tfrm1.ImgClick(Sender:TObject);
var  Kep:TImage;
begin
  if(Sender is TImage)then
  begin
    Kep:=(Sender as TImage);
    if((utolsoelotti='')or(utolso=''))then
    begin
      i:=StrToInt(pProba.Caption);
      Inc(i);
      if(utolsoelotti<>'')and(Lap(StrToInt(utolsoelotti),True).Tag=Kep.Tag)then
      Dec(i);
      pProba.Caption:=IntToStr(i);
    end;

    if(utolsoelotti<>'')and(utolso<>'')
    and(utolsoelotti<>utolso)then
    begin
      KepAd(Lap(StrToInt(utolsoelotti),True),IntToStr(lKepek.Items.Count-1));
      KepAd(Lap(StrToInt(utolso),True),IntToStr(lKepek.Items.Count-1));
      utolso:=''; utolsoelotti:='';
      if(lJ1.Font.Color=clRed)then
      begin
        lJ1.Font.Color:=clBlack;
      end
      else
      begin
        lJ1.Font.Color:=clRed;
      end;
    end{if(utolsoelotti<>'')and(utolso<>'')and(utolsoelotti<>utolso)}
    else
    begin
      if(utolso='')and(utolsoelotti<>'')and(utolsoelotti<>IntToStr(Kep.Tag))then utolso:=IntToStr(Kep.Tag);
      if(utolsoelotti='')then utolsoelotti:=IntToStr(Kep.Tag);
      KepAd(Lap(Kep.Tag,True),Kep.Hint);
    end; {else if(utolsoelotti<>'')and(utolso<>'')}

    if(utolsoelotti<>'')and(utolso<>'')and
    (Lap(StrToInt(utolsoelotti),True).Hint=Lap(StrToInt(utolso),True).Hint)then
    begin
      frm1.Color:=$00989FBD;
      tEltuntet.Enabled:=True;
      if(lJ1.Font.Color=clRed)then i:=StrToInt(pJ1p.Caption);
      Inc(i);
      if(lJ1.Font.Color=clRed)then pJ1p.Caption:=IntToStr(i);
    end;{if(utolsoelotti<>'')and(utolso<>'')and..}
  end;{if(Sender is TImage)}
end;

procedure Tfrm1.bTorolClick(Sender: TObject);
begin
  if(lKepek.ItemIndex<>-1)then lKepek.Items.Delete(lKepek.ItemIndex);
end;

procedure Tfrm1.lKepekClick(Sender: TObject);
var sr:TSearchRec;
begin
  SetCurrentDir(fnev);
  if(FindFirst(lKepek.Items[lKepek.ItemIndex],faAnyFile,sr)<>0)then
  begin
    MessageDlg('A v�lasztott �llom�ny nem tal�lhat� a mostani el�r�si �tj�n!'+#13#10+'K�rlek cser�ld ki a k�pet!',mtWarning,[mbOk],0);
    pKepcsereClick(Sender);
  end
  else KepAd(iTesztNezet,IntToStr(lKepek.ItemIndex));
end;

procedure Tfrm1.mJatekClick(Sender: TObject);
var i,i1,j,kov:integer; ok:boolean;
begin
  if(tEltuntet.Enabled=True)then Exit;
  pPontKiir.Visible:=True;
  utolsoelotti:='';
  utolso:='';
  pJ1P.Caption:='0';
  pProba.Caption:='0';
  db:=0;
  for i:=0to 5do
  for j:=0to 5do
  begin
    if(tbJatek.Components[db] is TImage)then
    with(tbJatek.Components[db] as TImage)do
    begin
      Left:=0;
      Top:=0;
    end;
    Inc(db);
  end;{for i for j}

  db:=0;
  for i:=0to 5do
  for j:=0to 5do
  begin
    if(tbJatek.Components[db] is TImage)then
    with(tbJatek.Components[db] as TImage)do
    begin
      Width:=sSzel.Value;
      Height:=sMag.Value;
      Left:=Left+j*(sSzel.Value+10);
      Top:=Top+i*(sMag.Value+10);
      Visible:=True;
      Hint:='';
    end;
    Inc(db);
  end;{for i for j}

  i:=0;
  j:=lKepek.Items.Count-1;
  while(i<>j)do
  begin
   for i1:=1to 2do
   begin
     repeat
       ok:=False;
       kov:=Random(2*j);
       if(Lap(kov,True).Hint='')then ok:=True;
     until(ok=True);
     Lap(kov,True).Hint:=IntToStr(i);
   end;{for i1}
   Inc(i);
  end;{while(ok=False)}

  j:=tbJatek.ComponentCount-1;
  for i:=0to j do KepAd(Lap(i,True),IntToStr(lKepek.Items.Count-1));
  pC.ActivePageIndex:=0;
end;

procedure Tfrm1.mBeallitasokClick(Sender: TObject);
begin
  if(tEltuntet.Enabled=True)then Exit;
  pC.ActivePageIndex:=1;
end;

procedure Tfrm1.pKepcsereClick(Sender: TObject);
var i,j:integer; hiba:boolean; sr:TSearchRec;
begin
  if(lKepek.ItemIndex=-1)then Exit;
  OpenP.InitialDir:=ExpandFileName(lKepek.Items[lKepek.ItemIndex]);
  if(OpenP.Execute)then
  begin
    if(lKepek.Items.IndexOf(LowerCase(ExtractRelativePath(fnev,OpenP.FileName)))=-1)then
    lKepek.Items[lKepek.ItemIndex]:=LowerCase(ExtractRelativePath(fnev,OpenP.FileName));
    j:=lKepek.Items.Count-1;
    i:=0;
    hiba:=True;
    SetCurrentDir(fnev);
    while(i<>j)and(hiba=True)do
    begin
      if(FindFirst(lKepek.Items[i],faAnyFile,sr)<>0)then hiba:=False;
      Inc(i);
    end;{while}
    mJatek.Enabled:=hiba;
  end;
end;

procedure Tfrm1.mKilepesClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm1.tEltuntetTimer(Sender: TObject);
var eleg,kesz:boolean; s:string;
begin
  eleg:=True;
  Lap(StrToInt(utolsoelotti),True).Width:=Lap(StrToInt(utolsoelotti),True).Width-2;
  Lap(StrToInt(utolsoelotti),True).Height:=Lap(StrToInt(utolsoelotti),True).Height-2;
  Lap(StrToInt(utolso),True).Width:=Lap(StrToInt(utolso),True).Width-2;
  Lap(StrToInt(utolso),True).Height:=Lap(StrToInt(utolso),True).Height-2;
  if(Lap(StrToInt(utolso),True).Height>0)then eleg:=False;
  if(eleg=True)then
  begin
    Lap(StrToInt(utolsoelotti),True).Visible:=False;
    Lap(StrToInt(utolso),True).Visible:=False;
  end;
  tEltuntet.Enabled:=not(eleg);
  tbJatek.Enabled:=(eleg);
  if(tbJatek.Enabled=True)then
  begin
    utolso:=''; utolsoelotti:='';
    kesz:=True;
    i:=0;
    j:=tbJatek.ComponentCount;
    while(i<j)and(kesz=True)do
    begin
      if(tbJatek.Components[i] is TImage)and((tbJatek.Components[i] as TImage).Visible=True)then kesz:=False;
      Inc(i);
     end;{while}

    if(kesz=True)then
    begin
      MessageDlg('Nyert�l! A j�t�k v�get �rt!'+#13#10+#13#10+s,mtInformation,[mbOk],0);
      pPontKiir.Visible:=False;
    end;
  end;
  frm1.Color:=clBtnFace;

end;

procedure Tfrm1.lKepekDblClick(Sender: TObject);
begin
  pKepcsereClick(Sender);
end;

end.

