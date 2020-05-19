
(define (problem strips-sat-x-1)
(:domain satellite)
(:requirements :strips :typing :htn :negative-preconditions)

  ;---------------- Facts -----------------------
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
  instrument8 - instrument
  satellite4 - satellite
  instrument9 - instrument
  instrument10 - instrument
  satellite5 - satellite
  instrument11 - instrument
  instrument12 - instrument
  instrument13 - instrument
  satellite6 - satellite
  instrument14 - instrument
  satellite7 - satellite
  instrument15 - instrument
  instrument16 - instrument
  satellite8 - satellite
  instrument17 - instrument
  instrument18 - instrument
  instrument19 - instrument
  satellite9 - satellite
  instrument20 - instrument
  instrument21 - instrument
  instrument22 - instrument
  satellite10 - satellite
  instrument23 - instrument
  instrument24 - instrument
  satellite11 - satellite
  instrument25 - instrument
  satellite12 - satellite
  instrument26 - instrument
  satellite13 - satellite
  instrument27 - instrument
  satellite14 - satellite
  instrument28 - instrument
  instrument29 - instrument
  instrument30 - instrument
  spectrograph1 - mode
  infrared3 - mode
  image4 - mode
  infrared0 - mode
  image2 - mode
  Star4 - direction
  Star2 - direction
  Star1 - direction
  GroundStation3 - direction
  Star0 - direction
  Planet5 - direction
  Star6 - direction
  Star7 - direction
  Phenomenon8 - direction
  Planet9 - direction
  Planet10 - direction
  Star11 - direction
  Star12 - direction
  Phenomenon13 - direction
  Phenomenon14 - direction
  Star15 - direction
  Star16 - direction
  Planet17 - direction
  Phenomenon18 - direction
  Star19 - direction
  Phenomenon20 - direction
  Star21 - direction
  Star22 - direction
  Star23 - direction
  Star24 - direction
  Phenomenon25 - direction
  Star26 - direction
  Planet27 - direction
  Planet28 - direction
  Planet29 - direction
  Planet30 - direction
  Planet31 - direction
  Planet32 - direction
  Star33 - direction
  Planet34 - direction
  Star35 - direction
  Phenomenon36 - direction
  Star37 - direction
  Phenomenon38 - direction
  Phenomenon39 - direction
  Star40 - direction
  Phenomenon41 - direction
  Phenomenon42 - direction
  Planet43 - direction
  Planet44 - direction
  Planet45 - direction
  Star46 - direction
  Phenomenon47 - direction
  Phenomenon48 - direction
  Planet49 - direction
  Star50 - direction
  Planet51 - direction
  Star52 - direction
  Phenomenon53 - direction
  Star54 - direction
  Planet55 - direction
  Phenomenon56 - direction
  Planet57 - direction
  Phenomenon58 - direction
  Planet59 - direction
  Planet60 - direction
  Star61 - direction
  Phenomenon62 - direction
  Star63 - direction
  Star64 - direction
  Star65 - direction
  Phenomenon66 - direction
  Planet67 - direction
  Planet68 - direction
  Planet69 - direction
  Phenomenon70 - direction
  Phenomenon71 - direction
  Star72 - direction
  Planet73 - direction
  Planet74 - direction
  Star75 - direction
  Planet76 - direction
  Star77 - direction
  Planet78 - direction
  Star79 - direction
  Phenomenon80 - direction
  Planet81 - direction
  Planet82 - direction
  Star83 - direction
  Planet84 - direction
  Phenomenon85 - direction
  Star86 - direction
  Planet87 - direction
  Planet88 - direction
  Planet89 - direction
  Phenomenon90 - direction
  Phenomenon91 - direction
  Star92 - direction
  Planet93 - direction
  Phenomenon94 - direction
  Planet95 - direction
  Planet96 - direction
  Phenomenon97 - direction
  Phenomenon98 - direction
  Planet99 - direction
  Phenomenon100 - direction
  Phenomenon101 - direction
  Planet102 - direction
  Planet103 - direction
  Planet104 - direction
  Star105 - direction
  Star106 - direction
  Star107 - direction
  Phenomenon108 - direction
  Phenomenon109 - direction
  Phenomenon110 - direction
  Star111 - direction
  Planet112 - direction
  Phenomenon113 - direction
  Planet114 - direction
  Star115 - direction
  Phenomenon116 - direction
  Phenomenon117 - direction
  Phenomenon118 - direction
  Phenomenon119 - direction
  Phenomenon120 - direction
  Planet121 - direction
  Star122 - direction
  Phenomenon123 - direction
  Planet124 - direction
  )

  ;--------------- Initial State -----------------
  (:init
      (supports instrument0 infrared0)
  (calibration_target instrument0 Star2)
  (supports instrument1 image2)
  (supports instrument1 image4)
  (calibration_target instrument1 Star1)
  (supports instrument2 infrared3)
  (supports instrument2 image4)
  (calibration_target instrument2 GroundStation3)
  (on_board instrument0 satellite0)
  (on_board instrument1 satellite0)
  (on_board instrument2 satellite0)
  (power_avail satellite0)
  (pointing satellite0 Star24)
  (supports instrument3 image2)
  (supports instrument3 infrared0)
  (supports instrument3 infrared3)
  (calibration_target instrument3 Star1)
  (supports instrument4 infrared0)
  (supports instrument4 image2)
  (supports instrument4 spectrograph1)
  (calibration_target instrument4 Star4)
  (supports instrument5 image4)
  (calibration_target instrument5 Star4)
  (on_board instrument3 satellite1)
  (on_board instrument4 satellite1)
  (on_board instrument5 satellite1)
  (power_avail satellite1)
  (pointing satellite1 Star72)
  (supports instrument6 image2)
  (calibration_target instrument6 GroundStation3)
  (on_board instrument6 satellite2)
  (power_avail satellite2)
  (pointing satellite2 Phenomenon71)
  (supports instrument7 image2)
  (calibration_target instrument7 Star0)
  (supports instrument8 image4)
  (supports instrument8 image2)
  (calibration_target instrument8 Star4)
  (on_board instrument7 satellite3)
  (on_board instrument8 satellite3)
  (power_avail satellite3)
  (pointing satellite3 Planet10)
  (supports instrument9 infrared0)
  (calibration_target instrument9 Star1)
  (supports instrument10 image2)
  (calibration_target instrument10 Star1)
  (on_board instrument9 satellite4)
  (on_board instrument10 satellite4)
  (power_avail satellite4)
  (pointing satellite4 Star86)
  (supports instrument11 image4)
  (supports instrument11 infrared0)
  (supports instrument11 spectrograph1)
  (calibration_target instrument11 Star2)
  (supports instrument12 infrared0)
  (calibration_target instrument12 GroundStation3)
  (supports instrument13 image4)
  (calibration_target instrument13 Star2)
  (on_board instrument11 satellite5)
  (on_board instrument12 satellite5)
  (on_board instrument13 satellite5)
  (power_avail satellite5)
  (pointing satellite5 Star37)
  (supports instrument14 infrared3)
  (supports instrument14 image2)
  (calibration_target instrument14 Star4)
  (on_board instrument14 satellite6)
  (power_avail satellite6)
  (pointing satellite6 Planet95)
  (supports instrument15 infrared3)
  (calibration_target instrument15 Star4)
  (supports instrument16 infrared3)
  (calibration_target instrument16 GroundStation3)
  (on_board instrument15 satellite7)
  (on_board instrument16 satellite7)
  (power_avail satellite7)
  (pointing satellite7 Phenomenon20)
  (supports instrument17 image2)
  (calibration_target instrument17 Star1)
  (supports instrument18 image4)
  (calibration_target instrument18 Star2)
  (supports instrument19 spectrograph1)
  (calibration_target instrument19 Star1)
  (on_board instrument17 satellite8)
  (on_board instrument18 satellite8)
  (on_board instrument19 satellite8)
  (power_avail satellite8)
  (pointing satellite8 Star115)
  (supports instrument20 image4)
  (supports instrument20 infrared0)
  (supports instrument20 spectrograph1)
  (calibration_target instrument20 Star4)
  (supports instrument21 infrared3)
  (supports instrument21 infrared0)
  (calibration_target instrument21 Star0)
  (supports instrument22 spectrograph1)
  (supports instrument22 infrared0)
  (supports instrument22 image4)
  (calibration_target instrument22 Star4)
  (on_board instrument20 satellite9)
  (on_board instrument21 satellite9)
  (on_board instrument22 satellite9)
  (power_avail satellite9)
  (pointing satellite9 Planet124)
  (supports instrument23 infrared3)
  (supports instrument23 infrared0)
  (supports instrument23 image4)
  (calibration_target instrument23 Star2)
  (supports instrument24 image4)
  (supports instrument24 infrared3)
  (supports instrument24 spectrograph1)
  (calibration_target instrument24 Star2)
  (on_board instrument23 satellite10)
  (on_board instrument24 satellite10)
  (power_avail satellite10)
  (pointing satellite10 Planet93)
  (supports instrument25 spectrograph1)
  (calibration_target instrument25 GroundStation3)
  (on_board instrument25 satellite11)
  (power_avail satellite11)
  (pointing satellite11 Planet17)
  (supports instrument26 infrared0)
  (supports instrument26 infrared3)
  (calibration_target instrument26 GroundStation3)
  (on_board instrument26 satellite12)
  (power_avail satellite12)
  (pointing satellite12 Star63)
  (supports instrument27 infrared3)
  (supports instrument27 image2)
  (supports instrument27 image4)
  (calibration_target instrument27 Star1)
  (on_board instrument27 satellite13)
  (power_avail satellite13)
  (pointing satellite13 Star92)
  (supports instrument28 infrared0)
  (calibration_target instrument28 Star0)
  (supports instrument29 image2)
  (supports instrument29 infrared0)
  (supports instrument29 image4)
  (calibration_target instrument29 GroundStation3)
  (supports instrument30 image2)
  (calibration_target instrument30 Star0)
  (on_board instrument28 satellite14)
  (on_board instrument29 satellite14)
  (on_board instrument30 satellite14)
  (power_avail satellite14)
  (pointing satellite14 Phenomenon85)
  )

  (:goal
        :tasks  (
                    (tag t1   (do_mission Planet5 image4) )
                    (tag t2   (do_mission Star6 infrared3) )
                    (tag t3   (do_mission Star7 image4) )
                    (tag t4   (do_mission Phenomenon8 image4) ) 
                    (tag t5   (do_mission Planet9 infrared0) )
                    (tag t6   (do_mission Planet10 infrared3) )
                    (tag t7   (do_mission Star12 image4) )
                    (tag t8   (do_mission Phenomenon13 image4) )
                    (tag t9   (do_mission Phenomenon14 spectrograph1) )
                    (tag t10  (do_mission Star15 spectrograph1) )
                    (tag t11  (do_mission Star16 image2) )
                    (tag t12  (do_mission Planet17 infrared3) )
                    (tag t13  (do_mission Phenomenon18 image4) )
                    (tag t14  (do_mission Star19 infrared3) )
                    (tag t15  (do_mission Phenomenon20 image4) )
                    (tag t16  (do_mission Star21 image4) )
                    (tag t17  (do_mission Star22 image4) )
                    (tag t18  (do_mission Star23 image2) )
                    (tag t19  (do_mission Star24 image2) )
                    (tag t20  (do_mission Phenomenon25 image4) )
                    (tag t21  (do_mission Planet28 image4) )
                    (tag t22  (do_mission Planet29 image4) )
                    (tag t23  (do_mission Planet30 infrared3) )
                    (tag t24  (do_mission Planet31 infrared3) )
                    (tag t25  (do_mission Planet32 spectrograph1) )
                    (tag t26  (do_mission Star33 infrared3) )
                    (tag t27  (do_mission Planet34 image4) )
                    (tag t28  (do_mission Star35 image2) )
                    (tag t29  (do_mission Star37 image2) )
                    (tag t30  (do_mission Phenomenon38 image4) )
                    (tag t31  (do_mission Phenomenon39 spectrograph1) )
                    (tag t32  (do_mission Star40 infrared3) )
                    (tag t33  (do_mission Phenomenon41 spectrograph1) )
                    (tag t34  (do_mission Phenomenon42 spectrograph1) )
                    (tag t35  (do_mission Planet44 infrared3) )
                    (tag t36  (do_mission Planet45 infrared0) )
                    (tag t37  (do_mission Star46 image4) )
                    (tag t38  (do_mission Phenomenon47 infrared3) )
                    (tag t39  (do_mission Phenomenon48 image4) )
                    (tag t40  (do_mission Planet49 infrared0) )
                    (tag t41  (do_mission Star50 infrared3) )
                    (tag t42  (do_mission Planet51 infrared0) )
                    (tag t43  (do_mission Star52 infrared3) )
                    (tag t44  (do_mission Star54 spectrograph1) ) 
                    (tag t45  (do_mission Planet55 spectrograph1) )
                    (tag t46  (do_mission Phenomenon56 infrared3) )
                    (tag t47  (do_mission Planet57 image4) )
                    (tag t48  (do_mission Planet59 image4) )
                    (tag t49  (do_mission Planet60 infrared3) )
                    (tag t50  (do_mission Star61 image2) )
                    (tag t51  (do_mission Phenomenon62 infrared3) )
                    (tag t52  (do_mission Star63 infrared3) )
                    (tag t53  (do_mission Star64 image4) )
                    (tag t54  (do_mission Star65 image2) )
                    (tag t55  (do_mission Planet67 infrared3) )
                    (tag t56  (do_mission Planet68 image4) )
                    (tag t57  (do_mission Planet69 spectrograph1) )
                    (tag t58  (do_mission Phenomenon70 infrared0) )
                    (tag t59  (do_mission Phenomenon71 image4) )
                    (tag t60  (do_mission Star72 image4) )
                    (tag t61  (do_mission Planet73 spectrograph1) )
                    (tag t62  (do_mission Planet74 image4) )
                    (tag t63  (do_mission Star75 infrared3) )
                    (tag t64  (do_mission Planet76 image2) )
                    (tag t65  (do_mission Star77 infrared0) )
                    (tag t66  (do_mission Planet78 spectrograph1) )
                    (tag t67  (do_mission Star79 image4) )
                    (tag t68  (do_mission Phenomenon80 image4) )
                    (tag t69  (do_mission Planet81 image4) )
                    (tag t70  (do_mission Star83 image4) )
                    (tag t71  (do_mission Planet84 infrared0) )
                    (tag t72  (do_mission Phenomenon85 spectrograph1) )
                    (tag t73  (do_mission Star86 image2) )
                    (tag t74  (do_mission Planet87 image4) )
                    (tag t75  (do_mission Planet88 infrared0) )
                    (tag t76  (do_mission Planet89 infrared0) )
                    (tag t77  (do_mission Phenomenon90 infrared0) )
                    (tag t78  (do_mission Phenomenon91 infrared3) )
                    (tag t79  (do_mission Star92 infrared0) )
                    (tag t80  (do_mission Planet93 infrared0) )
                    (tag t81  (do_mission Phenomenon94 infrared3) )
                    (tag t82  (do_mission Planet95 infrared3) )
                    (tag t83  (do_mission Planet96 spectrograph1) )
                    (tag t84  (do_mission Phenomenon97 infrared3) ) 
                    (tag t85  (do_mission Phenomenon98 image4) )
                    (tag t86  (do_mission Planet99 image4) )
                    (tag t87  (do_mission Phenomenon100 infrared3) )
                    (tag t88  (do_mission Phenomenon101 spectrograph1) )
                    (tag t89  (do_mission Planet102 infrared0) )
                    (tag t90  (do_mission Planet103 image4) )
                    (tag t91  (do_mission Planet104 spectrograph1) )
                    (tag t92  (do_mission Star105 image2) )
                    (tag t93  (do_mission Star106 infrared0) )
                    (tag t94  (do_mission Star107 infrared3) )
                    (tag t95  (do_mission Phenomenon108 infrared3) )
                    (tag t96  (do_mission Phenomenon109 image2) )
                    (tag t97  (do_mission Phenomenon110 image2) )
                    (tag t98  (do_mission Star111 image4) )
                    (tag t99  (do_mission Planet112 infrared0) )
                    (tag t100 (do_mission Phenomenon113 spectrograph1) )
                    (tag t101 (do_mission Planet114 infrared3) )
                    (tag t102 (do_mission Star115 image2) )
                    (tag t103 (do_mission Phenomenon116 spectrograph1) )
                    (tag t104 (do_mission Phenomenon117 infrared3) ) 
                    (tag t105 (do_mission Phenomenon119 image4) )
                    (tag t106 (do_mission Phenomenon120 infrared0) )
                    (tag t107 (do_mission Planet121 infrared3) )
                    (tag t108 (do_mission Star122 image2) )
                    (tag t109 (do_turning satellite1 Star0) )
                    (tag t110 (do_turning satellite2 Star61) )
                    (tag t111 (do_turning satellite4 Phenomenon123) )
                    (tag t112 (do_turning satellite5 Phenomenon80) )
                    (tag t113 (do_turning satellite9 Phenomenon14) )
                    (tag t114 (do_turning satellite14 Planet124) )
                )
        :constraints(and
                        (after (and 
                                    (have_image Planet5 image4)
                                    (have_image Star6 infrared3)
                                    (have_image Star7 image4)
                                    (have_image Phenomenon8 image4)
                                    (have_image Planet9 infrared0)
                                    (have_image Planet10 infrared3)
                                    (have_image Star12 image4)
                                    (have_image Phenomenon13 image4)
                                    (have_image Phenomenon14 spectrograph1)
                                    (have_image Star15 spectrograph1)
                                    (have_image Star16 image2)
                                    (have_image Planet17 infrared3)
                                    (have_image Phenomenon18 image4)
                                    (have_image Star19 infrared3)
                                    (have_image Phenomenon20 image4)
                                    (have_image Star21 image4)
                                    (have_image Star22 image4)
                                    (have_image Star23 image2)
                                    (have_image Star24 image2)
                                    (have_image Phenomenon25 image4)
                                    (have_image Planet28 image4)
                                    (have_image Planet29 image4)
                                    (have_image Planet30 infrared3)
                                    (have_image Planet31 infrared3)
                                    (have_image Planet32 spectrograph1)
                                    (have_image Star33 infrared3)
                                    (have_image Planet34 image4)
                                    (have_image Star35 image2)
                                    (have_image Star37 image2)
                                    (have_image Phenomenon38 image4)
                                    (have_image Phenomenon39 spectrograph1)
                                    (have_image Star40 infrared3)
                                    (have_image Phenomenon41 spectrograph1)
                                    (have_image Phenomenon42 spectrograph1)
                                    (have_image Planet44 infrared3)
                                    (have_image Planet45 infrared0)
                                    (have_image Star46 image4)
                                    (have_image Phenomenon47 infrared3)
                                    (have_image Phenomenon48 image4)
                                    (have_image Planet49 infrared0)
                                    (have_image Star50 infrared3)
                                    (have_image Planet51 infrared0)
                                    (have_image Star52 infrared3)
                                    (have_image Star54 spectrograph1)
                                    (have_image Planet55 spectrograph1)
                                    (have_image Phenomenon56 infrared3)
                                    (have_image Planet57 image4)
                                    (have_image Planet59 image4)
                                    (have_image Planet60 infrared3)
                                    (have_image Star61 image2)
                                    (have_image Phenomenon62 infrared3)
                                    (have_image Star63 infrared3)
                                    (have_image Star64 image4)
                                    (have_image Star65 image2)
                                    (have_image Planet67 infrared3)
                                    (have_image Planet68 image4)
                                    (have_image Planet69 spectrograph1)
                                    (have_image Phenomenon70 infrared0)
                                    (have_image Phenomenon71 image4)
                                    (have_image Star72 image4)
                                    (have_image Planet73 spectrograph1)
                                    (have_image Planet74 image4)
                                    (have_image Star75 infrared3)
                                    (have_image Planet76 image2)
                                    (have_image Star77 infrared0)
                                    (have_image Planet78 spectrograph1)
                                    (have_image Star79 image4)
                                    (have_image Phenomenon80 image4)
                                    (have_image Planet81 image4)
                                    (have_image Star83 image4)
                                    (have_image Planet84 infrared0)
                                    (have_image Phenomenon85 spectrograph1)
                                    (have_image Star86 image2)
                                    (have_image Planet87 image4)
                                    (have_image Planet88 infrared0)
                                    (have_image Planet89 infrared0)
                                    (have_image Phenomenon90 infrared0)
                                    (have_image Phenomenon91 infrared3)
                                    (have_image Star92 infrared0)
                                    (have_image Planet93 infrared0)
                                    (have_image Phenomenon94 infrared3)
                                    (have_image Planet95 infrared3)
                                    (have_image Planet96 spectrograph1)
                                    (have_image Phenomenon97 infrared3)
                                    (have_image Phenomenon98 image4)
                                    (have_image Planet99 image4)
                                    (have_image Phenomenon100 infrared3)
                                    (have_image Phenomenon101 spectrograph1)
                                    (have_image Planet102 infrared0)
                                    (have_image Planet103 image4)
                                    (have_image Planet104 spectrograph1)
                                    (have_image Star105 image2)
                                    (have_image Star106 infrared0)
                                    (have_image Star107 infrared3)
                                    (have_image Phenomenon108 infrared3)
                                    (have_image Phenomenon109 image2)
                                    (have_image Phenomenon110 image2)
                                    (have_image Star111 image4)
                                    (have_image Planet112 infrared0)
                                    (have_image Phenomenon113 spectrograph1)
                                    (have_image Planet114 infrared3)
                                    (have_image Star115 image2)
                                    (have_image Phenomenon116 spectrograph1)
                                    (have_image Phenomenon117 infrared3)
                                    (have_image Phenomenon119 image4)
                                    (have_image Phenomenon120 infrared0)
                                    (have_image Planet121 infrared3)
                                    (have_image Star122 image2)
                                    (pointing satellite1 Star0)
                                    (pointing satellite2 Star61)
                                    (pointing satellite4 Phenomenon123)
                                    (pointing satellite5 Phenomenon80)
                                    (pointing satellite9 Phenomenon14)
                                    (pointing satellite14 Planet124)
                                ) t114)
                    )
)
