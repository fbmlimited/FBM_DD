page 60142 FBM_SiteHistory_DD
{
    Caption = 'History';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_Site;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Version; Rec.Version)
                {
                    ApplicationArea = All;
                }
                field(ActiveRec; Rec.ActiveRec)
                {
                    ApplicationArea = All;
                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = All;

                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = All;

                }
                field("Record Owner"; Rec."Record Owner")
                {
                    ApplicationArea = All;

                }
                field("Change Note"; Rec."Change Note")
                {
                    ApplicationArea = All;

                }

            }
        }

    }


}