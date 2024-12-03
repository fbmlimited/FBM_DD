tableextension 70021 FBM_PurchHeaderExt_DD extends "Purchase Header"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;
            ValidateTableRelation = false;
            trigger
            OnValidate()
            var
                purchline: record "Purchase Line";
            begin
                purchline.SetRange("Document Type", rec."Document Type");
                purchline.SetRange("Document No.", rec."No.");
                purchline.ModifyAll(FBM_Site, rec.FBM_Site);

            end;
        }

        field(70120; "FBM_Consignee"; code[20])
        {
            Caption = 'Consignee';
            TableRelation = Customer;
            ValidateTableRelation = false;

        }
        field(70121; "FBM_Consignee Name"; Text[100])
        {
            Caption = 'Consignee Name';
        }
        field(70012; "FBM_Consignee Name 2"; Text[50])
        {
            Caption = 'Consignee Name 2';
        }
        field(70123; "FBM_Consignee Address"; Text[100])
        {
            Caption = 'Consignee Address';
        }
        field(70124; "FBM_Consignee Address 2"; Text[50])
        {
            Caption = 'Consignee Address 2';
        }
        field(70125; "FBM_Consignee City"; Text[30])
        {
            Caption = 'Consignee City';

        }
        field(70126; "FBM_Consignee Contact"; Text[100])
        {
            Caption = 'Consignee Contact';
        }
        field(70127; "FBM_Consignee Post Code"; Text[30])
        {
            Caption = 'Consignee Post Code';

        }
        field(70128; "FBM_Consignee Country"; Text[2])
        {
            Caption = 'Consignee Country';

        }
        field(70129; "FBM_Consignee County"; Text[30])
        {
            Caption = 'Consignee County';

        }
        field(70130; "FBM_Requisition"; Text[30])
        {
            Caption = 'Requisition Nr.';

        }
        field(70131; "FBM_Pedimento1"; Text[2])
        {
            Caption = 'Año Validaciòn [2]';
            //ObsoleteState = Removed;
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Aduana Despacho [2]';
            // ObsoleteState = Removed;
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Nro Patente [4]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Nro Progr. de Despacho [6]';
            ObsoleteState = Removed;
            trigger
            OnValidate()
            begin

                updateped();
            end;

        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;
            ObsoleteState = Removed;

        }
        field(70136; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Referencia JYM [3]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70137; "FBM_Pedimento34"; Text[1])
        {
            Caption = 'Ultimo digito año en curso [1]';
            trigger
            OnValidate()
            begin
                updateped();
            end;

        }
        field(70138; "FBM_Pedimento42"; Text[6])
        {
            Caption = 'Nro Progr. de Despacho [6]';

            trigger
            OnValidate()
            begin

                updateped();
            end;

        }
        field(70139; "FBM_Pedimento_2"; Text[22])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
        field(70140; "FBM_TotProd"; Decimal)
        {
            Caption = 'Total Products';
            Editable = false;

        }
        field(70141; "FBM_TotDiscount"; Decimal)
        {
            Caption = 'Total Discount';
            Editable = false;

        }
        field(70142; "FBM_TotFreight"; Decimal)
        {
            Caption = 'Total Freight';
            Editable = false;

        }
        field(70143; "FBM_TotWht"; Decimal)
        {
            Caption = 'Total Withholdings';
            Editable = false;

        }
        field(70144; "FBM_TotVAT"; Decimal)
        {
            Caption = 'Total VAT';
            Editable = false;

        }
        field(70145; "FBM_GrandTot"; Decimal)
        {
            Caption = 'Grand Total';
            Editable = false;

        }

    }

    local procedure updateped()
    var
        purchline: record "Purchase Line";
    begin

        rec.FBM_Pedimento_2 := rec.FBM_Pedimento12 + ' ' + rec.FBM_Pedimento1 + ' ' + FBM_Pedimento2 + ' ' + rec.FBM_Pedimento3 + '-' + rec.FBM_Pedimento34 + rec.FBM_Pedimento42;
        purchline.SetRange("Document Type", rec."Document Type");
        purchline.SetRange("Document No.", rec."No.");
        purchline.SetFilter(FBM_Pedimento_2, '<>%1', '');
        if purchline.FindFirst() then begin
            if purchline.FBM_Pedimento_2 <> '' then begin
                if confirm('This change will overwrite the Pedimento in all the lines. Do you want to continue?') then begin
                    purchline.Reset();
                    purchline.SetRange("Document Type", rec."Document Type");
                    purchline.SetRange("Document No.", rec."No.");
                    purchline.ModifyAll(FBM_Pedimento12, rec.FBM_Pedimento12);
                    purchline.ModifyAll(FBM_Pedimento1, rec.FBM_Pedimento1);
                    purchline.ModifyAll(FBM_Pedimento2, rec.FBM_Pedimento2);
                    purchline.ModifyAll(FBM_Pedimento3, rec.FBM_Pedimento3);
                    purchline.ModifyAll(FBM_Pedimento34, rec.FBM_Pedimento34);

                    purchline.ModifyAll(FBM_Pedimento42, rec.FBM_Pedimento42);
                    purchline.ModifyAll(FBM_Pedimento_2, rec.FBM_Pedimento_2);
                end;
            end;
        end
        else begin
            purchline.Reset();
            purchline.SetRange("Document Type", rec."Document Type");
            purchline.SetRange("Document No.", rec."No.");
            purchline.ModifyAll(FBM_Pedimento12, rec.FBM_Pedimento12);
            purchline.ModifyAll(FBM_Pedimento1, rec.FBM_Pedimento1);
            purchline.ModifyAll(FBM_Pedimento2, rec.FBM_Pedimento2);
            purchline.ModifyAll(FBM_Pedimento3, rec.FBM_Pedimento3);
            purchline.ModifyAll(FBM_Pedimento34, rec.FBM_Pedimento34);
            purchline.ModifyAll(FBM_Pedimento42, rec.FBM_Pedimento42);
            purchline.ModifyAll(FBM_Pedimento_2, rec.FBM_Pedimento_2);
        end;

    end;

}