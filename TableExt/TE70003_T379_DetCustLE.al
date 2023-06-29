tableextension 70003 FBM_DetCustLEExt_DD extends "Detailed Cust. Ledg. Entry"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70001; "FBM_Period End"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(70003; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin;

        }
        field(70004; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
    var
}