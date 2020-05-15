(define
	(problem p07)
	(:domain  rover)
	(:objects
		waypoint3 - waypoint
		waypoint4 - waypoint
		waypoint5 - waypoint
		waypoint1 - waypoint
		waypoint0 - waypoint
		waypoint2 - waypoint
		colour - mode
		high_res - mode
		low_res - mode
		rover0store - store
		rover1store - store
		rover2store - store
		rover0 - rover
		rover1 - rover
		rover2 - rover
		camera0 - camera
		camera1 - camera
		general - lander
		objective0 - objective
		objective1 - objective
	)
	(:htn
		:ordered-subtasks (and
		    (get_rock_data waypoint3)
		    (get_image_data objective0 high_res)
		    (get_soil_data waypoint1)
		    (get_rock_data waypoint2)
		    (get_soil_data waypoint4)
            (get_rock_data waypoint4)
        )
	)
	(:init
		(visible waypoint0 waypoint3)
		(visible waypoint3 waypoint0)
		(visible waypoint0 waypoint5)
		(visible waypoint5 waypoint0)
		(visible waypoint1 waypoint0)
		(visible waypoint0 waypoint1)
		(visible waypoint2 waypoint0)
		(visible waypoint0 waypoint2)
		(visible waypoint2 waypoint1)
		(visible waypoint1 waypoint2)
		(visible waypoint2 waypoint5)
		(visible waypoint5 waypoint2)
		(visible waypoint3 waypoint2)
		(visible waypoint2 waypoint3)
		(visible waypoint4 waypoint0)
		(visible waypoint0 waypoint4)
		(visible waypoint4 waypoint3)
		(visible waypoint3 waypoint4)
		(visible waypoint5 waypoint1)
		(visible waypoint1 waypoint5)
		(visible waypoint5 waypoint4)
		(visible waypoint4 waypoint5)
		(at_soil_sample waypoint1)
		(at_rock_sample waypoint2)
		(at_rock_sample waypoint3)
		(at_soil_sample waypoint4)
		(at_rock_sample waypoint4)
		(at_rock_sample waypoint5)
		(at_lander general waypoint3)
		(channel_free general)
		(at rover0 waypoint2)
		(available rover0)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)
		(can_traverse rover0 waypoint2 waypoint0)
		(can_traverse rover0 waypoint0 waypoint2)
		(can_traverse rover0 waypoint2 waypoint1)
		(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover0 waypoint2 waypoint3)
		(can_traverse rover0 waypoint3 waypoint2)
		(can_traverse rover0 waypoint2 waypoint5)
		(can_traverse rover0 waypoint5 waypoint2)
		(can_traverse rover0 waypoint0 waypoint4)
		(can_traverse rover0 waypoint4 waypoint0)
		(at rover1 waypoint3)
		(available rover1)
		(store_of rover1store rover1)
		(empty rover1store)
		(equipped_for_rock_analysis rover1)
		(can_traverse rover1 waypoint3 waypoint0)
		(can_traverse rover1 waypoint0 waypoint3)
		(can_traverse rover1 waypoint3 waypoint2)
		(can_traverse rover1 waypoint2 waypoint3)
		(can_traverse rover1 waypoint3 waypoint4)
		(can_traverse rover1 waypoint4 waypoint3)
		(can_traverse rover1 waypoint0 waypoint1)
		(can_traverse rover1 waypoint1 waypoint0)
		(can_traverse rover1 waypoint0 waypoint5)
		(can_traverse rover1 waypoint5 waypoint0)
		(at rover2 waypoint4)
		(available rover2)
		(store_of rover2store rover2)
		(empty rover2store)
		(equipped_for_soil_analysis rover2)
		(equipped_for_rock_analysis rover2)
		(equipped_for_imaging rover2)
		(can_traverse rover2 waypoint4 waypoint0)
		(can_traverse rover2 waypoint0 waypoint4)
		(can_traverse rover2 waypoint4 waypoint5)
		(can_traverse rover2 waypoint5 waypoint4)
		(can_traverse rover2 waypoint0 waypoint1)
		(can_traverse rover2 waypoint1 waypoint0)
		(can_traverse rover2 waypoint0 waypoint3)
		(can_traverse rover2 waypoint3 waypoint0)
		(can_traverse rover2 waypoint5 waypoint2)
		(can_traverse rover2 waypoint2 waypoint5)
		(on_board camera0 rover0)
		(calibration_target camera0 objective0)
		(supports camera0 colour)
		(supports camera0 high_res)
		(on_board camera1 rover2)
		(calibration_target camera1 objective1)
		(supports camera1 high_res)
		(visible_from objective0 waypoint0)
		(visible_from objective0 waypoint1)
		(visible_from objective0 waypoint2)
		(visible_from objective0 waypoint3)
		(visible_from objective0 waypoint4)
		(visible_from objective1 waypoint0)
		(visible_from objective1 waypoint1)
		(visible_from objective1 waypoint2)
		(visible_from objective1 waypoint3)
	)
)
