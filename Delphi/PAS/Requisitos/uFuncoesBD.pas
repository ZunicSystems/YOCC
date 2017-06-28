unit uFuncoesBD;

interface
uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, Vcl.Forms, uVariaveis, Vcl.StdCtrls, Math,
  Vcl.Mask, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.ExtCtrls, vcl.Dialogs;

procedure DBparaERP(qryDB:TADOQuery; frmERP : TForm);
procedure ERPparaDB(pStored:TADOStoredProc; frmERP:TForm; TipoOperacar:String; Query:TADOQuery);
procedure ExecutaStoredProc(pStored:TADOStoredProc);
Procedure Zera_Parameter(pStored:TADOStoredProc);

implementation

{::Pega os dados da Qry e coloca na tela}
procedure DBparaERP(qryDB:TADOQuery; frmERP : TForm);
var
   i, j : Integer;
   Campo : TComponent;
   cVar : String;
begin
   for i := 0 to qryDB.FieldDefs.Count - 1 do
   begin
      Campo := frmERP.FindComponent(qryDB.fieldDefs.Items[i].Name);
      if Campo <> nil then
      begin
         if Campo is TEdit then
         begin
            {::Verifica se o Campo é float money ou String::}
            if (qryDB.FieldDefs.Items[i].DataType = ftFloat) and
            (Trim(qryDB.FieldByName( qryDB.FieldDefs.Items[i].Name ).AsString) <> '') then
            begin
                TEdit(Campo).Text := FloatToStr(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsFloat);
                Continue;
            end;
            if qryDB.FieldDefs.Items[i].DataType = ftBCD then begin
               TEdit(Campo).Text := FloatToStr(RoundTo(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsFloat,-4));
               Continue;
            end;

            TEdit(Campo).Text := qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsString;
            Continue;
         end;

         if Campo is TLabeledEdit then
         begin
            {::Verifica se o Campo é float money ou String::}
            if (qryDB.FieldDefs.Items[i].DataType = ftFloat) and
            (Trim(qryDB.FieldByName( qryDB.FieldDefs.Items[i].Name ).AsString) <> '') then
            begin
                TLabeledEdit(Campo).Text := FloatToStr(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsFloat);
                Continue;
            end;
            if qryDB.FieldDefs.Items[i].DataType = ftBCD then begin
               TLabeledEdit(Campo).Text := FloatToStr(RoundTo(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsFloat,-4));
               Continue;
            end;

            TLabeledEdit(Campo).Text := qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsString;
            Continue;
         end;

         if Campo is TMaskEdit then
         begin
            TMaskEdit(Campo).Text := Copy(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name ).AsString, 1, 10);
            Continue;
         end;
         if Campo is TComboBox then
         begin
            TComboBox(Campo).Text := Trim(qryDB.FieldByName( qryDB.FieldDefs.Items[i].Name ).AsString);
            Continue;
         end;
         if Campo is TSpinEdit then
         begin
            TSpinEdit(Campo).Value := qryDB.FieldByName( qryDB.FieldDefs.Items[i].Name ).AsInteger;
            Continue;
         end;
         if Campo is TDBLookupComboBox then
         begin
             If qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsInteger <> 0 then
             begin
                TDBLookupComboBox(Campo).KeyValue := Trim(qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsString)
             end
             else
             begin
                TDBLookupComboBox(Campo).KeyValue := '0';
             end;
             Continue;
         end;
         if Campo is TCheckBox then
         begin
             If qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsBoolean then
             begin
                TCheckBox(Campo).Checked := True
             end
             else
             begin
                TCheckBox(Campo).Checked := False;
             end;
             Continue;
         end;
         if Campo is TRadioGroup then
         begin
             cVar := qryDB.FieldByName(qryDB.FieldDefs.Items[i].Name).AsString;
             for j := 0 to TRadioGroup(Campo).Items.Count -1 do begin
                If Pos( cVar, TRadioGroup(Campo).Items[j]) > 0 then
                   TRadioGroup(Campo).ItemIndex := j;
             end;
             Continue;
         end;
         if Campo is TMemo then
         begin
             TMemo(Campo).Text := Trim(qryDB.FieldByName( qryDB.FieldDefs.Items[i].Name ).AsString);
             Continue;
         end;
      end;
   end;
end;

Procedure Zera_Parameter(pStored:TADOStoredProc);
Var i : Integer;
begin
   For i := 0 to pStored.Parameters.Count - 1 do pStored.Parameters[i].Value := Null;
end;

{::Pega os dados da tela e joga no banco}
procedure ERPparaDB(pStored:TADOStoredProc; frmERP:TForm; TipoOperacar:String; Query:TADOQuery);
var
  Source: TParameter;
  i, j : Integer;
begin
   Zera_Parameter(pStored);

   for i := 0 to frmERP.ComponentCount-1 do
   begin
      {::Localizar o Parametro na Stored Procedure::}
      Source := pStored.Parameters.FindParam( '@V_' + frmERP.Components[i].Name );
      if Source <> nil then
      begin
         //--> Verifica se é Edit
         if frmERP.Components[i] is TEdit then
         begin
            if Source.DataType = ftString then
            begin
               Source.Value := TEdit(frmERP.Components[i]).Text;
               Continue;
            end;
            if Source.DataType = ftDateTime then
            begin
               if TEdit(frmERP.Components[i]).Text <> '' then
               begin
                  Source.Value := StrToDateTime(TEdit(frmERP.Components[i]).Text);
                  Continue;
               end;
            end;
            if Source.DataType in [ftFloat, ftInteger, ftBCD] then
            begin
               if TEdit(frmERP.Components[i]).Text <> '' then
               begin
                  Source.Value := StrToFloat(TEdit(frmERP.Components[i]).Text);
                  Continue;
               end;
            end;
         end;
         //--> Verifica se é TLabeledEdit
         if frmERP.Components[i] is TLabeledEdit then
         begin
            if Source.DataType = ftString then
            begin
               Source.Value := TLabeledEdit(frmERP.Components[i]).Text;
               Continue;
            end;
            if Source.DataType = ftDateTime then
            begin
               if TLabeledEdit(frmERP.Components[i]).Text <> '' then
               begin
                  Source.Value := StrToDateTime(TLabeledEdit(frmERP.Components[i]).Text);
                  Continue;
               end;
            end;
            if Source.DataType in [ftFloat, ftInteger, ftBCD] then
            begin
               if TLabeledEdit(frmERP.Components[i]).Text <> '' then
               begin
                  Source.Value := StrToFloat(TLabeledEdit(frmERP.Components[i]).Text);
                  Continue;
               end;
            end;
         end;
         //--> Verifica se é MaskEdit
         if frmERP.Components[i] is TMaskEdit then
         begin
            if Source.DataType = ftString then
            begin
               Source.Value := TMaskEdit(frmERP.Components[i]).Text;
               Continue;
            end;
            if Source.DataType = ftDateTime then
            begin
               if (TMaskEdit(frmERP.Components[i]).Text <> '  /  /    ') And
                  (TMaskEdit(frmERP.Components[i]).Text <> '') then
               Begin
                  Source.Value := StrToDateTime(TMaskEdit(frmERP.Components[i]).Text);
               End
               else
               begin
                  Source.Value := null;
               end;
               Continue;
            end;
            if Source.DataType in [ftFloat, ftInteger] then
            begin
               if TMaskEdit(frmERP.Components[i]).Text <> '' then
               begin
                  Source.Value := StrToFloat(TMaskEdit(frmERP.Components[i]).Text);
                  Continue;
               end;
            end;
         end;
         //--> Verifica se é ComboBox
         if frmERP.Components[i] is TComboBox then
         begin
            Source.Value := TComboBox(frmERP.Components[i]).Text;
            Continue;
         end;
         //--> Verifica se é DBLookupComboBox
         if frmERP.Components[i] is TDBLookupComboBox then
         begin
            Source.Value := Trim(TDBLookupComboBox(frmERP.Components[i]).KeyValue);
            Continue;
         end;
         //--> Verifica se é Memo
         if frmERP.Components[i] is TMemo then
         begin
            Source.Value := TMemo(frmERP.Components[i]).Text;
            Continue;
         end;
         //--> Verifica se é CheckBox
         if frmERP.Components[i] is TCheckBox then
         begin
            if TCheckBox(frmERP.Components[i]).Checked = True then
            begin
               Source.Value := True;
            end
            else
            begin
               Source.Value := False;
            end;
            Continue;
         end;

         //--> Verifica se é SpinEdit
         if frmERP.Components[i] is TSpinEdit then
         begin
            Source.Value := TSpinEdit(frmERP.Components[i]).Value;
            Continue;
         end;
      end;
   end;

   //--> Operacao que a SP irá executar, 'C' Create, 'U' UPDATE ou 'D' DELETE
   Source := pStored.Parameters.FindParam('@V_TipoOperacao');
   if Source <> nil then Source.Value := UpperCase(TipoOperacar);

   // Executa a Storad Procedure
   ExecutaStoredProc(pStored);
end;

{::Executa a Stored Procedure}
procedure ExecutaStoredProc(pStored:TADOStoredProc);
begin
    pStored.Connection.BeginTrans;
   if not pStored.Prepared then pStored.Prepared := True;

   try

      pStored.ExecProc;
      pStored.Connection.CommitTrans;
   except on E: Exception do
      Begin
         pStored.Connection.RollbackTrans;
      end;
   end;
   pStored.Prepared := False;
end;

end.
