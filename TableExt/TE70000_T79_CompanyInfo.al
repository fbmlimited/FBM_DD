tableextension 70000 FBM_CompanyInfoExt_DD extends "Company Information"
{
    fields
    {
        field(70010; FBM_EnWS; Boolean)
        {
            caption = 'Enable WebServices';
        }
        field(70011; FBM_EnSiteWS; Boolean)
        {

            caption = 'Enable Site WebServices';
            trigger

            OnValidate()
            begin
                rec.FBM_CustIsOp := rec.FBM_EnSiteWS;
            end;
        }
        field(70012; "FBM_TINNumber"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TIN Number';
        }
        field(70013; FBM_EnSpin; Boolean)
        {

            caption = 'Enable Spin';
        }
        Field(70014; FBM_FALessee; text[20])
        {
            Caption = 'Lessee';
            TableRelation = FBM_Subsidiary.Lessee;
            ValidateTableRelation = false;
        }
        field(70015; FBM_FAProperty; text[3])
        {
            ObsoleteState = Removed;
            Caption = 'Property';
            TableRelation = Company.Name;
            ValidateTableRelation = false;

        }
        field(70115; FBM_FAProperty2; text[30])
        {
            Caption = 'Property';
            TableRelation = Company.Name;
            ValidateTableRelation = false;
            trigger
            OnValidate()
            var
                fasetup: record "FA Setup";
            begin
                fasetup.Get();
                fasetup."FBM_FA Company" := rec.FBM_FAProperty2;
                fasetup.Modify();

            end;
        }
        field(70016; FBM_FABrand; Option)
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
        }

        field(70017; "FBM_CustIsOp"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Is Operator';
        }


        field(70018; FBM_EnMigr; Boolean)
        {

            caption = 'Enable Migration';
        }

        field(70019; FBM_EnAppr; Boolean)
        {

            caption = 'Enable Approvals';
        }
        field(70020; FBM_BankAddress; Text[250])
        {

            caption = 'Bank Address';
        }
        field(70021; FBM_Conso1; Enum FBM_Conso_DD)
        {

            caption = 'Conso 1';
        }
        field(70022; FBM_Conso2; Enum FBM_Conso_DD)
        {

            caption = 'Conso 2';
        }
        field(70023; FBM_Conso3; Enum FBM_Conso_DD)
        {

            caption = 'Conso 3';
        }
        field(70024; FBM_IsOnMainServer; Boolean)
        {

            caption = 'Is On Main Server';
        }
        field(70025; FBM_ScanCompany; Boolean)
        {

            caption = 'Scan Company';
        }
        field(70026; FBM_GDPR_Company; Text[250])
        {

            caption = 'GDPR Company Name';
        }
        field(70027; FBM_GDPR_Address; Text[250])
        {

            caption = 'GDPR Company Address';
        }
        field(70028; FBM_GDPR_email; Text[250])
        {

            caption = 'GDPR Company Email';
        }
        field(70029; FBM_GDPR_Url; Text[250])
        {

            caption = 'GDPR Url';
        }

    }

}