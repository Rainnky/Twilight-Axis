/obj/effect/proc_holder/spell/invoked/shrink
	name = "Shrink"
	desc = "For a time shrinks your target, forcing them to realize their pitifulness."
	cost = 2
	overlay_state = "rune3"
	releasedrain = 35
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 3 MINUTES
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	spell_tier = 4
	invocations = list("Miserrimus!")
	invocation_type = "shout"
	chargedloop = /datum/looping_sound/wind
	associated_skill = /datum/skill/magic/arcane
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	range = 7

/obj/effect/proc_holder/spell/invoked/shrink/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		if(target.has_status_effect (/datum/status_effect/debuff/shrink))
			to_chat(user, "<span class='warning'>They're too small to shrink!</span>")
			revert_cast()
			return
		target.transform = target.transform.Scale(0.65, 0.65)
		target.transform = target.transform.Translate(0, -(0.35 * 16))
		target.update_transform()
		to_chat(target, span_warning("I'm shrinking! Everything is getting so big!"))
		target.visible_message("[target]'s body shrinks in size!")
		addtimer(CALLBACK(src, PROC_REF(remove_debuff), target), wait = 120 SECONDS)
		target.apply_status_effect(/datum/status_effect/debuff/shrink)
		playsound(target, 'sound/misc/portal_enter.ogg', 50, TRUE, -2)
		return TRUE

/obj/effect/proc_holder/spell/invoked/shrink/proc/remove_debuff(mob/living/carbon/target)
	if(!target || QDELETED(target))
		return
	target.transform = target.transform.Translate(0, (0.35 * 16))
	target.transform = target.transform.Scale(1/0.65, 1/0.65)      
	target.update_transform()
	to_chat(target, span_warning("My body is growing back to its normal state."))
	target.visible_message("[target]'s body grows in size!")
