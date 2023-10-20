tableextension 70009 FBM_SalesLineExt_DD extends "Sales Line"
{
    fields
    {
        //DEVOPS #622 -- begin
        field(70100; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
            Editable = true;
        }
        field(70101; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            Editable = true;
            trigger OnValidate()
            var
                i: Integer;
            begin
                if "FBM_Period Start" = 0D then
                    "FBM_Period Start" := "Shipment Date";
                if "FBM_Period End" = 0D then
                    "FBM_Period End" := "Shipment Date";
                perioddiff := "FBM_Period End" - "FBM_Period Start";
                if perioddiff < 0 then
                    Error('Period Start is greater than Period End!');

                if perioddiff > 31 then
                    while i < 2 do begin
                        if Confirm(STRSUBSTNO('Period is longer than 31 days.\Do you want to continue?(Step %1)', i + 1), true) then
                            i := i + 1
                        else begin
                            Error('You cancel last action!');
                            break;
                        end;

                    end;
            end;
        }

        field(70102; FBM_IsPeriodEnabled; Boolean)
        {
            caption = 'Period Enabled';
        }
        field(70103; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code" where("Customer No." = field("Bill-to Customer No."));
            ValidateTableRelation = false;

        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                SalesHeaderRec: Record "Sales Header";
            begin
                if rec.Type = Rec.Type::"G/L Account" then begin
                    if GlAccount.Get("No.") then begin
                        if GlAccount."FBM_Periods Required" then begin
                            // get sales header
                            // Message(Format("Line No."));
                            if ("Line No." <> 0) then begin
                                if SalesHeader.get("Document Type", "Document No.") then begin
                                    if SalesHeader."FBM_Period Start" <> 0D then
                                        Rec.Validate("FBM_Period Start", SalesHeader."FBM_Period Start");
                                    if SalesHeader."FBM_Period End" <> 0D then
                                        Rec.Validate("FBM_Period End", SalesHeader."FBM_Period End");
                                    rec."Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
                                    rec.Validate(Rec.FBM_Site, SalesHeader.FBM_Site);

                                end;
                            end;
                        end;
                    end;
                end;




            end;

        }

    }
    var
        GlAccount: Record "G/L Account";
        SalesHeader: Record "Sales Header";
        newline: record "Sales Line";
        existingline: record "Sales Line";
        SalesHeaderRec: Record "Sales Header";
        perioddiff: Integer;

    trigger OnAfterInsert()
    var
        i: Integer;
    begin
        //UpdateIsPeriodEnabled();  //DEVOPS #622
        // Message(Format("Line No."));
        if ("Line No." <> 0) then begin
            if SalesHeader.get("Document Type", "Document No.") then begin
                if SalesHeader."FBM_Period Start" <> 0D then
                    Rec.Validate("FBM_Period Start", SalesHeader."FBM_Period Start");
                if SalesHeader."FBM_Period End" <> 0D then
                    Rec.Validate("FBM_Period End", SalesHeader."FBM_Period End");
                rec."Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
                rec.Validate(Rec.FBM_Site, SalesHeader.FBM_Site);
                rec.Modify(false);
            end;
        end;

        // insert line for billing statement

        /*   if (SalesHeader."FBM_Billing Statement" = true) then begin
              if (Rec."No." = 'S0001') then begin
                  newline.Init();
                  newline."Document Type" := Rec."Document Type";
                  newline.Type := newline.Type::Item;
                  newline."Document No." := REc."Document No.";
                  newline."Line No." := rec."Line No." + 1;
                  newline."No." := 'S0009';
                  newline.Quantity := 1;
                  newline.validate(Amount, -Rec.Amount * 0.05);

                  newline.Insert();
              end
              else
                  if (Rec."No." = 'S0002') then begin
                      newline.Init();
                      newline."Document Type" := Rec."Document Type";
                      newline.Type := newline.Type::Item;
                      newline."Document No." := REc."Document No.";
                      newline."Line No." := rec."Line No." + 1;
                      newline."No." := 'S0008';
                      newline.Quantity := 1;
                      newline.validate(Amount, -Rec.Amount * 0.05);

                      newline.Insert();

                  end;
          end; */
    end;

    trigger OnAfterModify()
    var
        i: Integer;
    begin

        if SalesHeader.get("Document Type", "Document No.") then begin

            if (Rec."No." = 'S0001') or (Rec."No." = 'S0002') then begin

                existingline.SetRange("Document No.", rec."Document No.");
                existingline.SetRange("Line No.", rec."Line No." + 1);
                if (existingline.FindFirst()) then begin
                    existingline.Validate("No.");
                    existingline.Validate("Unit Price", -rec."Unit Price" * 0.05);
                    existingline.Validate(Amount, -Rec.Amount * 0.05);
                    existingline.Modify();
                end;
            end;
        end;




    end;

    trigger OnDelete()
    begin
        if SalesHeader.get("Document Type", "Document No.") then begin

            if (Rec."No." = 'S0001') or (Rec."No." = 'S0002') then begin
                existingline.SetRange("Document No.", rec."Document No.");
                existingline.SetRange("Line No.", rec."Line No." + 1);
                if (existingline.FindFirst()) then begin
                    existingline.Delete();
                end;
            end;
        end;
    end;

    local procedure UpdateIsPeriodEnabled()
    begin
        if (Type = Type::"G/L Account") AND ("No." <> '') then begin
            GlAccount.SetFilter("No.", "No.");
            if GlAccount.FindFirst() then begin
                if GlAccount."FBM_Periods Required" then begin
                    FBM_IsPeriodEnabled := true;
                end
                else
                    ClearIsPeriod();
            end
            else
                ClearIsPeriod();
        end
        else
            ClearIsPeriod();
        Modify(false);
    end;

    local procedure ClearIsPeriod()
    begin
        FBM_IsPeriodEnabled := false;
        Clear("FBM_Period Start");
        Clear("FBM_Period End");
    end;
}
