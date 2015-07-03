{$IFDEF oldstuff}
{$IFDEF android}
library utekxp;

{$mode objfpc}{$H+}

uses
   {$IFDEF android}
cthreads,
{$ENDIF}
  customdrawnint,
  Interfaces,
  Forms,
  customdrawn_android,
  customdrawndrawers,
  utekmain in 'utekmain.pas' {MainForm},
    rutins in 'RUTINS.PAS', FakeDXDraw, assethelper;

exports
  Java_com_pascal_lclproject_LCLActivity_LCLOnTouch name 'Java_com_pascal_android_test_LCLActivity_LCLOnTouch',
  Java_com_pascal_lclproject_LCLActivity_LCLDrawToBitmap name 'Java_com_pascal_android_test_LCLActivity_LCLDrawToBitmap',
  Java_com_pascal_lclproject_LCLActivity_LCLOnCreate name 'Java_com_pascal_android_test_LCLActivity_LCLOnCreate',
  Java_com_pascal_lclproject_LCLActivity_LCLOnMessageBoxFinished name 'Java_com_pascal_android_test_LCLActivity_LCLOnMessageBoxFinished',
  Java_com_pascal_lclproject_LCLActivity_LCLOnKey name 'Java_com_pascal_android_test_LCLActivity_LCLOnKey',
  Java_com_pascal_lclproject_LCLActivity_LCLOnTimer name 'Java_com_pascal_android_test_LCLActivity_LCLOnTimer',
  Java_com_pascal_lclproject_LCLActivity_LCLOnConfigurationChanged name 'Java_com_pascal_android_test_LCLActivity_LCLOnConfigurationChanged',
  Java_com_pascal_lclproject_LCLActivity_LCLOnSensorChanged name 'Java_com_pascal_android_test_LCLActivity_LCLOnSensorChanged',
  Java_com_pascal_lclproject_LCLActivity_LCLOnMenuAction name 'Java_com_pascal_android_test_LCLActivity_LCLOnMenuAction',
  JNI_OnLoad name 'JNI_OnLoad',
  JNI_OnUnload name 'JNI_OnUnload';

procedure MyActivityOnCreate;
begin
  DefaultStyle := dsAndroid;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end;

begin
  Application.Title:='utekxp';
  CDWidgetset.ActivityClassName := 'com/pascal/utekxp/LCLActivity';
  CDWidgetset.ActivityOnCreate := @MyActivityOnCreate;
end.
{$else}
program utekxp;

//{$MODE Delphi}
{$mode objfpc}{$H+}
uses
  Forms, Interfaces,
  utekmain in 'utekmain.pas' {MainForm},
  rutins, FakeDXDraw, androidassethelper, normalassethelper, bitmap_control;

{$R *.res}

begin
  Application.Title:='utekxp';
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
{$ENDIF}
{$ENDIF}


{$IFDEF android}
library utekxp;

uses CastleAndroidNativeAppGlue, utekmain;

exports ANativeActivity_onCreate;

end.
{$else}
program utekxp;
{$mode objfpc}{$H+}
uses CastleWindow, utekmain;
begin
//  Application.Title:='utekxp';
  mainform.width:=320*3;
  mainform.Height:=200*3;
  mainform.OpenAndRun;
end.

{$ENDIF}

{uses CastleVectors, CastleWindow, CastleControls, CastleOnScreenMenu,
  CastleControlsImages, CastleImages, CastleFilesUtils, CastleColors,
  CastleUIControls, castle_base, castle_components, castle_window;
var
  Window: TCastleWindowCustom;
  Background: TCastleSimpleBackground;
  Button: TCastleButton;
  Image: TCastleImageControl;
  OnScreenMenu: TCastleOnScreenMenu;
  Touch: TCastleTouchControl;
begin
  Window := TCastleWindowCustom.Create(Application);
  {
  { customize tooltips to use rounded corners.
    Just because we can :) }
  Theme.Images[tiTooltip] := TooltipRounded;
  Theme.Corners[tiTooltip] := Vector4Integer(9, 9, 9, 9);

  Background := TCastleSimpleBackground.Create(Window);
  Background.Color := Green;
  Window.Controls.InsertBack(Background);

  Button := TCastleButton.Create(Window);
  Button.Caption := 'My Button';
  Button.Tooltip := 'Sample tooltip over my button';
  Button.Left := 10;
  Button.Bottom := 10;
  Button.Image := LoadImage(ApplicationData('sample_button_icon.png'));
  Button.OwnsImage := true;
  Window.Controls.InsertFront(Button);

  Image := TCastleImageControl.Create(Window);
  Image.URL := ApplicationData('sample_image_with_alpha.png');
  Image.Left := 10;
  Image.Bottom := 150;
  Window.Controls.InsertFront(Image);

  OnScreenMenu := TCastleOnScreenMenu.Create(Window);
  OnScreenMenu.Items.Add('one');
  OnScreenMenu.Items.Add('two');
  OnScreenMenu.Position := Vector2Integer(10, 300);
  OnScreenMenu.PositionRelativeMenuX := prLow;
  OnScreenMenu.PositionRelativeMenuY := prLow;
  OnScreenMenu.PositionRelativeScreenX := prLow;
  OnScreenMenu.PositionRelativeScreenY := prLow;
  Window.Controls.InsertFront(OnScreenMenu);

  Touch := TCastleTouchControl.Create(Window);
  Touch.Left := 200;
  Touch.Bottom := 150;
  Window.Controls.InsertFront(Touch);
      }
  Window.Width := 400;
  Window.Height := 500;
  Window.OpenAndRun;
end.}



