;;
;; Copyright (c) 2020 by Damien Pellier <Damien.Pellier@imag.fr>.
;;
;; This file is part of PDDL4J library.
;;
;; PDDL4J is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; PDDL4J is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
;;

(define (problem p07)

    (:domain satellite)

    (:objects
        satellite0 - satellite
        instrument0 - instrument
        instrument1 - instrument
        instrument2 - instrument
        satellite1 - satellite
        instrument3 - instrument
        instrument4 - instrument
        instrument5 - instrument
        satellite2 - satellite
        instrument6 - instrument
        satellite3 - satellite
        instrument7 - instrument
        satellite4 - satellite
        instrument8 - instrument
        instrument9 - instrument
        instrument10 - instrument
        satellite5 - satellite
        instrument11 - instrument
        instrument12 - instrument
        instrument13 - instrument
        satellite6 - satellite
        instrument14 - instrument
        instrument15 - instrument
        instrument16 - instrument
        satellite7 - satellite
        instrument17 - instrument
        instrument18 - instrument
        satellite8 - satellite
        instrument19 - instrument
        instrument20 - instrument
        instrument21 - instrument
        satellite9 - satellite
        instrument22 - instrument
        image0 - mode
        image2 - mode
        infrared4 - mode
        thermograph1 - mode
        spectrograph3 - mode
        GroundStation0 - direction
        Star3 - direction
        GroundStation4 - direction
        Star2 - direction
        GroundStation1 - direction
        Phenomenon5 - direction
        Planet6 - direction
        Planet7 - direction
        Planet8 - direction
        Phenomenon9 - direction
        Planet10 - direction
        Planet11 - direction
        Star12 - direction
        Star13 - direction
        Star14 - direction
        Star15 - direction
        Star16 - direction
        Phenomenon17 - direction
        Phenomenon18 - direction
        Planet19 - direction
        Star20 - direction
        Planet21 - direction
        Planet22 - direction
        Phenomenon23 - direction
        Star24 - direction
    )

    (:htn
        :ordered-subtasks (and
            (do_mission Phenomenon5 thermograph1)
            (do_mission Planet6 infrared4)
            (do_mission Planet7 image0)
            (do_mission Planet8 thermograph1)
            (do_mission Phenomenon9 image2)
            (do_mission Planet10 image0)
            (do_mission Planet11 infrared4)
            (do_mission Star12 image0)
            (do_mission Star13 image0)
            (do_mission Star14 thermograph1)
            (do_mission Star15 image0)
            (do_mission Star16 thermograph1)
            (do_mission Phenomenon17 infrared4)
            (do_mission Phenomenon18 spectrograph3)
            (do_mission Star20 image0)
            (do_mission Planet21 thermograph1)
            (do_mission Planet22 image2)
            (do_mission Phenomenon23 image0)
            (do_mission Star24 infrared4)
            (do_turning satellite5 Planet6)
            (do_turning satellite7 Star3)
            (do_turning satellite8 Star15)
            (do_turning satellite9 Star16)
        )
    )

    (:init
        (supports instrument0 infrared4)
        (calibration_target instrument0 Star3)
        (supports instrument1 spectrograph3)
        (calibration_target instrument1 GroundStation0)
        (supports instrument2 image0)
        (supports instrument2 thermograph1)
        (supports instrument2 image2)
        (calibration_target instrument2 GroundStation1)
        (on_board instrument0 satellite0)
        (on_board instrument1 satellite0)
        (on_board instrument2 satellite0)
        (power_avail satellite0)
        (pointing satellite0 Star15)
        (supports instrument3 thermograph1)
        (supports instrument3 image0)
        (calibration_target instrument3 GroundStation4)
        (supports instrument4 image2)
        (supports instrument4 thermograph1)
        (calibration_target instrument4 Star3)
        (supports instrument5 spectrograph3)
        (supports instrument5 thermograph1)
        (supports instrument5 image2)
        (calibration_target instrument5 GroundStation4)
        (on_board instrument3 satellite1)
        (on_board instrument4 satellite1)
        (on_board instrument5 satellite1)
        (power_avail satellite1)
        (pointing satellite1 Planet10)
        (supports instrument6 image0)
        (calibration_target instrument6 GroundStation1)
        (on_board instrument6 satellite2)
        (power_avail satellite2)
        (pointing satellite2 Star24)
        (supports instrument7 infrared4)
        (calibration_target instrument7 Star3)
        (on_board instrument7 satellite3)
        (power_avail satellite3)
        (pointing satellite3 Phenomenon9)
        (supports instrument8 spectrograph3)
        (calibration_target instrument8 GroundStation0)
        (supports instrument9 image0)
        (supports instrument9 image2)
        (supports instrument9 thermograph1)
        (calibration_target instrument9 Star3)
        (supports instrument10 image0)
        (supports instrument10 image2)
        (supports instrument10 spectrograph3)
        (calibration_target instrument10 Star2)
        (on_board instrument8 satellite4)
        (on_board instrument9 satellite4)
        (on_board instrument10 satellite4)
        (power_avail satellite4)
        (pointing satellite4 Planet19)
        (supports instrument11 image0)
        (calibration_target instrument11 Star3)
        (supports instrument12 infrared4)
        (supports instrument12 image0)
        (calibration_target instrument12 GroundStation4)
        (supports instrument13 spectrograph3)
        (calibration_target instrument13 Star2)
        (on_board instrument11 satellite5)
        (on_board instrument12 satellite5)
        (on_board instrument13 satellite5)
        (power_avail satellite5)
        (pointing satellite5 Planet10)
        (supports instrument14 spectrograph3)
        (supports instrument14 thermograph1)
        (supports instrument14 image0)
        (calibration_target instrument14 Star3)
        (supports instrument15 image0)
        (supports instrument15 thermograph1)
        (supports instrument15 image2)
        (calibration_target instrument15 GroundStation4)
        (supports instrument16 spectrograph3)
        (supports instrument16 image2)
        (calibration_target instrument16 GroundStation0)
        (on_board instrument14 satellite6)
        (on_board instrument15 satellite6)
        (on_board instrument16 satellite6)
        (power_avail satellite6)
        (pointing satellite6 Planet11)
        (supports instrument17 thermograph1)
        (supports instrument17 image2)
        (supports instrument17 image0)
        (calibration_target instrument17 GroundStation4)
        (supports instrument18 image2)
        (supports instrument18 thermograph1)
        (calibration_target instrument18 Star3)
        (on_board instrument17 satellite7)
        (on_board instrument18 satellite7)
        (power_avail satellite7)
        (pointing satellite7 Planet11)
        (supports instrument19 thermograph1)
        (supports instrument19 infrared4)
        (calibration_target instrument19 Star2)
        (supports instrument20 thermograph1)
        (calibration_target instrument20 GroundStation4)
        (supports instrument21 thermograph1)
        (calibration_target instrument21 Star2)
        (on_board instrument19 satellite8)
        (on_board instrument20 satellite8)
        (on_board instrument21 satellite8)
        (power_avail satellite8)
        (pointing satellite8 GroundStation4)
        (supports instrument22 spectrograph3)
        (supports instrument22 thermograph1)
        (supports instrument22 infrared4)
        (calibration_target instrument22 GroundStation1)
        (on_board instrument22 satellite9)
        (power_avail satellite9)
        (pointing satellite9 Planet11)
    )
)
