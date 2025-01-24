tableextension 70014 FBM_SalesSetupExt_DD extends "Sales & Receivables Setup"
{
    fields
    {
        field(70100; "FBM_Show Hall Invoice Warning"; Boolean)
        {
            caption = 'Show Hall Invoice Warning';
        }
        field(70102; "FBM_Period Start End mandatory"; Boolean)
        {
            caption = 'Period Mandatory';

        }
        field(70103; "FBM_Custtmp"; code[20])
        {

        }
        field(70104; "FBM_Billing Statement Nos."; Code[20])
        {

            Caption = 'Billing Statement Nos.';
            TableRelation = "No. Series";
        }
        field(70105; "FBM_SI_PTU"; text[50])
        {

            Caption = 'Sales Invoice PTU';

        }
        field(70106; "FBM_SI_DateIssued"; Date)
        {

            Caption = 'Sales Invoice Date Issued';

        }
        field(70107; "FBM_CM_PTU"; text[50])
        {

            Caption = 'Credit Memo PTU';

        }
        field(70108; "FBM_CM_DateIssued"; Date)
        {

            Caption = 'Credit Memo Date Issued';

        }
        field(70109; "FBM_BS_PTU"; text[50])
        {

            Caption = 'Billing Statement PTU';

        }
        field(70110; "FBM_BS_DateIssued"; Date)
        {

            Caption = 'Billing Statement Date Issued';

        }

    }
    var
}
