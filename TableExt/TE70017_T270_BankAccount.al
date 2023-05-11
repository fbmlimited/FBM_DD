tableextension 70017 FBM_BankAccountExt_DD extends "Bank Account"
{
    fields
    {
        field(70000; "FBM_Check Layout Code"; code[20])
        {
            caption = 'Check Layout';
            TableRelation = "Custom Report Layout" where("Report ID" = const(50041));
        }
        // Add changes to table fields here
        field(70003; "FBM_Approval Batch Amount"; Decimal)
        {
            FieldClass = FlowField;


            CalcFormula = Sum("Gen. Journal Line"."Amount" where("Bal. Account No." = FIELD("No."),
             "Journal Batch Name" = filter('APPROVALS'),
             "Reason Code" = filter('APPROVED')));



        }

        field(70004; "FBM_Approval Batch Amount2"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Sum("Detailed Vendor Ledg. Entry".Amount where
             ("FBM_Default Bank Account" = field("No."), FBM_Open = filter(true), FBM_approved = filter(true)));
        }
    }

    var
        myInt: Integer;
}