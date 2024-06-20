tableextension 70037 FBM_TransLineExt_DD extends "Transfer Line"
{
    fields
    {

        field(70000; FBM_SiteFrom; code[20])
        {
            Caption = 'Site From';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }
        field(70001; FBM_SiteTo; code[20])
        {
            Caption = 'Site To';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }
        field(70002; FBM_FromOrion; Boolean)
        {
            Caption = 'From Orion';


        }
        field(70032; FBM_SerialNo; Code[50])
        {
            Caption = 'Serial No';


        }

    }
    trigger
    OnAfterInsert()



    var
        Rec_ILE: Record "Item Ledger Entry";
        Rec_ResEnt: Record "Reservation Entry" temporary;
        Rec_ResEnt_Lu: Record "Reservation Entry";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ReservStatus: Enum "Reservation Status";
        CurrentSourceRowID: Text[250];
        SecondSourceRowID: Text[250];
        SerialNo: Code[50];
    begin
        if rec.FBM_FromOrion then begin
            if (rec.FBM_SerialNo <> '') and (rec.Quantity <> 1) then
                error('Quantity must be 1. Item=%1', rec."Item No.");

            if rec.FBM_SerialNo <> '' then begin
                SerialNo := rec.FBM_SerialNo;
                Rec_ResEnt.Init();
                Rec_ResEnt_Lu.Reset();
                if Rec_ResEnt_Lu.FindLast() then
                    Rec_ResEnt."Entry No." := Rec_ResEnt_Lu."Entry No." + 1
                else
                    Rec_ResEnt."Entry No." := 1;
                Rec_ResEnt."Expiration Date" := Today();
                Rec_ResEnt.Quantity := 1;
                Rec_ResEnt."Serial No." := SerialNo;
                Rec_ResEnt.Insert();

                CreateReservEntry.SetDates(0D, Rec_ResEnt."Expiration Date");
                CreateReservEntry.CreateReservEntryFor(Database::"Transfer Line", 0, Rec."Document No.", '', Rec."Derived From Line No.", Rec."Line No.",
                    Rec."Qty. per Unit of Measure", Rec_ResEnt.Quantity, Rec."Qty. per Unit of Measure" * Rec_ResEnt.Quantity, Rec_ResEnt);
                CreateReservEntry.CreateEntry(Rec."Item No.", Rec."Variant Code", Rec."Transfer-from Code", Rec.Description, Rec."Receipt Date", 0D, 0, ReservStatus::Surplus);
                CurrentSourceRowID := ItemTrackingMgt.ComposeRowID(5741, 0, Rec."Document No.", '', 0, Rec."Line No.");
                SecondSourceRowID := ItemTrackingMgt.ComposeRowID(5741, 1, Rec."Document No.", '', 0, Rec."Line No.");
                ItemTrackingMgt.SynchronizeItemTracking(CurrentSourceRowID, SecondSourceRowID, '');
            end;
        end;
    end;


}