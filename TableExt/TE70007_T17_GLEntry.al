tableextension 70007 FBM_GLEntryExt_DD extends "G/L Entry"
{
    fields
    {

        field(70100; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(70101; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            DataClassification = ToBeClassified;
        }
        field(70103; FBM_Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(70104; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
        field(70106; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
    }
}


