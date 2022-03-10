import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var tasksVM: TasksViewModel
    @State private var scrolledListOnAppear = false

    private func scrollToActiveTask(_ proxy: ScrollViewProxy) {
        guard !scrolledListOnAppear, let activeTask = tasksVM.tasks.first(where: { $0.status == .active }) else {
            return
        }

        proxy.scrollTo(activeTask.id, anchor: .center)
        scrolledListOnAppear = true
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                TaskListView(tasksVM: tasksVM)
                    .padding(.top, .listInset)

                HomeInfoHelpView()
            }
            .overlay(alignment: .top) {
                HomeProgressToolbarView(
                    completedTasks: tasksVM.amountOfCompletedTasks,
                    amountOfTasks: tasksVM.tasks.count
                )
            }
            .navigationBarHidden(true)
            .onAppear(perform: { scrollToActiveTask(proxy) })
            .onAppear(perform: tasksVM.updateCompletedTasks)
            .onChange(of: tasksVM.tasks, perform: { _ in
                tasksVM.updateCompletedTasks()
            })
        }
    }
}
