tableextension 70033 FBM_ItemLE_DD extends "Item Ledger Entry"
{
    fields
    {
        field(70000; FBM_NewItem; Boolean)
        {
            Caption = 'New Items';


        }
        field(70001; FBM_Country; code[10])
        {
            Caption = 'Country';


        }
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
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
            trigger
            OnValidate()
            var
                resentry: record "Reservation Entry";



            begin
                resentry.SetRange("Item Ledger Entry No.", rec."Entry No.");
                if resentry.FindFirst() then begin
                    resentry.FBM_Site := rec.FBM_Site;
                    resentry.FBM_Pedimento := rec.FBM_Pedimento;
                    resentry.FBM_Pedimento1 := rec.FBM_Pedimento1;
                    resentry.FBM_Pedimento2 := rec.FBM_Pedimento2;
                    resentry.FBM_Pedimento3 := rec.FBM_Pedimento3;
                    resentry.FBM_Pedimento4 := rec.FBM_Pedimento4;
                    resentry.Modify();
                end;

            end;

        }
        field(70136; "FBM_Pedimentobis"; Text[18])
        {
            Caption = 'Pedimento 2';
            Editable = false;

        }
    }

}