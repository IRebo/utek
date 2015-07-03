unit FakeDXDraw;

{$MODE objfpc}

interface

uses
  Classes, SysUtils,castleimages,assethelper,syncobjs, CastleWindowTouch,castlecontrols,  castlevectors;


type
  prect = ^trect;
  tddsurfacedesc = class
    lpsurface : pointer;
    lpitch : integer;
  end;

 TRGBQuads = array[0..255] of tvector3byte;

  TFakeDXSurface = class
    screen:array of byte;
    function Lock(const Rect: TRect; var SurfaceDesc: TDDSurfaceDesc): Boolean;
    procedure UnLock;
    constructor create;
  end;

  TFakeDXDraw = class
    mainform:TCastleWindowTouch;
    bitmapcontrol:tcastleimagecontrol;
    image:trgbimage;
    mutex:TCriticalSection;
    ColorTable:TRGBQuads;
    DefColorTable:TRGBQuads;
    Surface:TFakeDXSurface;
    copy_screen:array of byte;
    copy_colors:TRGBQuads;
    should_flip:boolean;
    destructor destroy;override;
    constructor Create(form:TCastleWindowTouch;mybitmapcontrol:tcastleimagecontrol );overload;
    procedure UpdatePalette;
    procedure Flip;
    procedure FlipReal;
 end;

implementation
uses utekmain;

destructor tfakedxdraw.destroy;
begin
  mutex.free;
  image.free;
      Inherited destroy;


end;

     procedure TFakeDXDraw.UpdatePalette;
     begin
       flip;
     end;

     function TFakeDXSurface.Lock(const Rect: TRect; var SurfaceDesc: TDDSurfaceDesc): Boolean;
     begin
       SurfaceDesc:=tddsurfacedesc.Create;
          SurfaceDesc.lpitch:=320;
          SurfaceDesc.lpsurface:=@screen[0];
          result:=true;
     end;

     procedure TFakeDXSurface.UnLock;
     begin
     end;

     procedure TFakeDXDraw.flipReal;
     var x,y,yoff:integer;
      col:tvector3byte;
begin

         mutex.Acquire;
         try

         if should_flip = false then exit;

             should_flip:=false;

         logw('inflip');
      logw('inflip1');

      for y:=0 to 200-1 do
         begin
              yoff:=y*320;
              for x:=0 to 320-1 do
                 begin
                      image.pixelptr(x,199-y)^:=copy_colors[copy_screen[x+yoff]];
                 end;
         end;
      bitmapcontrol.Image:=image.MakeCopy;
      logw('inflip4');

         finally
           mutex.Release;
         end;
    end;

    procedure TFakeDXDraw.Flip;
    var len:integer;
    begin
     mutex.Acquire;
     try
      copy_colors:=ColorTable;
      len:=length(surface.screen);
      setlength(copy_screen, len);
      move(surface.screen[0], copy_screen[0], len);
      should_flip:=true;
     finally
       mutex.Release;
     end;
    end;

    constructor TFakeDXDraw.Create(form:TCastleWindowTouch; mybitmapcontrol:TCastleImageControl);
    begin
     should_flip:=false;
      mutex:=TCriticalSection.create;
      Surface := TFakeDXSurface.Create;
      image:=TRGBImage.Create(320,200);


      self.mainform:=form;
      self.bitmapcontrol:=mybitmapcontrol;
    end;

constructor TFakeDXSurface.create;
begin
  SetLength(screen,320*200);
end;

end.

