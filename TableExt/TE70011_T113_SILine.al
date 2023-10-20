tableextension 70011 FBM_SILineExt_DD extends "Sales Invoice Line"
{
    fields
    {

        field(70100; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
        }
        field(70101; "FBM_Period End"; Date)
        {
            caption = 'Period End';
        }

        field(70102; FBM_IsPeriodEnabled; Boolean)
        {
            caption = 'Period Enabled';
        }
        field(70103; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
}
