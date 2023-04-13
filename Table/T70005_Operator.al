table 70005 FBM_Operator
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Operator Nr.';

        }
        field(2; "Name"; Code[200])
        {
            Caption = 'Operator Name';

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}