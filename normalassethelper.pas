unit normalassethelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,assethelper;

type
TnormalAssetHelper = class(TAssetHelper)
 constructor create;
 destructor destroy;override;
  function createfile( name:string):TFakefile;override;
  function createtextfile( name:string):tfaketextfile;override;
end;

TFakenormalFile = class (TFakeFile)
 manager:TnormalAssetHelper;
 newasset:file;
 constructor create(man:TAssetHelper; name:string);
 destructor destroy;override;
 function filesize:int64;override;
 procedure blockread(var buf;siz:int64);override;
 procedure reset(i:int64);override;
 procedure seek(pos:int64);override;
end;

TFakenormalTextFile = class (TFakeTextFile)
 text:text;
 constructor create(man:TAssetHelper; name:string);
 destructor destroy;override;

  function eof():boolean;override;
 procedure readln(var str:string); override;
 procedure reset;override;
end;

procedure initassets;
procedure destroyassets;



implementation

uses strutils;


constructor TnormalAssetHelper.create;
begin

end;
destructor TnormalAssetHelper.destroy;
begin
Inherited destroy;

end;

procedure initassets;
begin
    assets:=TnormalAssetHelper.Create;
end;
procedure destroyassets;
begin
    assets.free;
end;

function TnormalAssetHelper.createfile( name:string):TFakefile;
begin
    result:=TFakenormalFile.create(self,name);
end;

function TnormalAssetHelper.createtextfile( name:string):tfaketextfile;
begin
 result:=TFakenormaltextFile.create(self,name);
end;

constructor TFakenormalFile.create(man:TAssetHelper; name:string);
var fixedstring:string;
begin

  logw(pchar('opening asset '+name));
  fixedstring:='assets\'+name;
  logw(pchar('opening asset '+fixedstring));
assignfile(newasset,fixedstring);


   logw('asset was found');
end;

destructor TFakenormalFile.Destroy;
begin
   logw('closing asset');

 closefile(newasset);
   logw('closed asset');
       Inherited destroy;


end;

destructor TFakenormaltextFile.Destroy;
begin
 closefile(text);
     Inherited destroy;


end;


procedure TFakenormalFile.blockread(var buf;siz:int64);
begin
    logw('reading from asset');

 system.blockread(newasset, buf, siz);
 logw('finished reading');
end;

procedure TFakenormalFile.reset(i:int64);
begin
  system.reset(newasset,i);
end;

procedure TFakenormalFile.seek(pos:int64);
begin
 system.seek(newasset,pos);
end;

function TFakenormalFile.filesize:int64;
begin

   logw(pchar('getting filesize of asset'));

    result:=system.filesize(newasset);
   logw(pchar('got filesize of asset - '+inttostr(result)));
end;

constructor TFakenormaltextFile.create(man:TAssetHelper; name:string);
begin
 assignfile(text,'assets\'+name);
end;

function TFakenormaltextFile.eof:boolean;
begin
result:= system.eof(text);
 end;

 procedure TFakenormaltextFile.readln(var str:string);
 begin
system.readln(text,str);
 end;

 procedure TFakenormaltextFile.reset;
 begin
system.reset(text);
 end;

end.

