unit uFuncoes;

interface
uses
   Winapi.Windows, Winapi.Messages, Data.Win.ADODB, Data.DB, System.SysUtils,
   System.Variants, System.Classes, Vcl.Forms, uVariaveis, Vcl.StdCtrls, Math,
   Vcl.Mask, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.ExtCtrls, vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Graphics, Vcl.Buttons;

procedure EdicaoCampos(frmERP : Tform; Editavel : Boolean);

implementation

procedure EdicaoCampos(frmERP : Tform; Editavel : Boolean);
var
   i : integer;
begin
   for i := 0 to frmERP.ComponentCount - 1 do begin
      if (frmERP.Components[i] is TEdit) and ((frmERP.Components[i] as TEdit).Color <> clBtnFace)          then (frmERP.Components[i] as TEdit).ReadOnly := not Editavel;
      if (frmERP.Components[i] is TLabeledEdit ) and ((frmERP.Components[i] as TLabeledEdit).Color <> clBtnFace) then (frmERP.Components[i] as TLabeledEdit).ReadOnly := not Editavel;
      if (frmERP.Components[i] is TDateTimePicker ) and ((frmERP.Components[i] as TDateTimePicker).Color <> clBtnFace) then (frmERP.Components[i] as TDateTimePicker).Enabled := Editavel;
      if (frmERP.Components[i] is TMaskEdit) and ((frmERP.Components[i] as TMaskEdit).Color <> clBtnFace)  then (frmERP.Components[i] as TMaskEdit).ReadOnly := not Editavel;
      if frmERP.Components[i] is TDBEdit       then (frmERP.Components[i] as TDBEdit).ReadOnly := not Editavel;
      if frmERP.Components[i] is TButton       then (frmERP.Components[i] as TButton).Enabled := Editavel;
      if frmERP.Components[i] is TSpeedButton  then (frmERP.Components[i] as TSpeedButton).Enabled := Editavel;
      if frmERP.Components[i] is TMemo         then (frmERP.Components[i] as TMemo).Enabled := Editavel;
      if frmERP.Components[i] is TCheckBox     then (frmERP.Components[i] as TCheckBox).Enabled := Editavel;
      if frmERP.Components[i] is TTreeView     then (frmERP.Components[i] as TTreeView).ReadOnly := not Editavel;
      if (frmERP.Components[i] is TDBLookUpComboBox) and ((frmERP.Components[i] as TDBLookupComboBox).Color <> clBtnFace) then (frmERP.Components[i] as TDBLookUpComboBox).Enabled := Editavel;
      if frmERP.Components[i] is TDBRadioGroup then (frmERP.Components[i] as TDBRadioGroup).ReadOnly := not Editavel;
   end;
end;

end.
