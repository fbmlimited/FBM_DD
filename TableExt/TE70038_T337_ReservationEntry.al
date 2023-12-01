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
    }

}