tableextension 70003 FBM_DetCustLEExt_DD extends "Detailed Cust. Ledg. Entry"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70001; "FBM_Period End"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
}