A[] (ErrStat == 0) imply not deadlock
A[] (ErrStat == 0 and UseCase == 0) imply not deadlock
sup {ErrStat != 0} : c1
sup {ErrStat == 0 and control.GearChanged} : c1
sup {ErrStat != 0 or (UseCase != 0 and engine.ClutchOpen)} : c2
sup {ErrStat == 0 and UseCase == 0 and control.GearChanged} : c2
sup {control.CCloseError} : c3
sup {control.COpenError} : c4
sup {control.GSetError} : c5
sup {control.GNeuError} : c6
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