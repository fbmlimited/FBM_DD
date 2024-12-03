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
        field(70103; "FBM_IsFreight"; Boolean)
        {
            caption = 'Is Freight';
            trigger
                       OnValidate()
            begin
                if rec.FBM_IsFreight then
                    rec.FBM_IsWht := false;
            end;
        }
        field(70104; "FBM_IsWht"; Boolean)
        {
            caption = 'Is Withholding';
            -
            trigger
                                   OnValidate()
            begin
                if rec.FBM_IsWht then
                    rec.FBM_IsFreight := false;
            end;
        }
    }

}
