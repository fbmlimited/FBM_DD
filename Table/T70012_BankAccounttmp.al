table 70012 "FBM_BankAccountTMP"
{
    Caption = 'Bank Account';
    DataCaptionFields = "No.", Name;
    DrillDownPageID = "Bank Account List";
    LookupPageID = "Bank Account List";
    Permissions = TableData "Bank Account Ledger Entry" = r;
    DataPerCompany = false;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';


        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';


        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }


        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;


        }


        field(37; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }

        field(58; Balance; Decimal)
        {
            AccessByPermission = TableData "Bank Account Ledger Entry" = R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;

            Caption = 'Balance';
            Editable = false;
            FieldClass = Normal;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Bank Account Ledger Entry" = R;
            AutoFormatType = 1;

            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = Normal;
        }
        field(60; "Net Change"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;

            Caption = 'Net Change';
            Editable = false;
            FieldClass = Normal;
        }
        field(61; "Net Change (LCY)"; Decimal)
        {
            AutoFormatType = 1;

            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = Normal;
        }


        field(95; "Balance at Date"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;

            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = Normal;
        }
        field(96; "Balance at Date (LCY)"; Decimal)
        {
            AutoFormatType = 1;

            Caption = 'Balance at Date (LCY)';
            Editable = false;
            FieldClass = Normal;
        }
        field(97; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;

            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = Normal;
        }
        field(98; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;

            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = Normal;
        }
        field(99; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;

            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = Normal;
        }
        field(100; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;

            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = Normal;
        }

        field(110; IBAN; Code[50])
        {
            Caption = 'IBAN';


        }
        field(111; "SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
            TableRelation = "SWIFT Code";
            ValidateTableRelation = false;
        }
        field(70000; "FBM_Company"; Text[30])
        {
            Caption = 'Company';

        }
        field(70003; "FBM_Approval Batch Amount"; Decimal)
        {
            FieldClass = Normal;






        }

        field(70004; "FBM_Approval Batch Amount2"; Decimal)
        {
            FieldClass = Normal;


        }


    }

    keys
    {
        key(Key1; "No.", FBM_Company)
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }

    }








}

