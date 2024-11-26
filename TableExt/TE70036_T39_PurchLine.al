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
            Caption = 'Año Validaciòn [2]';
            //ObsoleteState = Removed;
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Aduana Despacho [2]';
            //ObsoleteState = Removed;
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Nro Patente [4]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Nro Progr. de Despacho [6]';
            ObsoleteState = Removed;
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
            ObsoleteState = Removed;

        }
        field(70136; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Referencia JYM [3]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70137; "FBM_Pedimento34"; Text[1])
        {
            Caption = 'Ultimo digito año en curso [1]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70138; "FBM_Pedimento42"; Text[6])
        {
            Caption = 'Nro Progr. de Despacho [6]';

            trigger
            OnValidate()
            begin

                updateped();
            end;

        }
        field(70139; "FBM_Pedimento_2"; Text[22])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
        field(70103; "FBM_IsFreight"; Boolean)
        {
            caption = 'Is Freight?';

        }
        field(70104; "FBM_IsWht"; Boolean)
        {
            caption = 'Is Withholding?';

        }
        modify("No.")
        {
            trigger
            OnAfterValidate()
            var
                item: record Item;
                glacc: record "G/L Account";

            begin
                if rec.type = rec.type::Item then
                    if item.get("No.") then begin
                        rec.FBM_IsFreight := item.FBM_IsFreight;
                        rec.FBM_IsWht := item.FBM_IsWht;
                    end;
                if rec.type = rec.type::"G/L Account" then
                    if glacc.get("No.") then begin
                        rec.FBM_IsFreight := glacc.FBM_IsFreight;
                        rec.FBM_IsWht := glacc.FBM_IsWht;
                    end;


            end;

        }
    }
    trigger
    OnInsert()
    var
        purchheader: record "Purchase Header";
    begin
        if purchheader.get(rec."Document Type", rec."Document No.") then
            if purchheader.FBM_Pedimento_2 <> '' then begin
                rec.FBM_Pedimento12 := purchheader.FBM_Pedimento12;
                rec.FBM_Pedimento1 := purchheader.FBM_Pedimento1;
                rec.FBM_Pedimento2 := purchheader.FBM_Pedimento2;
                rec.FBM_Pedimento3 := purchheader.FBM_Pedimento3;
                rec.FBM_Pedimento42 := purchheader.FBM_Pedimento42;
                rec.FBM_Pedimento_2 := purchheader.FBM_Pedimento_2;

            end;
    end;

    local procedure updateped()
    var
        purchheader: record "Purchase Header";
    begin
        if purchheader.get(rec."Document Type", rec."Document No.") then
            if purchheader.FBM_Pedimento_2 = '' then
                rec.FBM_Pedimento_2 := rec.FBM_Pedimento12 + ' ' + rec.FBM_Pedimento1 + ' ' + FBM_Pedimento2 + ' ' + rec.FBM_Pedimento3 + '-' + rec.FBM_Pedimento42
            else
                error('Pedimento in the header must be blank!');

    end;
}