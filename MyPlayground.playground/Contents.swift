//: Playground - noun: a place where people can play

import Cocoa

struct Bank {
    var bankName : String
}

struct  Profit{
    let bank:Bank
    let year:Int
    var principal:Double
    
   
    let rates :[ String : Double ] = ["农业银行" : 0.03,"工商银行" : 0.02,"中国银行" : 0.08,"招商银行" : 0.05,"开发银行" : 0.035 ]
    
    func caculateInterest() -> Double{
        guard let rate = rates[bank.bankName] else{
            return principal
        }
        
        var totalInterest :Double = 0
        var tempPrincipal = principal
        
        var i = 0
        repeat{
            
            totalInterest += tempPrincipal * rate
            tempPrincipal += tempPrincipal * rate
            
            i++
        } while i < year
        
        return totalInterest
    }
    private func caculatePrincipalAndInterest() ->Double{
        
        return principal + caculateInterest()
    }
    
    func printNews(){
    
        print("银行：\(bank.bankName) 储蓄年限：\(year)年 本金：\(principal) 利息：\(caculateInterest()) 合计：\(caculatePrincipalAndInterest())")
    }
}


var banks = ["农业银行","工商银行","中国银行","招商银行","开发银行"]
for bankName in banks{
    var bank = Bank(bankName: bankName)
    var PAI = Profit( bank: bank,year:4,principal: 40000 )
    PAI.printNews()

}



