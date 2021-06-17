class Client:User{
    private var meters:[ElectricMeter] = []
    private var metersIds:[Int] = []
    override var description:String{
        return "\(super.getId()), \(super.getName()), \(super.getPassword()), \n\(self.checkOwnRegisters())"
    }

    public func getMeters()->[ElectricMeter]{
        return self.meters
    }

    public func addMeter(meter:ElectricMeter){
        self.meters.append(meter)
    }

    public func getMetersIds()->[Int]{
        return self.metersIds
    }

    public func setMetersIds(value:[Int]){
        self.metersIds = value
    }

    public func addMeterIds(meter:Int){
        self.metersIds.append(meter)
    }

    public func checkOwnRegisters()-> String{
        var str = " MEDIDORES ASOCIADOS:\n"
        for i in self.meters{
            str += " - "
            str += i.description
        }
        return str
    }



    public func payPending(meterID:Int , registerID:Int)-> Void{

        var paid = "Datos no concuerdan, inserte correctamente el ID del medidor y el ID de la factura"
        // Check meter to pay
        for i in self.meters{
            if i.getId() == meterID{

                // Check register of meter to pay
                let meterRegisters = i.getRegisters()
                for j in meterRegisters{
                    if j.getIdRegister() == registerID{

                        // Pay register
                        if j.getPending() == true{
                            j.setPending(value:false)
                            paid = "El recibo ha sido pagado"
                        }else{
                            paid = "El recibo ya estaba pagado"
                        }
                        break
                    }


                }
                break
            }
        }


        print(paid)
        
            
    }

    
    public func appeal(meterId:Int, registerId:Int)-> Appeal{

        let randomId = Int.random(in:1..<30)

        // A cual registro de cual medidor le vamos a apelar?
        let registerss = meters[meterId].getRegisters()

        // Escribir la situación
        print("ESCRIBA LA SITUACIÓN A APELAR: ", terminator:"")
        let situation1 = readLine()!

        let appeal = Appeal(idAppeal:randomId, 
                            situation: situation1, 
                            attended:false, 
                            register: registerss[registerId], 
                            idClient: super.getId(), 
                            clientName: super.getName())

        return appeal
    
        
    }
}

