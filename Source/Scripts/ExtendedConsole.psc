Scriptname ExtendedConsole  Hidden 

; unused for command
string Function GetEditorId(Form akForm) global 
    return PO3_SKSEFunctions.GetFormEditorID(akForm)
EndFunction

string Function FreezeActor(Actor akActor, int type, bool abFreeze) global
    if !akActor
        return "invalid actor"
    endIf

    PO3_SKSEFunctions.FreezeActor(akActor, type, abFreeze)
    return akActor.GetActorBase().GetName() + " was frozen"
EndFunction

string Function DecapitateActor(Actor akActor) global
    if !akActor
        return "invalid actor"
    endIf

    PO3_SKSEFunctions.DecapitateActor(akActor)
    return akActor.GetActorBase().GetName() + " was decapitated"
EndFunction

string Function GetCombatTargets(Actor akActor) global
    Actor[] targets = PO3_SKSEFunctions.GetCombatTargets(akActor)
    if targets.length == 0
        return "no combat targets"
    else
        string msg = "Combat Targets: \n"
        int i = 0
        while i < targets.length
            msg += targets[i].GetActorBase().GetName() + " " + PO3_SKSEFunctions.GetFormEditorID(targets[i]) + " " + targets[i].GetFormID() + " \n"
            i += 1
        endwhile

        return msg
    endIf
EndFunction 

string Function IsPluginFound(string asName) global
    if PO3_SKSEFunctions.IsPluginFound(asName)
        return asName + " is installed"
    else
        return asName + " is not installed"
    endIf
EndFunction

string Function IsQuestItem(ObjectReference akRef) global
    if PO3_SKSEFunctions.IsQuestItem(akRef)
        return GetEditorId(akRef) + " is a quest item"
    else
        return GetEditorId(akRef) + " is not a quest item"
    endIf
EndFunction

string Function AddKeywordToForm(Form akForm, Keyword akKeyword) global
    if !akForm || !akKeyword
        return "invalid arguments " + akForm + " " + akKeyword
    endIf

    PO3_SKSEFunctions.AddKeywordToForm(akForm, akKeyword)

    return "added " + GetEditorId(akKeyword) + " to " + GetEditorId(akForm) 
EndFunction


string Function RemoveKeywordOnForm(Form akForm, Keyword akKeyword) global
    if !akForm || !akKeyword
        return "invalid arguments " + akForm + " " + akKeyword 
    endIf

    if PO3_SKSEFunctions.RemoveKeywordOnForm(akForm, akKeyword)
        return "removed " + GetEditorId(akKeyword) + " from " + GetEditorId(akForm) 
    else
        return "failed to remove " + GetEditorId(akKeyword) + " from " + GetEditorId(akForm)
    endIf
EndFunction