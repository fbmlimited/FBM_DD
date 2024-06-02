table 70017 FBM_CustSiteReq
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    DrillDownPageId = FBM_CustomerReq_DD;


    fields
    {
        field(1; EntryNo; biginteger)
        {
            AutoIncrement = true;
            caption = 'Registro';
        }
        field(2; ReqType; Option)
        {
            OptionMembers = "",Edit,New;
            OptionCaption = ',Cambio,Nuevo';
            caption = 'Request Type';
        }
        field(3; CustCode; code[20])
        {
            TableRelation = customer.FBM_GrCode;
            ValidateTableRelation = false;
            caption = 'Cod. Cliente';
            ObsoleteState = Removed;
        }
        field(4; Name; Text[100])
        {
            caption = 'Name';
        }
        field(5; "Name 2"; Text[100])
        {
            caption = 'Name 2';
        }
        field(6; Address; Text[100])
        {
            caption = 'Address';
        }
        field(7; "Address 2"; Text[100])
        {
            caption = 'Address 2';
        }
        field(8; City; Text[30])
        {
            caption = 'City';
        }
        field(9; "Post Code"; Text[20])
        {
            caption = 'Post Code';
        }
        field(10; County; Text[30])
        {
            caption = 'County/Ptovince';
        }
        field(11; "Country/Region Code"; code[10])
        {
            caption = 'Country';
        }
        field(12; "VAT registration No."; Text[20])
        {
            caption = 'VAT Reg.No.';
        }
        field(13; FBM_Group; Text[100])
        {
            caption = 'Group';
            TableRelation = FBM_CustGroup where(IsGroup = const(true));
        }
        field(14; FBM_Subgroup; Text[100])
        {
            caption = 'SubGroup';
            TableRelation = FBM_CustGroup where(Group = field(FBM_Group), IsGroup = const(false));
        }
        field(15; Sender; code[50])
        {
            caption = 'Sender';
        }
        field(16; Sent; DateTime)
        {
            caption = 'Sent';
        }
        field(17; Status; enum FBM_ReqStatus_DD)
        {
            caption = 'Status';
        }
        field(18; Rectype; code[20])
        {
            caption = 'Record Type';
        }
        field(19; companyReq; code[3])
        {
            caption = 'Source';
        }
        field(20; Ori_EntryNo; biginteger)
        {

            caption = 'Original Entry';
        }
        field(21; CustSiteCode; code[20])
        {
            TableRelation = if (Rectype = const('CUST')) customer.FBM_GrCode else
            FBM_Site."Site Code";
            ValidateTableRelation = false;
            caption = 'Cust./Site Code';

        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }

}