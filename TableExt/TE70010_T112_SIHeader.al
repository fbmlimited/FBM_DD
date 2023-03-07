tableextension 70010 FBM_SIHeaderExt_DD extends "Sales Invoice Header"
{
    fields
    {
        field(70000; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = "Cust-Op-Site"."Site Code";
        }
        //DevOps #619 -- begin
        field(70001; "FBM_Contract Code"; Code[4])
        {
            TableRelation = "Customer-Site"."Contract Code" WHERE("Customer No." = field("Sell-to Customer No."));

            trigger OnValidate()
            begin
            end;
        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(70002; "FBM_Period Start"; Date)
        {
        }
        field(70003; "FBM_Period End"; Date)
        {
        }

        field(70006; "FBM_Billing Statement"; Boolean)
        {


        }
    }
    var
}
