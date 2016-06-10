import Vapor

var workDir: String {
    let parent = #file.characters.split(separator: "/").map(String.init).dropLast().joined(separator: "/")
    let path = "/\(parent)/"
    return path + "/.." // Back one directory
}

let app = Application(workDir: workDir)

class HTMLRender: RenderDriver {
    func render(template: String, context: [String: Any]) throws -> String {
        return template
    }
}
View.renderers["html"] = HTMLRender()

app.get { req in
    return try app.view("welcome.html")
}

app.post("gh-webhook") { req in

    return Response(status: .ok)
}

// Print what link to visit for default port
app.start()

