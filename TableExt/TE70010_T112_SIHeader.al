tableextension 70010 FBM_SIHeaderExt_DD extends "Sales Invoice Header"
{
    fields
    {
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
        }
        //DevOps #619 -- begin
        field(70101; "FBM_Contract Code"; Code[4])
        {
            Caption = 'Contract';



        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(70102; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
        }
        field(70103; "FBM_Period End"; Date)
        {
            caption = 'Period End';
        }
        field(70104; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(70105; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }
        field(70106; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
        field(70108; "FBM_Currency2"; code[10])
        {
            caption = 'Local Currency ';
            TableRelation = Currency;

        }
        field(70109; "FBM_BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
        field(70110; "FBM_BeneficiaryBank2"; text[100])
        {
            caption = 'Payment Bank Beneficiary 2 ';

        }
        field(70112; "FBM_Cust Payment Bank Name"; Code[100])
        {
            caption = 'Payment Bank Name';


        }
        field(70114; "FBM_Cust Payment Bank Name2"; Code[100])
        {
            caption = 'Payment Bank 2 Name';


        }


        field(70113; "FBM_Billing Statement"; Boolean)
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
