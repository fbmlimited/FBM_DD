table 70000 FBM_TermsConditions
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Country; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Terms Conditions"; Text[1000])
        {
        }
    }
    keys
    {
        key(PK; country, "Line No.")
        {
            Clustered = true;
        }
    }

}
