tableextension 70037 FBM_TransLineExt_DD extends "Transfer Line"
{
    fields
    {

        field(70000; FBM_SiteFrom; code[20])
        {
            Caption = 'Site From';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }
        field(70001; FBM_SiteTo; code[20])
        {
            Caption = 'Site To';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }

    }

}