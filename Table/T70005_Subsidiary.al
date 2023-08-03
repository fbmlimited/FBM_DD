table 70005 FBM_Subsidiary
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; Country; text[3])//from Site, lookup on country3
        {
            Caption = 'Country';
            TableRelation = "Country/Region".FBM_Country3;
            ValidateTableRelation = false;
            trigger
            OnValidate()
            begin
                calcsub();
            end;
        }
        field(2; Lessee; text[20])// from FA
        {
            Caption = 'Lessee';
            TableRelation = FBM_Subsidiary.Lessee;
            ValidateTableRelation = false;
            trigger
           OnValidate()
            begin
                calcsub();
            end;
        }
        field(3; EGM_Property; text[3])// company information FA
        {
            Caption = 'Property';
            TableRelation = FBM_Subsidiary.EGM_Property;
            ValidateTableRelation = false;
        }
        field(4; Brand; Option)//from FA
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
        }
        field(5; Subsidiary; Code[7])//from FA
        {
            Caption = 'Subsidiary';

        }

        field(70019; FBM_LastAdquiredDate; Date)
        {
            Caption = 'Last Adquired Date';

        }


    }

    keys
    {
        key(PK; EGM_Property, Country, Lessee)
        {
            Clustered = true;
        }
    }
    procedure calcsub()

    begin

        rec.Subsidiary := rec.Lessee + ' ' + rec.Country;
    end;

}