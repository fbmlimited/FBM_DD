tableextension 70000 FBM_CompanyInfoExt_DD extends "Company Information"
{
    fields
    {
        field(70010; FBM_EnWS; Boolean)
        {
            caption = 'Enable WebServices';
        }
        field(70011; FBM_EnSiteWS; Boolean)
        {

            caption = 'Enable Site WebServices';
        }
        field(70012; "FBM_TINNumber"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TIN Number';
        }
    }

}