//
//  APIService.swift
//  NoteApp
//
//  Created by Berat Yavuz on 26.12.2022.
//

import Foundation
import Alamofire

class APIService {
    
    var delegate:DataDelegate?
    static let functions = APIService()
    
    func fetchNotes(){
        
        AF.request("http://10.22.42.80:8081/fetch").response { response in
           
            let data = String(data: response.data!, encoding: .utf8)
             
            self.delegate?.updateArray(newArray:data!)
            
       }
        
    }
 
    
    func createNote(date:String,title:String,note:String){
        AF.request("http://10.22.42.80:8081/create",method: .post,encoding: URLEncoding.httpBody,headers: ["title":title,"date":date,"note":note]).responseJSON { response in
            print(response)
        }
    }
    
    func updateNote(date:String,note:String,title:String,id:String) {
        AF.request("http://10.22.42.80:8081/update",method: .post,encoding: URLEncoding.httpBody,headers: ["title":title,"date":date,"note":note,"id":id]).responseJSON{ response in
            print(response)
        }
    }
    
    func deleteNote(id:String){
        AF.request("http://10.22.42.80:8081/delete",method: .post,encoding: URLEncoding.httpBody,headers: ["id":id]).responseJSON{ response in
            print(response)
            
        }
    }
    
}
