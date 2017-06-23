unit uMenu;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.Win.ADODB, Data.DB, SpeedButtonMenu, Math;

type TMenu = class(TObject)
   private
      fsPanel : TPanel;
      fsControleTop : Integer;
      fsWidthMenu : Integer;
      fsBarraRolagemClicada : Boolean;
      fsBarraRalagemOld : Tpoint;
      procedure AddItem(NomeItem, CaptionItem : String);
      procedure AddSubItem(nomeItem, CaptionItem, MenuItem : String);
      procedure AddItemOnClick(Sender : TObject);
      procedure doRedimensionaItem(Sender : TObject);
      procedure doMudaClickedCorItem(Sender : TObject);
      procedure AddSubItemOnClick(Sender : TObject);
      procedure doMudaClickedCaptionSubItem(Sender : TObject);
      procedure doShowForm(Sender : TObject);
      procedure doCriaPanelScroll(Panel : Tpanel);
      function getGlyph(NomeItem : String; Color : TColor) : TBitmap;
      procedure doMinimizaMenu(Sender : TObject);
      procedure doRedimencionaPnlConteiner();
      procedure doAtivaDesativaScroll(Subir,Descer,Barra : Boolean);
      procedure btnSubirOnClick(Sender : TObject);
      procedure btnDescerOnClick(Sender : TObject);
      procedure doMoveConteiner(Valor:Integer; MoveBarra : Boolean = True);
      procedure doCapturaScroll(var Msg: TMsg; var Handled: Boolean);
      function  getTamanhoBarraRolagem () : Integer;
      procedure pnlBarradeRolagemMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure pnlBarradeRolagemMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
      procedure pnlBarradeRolagemMouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure pnlScrollResize(Sender: TObject);
   public
      function getBtnClicked() : TSpeedButtonMenu;
      constructor Create(Panel : TPanel; qMenu : TADOQuery);
      Destructor Destroy;
   const
      fsWidthScroll : Integer = 15;
      fsTamahoMenu : Integer = 35;
      fsTamahoSubMenu : Integer = 28;
      fsTamahobtnScroll : Integer = 15;
end;
implementation

{ TMenu }

uses uTema, uPrincipal;

procedure TMenu.AddItem(NomeItem, CaptionItem : String);
var
   panel : TPanel;
   btn : TSpeedButtonMenu ;
begin
   panel := TPanel.Create(fsPanel);
   panel.Parent := fsPanel;
   panel.ParentBackground := False; //linha para que a cor possa ser diferente do parent
   panel.Top := fsControleTop;
   panel.Align := alTop;
   panel.Name := 'pnl' + nomeItem;
   panel.Height := fsTamahoMenu;
   panel.Caption := '';
   panel.Color := frmTema.pnlCorBtn.Color;
   inc(fsControleTop, fsTamahoMenu);


   btn := TSpeedButtonMenu.Create(panel);
   btn.Name := 'btn' + nomeItem;
   btn.Caption := captionItem;
   btn.Font.Color := frmTema.pnlCorBtn.Font.Color;
   btn.Flat := True;
   btn.Parent := panel;
   btn.Align := alTop;
   btn.Height := fsTamahoMenu;
   btn.Form := 'frm' + nomeItem;
   btn.Glyph := getGlyph(nomeItem, frmTema.pnlCorBtn.Color);
   btn.OnClick := AddItemOnClick;
end;

procedure TMenu.doShowForm(Sender : TObject);
var
   frmClass: TPersistentClass;
   frm : TForm;
   i : Integer;
   lblCaption : TComponent;
begin
   //fecha todos os forms instanciados e visiveis
   for i := 0 to Screen.FormCount - 1 do
   begin
      //Limpa a caption do form
      if Screen.Forms[i].Name = 'frmPrincipal' then
      begin
         lblCaption := Screen.Forms[i].FindComponent('lblCaption');
         if Pos(' ',TLabel(lblCaption).Caption) > 0 then       //esse espaço é um Alt+255
            TLabel(lblCaption).Caption := copy(TLabel(lblCaption).Caption,1,Pos(' ',TLabel(lblCaption).Caption));
      end;

      if (Screen.Forms[i].Name <> 'frmPrincipal') and (Screen.Forms[i].Visible) then
         Screen.Forms[i].DisposeOf;
   end;


   if (TSpeedButtonMenu(Sender).Form <> '') and (TSpeedButtonMenu(Sender).Clicked) then
   begin
      //Procura o form nas classes registradas
      if GetClass('T' + TSpeedButtonMenu(Sender).Form) <> nil then
      begin
         frmClass := GetClass('T' + TSpeedButtonMenu(Sender).Form)
      end
      else
      begin
         exit;
      end;


      if frmClass.InheritsFrom(TForm) then
      begin
         frm := TFormClass(frmClass).Create(GetParentForm(TControl(Sender)));

         //Faz a busca para colocar a plnWorkArea como parent do form
         for i := 0 to GetParentForm(TControl(Sender)).ComponentCount - 1 do
         begin
            if (GetParentForm(TControl(Sender)).Components[i] is TPanel) then
            begin
               if (GetParentForm(TControl(Sender)).Components[i] as TPanel).Name = 'pnlWorkArea' then
                  frm.Parent := (GetParentForm(TControl(Sender)).Components[i] as TPanel);
            end;
         end;
         frm.Show;

         //Coloca caption no form
         lblCaption := GetParentForm(TControl(Sender)).FindComponent('lblCaption');
         TLabel(lblCaption).Caption := TLabel(lblCaption).Caption + ' ' + '[' + StringReplace(TSpeedButtonMenu(Sender).Caption,'>','', []) + ']';
      end;
   end;
end;

function TMenu.getBtnClicked;
var
   i, j,h : Integer;
   oTmp : TComponent;
begin
   //Pega todos os componentes da panelmenu
   for i := 0 to fsPanel.ComponentCount - 1 do
   begin
      //Pega os componentes que ficam dentro das panels dos menus principais
      for j := 0 to fsPanel.Components[i].ComponentCount - 1  do
      begin
         oTmp := fsPanel.Components[i].Components[j];
         //verifica se o item principal esta clicado
         if (oTmp is TSpeedButtonMenu) then
         begin
            //muda o clicked de todos exeto o do ultimo clicado
            if TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Clicked then
            begin
               result := TSpeedButtonMenu(fsPanel.Components[i].Components[j]);
               Exit;
            end;
         end;
         //verifica as panel que tem os sub menus se estão clicados
         if (oTmp is TPanel) then
         begin
            for h := 0 to oTmp.ComponentCount - 1 do
            begin
               if (oTmp.Components[h] is TSpeedButtonMenu) then
               begin
                  if TSpeedButtonMenu(oTmp.Components[h]).Clicked then
                  begin
                     result := TSpeedButtonMenu(oTmp.Components[h]);
                     Exit;
                  End;
               end;
            end;
         end;
      end;
   end;
end;

function TMenu.getGlyph(NomeItem: String; Color : TColor): TBitmap;
var
   bmpGlyph : TBitmap;
begin
   bmpGlyph := TBitmap.Create;
   bmpGlyph.Handle := CreateMappedBmp(frmTema.ImOrdem.Picture.Bitmap.Handle, [clBlack], Color);
   Result := bmpGlyph;
end;

function TMenu.getTamanhoBarraRolagem: Integer;
var
   TamanhoAreaMenu, TamanhoConteinerMenu : Integer;
begin
   {::Essa função pega o tamanho que deve ter minha barra de rolagem
       Somo 30 para tirar a area do botão}

   TamanhoAreaMenu := TPanel(fsPanel.Parent).Height - (fsTamahobtnScroll * 2);
   TamanhoConteinerMenu := fsPanel.Height;

   //Aredonda sempre para cima
   Result := TamanhoAreaMenu - (Round(((TamanhoConteinerMenu - TamanhoAreaMenu) / 5) + 0.5));
end;

procedure TMenu.pnlBarradeRolagemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Sender is TWinControl) then
   begin
      fsBarraRolagemClicada :=True;
      SetCapture(TWinControl(Sender).Handle);
      GetCursorPos(fsBarraRalagemOld);
   end;
end;

procedure TMenu.pnlBarradeRolagemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
   BarraRolagemnewPos: TPoint;
   frmPoint : TPoint;
   newTop : integer;
begin
   if fsBarraRolagemClicada then
   begin
      GetCursorPos(BarraRolagemnewPos);
      newTop := (TPanel(Sender).Top - fsBarraRalagemOld.Y) + BarraRolagemnewPos.Y;

      //Se está na com top 0 não sobe mais                                                            //+3 é a margem
      if (fsBarraRalagemOld.Y > BarraRolagemnewPos.Y)  and
         (newTop <= (fsTamahobtnScroll)) then
      begin
         Exit;
      end;

      //não deixa descer até o infinito
      if (fsBarraRalagemOld.Y < BarraRolagemnewPos.Y) and                                                            //+3 é a margem
         ((newTop + TPanel(Sender).Height) >=
         (TPanel(TPanel(Sender).Parent).Height - (fsTamahobtnScroll))) then // somo para levar em conta o ultimo btn
      begin
         Exit;
      end;
      TWinControl(Sender).Top := newTop;
      doMoveConteiner(5*(fsBarraRalagemOld.Y-BarraRolagemnewPos.Y), False);
      fsBarraRalagemOld := BarraRolagemnewPos;
   end;
end;

procedure TMenu.pnlBarradeRolagemMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if fsBarraRolagemClicada then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    fsBarraRolagemClicada := False;
  end;
end;

procedure TMenu.pnlScrollResize(Sender: TObject);
begin
   doAtivaDesativaScroll(not (fsPanel.Height < TPanel(fsPanel.Parent).Height), not (fsPanel.Top = 0), not (fsPanel.Height < TPanel(fsPanel.Parent).Height));
end;

procedure TMenu.AddSubItem(nomeItem, CaptionItem, MenuItem: String);
var
   panel : TPanel;
   btn : TSpeedButtonMenu ;
begin
   panel := TPanel.Create(TPanel(fsPanel.FindComponent('pnl' + MenuItem)));
   panel.Parent := TPanel(fsPanel.FindComponent('pnl' + MenuItem));
   panel.ParentBackground := False; //linha para que a cor possa ser diferente do parent
   panel.Top := fsControleTop;
   panel.Align := alTop;
   panel.Name := 'pnl' + nomeItem;
   panel.Height := fsTamahoSubMenu;
   panel.Caption := '';
   panel.Color := frmTema.pnlCorMenu.Color;
   inc(fsControleTop, fsTamahoSubMenu);


   btn := TSpeedButtonMenu.Create(panel);
   btn.Name := 'btn' + nomeItem;
   btn.Font.Color := frmTema.pnlCorMenu.Font.Color;
   btn.Flat := True;
   btn.Parent := panel;
   btn.Align := alTop;
   btn.Height := fsTamahoSubMenu;
   btn.Form := 'frm' + nomeItem;
   btn.Caption := captionItem;
   btn.OnClick := AddSubItemOnClick;
end;

constructor TMenu.Create(Panel: TPanel; qMenu : TADOQuery);
var
   Ordem, Caption, Nome : String;
   PanelConteiner : TPanel;
begin
   //função para capturar o Scroll do mouse
   Application.OnMessage := doCapturaScroll;

   //Grava a largura do menu
   fsWidthMenu := Panel.Width;

   //cria a panel conteiner que vão ficar todos os botoes
   fsPanel := TPanel.Create(Panel);
   fsPanel.Parent := Panel;
   fsPanel.Top := 0;
   fsPanel.Left := 0;
   fsPanel.Width := Panel.Width - fsWidthScroll;
   fsPanel.Align := alCustom;
   fsPanel.Name := 'pnlConteiner';
   fsPanel.Caption := '';

   fsControleTop := 0;

   qMenu.First;
   while not qMenu.Eof do begin
      Ordem := qMenu.FieldByName('Ordem').AsString;
      Caption := qMenu.FieldByName('Caption').AsString;
      Nome := qMenu.FieldByName('Nome').AsString;

      if Length(Ordem) = 1 then//se o tamanho da ordem é 1('1','2','3') significa que é um btn pai
      begin
         AddItem(Nome,Caption)
      end
      else//se tem mais de um significa que é um subitem
      begin
         //localizo que é o btn pai
         qMenu.Locate('Ordem',copy(Ordem,1,1),[loCaseInsensitive, loPartialKey]);

         AddSubItem(Nome,Caption,qMenu.FieldByName('Nome').AsString);

         //volto a qry para sua posicao
         qMenu.Locate('Ordem',Ordem,[loCaseInsensitive, loPartialKey]);
      end;
      qMenu.Next;
   end;

   {:: Cria a Panel do Scroll}
   doCriaPanelScroll(Panel);


   {::Redimenciona conteiner}
   doRedimencionaPnlConteiner();
end;

destructor TMenu.Destroy;
begin
   fsPanel.DisposeOf;
end;

procedure TMenu.doAtivaDesativaScroll(Subir, Descer, Barra: Boolean);
var
   pnlScroll : TPanel;
begin
   pnlScroll := TPanel(TPanel(fsPanel.Parent).FindComponent('pnlScroll'));
   TSpeedButton(pnlScroll.FindComponent('btnSubir')).Visible := Subir;
   TSpeedButton(pnlScroll.FindComponent('btnDescer')).Visible := Descer;
   TPanel(pnlScroll.FindComponent('pnlBarradeRolagem')).Visible := Barra;

   //Ajusta o tamanho da barra de rolagem
   if Barra then
   begin
       TPanel(pnlScroll.FindComponent('pnlBarradeRolagem')).Height := getTamanhoBarraRolagem();
   end;
end;

procedure TMenu.doCapturaScroll(var Msg: TMsg; var Handled: Boolean);
var i: SmallInt;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam) ;
    if i > 0 then
      doMoveConteiner(5)
    else
      doMoveConteiner(-5);
    Handled := False;
  end;
end;

procedure TMenu.doCriaPanelScroll(Panel: Tpanel);
var
   PanelScroll, PanelBarra, Panelbtn : TPanel;
   btn: TSpeedButton;
   bmpGlyph : TBitmap;
begin
   {:: Cria a Panel}
   PanelScroll := TPanel.Create(Panel);
   PanelScroll.Parent := Panel;
   PanelScroll.Width := fsWidthScroll;
   PanelScroll.Align := alRight;
   PanelScroll.Name := 'pnlScroll';
   PanelScroll.Caption := '';
   PanelScroll.OnResize := pnlScrollResize;

   {::Cria a barra de rolagem}
   PanelBarra := TPanel.Create(PanelScroll);
   PanelBarra.Parent := PanelScroll;
   PanelBarra.ParentBackground := False; //linha para que a cor possa ser diferente do parent
   PanelBarra.Top := fsTamahobtnScroll + 3;  //+3 é a margem
   PanelBarra.Name := 'pnlBarradeRolagem';
   {:: O height da minha barra de rolagem é de acordo com o a diferença de tamanho
       para o meu menu}
   PanelBarra.Height := getTamanhoBarraRolagem();
   PanelBarra.Width := Round(fsWidthScroll / 2);
   PanelBarra.Left :=0;
   PanelBarra.Caption := '';
   PanelBarra.OnMouseDown := pnlBarradeRolagemMouseDown;
   PanelBarra.OnMouseUp := pnlBarradeRolagemMouseUp;
   PanelBarra.OnMouseMove := pnlBarradeRolagemMouseMove;
   PanelBarra.Color := frmTema.pnlCorBtn.Color;


  {:: Cria o btn que faz o recuo}
   btn := TSpeedButton.Create(PanelScroll);
   btn.Name := 'btnRecuo';
   btn.Font.Color := clBlack;
   btn.Font.Style := [fsBold];
   btn.Flat := True;
   btn.Left := -4;
   btn.Parent := PanelScroll;
   btn.Caption := '<<';
   btn.Top := Trunc((Screen.WorkAreaHeight / 2) - (fsWidthScroll / 2));
   btn.OnClick := doMinimizaMenu;

  {:: Cria o btn para subir o menu}
   btn := TSpeedButton.Create(PanelScroll);
   btn.Name := 'btnDescer';
   btn.Flat := True;
   btn.Left := 0;
   btn.Top := 0;
   btn.Height := fsTamahobtnScroll;
   btn.Width := fsTamahobtnScroll;
   btn.Parent := PanelScroll;
   //Tratamento para o speedbutton não colocar a parte preta como tranparente
   bmpGlyph := TBitmap.Create;
   bmpGlyph.Handle := CreateMappedBmp(frmTema.SetaCima.Picture.Bitmap.Handle, [clWhite], frmTema.pnlCorMenu.Color);
   btn.Glyph :=  bmpGlyph;
   btn.OnClick := btnSubirOnClick;

  {:: Cria o btn para descer o menu}
   btn := TSpeedButton.Create(PanelScroll);
   btn.Name := 'btnSubir';
   btn.Flat := True;
   btn.Left := 0;
   btn.Top := PanelScroll.Height - 15;
   btn.Height := fsTamahobtnScroll;
   btn.Width := fsTamahobtnScroll;
   btn.Anchors := [akBottom];
   btn.Parent := PanelScroll;
   btn.Glyph := frmTema.Setabaixo.Picture.Bitmap;
   btn.OnClick := btnDescerOnClick;
end;

procedure TMenu.doMinimizaMenu(Sender: TObject);
var
   tmp : TComponent;
begin
   //Pega a panel principal do menu
   tmp := TPanel(TSpeedButton(Sender).Parent).Parent;
   if TPanel(tmp).Width = fsWidthScroll then
   begin
      TPanel(tmp).Width := fsWidthMenu;
      TSpeedButton(Sender).Caption := '<<';

      {::Se meu conteiner é menor que o parent dele não precisa subir por isso inativa
       Se meu conteiner tem o top 0 não posso descer ele}
      doAtivaDesativaScroll(not ((fsPanel.Height + fsPanel.Top) <= TPanel(fsPanel.Parent).Height), not (fsPanel.Top = 0), not (fsPanel.Height < TPanel(fsPanel.Parent).Height));
   end
   else
   begin
      TPanel(tmp).Width := fsWidthScroll;
      TSpeedButton(Sender).Caption := '>>';

      //Se o menu está minimizado as funções scroll não aparece
      doAtivaDesativaScroll(False,False,False);
   end;
end;

procedure TMenu.doMoveConteiner(Valor: Integer; MoveBarra : Boolean = True);
var
   PanelBarra  : TPanel;
begin
   //Se está na com top 0 não sobe mais
   if (Valor > 0)  and (fsPanel.Top >= 0) then
   begin
      Exit;
   end;

   //não deixa descer até o infinito -- + 10 é uma margem
   if (Valor < 0)  and ((fsPanel.Top + fsPanel.Height + 10) <= TPanel(fsPanel.Parent).Height) then
   begin
      Exit;
   end;
   {::Se for um valor negativo o conteiner vai subir, se for positivo vai descer}
   fsPanel.Top := fsPanel.Top + Valor;
   {::Move a barra de rolagem}
   if MoveBarra then
   begin
      PanelBarra := TPanel(TPanel(TPanel(fsPanel.Parent).FindComponent('pnlScroll')).FindComponent('pnlBarradeRolagem'));
      PanelBarra.Top := PanelBarra.Top + (1 * ifthen(Valor > 0,-1,1));
   end;

   {::Se meu conteiner é menor que o parent dele não precisa subir por isso inativa
       Se meu conteiner tem o top 0 não posso descer ele}
   doAtivaDesativaScroll(not ((fsPanel.Height + fsPanel.Top) <= TPanel(fsPanel.Parent).Height), not (fsPanel.Top = 0), True);
end;

procedure TMenu.doMudaClickedCaptionSubItem(Sender: TObject);
var
   i,j : Integer;
   oTmp : TComponent;
begin

   //Desmarca todos os Itens
   for i := 0 to fsPanel.ComponentCount - 1 do
   begin
      for j := 0 to fsPanel.Components[i].ComponentCount - 1  do
      begin
         if (fsPanel.Components[i].Components[j] is TSpeedButtonMenu) then
         begin
            //muda o clicked de todos exeto o do ultimo clicado
            if TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Name <>  TSpeedButtonMenu(Sender).Name then
               TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Clicked := False;
         end;
      end;
   end;

   //Desmarca todos os SubItens e coloca a caption inicial
   for i := 0 to TPanel(TPanel(TSpeedButtonMenu(Sender).Parent).Parent).ComponentCount - 1 do
   begin
      oTmp := TPanel(TPanel(TSpeedButtonMenu(Sender).Parent).Parent).Components[i];
      for j := 0 to oTmp.ComponentCount - 1 do
      begin
         if (oTmp.Components[j] is TSpeedButtonMenu) then
         begin
            if TSpeedButtonMenu(oTmp.Components[j]).Name <> TSpeedButtonMenu(Sender).Name then
               TSpeedButtonMenu(oTmp.Components[j]).Clicked := False;
            if Copy(TSpeedButton(oTmp.Components[j]).Caption,1,1) = '>' then
               TSpeedButton(oTmp.Components[j]).Caption := Copy(TSpeedButtonMenu(oTmp.Components[j]).Caption,3,length(TSpeedButtonMenu(oTmp.Components[j]).Caption));
         end;
      end;
   end;

   //Acrescenta ► se for submenu e não for o clicado, se for o clicado desclica
   if not TSpeedButtonMenu(Sender).Clicked then
   begin
      TSpeedButtonMenu(Sender).Caption := '> ' + TSpeedButtonMenu(Sender).Caption;
      TSpeedButtonMenu(Sender).Clicked := True;
   end
   else
   begin
      TSpeedButtonMenu(Sender).Clicked := False;
   end;
end;

procedure TMenu.AddSubItemOnClick(Sender: TObject);
begin
   doMudaClickedCaptionSubItem(Sender);
   doShowForm(Sender);
end;

procedure TMenu.btnDescerOnClick(Sender: TObject);
begin
   doMoveConteiner(-5);
end;

procedure TMenu.btnSubirOnClick(Sender: TObject);
begin
   doMoveConteiner(5);
end;

procedure TMenu.AddItemOnClick(Sender: TObject);
begin
   doRedimensionaItem(Sender);
   doMudaClickedCorItem(Sender);
   doShowForm(Sender);
   {::Redimenciona conteiner}
   doRedimencionaPnlConteiner();
end;

procedure TMenu.doMudaClickedCorItem(Sender: TObject);
var
   i,j,h: Integer;
   oTmp : TComponent;
begin
   //Desmarca todos os Itens e coloca a corpadrão
   for i := 0 to fsPanel.ComponentCount - 1 do
   begin
      for j := 0 to fsPanel.Components[i].ComponentCount - 1  do
      begin
         oTmp := fsPanel.Components[i].Components[j];
         if (oTmp is TSpeedButtonMenu) then
         begin
            //muda o clicked de todos exeto o do ultimo clicado
            if TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Name <>  TSpeedButtonMenu(Sender).Name then
            begin
               TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Clicked := False;
               TPanel(TSpeedButtonMenu(fsPanel.Components[i].Components[j]).Parent).Color := frmTema.pnlCorBtn.Color;
            end;
         end;
         // desmarca os submenus
         if (oTmp is TPanel) then
         begin
            for h := 0 to oTmp.ComponentCount - 1 do
            begin
               if (oTmp.Components[h] is TSpeedButtonMenu) then
               begin
                  TSpeedButtonMenu(oTmp.Components[h]).Clicked := False;
                  if Copy(TSpeedButton(oTmp.Components[h]).Caption,1,1) = '>' then
                     TSpeedButton(oTmp.Components[h]).Caption := Copy(TSpeedButtonMenu(oTmp.Components[h]).Caption,3,length(TSpeedButtonMenu(oTmp.Components[h]).Caption));
               end;
            end;
         end;
      end;
   end;

   //Marca o menu clicado se nao ja estiver clicado
   if (TSpeedButtonMenu(Sender).Clicked) or (TPanel(TSpeedButtonMenu(Sender).Parent).Color = frmTema.pnlCorTop.Color) then
   begin
      TSpeedButtonMenu(Sender).Clicked := False;
      TPanel(TSpeedButtonMenu(Sender).Parent).Color := frmTema.pnlCorBtn.Color;
   end
   else
   begin
      TSpeedButtonMenu(Sender).Clicked := True;
      TPanel(TSpeedButtonMenu(Sender).Parent).Color := frmTema.pnlCorTop.Color;
   end;
end;

procedure TMenu.doRedimencionaPnlConteiner;
var
   i, TamanhoConteiner : Integer;
begin
   TamanhoConteiner := 0;
   //Pega o tamanho que todos os botoes estão ocupando
   for i := 0 to fsPanel.ComponentCount - 1 do begin
      if (fsPanel.Components[i] is TPanel) and (TPanel(fsPanel.Components[i]).Height >= fsTamahoMenu) then
         TamanhoConteiner := TamanhoConteiner + TPanel(fsPanel.Components[i]).Height;
   end;

   fsPanel.Height := TamanhoConteiner;
   {::Se meu conteiner é menor que o parent dele não precisa subir por isso inativa
       Se meu conteiner tem o top 0 não posso descer ele}
   doAtivaDesativaScroll(not (fsPanel.Height < TPanel(fsPanel.Parent).Height), not (fsPanel.Top = 0), not (fsPanel.Height < TPanel(fsPanel.Parent).Height));
end;

procedure TMenu.doRedimensionaItem(Sender : TObject);
var
   i,j : Integer;
begin
   j := 0;
   //Coloca todas as panels de botoes principais para o tamanho padrão exceto a clicada
   for i := 0 to fsPanel.ComponentCount - 1 do
   begin
      if (fsPanel.Components[i] is TPanel) then
         if(TPanel(fsPanel.Components[i]).Name <>  TPanel(TSpeedButtonMenu(Sender).Parent).Name) then
            TPanel(fsPanel.Components[i]).Height := fsTamahoMenu;
   end;

   //Vejo quantos submenus tem nesse menu para poder redimencionar a panel de forma correta
   for i := 0 to TPanel(TSpeedButtonMenu(Sender).Parent).ComponentCount - 1 do
   begin
      if (TPanel(TSpeedButtonMenu(Sender).Parent).Components[i] is TPanel) then
         inc(j)
   end;

   //redimensiona
   if (TSpeedButtonMenu(Sender).Clicked) or (TPanel(TSpeedButton(Sender).Parent).Height > fsTamahoMenu) then
   begin
      TPanel(TSpeedButton(Sender).Parent).Height := fsTamahoMenu;
   end
   else
   begin
      TPanel(TSpeedButton(Sender).Parent).Height := j * fsTamahoSubMenu + fsTamahoMenu;
   end;
end;

end.
