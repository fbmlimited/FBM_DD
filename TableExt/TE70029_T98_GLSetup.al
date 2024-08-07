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


    }

}