tableextension 70007 FBM_GLEntryExt_DD extends "G/L Entry"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(70001; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            DataClassification = ToBeClassified;
        }
        field(70003; FBM_Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin,Online;

        }
        field(70004; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
}


