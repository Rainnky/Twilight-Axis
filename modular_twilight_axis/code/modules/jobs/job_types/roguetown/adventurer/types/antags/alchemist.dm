/datum/outfit/job/roguetown/bandit/hedgealchemist/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.adjust_skillrank_up_to(/datum/skill/misc/swimming, SKILL_LEVEL_EXPERT, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/climbing, SKILL_LEVEL_EXPERT, TRUE)
