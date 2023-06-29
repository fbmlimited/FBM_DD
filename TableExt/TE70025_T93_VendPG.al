tableextension 70025 FBM_VendPGExt_DD extends "Vendor Posting Group"
{
    fields
    {
        field(70000; FBM_BudgetAccount; code[20])
        {
            Caption = 'Replace Budget Account for VAT';
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BUDGET_ACCOUNT'));

        }

    }

}