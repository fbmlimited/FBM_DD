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
            Caption = 'Property';
            TableRelation = FBM_Subsidiary.EGM_Property;
            ValidateTableRelation = false;
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
    }

}