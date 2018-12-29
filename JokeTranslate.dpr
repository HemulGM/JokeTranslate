program JokeTranslate;

uses
  Vcl.Forms,
  JK.Main in 'JK.Main.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
