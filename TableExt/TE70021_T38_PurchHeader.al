tableextension 70021 FBM_PurcheHeaderExt_DD extends "Purchase Header"
{
    fields
    {
        field(70000; FBM_Site; code[20])
        {
            TableRelation = FBM_Site;
            ValidateTableRelation = false;
        }

        field(70020; "FBM_Consignee"; code[20])
        {
            Caption = 'Consignee';
            TableRelation = Customer;
            ValidateTableRelation = false;

        }
        field(70021; "FBM_Consignee Name"; Text[100])
        {
            Caption = 'Consignee Name';
        }
        field(70022; "FBM_Consignee Name 2"; Text[50])
        {
            Caption = 'Consignee Name 2';
        }
        field(70023; "FBM_Consignee Address"; Text[100])
        {
            Caption = 'Consignee Address';
        }
        field(70024; "FBM_Consignee Address 2"; Text[50])
        {
            Caption = 'Consignee Address 2';
        }
        field(70025; "FBM_Consignee City"; Text[30])
        {
            Caption = 'Consignee City';

        }
        field(70026; "FBM_Consignee Contact"; Text[100])
        {
            Caption = 'Consignee Contact';
        }
        field(70027; "FBM_Consignee Post Code"; Text[30])
        {
            Caption = 'Consignee Post Code';

        }
        field(70028; "FBM_Consignee Country"; Text[2])
        {
            Caption = 'Consignee Country';

        }
        field(70029; "FBM_Consignee County"; Text[30])
        {
            Caption = 'Consignee County';

        }
        field(70030; "FBM_Requisition"; Text[30])
        {
            Caption = 'Requisition Nr.';

        }
    }

}