tableextension 70030 FBM_LocationExt_DD extends Location
{
    fields
    {
        field(70000; FBM_NewItem; Boolean)
        {
            Caption = 'New Items';


        }
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
    }

}