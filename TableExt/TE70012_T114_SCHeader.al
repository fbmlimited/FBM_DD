tableextension 70012 FBM_SCHeaderExt_DD extends "Sales Cr.Memo Header"
{
    fields
    {
        field(70100; FBM_Site; Code[20])
        {
            caption = 'Site';

        }

        field(70101; "FBM_Contract Code"; Code[4])
        {

            caption = 'Contract';
        }

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

        }
        field(70105; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

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
        field(700112; "FBM_Cust Payment Bank Name"; Code[100])
        {
            caption = 'Payment Bank Name';


        }
        field(700114; "FBM_Cust Payment Bank Name2"; Code[100])
        {
            caption = 'Payment Bank 2 Name';


        }


        field(70123; FBM_Signature_pic; MediaSet)
        {
            caption = 'Signature';


        }

    }

}
