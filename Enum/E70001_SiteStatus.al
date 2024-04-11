enum 70001 "FBM_Site Status_DD"
{
    Extensible = true;
    AssignmentCompatibility = true;
    value(0; "DBC ADMIN") { Caption = 'DBC Admin'; } // false
    value(1; "OPERATIONAL") { Caption = 'Operational'; } // true
    value(2; "HOLD OPERATION") { Caption = 'Hold Operation'; } //true
    value(3; "STOP OPERATION") { Caption = 'Stop Operation'; } //false
    value(4; "PRE-OPENING ") { Caption = 'Pre-Opening'; } //false

}