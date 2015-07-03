unit assethelper;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;


type


TFakeFile = class
      function filesize:int64;virtual;abstract;
      procedure blockread(var buf;siz:int64);virtual;abstract;
      procedure reset(i:int64);virtual;abstract;
      procedure seek(pos:int64);virtual;abstract;
  end;

TFakeTextFile = class
 function eof():boolean;virtual;abstract;
 procedure readln(var str:string);   virtual;abstract;
 procedure reset;virtual;abstract;
end;
TAssetHelper = class
 function createfile( name:string):TFakefile;virtual;abstract;
  function createtextfile( name:string):tfaketextfile;virtual;abstract;
  end;


procedure assign(out f:tfakefile; name:string);
procedure reset(var f:tfakefile;i:int64);
function filesize(var f:TFakeFile):int64;
procedure seek(var f:tfakefile;pos:int64);
procedure blockread(var f:TFakeFile;var buf;size:int64);
procedure close(var f:tfakefile);

procedure tassign(out f:tfaketextfile; name:string);
procedure treset(f:tfaketextfile);
//function filesize(f:TFakeFile):int64;
procedure treadln(f:tfaketextfile;var str:string);
procedure tclose(f:tfaketextfile);
function teof(f:tfaketextfile):boolean;
var assets:TAssetHelper;

  procedure logw(text:pchar);

 implementation

    {$ifdef android}
    uses castleandroidlog;

procedure logw(text:pchar);
begin
     androidlog(alInfo,text);
end;
{$else}
uses castlelog;
    procedure logw(text:pchar);
    begin
         writelnlog('log',text);
    end;
{$endif}


procedure assign(out f:tfakefile; name:string);
begin
  f:=assets.createfile(name);
end;

procedure close(var f:tfakefile);
begin
  f.free;
end;



procedure reset(var f:tfakefile;i:int64);
begin
  f.reset(i);
end;

function filesize(var f:TFakeFile):int64;
begin
  result:=f.filesize;
end;
procedure blockread(var f:TFakeFile;var buf;size:int64);
begin
  f.blockread(buf,size);
end;


procedure tassign(out f:tfaketextfile; name:string);
begin
 f:=assets.createtextfile(name);
end;

procedure treset(f:tfaketextfile);
begin
 f.reset();
end;

//function filesize(f:TFakeFile):int64;
procedure treadln(f:tfaketextfile;var str:string);
begin
   f.readln(str);
end;

procedure tclose(f:tfaketextfile);
begin
     f.free;
end;

function teof(f:tfaketextfile):boolean;
begin
     result:=f.eof;
end;

procedure seek(var f:tfakefile;pos:int64);
begin
     f.seek(pos);
end;

end.


