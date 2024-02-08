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
    }
    var
}
