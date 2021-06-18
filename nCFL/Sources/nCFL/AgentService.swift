class AgentService:User{

    public func checkRegisters(arrayMeter:[ElectricMeter]) -> Void{
        for r in arrayMeter {
            print("---------------------------------")
            r.showRegisters()   
        }
        //print("Yo reviso los registros")
    }

    public func checkAppels(arrayAppeals:[Appeal]) -> Void{
        print("\n**APELACIONES EN EL SISTEMA**\n")
        for a in arrayAppeals {
            print("---------------------------------\n")
            print("ID APELACION: \(a.getId())")
            print("SITUACION: \(a.getSituation())")
            if a.getAttended() == false{
                print("ATENDIDA: No")

            }else{
                print("ATENDIDA: Si")
            }
            print("ID REGISTRO: \(a.getRegister().getIdRegister())\n")
        }
        //print("Yo reviso las apelaciones")
    }

    //Recibe una apelacion y le cambia el estado de atendido
    public func fixAppeal(appeal:Appeal) -> Void{
        appeal.setAttended(value:true)
        print("\n**SE HA ATENDIDO LA APELACION**\n")
        print("ID APELACION: \(appeal.getId())")
        print("SITUACION: \(appeal.getSituation())")
        if appeal.getAttended() == false{
            print("ATENDIDA: No")

        }else{
            print("ATENDIDA: Si")
        }
        print("ID REGISTRO: \(appeal.getRegister().getIdRegister())\n")
        //print("Yo arreglo una apelacion")
    }

    public func checkMeters(arrayMeter:[ElectricMeter]) -> Void{
        print("\n**MEDIDORES ASOCIADOS AL SISTEMA**\n")
        for m in arrayMeter {
            print("---------------------------------\n")
            print("ID DEL MEDIDOR: \(m.getId())")
            print("TIPO: \(m.getType())")
            print("TARIFA: \(m.getRate())")
            print("CONSUMO: \(m.getConsumption())")
            m.showRegisters()   
        }
        //print("Yo muestro los medidores")
    }

    public func fixMeterCons(meter:ElectricMeter,value:Double) -> Void{
        meter.setConsumption(value:value)
        let newRate = meter.calculateRate(meterType:meter.getType())
        meter.setRate(value:newRate)
        print("\n**SE HA ARREGLADO EL CONSUMO DEL MEDIDOR**\n")
        print("ID DEL MEDIDOR: \(meter.getId())")
        print("TIPO: \(meter.getType())")
        print("TARIFA: \(meter.getRate())")
        print("CONSUMO: \(meter.getConsumption())")
        meter.showRegisters()   
        //print("Yo arreglo el consumo en un medidor")
    }
}