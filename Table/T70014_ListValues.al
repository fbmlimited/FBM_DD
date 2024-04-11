table 70014 FBM_ListValues
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    DrillDownPageId = FBM_ValueList_DD;


    fields
    {
        field(1; Type; Text[20])
        {
            Caption = 'Type';
            TableRelation = FBM_ListValues.Value where(type = CONST('TYPE'));
            ValidateTableRelation = FALSE;
        }
        field(2; Ord; Integer)
        {
            Caption = 'Order';

        }
        field(3; Value; Text[20])
        {
            Caption = 'Value';

        }
        field(4; IsDefault; Boolean)
        {
            Caption = 'IsDefault';

        }

    }

    keys
    {
        key(PK; Type, Ord)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Value)
        {

        }

    }

}