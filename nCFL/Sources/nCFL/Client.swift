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



    public func payPending(meter:ElectricMeter , registerID:Int)-> Void{
        let amount = meter.calculateAmount(meter:meter, registerID:registerID)
        if amount != -1.1{
            //Acá iriría lo de la tarjeta
            //Sino pasa le dice que no tiene dinero esa tarjeta
            for i in meter.getRegisters(){
                if i.getIdRegister() == registerID{
                    i.setPending(value:false)
                    i.setPaidAmount(value:amount)
                }
            }
        }
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

