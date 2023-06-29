tableextension 70026 FBM_CustPGExt_DD extends "Customer Posting Group"
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