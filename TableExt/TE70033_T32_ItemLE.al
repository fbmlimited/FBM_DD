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
        field(70002; FBM_UsedItem; Boolean)
        {
            Caption = 'Used Items';


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
            ObsoleteState = Removed;


        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Ped2';
            ObsoleteState = Removed;


        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Ped2 [4]';

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Ped3 [7]';

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
                    resentry.FBM_Pedimentobis := rec.FBM_Pedimentobis;
                    resentry.FBM_Pedimento12 := rec.FBM_Pedimento12;

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
            trigger
                        OnValidate()
            begin
                if (FBM_Pedimentobis <> 'N/A') and (FBM_Pedimentobis <> '0') and (FBM_Pedimentobis <> '') then
                    FBM_Pedimento := FBM_Pedimentobis;
            end;
        }
        field(70137; FBM_FromOrion; Boolean)
        {
            Caption = 'From Orion';


        }
        field(70138; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Ped1 [3]';


        }
    }

}