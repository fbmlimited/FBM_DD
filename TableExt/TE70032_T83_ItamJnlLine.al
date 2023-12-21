tableextension 70032 FBM_ItenJnlLineExt_DD extends "Item Journal Line"
{
    fields
    {
        field(70100; FBM_Site; Code[20])
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


        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Ped2';


        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Ped3';

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Ped4';


        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
    }

}