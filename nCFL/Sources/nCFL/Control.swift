import Foundation

class Control{

    init(){
    }
    
    public func getDataJson(value:String)->[[String: Any]]{
        var cpath = Bundle.main.resourcePath!
        cpath =  cpath.replacingOccurrences(of: ".build/x86_64-unknown-linux-gnu/debug", with: "", options: NSString.CompareOptions.literal, range: nil)
        let path = cpath+"Sources/nCFL/dataBase.json"
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let jsonRead = jsonResult[value] as? [Any] {
                    let jsonTransformed = jsonRead.compactMap{ $0 as? [String: Any] }
                    return jsonTransformed
            }
        } catch {
            print("ERROR LEYENDO EL JSON")
            
        }
        return [["e":-1]]
        
    }

/*
    public func getClients()->[Client]{
        print("Aca importo clientes")
    }
    public func getMeters()->[Meters]{
        print("Aca importo medidores")
    }
    public func getAgents()->[AgentService]{
        print("Aca importo agentes")
    }
    public func getRegisters()->[ElectricMeter]{
        print("Aca importo registros")
    }
    */
}
