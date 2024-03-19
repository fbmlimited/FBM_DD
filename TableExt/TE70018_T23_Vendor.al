tableextension 70018 FBM_VendorExt_DD extends Vendor
{

    fields
    {
        field(70002; "FBM_Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Default Bank Account';


        }
        field(70003; "FBM_Print Name on Check"; Text[100])
        {
            Caption = 'Print Name on Check';
        }
        field(70004; "FBM_Acronym"; Text[3])
        {
            Caption = 'Company''s symbol';
            trigger
           OnLookup()
            var
                company: record Company;
                compinfo: record "Company Information";
                buffer: record "Name/Value Buffer" temporary;
            begin
                company.FindFirst();
                repeat
                    compinfo.ChangeCompany(company.Name);
                    compinfo.get;

                    buffer.AddNewEntry(compinfo."Custom System Indicator Text", '');
                until company.Next() = 0;
                if page.RunModal(page::"Name/Value Lookup", buffer) = action::LookupOK then
                    FBM_Acronym := buffer.Name;

            end;
        }
    }
    // trigger OnAfterModify()
    // begin
    //     TestField("Currency Code");
    // end;
}