A[] (ErrStat == 0) imply not deadlock
A[] (ErrStat == 0 and UseCase == 0) imply not deadlock
A[] v1 imply c1 <= 1500
A[] v2 imply c2 <= 1000
A[] v3 imply c3 <= 200
A[] v4 imply c4 <= 200
A[] v5 imply c5 <= 350
A[] v6 imply c6 <= 200
A[] control.CCloseError imply clutch.ErrorClose
A[] control.COpenError imply clutch.ErrorOpen
A[] control.GSetError imply gearbox.ErrorIdle
A[] control.GNeuError imply gearbox.ErrorNeu
A[] engine.ErrorSpeed imply ErrStat != 0
A[] engine.Torque imply clutch.Closed
E<> interface.GearR
E<> interface.GearN
E<> interface.Gear1
E<> interface.Gear2
E<> interface.Gear3
E<> interface.Gear4
E<> interface.Gear5
A[] ((control.Gear and interface.GearR) imply engine.Torque)
A[] ((control.Gear and interface.Gear1) imply engine.Torque)
A[] ((control.Gear and interface.Gear2) imply engine.Torque)
A[] ((control.Gear and interface.Gear3) imply engine.Torque)
A[] ((control.Gear and interface.Gear4) imply engine.Torque)
A[] ((control.Gear and interface.Gear5) imply engine.Torque)
A[] v15 imply c15 <= 900
E<> v16 imply c16 > 899
A[] (deadlock imply ErrStat != 0)
sup{v1}:c1
sup{v2}:c2
sup{v3}:c3
sup{v4}:c4
sup{v5}:c5
sup{v6}:c6
sup{v15}:c15
sup{v16}:c16