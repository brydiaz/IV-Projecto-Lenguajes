import Foundation 


class Register {

    private var idRegister:Int = 0;
    private var idMeter:Int = 0;
    private var pending:Bool = false;
    private var paidAmount:Double = 0;
    private var pendingAmout:Double = 0;

    var description:String{
        return "\(idRegister),\(idMeter),\(pending),\(paidAmount),\(pendingAmout)\n"
    }
    
    public init(idRegister:Int, idMeter:Int, pending:Bool, paidAmount:Double,pendingAmout:Double){
        self.idRegister = idRegister
        self.idMeter = idMeter
        self.pending = pending
        self.paidAmount = paidAmount
        self.pendingAmout = pendingAmout

    }

    public func getIdRegister()->Int{
        return self.idRegister
    }

    public func getIdMeter()->Int{
        return self.idMeter
    }
    public func getPending()->Bool{
        return self.pending
    }
    public func getPaidAmount()->Double{
        return self.paidAmount
    }
    public func getPendingAmout()->Double{
        return self.pendingAmout
    }

    public func setIdRegister(value:Int){
        self.idRegister = value
    }

    public func setIdMeter(value:Int){
        self.idMeter = value
    }
    public func setPending(value:Bool){
        self.pending = value
    }
    public func setPaidAmount(value:Double){
        self.paidAmount = value
    }
    public func setPendingAmout(value:Double){
        self.pendingAmout = value
    }
    
    public func calculateAmount()->Double{
        print("Yo calculo las cuentas")
        return 0.0
    }
}