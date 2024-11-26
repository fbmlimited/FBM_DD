tableextension 70039 FBM_PurchInvHeaderExt_DD extends "Purch. Inv. Header"
{
    fields
    {
        field(70131; "FBM_Pedimento1"; Text[2])
        {
            Caption = 'Año Validaciòn [2]';
            //ObsoleteState = Removed
            ;

        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Aduana Despacho [2]';
            //ObsoleteState = Removed
            ;

        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Nro Patente [4]';

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Nro Progr. de Despacho [6]';
            ObsoleteState = Removed;


        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
        field(70136; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Referencia JYM [3]';


        }
        field(70137; "FBM_Pedimento34"; Text[1])
        {
            Caption = 'Ultimo digito año en curso [1]';


        }
        field(70138; "FBM_Pedimento42"; Text[6])
        {
            Caption = 'Nro Progr. de Despacho [6]';



        }


    }

}