tableextension 70042 FBM_ContactsExt_DD extends Contact
{
    fields
    {
        field(70000; FBM_Role; Text[20])
        {
            Caption = 'Department';
            TableRelation = FBM_ListValues.Value where(type = const('DEPARTMENT'));
            ValidateTableRelation = false;
            trigger
            OnValidate()
            begin
                FBM_RoleTXT := format(FBM_Role);
            end;


        }
        field(70001; FBM_RoleTXT; Text[100])
        {
            Caption = 'Position';


        }
        field(70002; FBM_Site; Code[20])
        {
            Caption = 'Site Master';


        }
        field(70003; FBM_Customer; Code[20])
        {
            Caption = 'Customer Master';


        }
    }

}