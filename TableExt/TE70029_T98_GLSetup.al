tableextension 70029 FBM_GLSetupExt_DD extends "General Ledger Setup"
{
    fields
    {
        field(70100; FBM_ExchRateFluctuation; decimal)
        {
            caption = 'Exch. Rate Max Fluctuation (%)';

        }
        field(70101; FBM_ExchRatePHPMin; decimal)
        {
            caption = 'MIN Exch. Rate (PHP/USD)';

        }
        field(70102; FBM_ExchRatePHPMax; decimal)
        {
            caption = 'MAX Exch. Rate (PHP/USD)';

        }
        field(70103; FBM_CheckMinMaMax; Boolean)
        {
            caption = 'Check Min/Max Exch. Rate (PHP/USD)';

        }
        field(70104; FBM_PropExchRate; text[50])
        {
            caption = 'Propagate Exch. Rate From';
            TableRelation = Company;

            trigger
            OnValidate()
            var
                glsetup: record "General Ledger Setup";
            begin
                glsetup.ChangeCompany(rec.FBM_PropExchRate);

                glsetup.FBM_PropExchRateTo := (rec.FBM_PropExchRate <> '');
                glsetup.Modify();
            end;

        }
        field(70105; FBM_PropExchRateTo; Boolean)
        {
            caption = 'Propagate Exch. Rate To';


        }




    }

}