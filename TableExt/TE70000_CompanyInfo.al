tableextension 70000 FBM_CompanyInfoExt_DD extends "Company Information"
{
    fields
    {
        field(70000; FBM_EnableWS; Boolean)
        {
            caption = 'Enable WebServices';
        }
        field(70001; FBM_EnableSiteWS; Boolean)
        {
            caption = 'Enable Site WebServices';
        }
    }

}