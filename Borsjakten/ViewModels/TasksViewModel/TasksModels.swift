import SwiftUI

struct TaskResponse: Identifiable, Equatable, Codable {
    var placement: Int
    var status: TaskStatusResponse
    var info: TaskInfoResponse
    let taskID = UUID().uuidString

    var id: String { taskID }

    static func mockedTask(
        placement: Int = 99,
        status: TaskStatusResponse = .locked,
        title: String = "Lorem Ipsum",
        text: String = loremIpsumText
    ) -> TaskResponse {
        return TaskResponse(placement: placement, status: status, info: .init(title: title, text: text))
    }
}

struct TaskInfoResponse: Equatable, Codable {
    var title: String
    var text: String
}

enum TaskStatusResponse: Codable {
    case completed, active, locked
}

enum TaskDirection: String {
    case up
    case right
    case left
}

var loremIpsumText = """
Sed laoreet viverra magna, non tincidunt mi rhoncus in. Nullam auctor nunc in porta ultrices. Curabitur luctus magna in erat auctor porta. Proin ac neque id quam suscipit gravida. Nam volutpat in ex ut bibendum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec ligula tincidunt, tincidunt metus nec, scelerisque nunc. Fusce sodales laoreet fringilla. Aenean at aliquet diam. Ut elementum felis et lorem bibendum placerat. Maecenas vehicula fringilla enim ac venenatis. Cras facilisis sem ac leo ornare ullamcorper. Curabitur laoreet nibh quis euismod pulvinar. Donec scelerisque suscipit est eget scelerisque. Aliquam erat volutpat. Nam bibendum dapibus felis, eget dignissim justo imperdiet ac.

Mauris et magna magna. Integer at quam magna. Nulla vestibulum erat blandit magna dictum posuere. In venenatis neque felis, in molestie elit condimentum id. Ut at nisi enim. In magna justo, ornare ac risus at, luctus ornare purus. Nunc viverra id turpis quis porta. Integer malesuada mattis dolor id varius. Etiam dignissim aliquam suscipit. Etiam neque ex, fringilla eget ex quis, porttitor facilisis enim. Donec a est quis ex consectetur mattis vitae gravida velit. Praesent pharetra tellus vitae elit tincidunt feugiat. Morbi nec metus ut mauris gravida vehicula. Nam accumsan feugiat orci, sed semper nunc aliquet varius.
"""
