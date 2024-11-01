tableextension 70043 FBM_InvSetupext_DD extends "Inventory Setup"
{
    fields
    {
        field(70000; FBM_InvAdjTemplate; code[10])
        {
            caption = 'Adjmt. Template';
            TableRelation = "Item Journal Template";

        }
        field(70001; FBM_InvAdjBatch; code[10])
        {
            caption = 'Adjmt. Batch';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field(FBM_InvAdjTemplate));

        }
        field(70002; FBM_EmailTransfer; text[250])
        {
            caption = 'Email Address for Transfers';


        }
    }

}