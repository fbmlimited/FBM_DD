tableextension 70013 FBM_SCLineExt_DD extends "Sales Cr.Memo Line"
{
    fields
    {
        //DEVOPS #622 -- begin
        field(70000; "FBM_Period Start"; Date)
        {
        }
        field(70001; "FBM_Period End"; Date)
        {

        }
        field(70003; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;
        }
    }
}
