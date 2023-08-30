tableextension 70015 FBM_UserSetupExt_DD extends "User Setup"
{
    fields
    {
        field(70018; "FBM_See LCY in Journals"; Boolean)
        {
            caption = 'See LCY in Journals';
            DataClassification = ToBeClassified;
        }
        field(70020; "FBM_Bank Filter"; text[2048])
        {
            caption = 'Bank Filter';
            DataClassification = ToBeClassified;
        }

        field(70021; "FBM_Item Filter"; text[2048])
        {
            caption = 'Item Filter';
            DataClassification = ToBeClassified;
        }
        field(70022; "FBM_Approve Finance"; boolean)
        {
            caption = 'Approve Finance';
            DataClassification = ToBeClassified;

        }
        field(70023; FBM_Signature_pic; MediaSet)
        {
            caption = 'Signature';


        }
        field(70024; "FBM_Approve AP"; boolean)
        {
            caption = 'Approve AP';
            DataClassification = ToBeClassified;

        }
    }
    var
}
