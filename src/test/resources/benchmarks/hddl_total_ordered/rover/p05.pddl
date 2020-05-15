(define
	(problem p05)
	(:domain rover)
	(:objects
		waypoint0 - waypoint
		waypoint1 - waypoint
		waypoint2 - waypoint
		waypoint3 - waypoint
		colour - mode
		high_res - mode
		low_res - mode
		rover0store - store
		rover1store - store
		rover0 - rover
		rover1 - rover
		camera0 - camera
		camera1 - camera
		camera2 - camera
		general - lander
		objective0 - objective
		objective1 - objective
		objective2 - objective
	)
	(:htn
    	:ordered-subtasks (and
    		(get_soil_data waypoint2)
    		(get_image_data objective2 high_res)
    		(get_image_data objective0 colour)
    		(get_soil_data waypoint1)
    		(get_rock_data waypoint0)
            (get_image_data objective0 high_res)
    		(get_rock_data waypoint1)
        )
    )
    (:init
     	(visible waypoint0 waypoint2)
		(visible waypoint2 waypoint0)
		(visible waypoint1 waypoint0)
		(visible waypoint0 waypoint1)
		(visible waypoint1 waypoint3)
		(visible waypoint3 waypoint1)
		(visible waypoint2 waypoint1)
		(visible waypoint1 waypoint2)
		(visible waypoint3 waypoint0)
		(visible waypoint0 waypoint3)
		(visible waypoint3 waypoint2)
		(visible waypoint2 waypoint3)
		(at_rock_sample waypoint0)
		(at_soil_sample waypoint1)
		(at_rock_sample waypoint1)
		(at_soil_sample waypoint2)
		(at_soil_sample waypoint3)
		(at_lander general waypoint3)
		(channel_free general)
		(at rover0 waypoint0)
		(available rover0)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)
		(can_traverse rover0 waypoint0 waypoint1)
		(can_traverse rover0 waypoint1 waypoint0)
		(can_traverse rover0 waypoint0 waypoint3)
		(can_traverse rover0 waypoint3 waypoint0)
		(at rover1 waypoint0)
		(available rover1)
		(store_of rover1store rover1)
		(empty rover1store)
		(equipped_for_soil_analysis rover1)
		(equipped_for_imaging rover1)
		(can_traverse rover1 waypoint0 waypoint1)
		(can_traverse rover1 waypoint1 waypoint0)
		(can_traverse rover1 waypoint1 waypoint2)
		(can_traverse rover1 waypoint2 waypoint1)
		(can_traverse rover1 waypoint1 waypoint3)
		(can_traverse rover1 waypoint3 waypoint1)
		(on_board camera0 rover1)
		(calibration_target camera0 objective1)
		(supports camera0 high_res)
		(supports camera0 low_res)
		(on_board camera1 rover1)
		(calibration_target camera1 objective1)
		(supports camera1 colour)
		(supports camera1 high_res)
		(on_board camera2 rover0)
		(calibration_target camera2 objective1)
		(supports camera2 colour)
		(supports camera2 high_res)
		(supports camera2 low_res)
		(visible_from objective0 waypoint0)
		(visible_from objective0 waypoint1)
		(visible_from objective0 waypoint2)
		(visible_from objective0 waypoint3)
		(visible_from objective1 waypoint0)
		(visible_from objective1 waypoint1)
		(visible_from objective1 waypoint2)
		(visible_from objective2 waypoint0)
		(visible_from objective2 waypoint1)
		(visible_from objective2 waypoint2)
	)
)
