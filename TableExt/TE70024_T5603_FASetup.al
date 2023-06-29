tableextension 70024 FBM_FASetupExt_DD extends "FA Setup"
{
    fields
    {
        field(70000; "FBM_Enable FA Site Tracking"; Boolean)//no
        {
            Caption = 'Enable FA Site Tracking';
        }
        field(70001; "FBM_Customer Dimension"; Code[20])//no
        {
            Caption = 'Customer Dimension';
            TableRelation = Dimension.Code;
        }
        field(70002; "FBM_Operator Dimension"; Code[20])//no
        {
            Caption = 'Operator Dimension';
            TableRelation = Dimension.Code;
        }
        field(70003; "FBM_Site Dimension"; Code[20])
        {
            Caption = 'Site Dimension';
            TableRelation = Dimension.Code;
        }
        field(70004; "FBM_FA Company"; Text[30])//no
        {
            //this field will hold the link to the 'mother' company where FAs are held
            Caption = 'Fixed Asset Company';
            TableRelation = Company.Name;
        }
        //DevOps #619 -- begin
        field(70005; "FBM_Contract Dimension"; Code[20])//no
        {
            Caption = 'Contract Dimension';
            TableRelation = Dimension.Code;
        }
    }
    var
}
