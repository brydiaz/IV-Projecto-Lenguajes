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
            print("ATENDIDA: \(a.getAttended())")
            print("ID REGISTRO: \(a.getRegister().getIdRegister())\n")
        }
        //print("Yo reviso las apelaciones")
    }

    public func fixAppeal(value:Int){
        print("Yo arreglo una apelacion")
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

    public func fixMeterCons(value:Int){
        print("Yo arreglo el consumo en un medidor")
    }
}