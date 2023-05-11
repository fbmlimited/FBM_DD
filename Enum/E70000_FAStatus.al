enum 70000 "FBM_FA Status_DD"
{
    Extensible = true;
    AssignmentCompatibility = true;
    value(0; " ") { Caption = ' '; }
    value(1; "A. Production") { Caption = 'A. In Production'; }
    value(2; "B. Transit") { Caption = 'B. In Transit'; }
    value(3; "C. stock") { Caption = 'C. In Stock (new machines)'; }
    value(4; "D. Installed Op.") { Caption = 'D. Installed Operative'; }
    value(5; "E. Installed Non-Op.") { Caption = 'E. Installed Non-Operative'; }
    value(6; "F. Non Installed") { Caption = 'F. Non-Installed Non-new Non-operative'; }
    value(7; "G. Kill") { Caption = 'G. For Kill'; }
    value(8; "H. Killed") { Caption = 'H. Killed'; }
}