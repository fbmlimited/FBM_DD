tableextension 70021 FBM_PurchHeaderExt_DD extends "Purchase Header"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;
            ValidateTableRelation = false;
        }

        field(70120; "FBM_Consignee"; code[20])
        {
            Caption = 'Consignee';
            TableRelation = Customer;
            ValidateTableRelation = false;

        }
        field(70121; "FBM_Consignee Name"; Text[100])
        {
            Caption = 'Consignee Name';
        }
        field(70012; "FBM_Consignee Name 2"; Text[50])
        {
            Caption = 'Consignee Name 2';
        }
        field(70123; "FBM_Consignee Address"; Text[100])
        {
            Caption = 'Consignee Address';
        }
        field(70124; "FBM_Consignee Address 2"; Text[50])
        {
            Caption = 'Consignee Address 2';
        }
        field(70125; "FBM_Consignee City"; Text[30])
        {
            Caption = 'Consignee City';

        }
        field(70126; "FBM_Consignee Contact"; Text[100])
        {
            Caption = 'Consignee Contact';
        }
        field(70127; "FBM_Consignee Post Code"; Text[30])
        {
            Caption = 'Consignee Post Code';

        }
        field(70128; "FBM_Consignee Country"; Text[2])
        {
            Caption = 'Consignee Country';

        }
        field(70129; "FBM_Consignee County"; Text[30])
        {
            Caption = 'Consignee County';

        }
        field(70130; "FBM_Requisition"; Text[30])
        {
            Caption = 'Requisition Nr.';

        }
    }

}