//
//  PetModel.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

struct Pet {
    let name: String
    let age: String
    let imageName: String
    let tasks: [PetTask]
}

struct PetTask {
    let title: String
    let isDone: Bool
}
