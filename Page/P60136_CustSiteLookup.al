page 60136 FBM_CustSiteLookup_DD
{
    Caption = 'Customer |Site';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_CustomerSite_C;
    InsertAllowed = false;
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Site Code"; Rec."Site Code")
                {
                    ApplicationArea = All;
                }
                field("Site Gr. Code"; Rec.SiteGrCode)
                {
                    ApplicationArea = All;
                }
                field("Site Name"; Rec."Site Name_FF")
                {
                    ApplicationArea = All;
                }
                field(Status_FF; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    trigger
    OnOpenPage()
    begin
        rec.SetRange(ActiveRec, true);
    end;


}