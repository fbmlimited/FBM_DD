tableextension 70011 FBM_SILineExt_DD extends "Sales Invoice Line"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
        }
        field(70001; "FBM_Period End"; Date)
        {
            caption = 'Period End';
        }

        field(70002; FBM_IsPeriodEnabled; Boolean)
        {
            caption = 'Period Enabled';
        }
        field(70003; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
}
