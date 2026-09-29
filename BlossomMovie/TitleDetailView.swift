//
//  TitleDetailView.swift
//  BlossomMovie
//
//  Created by USER on 28/09/2026.
//

import SwiftUI
import SwiftData

struct TitleDetailView: View {
    @Environment(\.dismiss) var dismiss
    let title: Title
    var titleName: String{
        return (title.name ?? title.title) ?? ""
    }
    
    let viewModel = ViewModel()
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        GeometryReader { geometry in
            switch viewModel.videoIdStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView().frame(width: geometry.size.width, height: geometry.size.height * 0.85)
            case .success:
                ScrollView{
                    LazyVStack(alignment: .leading){
                        
                        YouTubePlayer(videoId: viewModel.videoId)
                            .aspectRatio(1.3,contentMode: .fit)
                        
                        Text(titleName)
                            .bold()
                            .font(.title)
                            .padding(5)
                        
                        Text((title.overview ?? ""))
                            .padding(5)
                        
                        HStack{
                            Spacer()
                            Button{
                                let saveTitle = title
                                saveTitle.title = titleName
                                modelContext.insert(saveTitle)
                                try? modelContext.save()
                                dismiss()
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                            Spacer()
                        }
                        
                       
                    }
                }
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
                    .errorMessage()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .task{
            await viewModel.getVideoId(for: titleName)
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
