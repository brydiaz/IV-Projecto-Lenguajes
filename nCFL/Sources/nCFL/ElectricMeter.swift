import Foundation 

class ElectricMeter{

    private var idMeter:Int = 0
    private var type:String = ""
    private var rate:Double = 0.0
    private var consumption:Double = 0.0
    private var registers: [Register] = []

    var description:String{
        return "\(idMeter),\(type),\(rate),\(consumption),\n\(self.showRegisters())"
    }

    public init(idMeter:Int, type:String, consumption:Double){
        self.idMeter = idMeter
        self.type = type
        self.rate = calculateRate(meterType:type)
        self.consumption = consumption
    }

    public func getId()->Int{
        return self.idMeter
    }

    public func getType()->String{
        return self.type
    }

    public func getRate()->Double{
        return self.rate
    }

    public func getConsumption()->Double{
        return self.getConsumption()
    }

    public func getRegisters()->[Register]{
        return self.registers
    }

    public func setId(value:Int){
        self.idMeter = value
    }

    public func setType(value:String){
        self.type = value
    }

    public func setRate(value:Double){
        self.rate = value
    }
    
    public func setConsumption(value:Double){
        self.consumption = value
    }

    public func addRegister(value:Register){
        self.registers.append(value)
    }
    public func showRegisters()-> String{
        var str = " REGISTROS ASOCIADOS:\n"
        for i in self.registers{
            str += " - "
            str += i.description 
        }
        return str
    }

    public func calculateRate(meterType:String)->Double{
        print("Aca dependiendo del tipo se calcula cual será la tarifa")
        return 777.77
    }

    

}