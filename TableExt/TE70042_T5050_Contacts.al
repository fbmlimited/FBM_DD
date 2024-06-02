tableextension 70042 FBM_ContactsExt_DD extends Contact
{
    fields
    {
        field(70000; FBM_Role; enum FBM_ContactRole_DD)
        {
            Caption = 'Role';
            trigger
            OnValidate()
            begin
                FBM_RoleTXT := format(FBM_Role);
            end;


        }
        field(70001; FBM_RoleTXT; Text[100])
        {
            Caption = 'Role (Text)';


        }
    }

}