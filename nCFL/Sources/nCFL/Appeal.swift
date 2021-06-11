class Appeal{

    private var idAppeal:Int = 0
    private var situation:String = ""
    private var attended:Bool = false
    private var register:Register?

    var description:String{
        return "\(idAppeal),\(situation),\(attended),\n -Registro Apelado: \(register!.description)\n"
    }
    public init(idAppeal:Int, situation:String, attended:Bool, register:Register!){

        self.idAppeal = idAppeal
        self.situation = situation
        self.attended = attended
        self.register = register

    }

    public func getId()->Int{
        return self.idAppeal
    }

    public func getSituation()->String{
        return self.situation
    }

    public func getAttended()->Bool{
        return self.attended
    }

    public func getRegister()->Register{
        return self.register!
    }

    public func setId(value:Int){
        self.idAppeal = value
    }

    public func setSituation(value:String){
        self.situation = value
    }

    public func setAttended(value:Bool){
        self.attended = value
    }

    public func setRegister(value:Register){
        self.register = value
    }

}