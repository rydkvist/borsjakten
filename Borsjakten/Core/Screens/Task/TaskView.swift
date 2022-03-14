import SwiftUI

struct TaskView: View {
    @EnvironmentObject private var tasksVM: TasksViewModel
    @Environment(\.presentationMode) var presentationMode
    let task: TaskResponse

    private func onTap() {
        tasksVM.completeTask(task)
        presentationMode.wrappedValue.dismiss()
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(task.info.text)
                    .font(.body)
                    .foregroundColor(.primary)

                Rectangle()
                    .fill(Color.clear)
                    .padding(.bottom, .listInset)
            }
            .padding()
        }
        .overlay(alignment: .bottom) {
            Button(action: onTap) {
                Label("Next level", systemImage: "arrow.forward")
                    .labelStyle(ReversedLabelStyle())
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .background(Color.accentColor)
            .cornerRadius(12)
            .shadow(radius: 8)
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
        }
        .background(.thickMaterial)
        .navigationTitle(task.info.title)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskView(task: .mockedTask())
        }
    }
}

struct ReversedLabelStyle: LabelStyle {
    var spacing: CGFloat = 8

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.title

            configuration.icon
        }
    }
}
