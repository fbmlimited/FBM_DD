tableextension 70006 FBM_GLAccountExt_DD extends "G/L Account"
{
    fields
    {
        field(70100; "FBM_Periods Required"; Boolean)
        {
            caption = 'Periods Required';

        }
        field(70101; "FBM_FranchiseTax"; Boolean)
        {
            caption = 'Franchise Tax';

        }
        field(70102; "FBM_WHTax"; Boolean)
        {
            caption = 'Withholding Tax';

        }

    }

}
