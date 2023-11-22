table 70013 FBM_SalesInvLineTmp
{
    Caption = 'Sales Invoice Line tmp';

    Permissions = TableData "Item Ledger Entry" = r,
                  TableData "Value Entry" = r;
    TableType = Temporary;

    fields
    {
        field(1; DocType; Enum "Sales Document Type")
        {

        }
        field(2; "Sell-to Customer No."; Code[20])
        {

        }
        field(3; "Document No."; Code[20])
        {

        }
        field(4; "Line No."; Integer)
        {

        }
        field(5; Type; Enum "Sales Line Type")
        {

        }
        field(6; "No."; Code[20])
        {

        }
        field(7; "Location Code"; Code[10])
        {

        }
        field(8; "Posting Group"; Code[20])
        {

        }
        field(10; "Shipment Date"; Date)
        {

        }
        field(11; Description; Text[100])
        {

        }
        field(12; "Description 2"; Text[50])
        {

        }
        field(13; "Unit of Measure"; Text[50])
        {

        }
        field(15; Quantity; Decimal)
        {

        }
        field(22; "Unit Price"; Decimal)
        {

        }
        field(23; "Unit Cost (LCY)"; Decimal)
        {

        }
        field(25; "VAT %"; Decimal)
        {

        }
        field(27; "Line Discount %"; Decimal)
        {

        }
        field(28; "Line Discount Amount"; Decimal)
        {

        }
        field(29; Amount; Decimal)
        {

        }
        field(30; "Amount Including VAT"; Decimal)
        {

        }
        field(32; "Allow Invoice Disc."; Boolean)
        {

        }
        field(34; "Gross Weight"; Decimal)
        {

        }
        field(35; "Net Weight"; Decimal)
        {

        }
        field(36; "Units per Parcel"; Decimal)
        {

        }
        field(37; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Appl.-to Item Entry';
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(42; "Customer Price Group"; Code[10])
        {

        }
        field(45; "Job No."; Code[20])
        {

        }
        field(52; "Work Type Code"; Code[10])
        {

        }
        field(63; "Shipment No."; Code[20])
        {

        }
        field(64; "Shipment Line No."; Integer)
        {

        }
        field(65; "Order No."; Code[20])
        {
            ;
        }
        field(66; "Order Line No."; Integer)
        {
        }
        field(68; "Bill-to Customer No."; Code[20])
        {

        }
        field(69; "Inv. Discount Amount"; Decimal)
        {

        }
        field(73; "Drop Shipment"; Boolean)
        {

        }
        field(74; "Gen. Bus. Posting Group"; Code[20])
        {

        }
        field(75; "Gen. Prod. Posting Group"; Code[20])
        {

        }
        field(77; "VAT Calculation Type"; Enum "Tax Calculation Type")
        {

        }
        field(78; "Transaction Type"; Code[10])
        {

        }
        field(79; "Transport Method"; Code[10])
        {

        }
        field(80; "Attached to Line No."; Integer)
        {

        }
        field(81; "Exit Point"; Code[10])
        {

        }
        field(82; "Area"; Code[10])
        {

        }
        field(83; "Transaction Specification"; Code[10])
        {

        }
        field(84; "Tax Category"; Code[10])
        {

        }
        field(85; "Tax Area Code"; Code[20])
        {

        }
        field(86; "Tax Liable"; Boolean)
        {

        }
        field(87; "Tax Group Code"; Code[20])
        {

        }
        field(88; "VAT Clause Code"; Code[20])
        {

        }
        field(89; "VAT Bus. Posting Group"; Code[20])
        {

        }
        field(90; "VAT Prod. Posting Group"; Code[20])
        {

        }
        field(97; "Blanket Order No."; Code[20])
        {

        }
        field(98; "Blanket Order Line No."; Integer)
        {

        }
        field(99; "VAT Base Amount"; Decimal)
        {

        }
        field(100; "Unit Cost"; Decimal)
        {

        }
        field(101; "System-Created Entry"; Boolean)
        {

        }
        field(103; "Line Amount"; Decimal)
        {

        }
        field(104; "VAT Difference"; Decimal)
        {

        }
        field(106; "VAT Identifier"; Code[20])
        {

        }
        field(107; "IC Partner Ref. Type"; Enum "IC Partner Reference Type")
        {

        }
        field(108; "IC Partner Reference"; Code[20])
        {

        }
        field(123; "Prepayment Line"; Boolean)
        {

        }
        field(130; "IC Partner Code"; Code[20])
        {

        }
        field(131; "Posting Date"; Date)
        {

        }
        field(138; "IC Item Reference No."; Code[50])
        {

        }
        field(145; "Pmt. Discount Amount"; Decimal)
        {

        }
        field(180; "Line Discount Calculation"; Option)
        {

            OptionCaption = 'None,%,Amount';
            OptionMembers = "None","%",Amount;
        }
        field(480; "Dimension Set ID"; Integer)
        {

        }
        field(1001; "Job Task No."; Code[20])
        {

        }
        field(1002; "Job Contract Entry No."; Integer)
        {

        }
        field(1700; "Deferral Code"; Code[10])
        {

        }
        field(5402; "Variant Code"; Code[10])
        {

        }
        field(5403; "Bin Code"; Code[20])
        {

        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {

        }
        field(5407; "Unit of Measure Code"; Code[10])
        {

        }
        field(5415; "Quantity (Base)"; Decimal)
        {

        }
        field(5600; "FA Posting Date"; Date)
        {

        }
        field(5602; "Depreciation Book Code"; Code[10])
        {

        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {

        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {

        }
        field(5613; "Use Duplication List"; Boolean)
        {

        }
        field(5700; "Responsibility Center"; Code[10])
        {

        }
        field(5705; "Cross-Reference No."; Code[20])
        {

        }
        field(5706; "Unit of Measure (Cross Ref.)"; Code[10])
        {

        }


        field(5709; "Item Category Code"; Code[20])
        {

        }
        field(5710; Nonstock; Boolean)
        {

        }
        field(5711; "Purchasing Code"; Code[10])
        {

        }

        field(5725; "Item Reference No."; Code[50])
        {

        }
        field(5726; "Item Reference Unit of Measure"; Code[10])
        {

        }
        field(5727; "Item Reference Type"; Enum "Item Reference Type")
        {

        }
        field(5728; "Item Reference Type No."; Code[30])
        {

        }
        field(5811; "Appl.-from Item Entry"; Integer)
        {

        }
        field(6608; "Return Reason Code"; Code[10])
        {

        }
        field(7000; "Price Calculation Method"; Enum "Price Calculation Method")
        {

        }
        field(7001; "Allow Line Disc."; Boolean)
        {

        }
        field(7002; "Customer Disc. Group"; Code[20])
        {

        }
        field(7004; "Price description"; Text[80])
        {

        }
        field(70100; "FBM_Period Start"; Date)
        {

        }
        field(70101; "FBM_Period End"; Date)
        {

        }
        field(70103; FBM_Site; Code[20])
        {


        }

    }

    keys
    {
        key(Key1; DocType, "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Blanket Order No.", "Blanket Order Line No.")
        {
        }
        key(Key3; "Sell-to Customer No.")
        {
        }
        key(Key4; "Sell-to Customer No.", Type, "Document No.")
        {
            Enabled = false;
            MaintainSQLIndex = false;
        }
        key(Key5; "Shipment No.", "Shipment Line No.")
        {
        }
        key(Key6; "Job Contract Entry No.")
        {
        }
        key(Key7; "Bill-to Customer No.")
        {
        }
        key(Key8; "Order No.", "Order Line No.", "Posting Date")
        {
        }
        key(Key9; "Document No.", "Location Code")
        {
            MaintainSQLIndex = false;
            SumIndexFields = Amount, "Amount Including VAT", "Inv. Discount Amount";
        }
    }











}

