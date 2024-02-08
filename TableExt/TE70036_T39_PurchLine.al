tableextension 70036 FBM_PurchLineExt_DD extends "Purchase Line"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        modify("Location Code")
        {
            trigger
                OnAfterValidate()
            var
                loc: record Location;
            begin
                if loc.get("Location Code") then
                    if loc.FBM_Site <> '' then
                        rec.FBM_Site := loc.FBM_Site;
            end;
        }
        field(70131; "FBM_Pedimento1"; Text[2])
        {
            Caption = 'Ped1';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Ped2';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Ped3';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Ped4';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;

        }

    }
    trigger
    OnInsert()
    var
        purchheader: record "Purchase Header";
    begin
        if purchheader.get(rec."Document Type", rec."Document No.") then
            if purchheader.FBM_Pedimento <> '' then begin
                rec.FBM_Pedimento1 := purchheader.FBM_Pedimento1;
                rec.FBM_Pedimento2 := purchheader.FBM_Pedimento2;
                rec.FBM_Pedimento3 := purchheader.FBM_Pedimento3;
                rec.FBM_Pedimento4 := purchheader.FBM_Pedimento4;
                rec.FBM_Pedimento := purchheader.FBM_Pedimento;

            end;
    end;

    local procedure updateped()
    var
        purchheader: record "Purchase Header";
    begin
        if purchheader.get(rec."Document Type", rec."Document No.") then
            if purchheader.FBM_Pedimento = '' then
                rec.FBM_Pedimento := rec.FBM_Pedimento1 + ' ' + rec.FBM_Pedimento2 + ' ' + rec.FBM_Pedimento3 + ' ' + rec.FBM_Pedimento4
            else
                error('Pedimento in the header must be blank!');

    end;
}