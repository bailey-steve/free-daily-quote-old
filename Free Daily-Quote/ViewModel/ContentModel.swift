//
//  ContentModel.swift
//  RandomQuotes
//
//  Created by Steve Bailey on 13/09/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var  quote : String = "Fetching Quote"
    @Published var  length : String = ""
    @Published var  author : String = ""
    @Published var  tags : [String] = ["None"]
    @Published var  category : String = ""
    @Published var  language : String = ""
    @Published var  date : String  = ""
    @Published var  permalink : String = ""
    @Published var  id : String = ""
    @Published var  background : String = ""
    @Published var  title : String = ""
    
    @Published var imageData: Data = Data()
    
    @Published var theysaidsoImageLocation : String = "https://theysaidso.com/branding/theysaidso.png"
    @Published var theysaidsoImageData: Data = Data()
    
    @Published var random: Int = -1
    

    init(preview:Bool = false) {
        
        
        
        if preview {
            
            self.quote = "Live as if you were to die tomorrow. Learn as if you were to live forever."
            self.length = "1"
            self.author =  "Mahatma Gandhi"
            self.tags = ["None"]
            self.category = "General"
            self.language = "en"
            self.date = "01/01/2022"
            self.permalink = "https://theysaidso.com/quote/japanese-proverb-vision-without-action-is-daydream-action-without-vision-is-nigh"
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
                let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
                //print(responseModel)

                let localQuote = responseModel.contents!.quotes![0]
                DispatchQueue.main.async {
                    self.quote = localQuote.quote
                    self.length = localQuote.length
                    self.author = localQuote.author
                    self.tags = localQuote.tags
                    self.category = localQuote.category
                    self.language = localQuote.language
                    self.date = localQuote.date
                    self.permalink = localQuote.permalink
                    self.id = localQuote.id
                    self.background = localQuote.background
                    self.title = localQuote.title
                    
                    self.random = localQuote.random
                    
                    self.getImageData()
                    self.getTheySaidSoImageData()
                }
                print(self.quote)
                

                
            } catch {
                    print(error)
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    func getImageData() {
        
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
        
    }
    
    func getTheySaidSoImageData() {

        if let url = URL(string: theysaidsoImageLocation){
            
            // Get a session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    
                    DispatchQueue.main.async {
                        // Set the image data
                        self.theysaidsoImageData = data!
                    }
                }
            }
            dataTask.resume()
        }
        
    }
}


