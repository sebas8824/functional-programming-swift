//: Playground - noun: a place where people can play

import Foundation

class Transaction : Codable {
    var from : String
    var to : String
    var amount : Double
    
    init(from: String, to: String, amount: Double) {
        self.from = from
        self.to = to
        self.amount = amount
    }
}

class Block {
    var index : Int = 0
    var previousHash : String = ""
    var hash : String!
    var nonce : Int
    
    private (set) var transactions: [Transaction] = [Transaction]()
    
    var key : String {
        get {
            let transactionsData = try! JSONEncoder().encode(self.transactions)
            let transactionsJSONString = String(data: transactionsData, encoding: .utf8)
            
            return String(self.index) + self.previousHash + String(self.nonce) + transactionsJSONString!
        }
    }
    
    func addTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }
    
    init() {
        self.nonce = 0
    }
}

class Blockchain {
    private (set) var blocks: [Block] = [Block]()
    
    init(genesisBlock: Block) {
        addBlock(genesisBlock)
    }
    
    func addBlock(_ block: Block) {
        if self.blocks.isEmpty {
            block.previousHash = String(repeating: "0", count: 10)
            block.hash = generateHash(for: block)
        }
        self.blocks.append(block)
    }
    
    func generateHash(for block: Block) -> String {
        var hash = block.key.sha1Hash()
    }
}


extension String {
    func sha1Hash() -> String {
        let task = Process()
    }
}

let genesisBlock = Block()
let blockchain = Blockchain(genesisBlock: genesisBlock)
let transtraction = Transaction(from: "Sebastian", to: "Alejandra", amount: 20)
let block1 = Block()
block1.addTransaction(transaction: transtraction)
block1.key
