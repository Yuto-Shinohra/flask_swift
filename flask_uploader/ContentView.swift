
import SwiftUI

struct ContentView: View {
    @ObservedObject var scannerModel = ScannerModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(scannerModel.imageArray, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .navigationTitle("Vinsonkitデモ")
            .toolbar {
                ToolbarItem {
                    Button("スキャンする") {
                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                        let window = windowScene?.windows
                        window?.filter({$0.isKeyWindow}).first?.rootViewController?.present(scannerModel.getDocumentCameraViewController(), animated: true)
                    }
                }
            }
        }
    }
    //func かくよー！
}
