unit uFuncoesImagem;

interface
uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, Vcl.Forms, uVariaveis, Vcl.StdCtrls, Math,
   Vcl.Mask, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.ExtCtrls, vcl.Dialogs, PNGImage,
  Vcl.ComCtrls, Vcl.Graphics, Vcl.Buttons, Jpeg, ExtDlgs, ComObj, ShellApi;

  function getImagemFromFile():TJPEGImage;
  function setCompression(JPEG : TJPEGImage):TJPEGImage;
  function rotate90G_Direita(JPEG : TJPEGImage):TJPEGImage;
  function rotate90G_Esquerda(JPEG : TJPEGImage):TJPEGImage;
const COMPRESSAO : integer = 60;

var savePath : String;

implementation

function getImagemFromFile():TJPEGImage;
var
   openPictureDialog : TOpenPictureDialog;
   bmp : TBitmap;
   jpg : TJPEGImage;
   PNG : TPngImage;
begin
   try
      openPictureDialog := TOpenPictureDialog.Create(nil);

      openPictureDialog.Execute();

      jpg := TJPEGImage.Create;

      if LowerCase(ExtractFileExt(openPictureDialog.FileName)) = '.bmp' then
      begin
         bmp := TBitmap.Create;
         bmp.LoadFromFile(openPictureDialog.FileName);
         jpg.Assign(bmp);
         bmp.Free;
         Result := jpg;
      end;

      if LowerCase(ExtractFileExt(openPictureDialog.FileName)) = '.jpg' then
      begin
         jpg.LoadFromFile(openPictureDialog.FileName);
         Result := jpg;
      end;

      if LowerCase(ExtractFileExt(openPictureDialog.FileName)) = '.png' then
      begin
         PNG := TPngImage.Create;
         PNG.LoadFromFile(openPictureDialog.FileName);
         bmp := TBitmap.Create;
         bmp.Assign(PNG);
         jpg.Assign(BMP);
         PNG.Free;
         BMP.Free;
         Result := jpg;
      end;

   finally
      FreeAndNil(openPictureDialog);
   end;
end;

function setCompression(JPEG : TJPEGImage):TJPEGImage;
var
   jpeg2 : TJPEGImage;
begin
   jpeg2 := TJPEGImage.Create;
   jpeg2.CompressionQuality := COMPRESSAO;
   jpeg2.Compress;

   Result := jpeg;
end;

function rotate90G_Direita(JPEG : TJPEGImage):TJPEGImage;
const
   PixelMax = 32768;
type
   pPixelArray = ^TPixelArray;
   TPixelArray = array[0..PixelMax - 1] of TRGBTriple;
var
   YDest: integer;
   XOrig: integer;
   YOrig: integer;
   RowOrig: pPixelArray;
   RowDest: pPixelArray;
   BmpOrig: TBitmap;
   BmpDest: TBitmap;
   JPEGAux : TJPEGImage;
begin
   BmpOrig := TBitmap.Create();
   BmpDest := TBitmap.Create();
   JPEGAux := TJPEGImage.Create();

   BmpOrig.Assign(JPEG);

   BmpDest.Width       := BmpOrig.Height;
   BmpDest.Height      := BmpOrig.Width;
   BmpDest.PixelFormat := pf24bit;

   for YDest := 0 to BmpDest.Height - 1 do
   begin
      RowDest := BmpDest.Scanline[YDest];
      XOrig   := BmpOrig.Width - YDest - 1;
      for YOrig := 0 to BmpOrig.Height - 1 do
      begin
         RowOrig        := BmpOrig.Scanline[YOrig];
         RowDest[YOrig] := RowOrig[XOrig];
      end;
   end;

   JPEGAux.Assign(BmpDest);
   BmpDest.Free;
   BmpOrig.Free;

   Result := JPEGAux;
end;

function rotate90G_Esquerda(JPEG : TJPEGImage):TJPEGImage;
const
   MAX : integer = 3;
var i : integer;
   JPEG_AUX : TJPEGImage;
begin
   JPEG_AUX := TJPEGImage.Create();
   JPEG_AUX.Assign(JPEG);

   for I := 1 to MAX do
      JPEG_AUX := rotate90G_Direita(JPEG_AUX);

   Result := JPEG_AUX;
end;

end.
