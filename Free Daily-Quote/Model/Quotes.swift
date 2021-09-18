
import Foundation
struct Quotes : Codable {
	var quote : String = "Unable to contact server."
	var length : String = "0"
	var author : String = ""
	var tags : [String] = ["None"]
	var category : String = ""
	var language : String = ""
	var date : String = ""
	var permalink : String = ""
	var id : String = ""
	var background : String = ""
	var title : String = ""
    
    var random: Int = -1
    
	enum CodingKeys: String, CodingKey {

		case quote = "quote"
		case length = "length"
		case author = "author"
		case tags = "tags"
		case category = "category"
		case language = "language"
		case date = "date"
		case permalink = "permalink"
		case id = "id"
		case background = "background"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
        
        let values: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)

        do {
            let value:String = try values.decodeIfPresent(String.self, forKey: .quote)!
            quote = value
        } catch{}

        do {
            let value = try values.decodeIfPresent(String.self, forKey: .length)!
            length = value
        } catch{}
		
        do {
            let value = try values.decodeIfPresent(String.self, forKey: .author)!
            author = value
        } catch{}
        
        do{
            let value: [String] = try values.decodeIfPresent([String].self, forKey: .tags)!
            tags = value
        }
        catch{}
        
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .category)!
            category = value
        } catch {}
		
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .language)!
            language = value
        } catch{}
		
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .date)!
            date = value
        } catch {}
		
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .permalink)!
            permalink = value
        } catch {}
        
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .id)!
            id = value
        } catch{}
		
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .background)!
            background = value
        } catch {}
		
        do{
            let value = try values.decodeIfPresent(String.self, forKey: .title)!
            title = value
        } catch {}
        
        random = Int.random(in: 1..<5000)
		
	}

    
    
}

