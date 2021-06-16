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
        return self.meters
    }

    public func addMeter(meter:Int){
        self.meters.append(meter)
    }

    public func checkOwnRegisters()-> String{
        var str = " MEDIDORES ASOCIADOS:\n"
        for i in self.meters{
            str += " - "
            str += i.description 
        }
        return str
    }

    public func payPending(value:Int){
        print("Yo pago los recibos")
    }

    public func appeal(value:Int){
        print("Yo apelo un recibo")
    }
}