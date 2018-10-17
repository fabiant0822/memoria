program Memoria;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frm1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Memória játék';
  Application.CreateForm(Tfrm1, frm1);
  Application.Run;
end.
