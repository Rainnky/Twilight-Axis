/proc/send2discordwh(var/data)
    world.Export("http://127.0.0.1:8080", data, 0, null, "POST")

/datum/admin_help/New(msg, client/C, is_bwoink)
    . = ..()
    var/list/data = list(
        "type"= "ahelp",
        "id"= "[id]",
        "round_id"= GLOB.rogue_round_id,
        "opened_at"= "[opened_at]",
        "initiator"= "[initiator]",
        "adminstarted"= "[is_bwoink]",
        "message"= msg
    )
    send2discordwh(data)

/datum/admin_help/Close(key_name, silent)
    . = ..()
    var/list/data = list(
        "type"= "close",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    

/datum/admin_help/Reopen()
    . = ..()
    var/list/data = list(
        "type"= "reopen",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    


/datum/admin_help/mentorissue(key_name)
    . = ..()
    var/list/data = list(
        "type"= "mentorissue",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    


/datum/admin_help/Resolve(key_name, silent)
    . = ..()
    var/list/data = list(
        "type"= "resolve",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    

    
/datum/admin_help/Reject(key_name)
    . = ..()
    var/list/data = list(
        "type"= "reject",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    


/datum/admin_help/ICIssue(key_name)
    . = ..()
    var/list/data = list(
        "type"= "icissue",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)    

    
/datum/admin_help/handle_issue(key_name)
    . = ..()
    var/list/data = list(
        "type"= "handle",
        "id"= "[id]",
        "initiator"= "[usr.ckey]",
    )
    send2discordwh(data)

//Reassociate still open ticket if one exists
/datum/admin_help_tickets/ClientLogin(client/C)
    . = ..()
    if(C.current_ticket)
        var/list/data = list(
            "type"= "login",
            "id"= "[C.current_ticket.id]",
            "initiator"= "[C.ckey]",
        )
        send2discordwh(data)


//Dissasociate ticket
/datum/admin_help_tickets/ClientLogout(client/C)
    . = ..()
    if(C.current_ticket)
        var/list/data = list(
            "type"= "logout",
            "id"= "[C.current_ticket.id]",
            "initiator"= "[C.ckey]",
        )
        send2discordwh(data)


// /client/cmd_ahelp_reply(whom)
//     var/list/ret = ..()
//     var/list/data = list(
//         "type"= "areply",
//         "id"= "[ret[1].id]",
//         "initiator"= src.ckey,
//         "admin"= "1" ? holder : "0",
//         "message"= ret[2]
//     )
//     send2discordwh(data)  

// /client/cmd_admin_pm(whom, msg)
//     var/retval = ..()
//     if(istype(retval, /datum/admin_help))
//         var/datum/admin_help/ticket = retval
//         var/list/data = list(
//             "type"= "areply",
//             "id"= "[ticket.id]",
//             "initiator"= src.ckey,
//             "admin"= "1" ? holder : "0",
//             "message"= msg
//         )
//         send2discordwh(data)
