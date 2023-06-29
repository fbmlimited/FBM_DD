tableextension 70011 FBM_SILineExt_DD extends "Sales Invoice Line"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
        }
        field(70001; "FBM_Period End"; Date)
        {
        }

        field(70002; FBM_IsPeriodEnabled; Boolean)
        {
        }
        field(70003; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
}
