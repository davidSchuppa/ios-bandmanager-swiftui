//
//  CustomPickerView.swift
//  BandManager
//

import SwiftUI

struct CustomPickerView: View {
    var items: [String]
    @State private var filteredItems: [String] = []
    @State private var filterString: String = ""
    @State private var frameHeight: CGFloat = 400

    @Binding var pickerField: String
    @Binding var presentPicker: Bool
    var saveUpdate: ((String) -> Void)?
    
    var body: some View {
        let filterBinding = Binding<String> (
            get: { filterString },
            set: {
                filterString = $0.lowercased()
                if filterString != "" {
                    filteredItems = items.filter { $0.lowercased().contains(filterString.lowercased())}
                } else {
                    filteredItems = items
                }
                setHeight()
            }
        )
        ZStack {
            Color.black.opacity(0.2)
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Button(action: {
                            withAnimation {
                                presentPicker = false
                            }
                        }) {
                            Text("Cancel")
                        }
                        .padding(10)
                        Spacer()
                        
                        if let saveUpdate = saveUpdate {
                            Button(action: {
                                if !items.contains(filterString) {
                                    saveUpdate(filterString.lowercased())
                                }
                                pickerField = filterString
                                withAnimation {
                                    presentPicker = false
                                }
                            }) {
                                Image(systemName: "plus")
                            }
                            .padding(10)
                        }
                    }

                    Text("Tap to select, or type in a new entry")
                        .font(.caption)
                        .padding(.leading, 10)
                    
                    TextField("Filter by entering text", text: filterBinding)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    List {
                        ForEach(filteredItems, id: \.self) { item in
                            Button(action: {
                                pickerField = item
                                withAnimation {
                                    presentPicker = false
                                }
                            }) {
                                Text(item)
                            }
                        }
                    }
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .frame(maxWidth: 400)
                .padding(.horizontal, 10)
                .frame(height: frameHeight)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            filteredItems = items
            setHeight()
        })
    }
    
    fileprivate func setHeight() {
        withAnimation {
            if filteredItems.count > 5 {
                frameHeight = 400
            } else if filteredItems.count == 0 {
                frameHeight = 130
            } else {
                frameHeight = CGFloat(filteredItems.count * 45 + 130)
            }
        }
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previewData = ["guitar", "bass", "vocal", "drum", "bassAmp", "bassGuitar", "guitarAmp"].sorted()
    static let saveFunction = { stringToSave in
        previewData.append(stringToSave)
    }
    static var previews: some View {
        CustomPickerView(items: previewData, pickerField: .constant(""), presentPicker: .constant(true), saveUpdate: saveFunction)
    }
}

