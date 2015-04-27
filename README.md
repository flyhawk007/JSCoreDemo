# JSCore Demo

This tiny project demonstrates JavaScriptCore bridging in Swift.



``` swift
let js = JSCore.newContext()
js.requireRequestModule()
let uploadURLString = "http://api.t.sina.com.cn/statuses/update.json"
let r = js.run("new Request('\(uploadURLString)').post(['status=test'])") as! NSString
println(r)
```

## Requirements
1. Xcode 6.3
2. iOS 7.0+

## Unit tests
Open the project with Xcode then press command + u.

## Contacts
Follow [Lex Tang](https://github.com/lexrus/) ([@lexrus on Twitter](https://twitter.com/lexrus/))

## License
This code is distributed under the terms and conditions of the MIT license.
