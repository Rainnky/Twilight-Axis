/datum/outfit/job/roguetown/bandit/hedgealchemist/pre_equip(mob/living/carbon/human/H)
	. = ..()
	// Нет уверенности почему, но adjust_skillrank_up_to работает как просто adjust_skillrank, поэтому оставлю именно adjust_skillrank 
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
