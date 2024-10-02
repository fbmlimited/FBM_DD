tableextension 70032 FBM_ItenJnlLineExt_DD extends "Item Journal Line"
{
    fields
    {
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        modify("Location Code")
        {
            trigger
               OnAfterValidate()
            var
                loc: record Location;
            begin
                if loc.get("Location Code") then
                    if loc.FBM_Site <> '' then
                        rec.FBM_Site := loc.FBM_Site;
            end;
        }
        field(70131; "FBM_Pedimento1"; Text[3])
        {
            Caption = 'Ped1';
            ObsoleteState = Removed;


        }
        field(70132; "FBM_Pedimento2"; Text[4])
        {
            Caption = 'Ped2';
            ObsoleteState = Removed;


        }
        field(70133; "FBM_Pedimento3"; Text[7])
        {
            Caption = 'Ped2 [4]';

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Ped3 [7]';
            //ObsoleteState = Removed;

        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
        field(70136; "FBM_Pedimentobis"; Text[18])
        {
            Caption = 'Pedimento 2';
            Editable = false;
            trigger
            OnValidate()
            begin
                if (FBM_Pedimentobis <> 'N/A') and (FBM_Pedimentobis <> '0') and (FBM_Pedimentobis <> '') then
                    FBM_Pedimento := FBM_Pedimentobis;
            end;

        }
        field(70137; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Ped1 [3]';


        }
        field(70002; FBM_FromOrion; Boolean)
        {
            Caption = 'From Orion';


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
            if (rec."Serial No." <> '') and (rec.Quantity <> 1) then
                error('Quantity must be 1. Item=%1', rec."Item No.");

            if rec."Serial No." <> '' then begin
                SerialNo := rec."Serial No.";
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
                CreateReservEntry.CreateReservEntryFor(Database::"Transfer Line", 0, Rec."Document No.", '', Rec."Line No.", Rec."Line No.",
                    Rec."Qty. per Unit of Measure", Rec_ResEnt.Quantity, Rec."Qty. per Unit of Measure" * Rec_ResEnt.Quantity, Rec_ResEnt);
                CreateReservEntry.CreateEntry(Rec."Item No.", Rec."Variant Code", Rec."Location Code", Rec.Description, Rec."Posting Date", 0D, 0, ReservStatus::Surplus);
                CurrentSourceRowID := ItemTrackingMgt.ComposeRowID(5741, 0, Rec."Document No.", '', 0, Rec."Line No.");
                SecondSourceRowID := ItemTrackingMgt.ComposeRowID(5741, 1, Rec."Document No.", '', 0, Rec."Line No.");
                ItemTrackingMgt.SynchronizeItemTracking(CurrentSourceRowID, SecondSourceRowID, '');
            end;
        end;
    end;

}