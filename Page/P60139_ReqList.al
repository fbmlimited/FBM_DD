page 60139 FBM_ReqList_DD
{
    Caption = 'Change Requests';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_CustSiteReq;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = FBM_CustomerChangeReq_DD;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Rectype; Rec.Rectype)
                {
                    ApplicationArea = All;
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                    trigger
                    OnDrillDown()
                    var
                        req: record FBM_CustSiteReq;
                    begin
                        req.SetRange(EntryNo, rec.EntryNo);
                        page.run(page::FBM_CustomerChangeReq_DD, req);

                    end;
                }
                field(CustSiteCode; Rec.CustSiteCode)
                {
                    ApplicationArea = All;
                }
                field(ReqType; Rec.ReqType)
                {
                    ApplicationArea = All;
                }
                field(companyReq; Rec.companyReq)
                {
                    ApplicationArea = All;
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                }
                field(Sent; Rec.Sent)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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
}