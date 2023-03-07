tableextension 70019 FBM_DetVendorLEExt_DD extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(70025; "FBM_Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Default Bank Account';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."FBM_Default Bank Account" where("No." = field("Vendor No.")));
        }

        field(70000; FBM_approved; Boolean)
        {
            Caption = 'Finance Approved';

            FieldClass = FlowField;
            CalcFormula = lookup("Vendor Ledger Entry".approved where("Entry No." = field("Vendor Ledger Entry No.")));

        }

        field(70001; FBM_open; Boolean)
        {
            Caption = 'Finance Approved';

            FieldClass = FlowField;
            CalcFormula = lookup("Vendor Ledger Entry".Open where("Entry No." = field("Vendor Ledger Entry No.")));

        }
    }
}
