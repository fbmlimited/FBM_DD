page 60135 FBM_SiteMasterList_DD
{
    Caption = 'Site Master List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_Site;
    CardPageId = FBM_SiteMaster_DD;
    SourceTableView = where(ActiveRec = const(true));

    layout
    {
        area(Content)
        {
            group(header)
            {
                field(maxcode; maxcode)
                {
                    caption = 'Max SiteGrCode';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            repeater(Group)
            {
                field("Site Code"; Rec."Site Code")
                {
                    ApplicationArea = All;
                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;
                }
                field("Site Name 2"; Rec."Site Name 2")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Vat Number"; Rec."Vat Number")
                {
                    ApplicationArea = All;
                }
                field(Company1; Rec.Company1)
                {
                    ApplicationArea = All;
                }
                field(Company2; Rec.Company2)
                {
                    ApplicationArea = All;
                }
                field(Company3; Rec.Company3)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }

    trigger
                       OnOpenPage()
    begin
        getmaxsite();

    end;

    var
        maxcode: Text;
        site: record FBM_Site;


    procedure getmaxsite()


    begin
        site.SetFilter("Site Code", '<%1', 'SITE9990');
        site.SetCurrentKey("Site Code");
        if site.FindLast() then
            maxcode := site."Site Code";
        CurrPage.Update();
    end;
}