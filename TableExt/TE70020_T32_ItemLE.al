tableextension 70020 FBM_ItemLEExt_DD extends "Item Ledger Entry"
{
    fields
    {

        field(70002; "FBM_Document No Value Entry"; Code[20])
        {
            FieldClass = FlowField;


            CalcFormula = lookup("Purch. Rcpt. Header"."Order No." where("No." = FIELD("Document No.")));


        }
    }


}

