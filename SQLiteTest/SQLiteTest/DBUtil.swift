//
//  DbUtil.swift
//  SqliteTest
//
//  Created by Sercan on 15/01/2017.
//  Copyright © 2017 Gio. All rights reserved.
//

import Foundation
import SQLite

class DBUtil {
    static var sharedInstance = DBUtil()
    var db: Connection?
    
    let Student = Table("Student")
    let Id = Expression<Int64>("Id")
    let Name = Expression<String>("Name")
    
    
    init() {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(path)
        do{
            db = try Connection("\(path)/school.sqlite3")
            /*
            try db!.run(Student.create(block: {
                t in
                t.column(Id)
                t.column(Name)
            }))
 */
            
            try db!.run(Student.create(temporary: false, ifNotExists: true, block: {
                t in
                t.column(Id,primaryKey:true)
                t.column(Name)
            }))
        }
        catch{
            print("HATA \(error)")
        }
    }
    
    func addStudent(name:String){
        do{
            try db!.run(Student.insert(Name<-name))
        }
        catch{
            
        }
    }
    
    func getById(id:Int64) -> Row? {
        do{
            let query = Student.filter(Id == id)
            print(query.asSQL())
            var data = try db!.pluck(query)
            return data
            
        }
        catch{
            print("Get by Id Error : \(error)")
            return nil
        }
    }
    
    
    func deleteById(id:Int64){
        do{
            let student = Student.filter(Id == id)
            try db!.run(student.delete())
        }
        catch{
            print("Get by Id Error : \(error)")
            
        }
    }
    
}
