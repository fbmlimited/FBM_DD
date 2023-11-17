tableextension 70035 FBM_DirectTransHeaderExt_DD extends "Direct Trans. Header"
{
    fields
    {
        field(70000; FBM_SiteFrom; code[20])
        {
            Caption = 'Site From';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        field(700001; FBM_SiteTo; code[20])
        {
            Caption = 'Site To';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }

    }

}