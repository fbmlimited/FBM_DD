tableextension 70040 FBM_PurchInvLineExt_DD extends "Purch. Inv. Line"
{
    fields
    {
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