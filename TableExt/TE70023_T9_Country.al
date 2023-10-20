tableextension 70023 FBM_CountryExt_DD extends "Country/Region"
{
    fields
    {
        field(70100; FBM_Account; text[50])
        {
            Caption = 'Account Label';

        }
        field(70101; FBM_Country3; text[3])
        {
            Caption = 'Country 3 chars';

        }
    }

}