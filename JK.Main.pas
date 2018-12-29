unit JK.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, HGM.Controls.SpinEdit;

type
  TLang = record
   Code:string;
   Desc:string;
  end;

  TLangList = TList<TLang>;

  TFormMain = class(TForm)
    PanelLangs: TPanel;
    ListViewLangs: TListView;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    EditText: TEdit;
    Button1: TButton;
    Label2: TLabel;
    ListViewResult: TListView;
    ComboBoxLang: TComboBox;
    SpinEditCount: TlkSpinEdit;
    Panel3: TPanel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FLang:TLangList;
  end;

var
  FormMain: TFormMain;

implementation
 uses IdHTTP;

{$R *.dfm}

procedure ReadLangCSV(FN:TFileName; FieldSeparator:Char; var List:TLangList);
var SData, SRow:TStrings;
    i:integer;
    Lang:TLang;
begin
 SData:=TStringList.Create;
 SData.LoadFromFile(FN);
 List.Clear;
 if SData.Count > 0 then
  begin
   SRow:=TStringList.Create;
   SRow.Delimiter:=FieldSeparator;
   SRow.StrictDelimiter:=True;
   for i := 0 to SData.Count - 1 do
    begin
     SRow.DelimitedText:=SData[i];
     try
      Lang.Code:=SRow.Strings[0];
      Lang.Desc:=SRow.Strings[1];
      List.Add(Lang);
     except

     end;
    end;
   SRow.Free;
  end;
 SData.Free;
end;

function TranslateGoogle(Text, myLang, toLang:string; var Err:Boolean):string;
var HTTP:TIdHTTP;
    PostData:TStringList;
    Response:TStringStream;
begin
 Result:='';
 HTTP:=TIdHTTP.Create(nil);
 Text:=StringReplace(Text, '...', '', [rfReplaceAll]);
 Text:=StringReplace(Text, #13#10, ' ', [rfReplaceAll]);
 PostData:=TStringList.Create;
 PostData.Add('sl='+myLang);
 PostData.Add('tl='+toLang);
 PostData.Add('js=n');
 PostData.add('prev=_t');
 PostData.Add('hl='+myLang);
 PostData.Add('ie=UTF-8');
 PostData.add('eotf=1');
 PostData.Add('text='+Text);
 PostData.Add('client=x');
 Response:=TStringStream.Create('');
 Err:=False;
 try
  try
   HTTP.Post('http://translate.google.ru/translate_a/t', PostData, Response);
   Result:=UTF8ToWideString(Response.DataString);
   if Result.Length > 0 then Delete(Result, 1, 1);
   if Result.Length > 0 then Delete(Result, Result.Length, 1);
  except
   Err:=True;
  end;
 finally
  PostData.Free;
  HTTP.Free;
  Response.Free;
 end;
end;

procedure InsertResult(LV:TListView; L1, L2:TLang; Res:string);
begin
 with LV.Items.Add do
  begin
   Caption:=L1.Desc;
   SubItems.Add('to');
   SubItems.Add(L2.Desc);
   SubItems.Add(Res);
  end;
 Application.ProcessMessages;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var i, r: Integer;
    L1, L2:TLang;
    res, tg:string;
    Err:Boolean;
    SLang:TLang;
begin
 r:=ComboBoxLang.ItemIndex;
 if r >= 0 then L1:=FLang[r]
 else
  begin
   L1.Code:='ru';
   L1.Desc:='Russian';
  end;
 SLang:=L1;
 tg:=EditText.Text;
 Randomize;
 ListViewResult.Clear;
 for i:= 1 to SpinEditCount.Value do
  begin
   res:='';
   while res = '' do
    begin
     repeat r:=Random(FLang.Count)
     until FLang[r].Code <> L2.Code;
     L2:=FLang[r];
     res:=TranslateGoogle(tg, L1.Code, L2.Code, Err);
     if Err then Sleep(4000) else Sleep(1000);
    end;
   tg:=res;
   InsertResult(ListViewResult, L1, L2, res);
   L1:=L2;
  end;
 L2:=SLang;
 res:=TranslateGoogle(tg, L1.Code, L2.Code, Err);
 InsertResult(ListViewResult, L1, L2, res);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var i, s: Integer;
begin
 FLang:=TLangList.Create;
 ReadLangCSV(ExtractFilePath(Application.ExeName)+'\langs.csv', ';', FLang);
 ComboBoxLang.Items.Clear;
 ListViewLangs.Items.Clear;
 s:=-1;
 for i:= 0 to FLang.Count-1 do
  with ListViewLangs.Items.Add do
   begin
    Caption:=FLang[i].Desc;
    SubItems.Add(FLang[i].Code);
    ComboBoxLang.Items.Add(Caption);
    if FLang[i].Code = 'ru' then s:=i;
   end;
 ComboBoxLang.ItemIndex:=s;
end;

end.
