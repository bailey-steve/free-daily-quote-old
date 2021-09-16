//
//  ContentModel.swift
//  RandomQuotes
//
//  Created by user198386 on 13/09/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var  quote : String = "quote"
    //@Published var  length : String
    @Published var  author : String = "author"
    //@Published var  tags : [String]
    //@Published var  category : String
    //@Published var  language : String
    //@Published var  date : String
    //@Published var  permalink : String
    @Published var  id : String = "99999"
    @Published var  background : String = ""
    @Published var  title : String = "title"
    
    @Published var imageData: Data = Data()
    
    init(preview:Bool = false) {
        
        if preview {
            
            self.quote = "Live as if you were to die tomorrow. Learn as if you were to live forever."
            //self.length = localQuote.length  ?? ""
            self.author =  "Mahatma Gandhi"
            // self.tags = localQuote.tags
            //self.category = localQuote.category ?? ""
            //self.language = localQuote.language ?? ""
            //self.date = localQuote.date  ?? ""
            //self.permalink = localQuote.permalink ?? ""
            self.id = "12345"
            self.background =  "https://theysaidso.com/img/bgs/man_on_the_mountain.jpg"
            self.title =  "Quote"
            
            self.getImageData()
            
            return
        }
        
        getQuote()
    }
    func getQuote(){
        
        var request = URLRequest(url: URL(string: "https://quotes.rest/qod")!);
        
        request.httpMethod = "GET";
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("YOUR API KEY HERE", forHTTPHeaderField: "X-TheySaidSo-Api-Secret")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                print(data!)
                print(response!)
                
                if error != nil {
                    print(error!)
                }
                
                let jsonDecoder = JSONDecoder()
                // Access the response here by using json model class
                // You can autogenerate Json4Swift_Base swift class below by pasting the JSON response in
                // the webpage http://www.json4swift.com
                let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
                //print(responseModel)
                
                
                let localQuote = responseModel.contents!.quotes![0]
                DispatchQueue.main.async {
                    self.quote = localQuote.quote
                    //self.length = localQuote.length  ?? ""
                    self.author = localQuote.author
                    // self.tags = localQuote.tags
                    //self.category = localQuote.category ?? ""
                    //self.language = localQuote.language ?? ""
                    //self.date = localQuote.date  ?? ""
                    //self.permalink = localQuote.permalink ?? ""
                    self.id = localQuote.id
                    self.background = localQuote.background
                    self.title = localQuote.title
                    
                    self.getImageData()
                }
                print(self.quote)
                
            } catch {
                    print(error)
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    func getImageData() {
        
        // Check that image url isn't nil
        //guard background != nil else {
        //    return
        //}
        
        // Download the data for the image
        if let url = URL(string: background){
            
            // Get a session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    
                    DispatchQueue.main.async {
                        // Set the image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
        
    }}
