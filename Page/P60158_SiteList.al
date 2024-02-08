page 60158 FBM_SiteList_DD
{
    Caption = 'PageName';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_CustomerSite_C;

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
                field(SiteGrCode; Rec.SiteGrCode)
                {
                    ApplicationArea = All;
                }
                field("Site Name_FF"; Rec."Site Name_FF")
                {
                    ApplicationArea = All;
                }
            }
        }

    }


}