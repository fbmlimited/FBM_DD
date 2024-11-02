tableextension 70038 FBM_RevEntryExt_DD extends "Reservation Entry"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        field(70101; FBM_BinCode; Code[20])
        {
            Caption = 'Bin Code';


        }
        field(70131; "FBM_Pedimento1"; Text[2])
        {
            Caption = 'Ped1 [2]';
            //ObsoleteState = Removed;


        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Ped2 [2]';
            //ObsoleteState = Removed;


        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Ped3 [4]';

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
        field(70136; "FBM_Pedimentobis"; Text[18])
        {
            Caption = 'Pedimento 2';
            Editable = false;

        }
        field(70137; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Ped Alpha [3]';


        }
    }

}