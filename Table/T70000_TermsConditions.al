table 70000 FBM_TermsConditions
{
    DataPerCompany = true;

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
        field(10; DocType; Option)
        {
            OptionMembers = SI,PO,CM;
            caption = 'Document Type';
        }
    }
    keys
    {
        key(PK; country, DocType, "Line No.")
        {
            Clustered = true;
        }
    }

}
