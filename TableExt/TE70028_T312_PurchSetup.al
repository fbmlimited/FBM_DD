tableextension 70028 FBM_PurchSetupExt_DD extends "Purchases & Payables Setup"
{
    fields
    {
        field(70100; FBM_Enable_CompMsg; boolean)
        {
            Caption = 'En. Comp. Doc. Msg.';


        }
        field(70101; FBM_Use_Pedimento; boolean)
        {
            Caption = 'Use "Pedimento"';


        }

    }

}