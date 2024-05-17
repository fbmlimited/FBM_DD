tableextension 70001 FBM_CustLEExt_DD extends "Cust. Ledger Entry"
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
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(70104; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
        field(70105; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
        field(61100; FBM_DocNo; code[20])
        {
            Caption = 'Doc. No.';


        }
        field(61101; FBM_DocDate; Date)
        {
            Caption = 'Doc. Date';


        }
        field(61102; FBM_DocType; Enum "Gen. Journal Document Type")
        {
            Caption = 'Doc. Type';


        }

    }
    var
}