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

    public func showAllRegisters(arrayMeter:[ElectricMeter]){
        print("\n**MEDIDORES ASOCIADOS AL SISTEMA**\n")
        for m in arrayMeter {
            print("---------------------------------\n")
            print("ID DEL MEDIDOR: \(m.getId())")
            print("TIPO: \(m.getType())")
            print("TARIFA: \(m.getRate())")
            print("CONSUMO: \(m.getConsumption())")
            m.showRegisters()   
        }
    }



    public func payPending(meter:ElectricMeter , registerID:Int)-> Void{

        var paid = "\nEl registro de este medidor no ha sido encontrado"

        let amount = meter.calculateAmount(meter:meter, registerID:registerID)
        if amount != -1.1{
            
            // Cuanto tiene la tarjeta del cliente
            let tarjeta = 100000.0

            if amount > tarjeta{
                paid = "\nEl usuario no tiene fondos suficientes para pagar el registro"
            }else{
                for i in meter.getRegisters(){
                    if i.getIdRegister() == registerID{
                        
                        if i.getPending() == true{
                            paid = "\nSe ha pagado el recibo"
                            i.setPending(value:false)
                            i.setPaidAmount(value:amount)
                        }else{
                            paid = "\nEl registro ya estaba pago"
                        } 
                    }
                }
            } 
        }

        print(paid)
    }
        
    
    public func appeal(meterId:Int, registerId:Int)-> Appeal{

        let randomId = Int.random(in:1..<30)
      

        var contador = 0
        var meterCorrect = false
        for i in self.meters{
            if meterId == i.getId(){
                meterCorrect = true
                break
            }
            contador = contador + 1
        }


        if meterCorrect==false{
            print("Medidor no encontrado")
        }else{
            // A cual registro de cual medidor le vamos a apelar?
            var registerss = meters[contador].getRegisters()

        
            // Escribir la situación
            print("ESCRIBA LA SITUACIÓN A APELAR: ", terminator:"")
            let situation1 = readLine()!

            
            for i in registerss{
                if i.getIdRegister() == registerId{
                    let appeal = Appeal(idAppeal:randomId, 
                                situation: situation1, 
                                attended:false, 
                                register: i, 
                                idClient: super.getId(), 
                                clientName: super.getName())
                    
                    print("APELACIÓN INGRESADA")
                    return appeal
                }
            }
        }

        let appeal1 = Appeal()
        return appeal1
        
    }
}

