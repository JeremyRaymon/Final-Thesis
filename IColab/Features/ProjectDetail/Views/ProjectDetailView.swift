//
//  ProjectDetailView.swift
//  IColab
//
//  Created by Kevin Dallian on 02/09/23.
//

import SwiftUI


struct ProjectDetailView: View {
    var project : Project
    @State var pickerSelection : PickerItem = .overview
    @State var showSheet = false
    let pickerItems : [PickerItem] = [.overview, .milestone]
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomLeading){
                Image("purple")
                    .resizable()
                    .frame(height: 200)
                Text("\(project.title)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
            }
            OwnerNameView(name: project.owner?.name ?? "Name", showSheet: $showSheet)
                .offset(y: -10)
            PickerView(pickerSelection: $pickerSelection, allItems: pickerItems)
                .padding(.horizontal, 10)
            switch pickerSelection {
            case .overview:
                OverviewView(project: project)
            case .milestone:
                MilestoneView(milestones: project.milestones)
            default:
                EmptyView()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showSheet, content: {
            OwnerProfileSheet(owner: project.owner!)
                .presentationDetents([.fraction(0.45), .large])
                .presentationDragIndicator(.visible)
        })
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Mock.projects[0])
            .preferredColorScheme(.dark)
    }
}
