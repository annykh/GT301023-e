// MongoDB

// use <database_name> -  команда для создания БД или для того чтоб переключиться между бд
// cls - Очищает скрипт/консоль
// show databases - Показывает все БД
// show collections - Показывает все коллекции в БД
// db.createCollection('users') - Создаем пустую коллекцию users
// db.collection_name.insertOne() - Вставляет один объект/документ в коллекцию
// db.collection_name.insertMany([{},{},{}]) - Вставляет несколько объектов/документов в коллекцию. Добавляем через массив из обьектов.
// db.collection_name.drop() - Удалит коллекцию
// db.dropDatabase() - Удалит бд
// db.workers.find({Условие}) - Выборка
// db.collection_name.deleteOne({Условие}) - удалит первую запись соответсувующий запросу
// db.collection_name.deleteMany({Условие}) - удалит все записи соответсувующие запросу

// Операторы сравнения

// $eq : значения равны - equal
// $ne : значения не равны - not equal
// $gt : значение больше другого значения - greater than
// $gte : значение больше или равно другому значению - greater than equal
// $lt : значение меньше другого значения - less than
// $lte : значение меньше или равно другому значению - less than equal
// $in : значение соответствует одному из значений в массиве 

// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются
// $not : возвращает документы, в которых условие не выполняется

db.users.insertOne({name: 'John', lastName: 'Smith', age: 18})

db.users.insertOne({
    name: 'Tom',
    lastName: 'Willson',
    age: 35
})

db.users.insertOne({
    name: 'Bob',
    lastName: 'Brown',
    age: 40
})

db.users.insertMany([
    {
        name: 'Lily',
        lastName: 'Hardy',
        age: 23
    },
    {
        name: 'James',
        lastName: 'King',
        age: 30
    },
    {
        name: 'Stive',
        lastName: 'Smith',
        age: 27
    }
])

db.users.drop()
db.dropDatabase()

// Создать бд GT301023
// Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// _id, title, price, count. 
// Используйте следующие данные:
	
// 1 Apple 280 4
// 2 Lemon 300 8
// 3 Lime 500 3
// 4 Orange 200 8

// {
//     _id: 1,
//     title: 'Apple',
//     price: 280,
//     count: 4
// }

// use GT301023

db.fruits.insertMany([
    {
        _id: 1,
        title: 'Apple',
        price: 280,
        count: 4
    },
    {
        _id: 2,
        title: 'Lemon',
        price: 300,
        count: 8
    },    
    {
        _id: 3,
        title: 'Lime',
        price: 500,
        count: 3
    },    
    {
        _id: 4,
        title: 'Orange',
        price: 200,
        count: 8
    }
])

// Вывести все документы из fruits
// select * from fruits
db.fruits.find()

// Вывести все данные из документа, где title = Lemon
db.fruits.find({title: 'Lemon'})
db.fruits.find({title: {$eq: 'Lemon'}})

// Вывести фрукты, которые стоят меньше 300.
db.fruits.find({price: {$lt: 300}})

// Вывести фрукты, кол/во которых больше/равно 4
db.fruits.find({count: {$gte: 4}})

// Вывести документы, где title либо Lemon, либо Lime
db.fruits.find({title: {$in: ['Lemon', 'Lime']}})

// Вывести фрукты, где кол/во больше 3, а цена меньше 300
db.fruits.find({
    $and: [
        {count: {$gt: 3}},
        {price: {$lt: 300}}
    ]
})

db.fruits.find({count: {$gt: 3}, price: {$lt: 300}})

// Вывести фрукты с кол/во больше 3 и меньше 8.
db.fruits.find({count: {$gt: 3, $lt: 8}})

// Вывести фрукты, где кол/во меньше 4 или больше 7
db.fruits.find({
    $or: [
        {count: {$lt: 4}},
        {count: {$gt: 7}}
    ]
})

db.fruits.find({count: {$not: {$gte: 4, $lte: 7}}})

// Удалить из коллекции документ, где title = Lemon
db.fruits.deleteOne({title: 'Lemon'})

// Удалить все фрукты, где кол/во меньше 8
db.fruits.deleteMany({count: {$lt: 8}})
