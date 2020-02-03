# Network Module Usage

Firstly make sure you don't forget setting your environment (baseUrl). 

AppDelegate is a good place to use.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    APIClient.instance.environment = NetworkEnvironment(
       baseUrl: "https://www.mybaseurl.com/"
    )

	return true
}
```

## Creating JSON Model.

To create (generate) your Request (post methods) and Response models you can use online tools like *https://app.quicktype.io/*

You basically give your sample JSON to tool and it gives back to you Auto-Generated swift class model. (Including nested instances)

Lets create a model together.

Assume you have a JSON like below.

```json
{
	"customerKey": {
    	"custId": 22022163
    }
}
```
Copy this JSON to any tool you like to use. And let him generate codes like below.

```swift
import Foundation

class CustomerKey: Codable {
    var custID: Int?

    // You can ignore if you want to use exact same keys in JSON
    enum CodingKeys: String, CodingKey {
        case custID 
    }
    
}
```

## Creating a Request (Confirm Request protocol).

To create a request, you must confirm **Request** protocol. (Except GET request, GET is optional)

```swift
import Alamofire

protocol Request: Codable {
    associatedtype Response: Codable
    var endPoint: String { get set }
    var httpMethod: HTTPMethod { get set }
}
```

You can investigate Request protocol in the project. It just has 3 parameters.

* **httpMethod**: HTTPMethod
* **endPoint**: String
* **associatedtype**: Response: Codable

Then lets create one.

```swift
import Foundation

final class MyRequestObject: Request {

    var httpMethod: HTTPMethod = .post
    var endPoint: String = "user/inquireReferCode"
    
    // Create same way you did for CustomerKey
    typealias Response = MyResponseObject 


    public var customerKey: CustomerKey?

    enum CodingKeys: CodingKey {
        case customerKey
    }

}
```

Okay so now lets see how we can execute Http Request

Use **APIClient** instance, required methods are already implemented.

## Request Samples

* ##### GET

```swift
let request = MyRequestObject()
APIClient.instance.execute(
    request: request,
    success: { (myResponseObjectModel) in
        
    },
    failure: { error in
        // Handle error
    }
)
```

You don't need to create Request object for **GET** requests. 
You can just jump right into request.

```swift
APIClient.instance.executeGET(
	endPoint: "articles", 
    success: { (articles: [Article]) in
        print(articles.count)
        // ..
    }, 
    failure: { error in
    	// Handle error
    })
```

* ##### POST

No difference from GET request, you can use 
```APIClient.instance.execute()``` 
method with any *Request* object, just make sure you set 
```httpMethod = .post``` 
in request that's it.

