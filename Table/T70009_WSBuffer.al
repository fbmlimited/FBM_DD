table 70009 FBM_WSBuffer
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; WS; text[100])
        {
            Caption = 'WebService';
            DataClassification = ToBeClassified;
        }
        field(2; DateTrans; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(3; TimeTrans; Time)
        {
            Caption = 'Time';
            DataClassification = ToBeClassified;
        }
        field(4; F01; Text[250])
        {
            Caption = 'F01';
            DataClassification = ToBeClassified;
        }
        field(5; F02; Text[250])
        {
            Caption = 'F02';
            DataClassification = ToBeClassified;
        }
        field(6; F03; Text[250])
        {
            Caption = 'F03';
            DataClassification = ToBeClassified;
        }
        field(7; F04; Text[250])
        {
            Caption = 'F04';
            DataClassification = ToBeClassified;
        }
        field(8; F05; Text[250])
        {
            Caption = 'F05';
            DataClassification = ToBeClassified;
        }
        field(9; F06; Text[250])
        {
            Caption = 'F06';
            DataClassification = ToBeClassified;
        }
        field(10; F07; Text[250])
        {
            Caption = 'F07';
            DataClassification = ToBeClassified;
        }
        field(11; F08; Text[250])
        {
            Caption = 'F08';
            DataClassification = ToBeClassified;
        }
        field(12; F09; Text[250])
        {
            Caption = 'F09';
            DataClassification = ToBeClassified;
        }
        field(13; F10; Text[250])
        {
            Caption = 'F10';
            DataClassification = ToBeClassified;
        }
        field(14; F11; Text[250])
        {
            Caption = 'F11';
            DataClassification = ToBeClassified;
        }
        field(15; F12; Text[250])
        {
            Caption = 'F12';
            DataClassification = ToBeClassified;
        }
        field(16; F13; Text[250])
        {
            Caption = 'F13';
            DataClassification = ToBeClassified;
        }
        field(17; F14; Text[250])
        {
            Caption = 'F14';
            DataClassification = ToBeClassified;
        }
        field(18; F15; Text[250])
        {
            Caption = 'F15';
            DataClassification = ToBeClassified;
        }
        field(19; F16; Text[250])
        {
            Caption = 'F16';
            DataClassification = ToBeClassified;
        }
        field(20; F17; Text[250])
        {
            Caption = 'F17';
            DataClassification = ToBeClassified;
        }
        field(21; F18; Text[250])
        {
            Caption = 'F18';
            DataClassification = ToBeClassified;
        }
        field(22; F19; Text[250])
        {
            Caption = 'F19';
            DataClassification = ToBeClassified;
        }
        field(23; F20; Text[250])
        {
            Caption = 'F20';
            DataClassification = ToBeClassified;
        }
        field(1000; EntryNo; BigInteger)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(1001; BatchNo; Integer)
        {
            Caption = 'Batch No.';
            DataClassification = ToBeClassified;
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