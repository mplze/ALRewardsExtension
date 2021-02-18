pageextension 50104 "Customer Card Ext" extends "Customer Card"
{
    ContextSensitiveHelpPage = 'sales-rewards';

    layout
    {
        addlast(General)
        {
            field("Reward ID"; Rec."Reward ID")
            {
                ApplicationArea = All;
                Lookup = true;
            }
        }
    }

    actions
    {
        addfirst(Navigation)
        {
            action("Rewards")
            {
                ApplicationArea = All;
                RunObject = page "Reward List";
            }
        }
    }
}