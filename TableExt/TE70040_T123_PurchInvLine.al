tableextension 70040 FBM_PurchInvLineExt_DD extends "Purch. Inv. Line"
{
    fields
    {
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

        }
        field(70137; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Ped1 [3]';


        }

    }

}