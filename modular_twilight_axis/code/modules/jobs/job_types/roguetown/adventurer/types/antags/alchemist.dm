/datum/outfit/job/roguetown/bandit/hedgealchemist/pre_equip(mob/living/carbon/human/H)
	. = ..()
	// Нет уверенности почему, но adjust_skillrank_up_to работает как просто adjust_skillrank, поэтому оставлю именно adjust_skillrank 
	H.adjust_skillrank(/datum/skill/misc/swimming, -1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_WIL, 1)
	H.change_stat(STATKEY_INT, -1)
