import SwiftUI

struct StockStudyView: View {
    @EnvironmentObject private var tasksVM: TasksViewModel
    @State private var scrolledListOnAppear = false

    private func scrollToActiveTask(_ proxy: ScrollViewProxy) {
        guard !scrolledListOnAppear, let activeTask = tasksVM.tasks.first(where: { $0.status == .active }) else {
            return
        }

        proxy.scrollTo(activeTask.id, anchor: .bottom)
        scrolledListOnAppear = true
    }

    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    TaskListView(tasksVM: tasksVM)

                    StockStudyInfoView()
                        .padding(.bottom, .listInset)
                }
                .onAppear(perform: { scrollToActiveTask(proxy) })
                .onAppear(perform: tasksVM.updateCompletedTasks)
                .onChange(of: tasksVM.tasks, perform: { _ in
                    tasksVM.updateCompletedTasks()
                })
                .overlay(alignment: .bottom) {
                    StockStudyProgressView(
                        completedTasks: tasksVM.amountOfCompletedTasks,
                        amountOfTasks: tasksVM.tasks.count
                    )
                }
            }
            .navigationTitle(DrawerScreens.stockStudy.rawValue)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DrawerNavigationButtonView()
                }
            }
        }
    }
}
