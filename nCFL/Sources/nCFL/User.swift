import Foundation 


class User{
    private var id:Int = 0;
    private var name:String = "";
    private var password:String = "";

    var description:String{
        return "\(id), \(name), \(password)\n"
    }

    public init(id:Int, name:String, password:String){

        self.id = id
        self.name = name
        self.password = password

    }

    public func getId()->Int{
        return self.id
    }
    public func getName()->String{
        return self.name
    }
    public func getPassword()->String{
        return self.password
    }

    public func setId(value:Int){
        self.id = value
    }
    public func setName(value:String){
        self.name = value
    }
    public func setPassword(value:String){
        self.password = value
    }
}