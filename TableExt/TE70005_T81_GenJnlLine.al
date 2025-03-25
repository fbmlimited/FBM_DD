tableextension 70005 FBM_GenJnlLineExt_DD extends "Gen. Journal Line"
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
            // ObsoleteState = Removed;
        }
        field(70104; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;


        }
        field(70106; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
        field(70010; FBM_DueDate_FF; Date)
        {
            Caption = 'DueDate';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Inv. Header"."Due Date" where("No." = field("Applies-to Doc. No.")));

        }
    }
    var
}
