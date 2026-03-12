/obj/structure/closet/MiddleMouseDrop_T(atom/movable/dragged, mob/living/user)
	if(user.mmb_intent)
		return ..()

	if(!dragged)
		return

	var/is_head = istype(dragged, /obj/item/bodypart/head/dullahan)

	if(dragged != user && !is_head)
		return

	var/atom/initiator = is_head ? dragged : user

	return erp_try_start(initiator, src, user)
