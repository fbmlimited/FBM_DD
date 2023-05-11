table 70003 FBM_CustGroup
{
    DataPerCompany=false;
    DataClassification = ToBeClassified;
    //LookupPageId = 50013;
    fields
    {
        field(1; "Group"; Code[20])
        {
            Caption = 'Customer Group';

        }
        field(2; "Group Name"; Text[100])
        {
            Caption = 'Group Name ';
        }

        field(3; "SubGroup"; Code[20])

        {
            Caption = 'Customer SubGroup ';
        }

        field(4; "SubGroup Name"; Text[100])
        {
            Caption = 'SubGroup Name';

        }
        field(5; IsGroup; Boolean)
        {
            Caption = 'Is Group';

        }
    }

    keys
    {
        key(PK; "Group", "SubGroup")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Group", "Group Name", "SubGroup", "SubGroup Name")
        {
        }
    }



}