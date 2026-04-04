//
//  MyPetCard.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct MyPetCardView: View {
    let pet: Pet
    let onTapDetails: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack(alignment: .top, spacing: 12) {
                
                Image(pet.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(pet.name)
                        .font(DSTypography.title)
                    
                    Text("Age: \(pet.age)")
                        .font(DSTypography.body)
                        .foregroundStyle(DSColor.Text.secondary)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(DSColor.Brand.primarySoft)
                        .frame(width: 40, height: 40)

                    Image(systemName: "heart.fill")
                        .foregroundStyle(DSColor.Brand.primary)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(pet.tasks.indices, id: \.self) { index in
                    taskRow(pet.tasks[index])
                }
            }
            
            Button(action: onTapDetails) {
                Text("View details →")
                    .font(DSTypography.body)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(DSColor.Brand.primary)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .background(DSColor.Brand.primarySoft)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

extension MyPetCardView {

    private func taskRow(_ task: PetTask) -> some View {
        HStack(spacing: 8) {

            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(task.isDone
                          ? DSColor.Brand.primary
                          : DSColor.Brand.secondaryNude)
                    .frame(width: 20, height: 20)

                if task.isDone {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                }
            }

            Text(task.title)
                .font(DSTypography.body)
                .foregroundStyle(DSColor.Text.primary)
        }
    }
}
