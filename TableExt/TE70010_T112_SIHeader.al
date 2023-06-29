tableextension 70010 FBM_SIHeaderExt_DD extends "Sales Invoice Header"
{
    fields
    {
        field(70000; FBM_Site; Code[20])
        {
            Caption = 'Site';
        }
        //DevOps #619 -- begin
        field(70001; "FBM_Contract Code"; Code[4])
        {


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
        field(70004; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin;

        }
        field(70005; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }

        field(70008; "FBM_Currency2"; code[10])
        {
            caption = 'Local Currency ';
            TableRelation = Currency;

        }
        field(70009; "FBM_BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
        field(70010; "FBM_BeneficiaryBank2"; text[100])
        {
            caption = 'Payment Bank Beneficiary 2 ';

        }
        field(700012; "FBM_Cust Payment Bank Name"; Code[100])
        {


        }
        field(700014; "FBM_Cust Payment Bank Name2"; Code[100])
        {


        }


        field(70013; "FBM_Billing Statement"; Boolean)
        {
            Caption = 'Billing Statement';

        }

        field(70023; FBM_Signature_pic; MediaSet)
        {
            caption = 'Signature';


        }


    }
    var
}
