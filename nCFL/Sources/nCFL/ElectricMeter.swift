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
        self.consumption = consumption
        self.rate = calculateRate(meterType:type)
        
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
        switch meterType {
            case "T-REH:PUNTA":
                if self.consumption < 500{
                    return 153.14
                }else{
                    return 189.34
                }
            case "T-REH:VALLE":
                if self.consumption < 500{
                    return 62.78 
                }else{
                    return 76.42
                }
            case "T-REH:NOCHE":
                if self.consumption < 500{
                    return 26.28 
                
                }else{
                    return 35.37
                }

            case "T-RE":

                if self.consumption < 30{
                    return 0.0
                }else if (30<self.consumption && self.consumption<200){
                    return 66.16
                }else if (200<self.consumption && self.consumption<300){
                    return 101.53
                }else{
                    return 104.93
                }
            case "T-AP":
                return 3.22
            case "T-IN":
                return 111.79

            case "T-MT:PUNTA":
                return 57.02
            case "T-MT:VALLE":
                return 28.51
            case "T-MT:NOCHE":
                return 20.53
            
            case "T-MTb:PUNTA":
                return 108.19
            case "T-MTb:VALLE":
                return 37.17
            case "T-MTb:NOCHE":
                return 23.86
            
            case "T-CS":
                return 75.29
            case "T-PRO":
                return 111.79
            case "T-CO":
                return 111.79
            case "T-A":
                return 26.60

                
            default:
                return 777.77  
        }
  
    }

    

}