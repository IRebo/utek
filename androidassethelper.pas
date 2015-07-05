unit androidassethelper;

{$mode objfpc}{$H+}

interface

{$ifdef android}

uses
  jni, CastleAndroidAssetManager, assethelper,
  Classes, SysUtils;

type
TAndroidAssetHelper = class(TAssetHelper)
 nativeAssets:PAAssetManager;
 javaassets:jobject;
 constructor create;
 destructor destroy;override;
   function createfile( name:string):TFakefile;override;
  function createtextfile( name:string):tfaketextfile;override;
end;

TFakeAndroidFile = class (TFakeFile)
 manager:TAndroidAssetHelper;
 newasset:paasset;
 constructor create(man:TAssetHelper; name:string);
 destructor destroy;override;
 function filesize:int64;override;
 procedure blockread(var buf;siz:int64);override;
  procedure reset(i:int64);override;
 procedure seek(pos:int64);override;

end;

TFakeAndroidTextFile = class (TFakeTextFile)
 strings:TStringList;
 curpos:integer;
 constructor create(man:TAssetHelper; name:string);
 destructor destroy;override;

 function eof():boolean;override;
  procedure readln(var str:string); override;
  procedure reset;override;
 end;

procedure initassets;
procedure destroyassets;

implementation

uses strutils,  CastleAndroidAssetStream;
'function AAssetManager_fromJava(env: PJNIEnv;mgr: jobject): PAAssetManager; cdecl; external 'libandroid.so';

constructor TAndroidAssetHelper.create;
begin
  logw('create assets1');
  nativeassets := AssetManager;

  logw('create assets4');

    if nativeAssets=nil then begin
    raise exception.create('no assets4');
  end;

logw('create assets5');

end;
destructor TAndroidAssetHelper.destroy;
begin

  nativeAssets:=nil;
      Inherited destroy;


end;

procedure initassets;
begin
    assets:=TAndroidAssetHelper.Create;
end;
procedure destroyassets;
begin
    assets.free;
end;

procedure assign(out f:tfakefile; name:string);
begin
  f:=TFakeAndroidFile.Create(assets, name);
end;

procedure close(var f:tfakefile);
begin
  f.free;
end;

function TAndroidAssetHelper.createfile( name:string):TFakefile;
begin
  result:=TFakeAndroidFile.create(self, name);
end;

function TAndroidAssetHelper.createtextfile( name:string):tfaketextfile;
begin
  result:=TFakeAndroidTextFile.create(self, name);
end;

constructor TFakeAndroidFile.create(man:TAssetHelper; name:string);
var dir:PAAssetDir;
  foundname:pchar;
  fixedstring:string;
begin
  manager:=TAndroidAssetHelper(man);

{dir:=AAssetManager_openDir(manager.nativeassets, 'CODE');
  if dir=nil then begin
    logw('dir not found');
    exit;
  end;
 repeat
  foundname:= AAssetDir_getNextFileName(dir);
  logw('returned');
  if foundname<>nil then begin
     logw(pchar(inttostr(strlen(foundname))));
     logw(foundname);
  end;
 until foundname=nil;
 }
  logw(pchar('opening asset '+name));
  fixedstring:=replacestr(name,'\','/');
  logw(pchar('opening asset '+fixedstring));
   newasset:= AAssetManager_open(manager.nativeassets, pchar(fixedstring), AASSET_MODE_RANDOM);
   logw(pchar('openened asset '+name));

   if newasset=nil then
   begin
      logw('asset not found');
      raise exception.create('asset not found - '+name);
   end;

   logw('asset was found');
end;

destructor TFakeAndroidFile.Destroy;
begin
   logw('closing asset');
   if newasset=nil then exit;

   AAsset_close(newasset);
   logw('closed asset');
       Inherited destroy;


end;

procedure TFakeAndroidFile.reset(i:int64);
begin
end;

procedure TFakeAndroidFile.seek(pos:int64);
begin
    AAsset_seek(newasset,pos,0);

end;

destructor TFakeAndroidtextFile.Destroy;
begin
                                           Inherited destroy;


end;


procedure TFakeAndroidFile.blockread(var buf;siz:int64);
begin
    logw('reading from asset');
   if newasset=nil then
   raise exception.create('asset not found during blockread');

 AAsset_read(newasset, @buf, siz);
 logw('finished reading');
end;

function TFakeAndroidFile.filesize:int64;
begin

   logw(pchar('getting filesize of asset'));
    if newasset=nil then
   raise exception.create('asset not found during filesize');

    result:=AAsset_getLength(newasset);
   logw(pchar('got filesize of asset - '+inttostr(result)));
end;

constructor TFakeAndroidtextFile.create(man:TAssetHelper; name:string);
var afile:tfakeandroidfile;
  buf:tbytes;
  length:int64;
  i:integer;
  stream:tbytesstream;
begin
   logw('textfile');
     afile:=TFakeAndroidFile.create(man, name);
     length:=afile.filesize;
     setlength(buf,length);
     afile.blockread(buf[0],length);
     afile.free;
     logw('textfile2');

     strings:=TStringList.Create;
     stream:=TBytesStream.Create(buf);
     strings.LoadFromStream(stream);
     stream.free;
        logw('textfile3');
      curpos:=0;
end;

 function TFakeAndroidtextFile.eof():boolean;
 begin
     if curpos<strings.count then
     begin
        result:=false;
     end
     else
     begin
          result:=true;
     end;
 end;
  procedure TFakeAndroidtextFile.readln(var str:string);
  begin
str:=strings[curpos];
inc(curpos);
  end;

  procedure TFakeAndroidtextFile.reset;
  begin

  end;

{$else}
implementation
{$endif}
end.

