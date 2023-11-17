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

    }

}