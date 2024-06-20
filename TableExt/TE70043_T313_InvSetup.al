tableextension 70043 FBM_InvSetupext_DD extends "Inventory Setup"
{
    fields
    {
        field(70000; FBM_InvAdjTemplate; code[10])
        {
            caption = 'Adjmt. Template';
            TableRelation = "Gen. Journal Template";

        }
        field(70001; FBM_InvAdjBatch; code[10])
        {
            caption = 'Adjmt. Batch';
            TableRelation = "Gen. Journal Batch" where("Journal Template Name" = field(FBM_InvAdjTemplate));

        }
    }

}