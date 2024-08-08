// MongoDB

// use 
// cls
// show databases
// show collections
// db.createCollection
// db.collection_name.insertOne
// db.collection_name.insertMany
// db.collection_name.drop
// db.dropDatabase
// db.collection_name.find

// $eq
// $ne
// $gt
// $gte
// $lt
// $lte
// $in

// $and
// $or
// $not
// $nor

// db.collection_name.deleteOne
// db.collection_name.deleteMany

db.workers.insertMany([
    {
      _id: 1,
      firstname: 'Inga',
      lastname: 'Petrova',
      age: 27,
      position: 'Barista',
      salary: 1500,
      skills: ['preparing drinks', 'cleaning equipment']
    },
    {
      _id: 2,
      firstname: 'Boris',
      lastname: 'Orlov',
      age: 36,
      position: 'Server',
      salary: 2400,
      skills: ['taking orders', 'suggesting meals', 'taking payments']
    },
    {
      _id: 3,
      firstname: 'Ivan',
      lastname: 'Demidov',
      age: 32,
      position: 'Chef',
      salary: 3200,
      skills: ['preparing food', 'baking bread']
    },
    {
      _id: 4,
      firstname: 'Marina',
      lastname: 'Sidorov',
      age: 22,
      position: 'Hostess',
      salary: 1700,
      skills: ['greeting guests', 'seating guests', 'answering phone calls']
    },
    {
      _id: 5,
      firstname: 'Olga',
      lastname: 'Ivanova',
      age: 43,
      position: 'Sommelier',
      salary: 2500,
      skills: ['curating a wine list', 'creating wine pairings']
    }
  ])

// Найти работников младше 30 лет.
db.workers.find({age: {$lt: 30}})

// Найти работников, чьи возрасты находятся в диапазоне от 30 до 45(вкл. концы).
db.workers.find({age: {$gte: 30, $lte: 45}})

// Найти работников, которым либо больше 35, либо меньше 25.
db.workers.find({
    $or: [
        {age: {$gt: 35}},
        {age: {$lt: 25}}
    ]
})

// not 25-35
db.workers.find({age: {$not: {$gte: 25, $lte: 35}}})


// Найти всех работников, чьи навыки включают 'baking bread' 
db.workers.find({skills: 'baking bread'})
db.workers.find({skills: {$eq: 'baking bread'}})

db.workers.find({skills: ['baking bread']}) //пустая выборка 


// Найти всех работников, чьи навыки равняются(строго) ['preparing food', 'baking bread']
db.workers.find({skills: ['preparing food', 'baking bread']})

db.workers.find({skills: ['baking bread', 'preparing food']}) //пустая выборка 


// Проекция

// select column1, column2
// from table

// db.collection_name.find({Условие}, {прокция})

// Вывести только ид, имена, фамилии работников, которым больше 30.
// Выводим _id, firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1})

// Вывести работников, которым больше 30.
// Выводим firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})

// Вывести работников, которым больше 30.
// Вывести все поля кроме id и salary
db.workers.find({age: {$gt: 30}}, {_id: 0, salary: 0})

// Вывести имена, фамилии и зарплаты всех сотрудников.
db.workers.find({}, {firstname: 1, lastname: 1, salary: 1, _id: 0})

// 1 и 0 можно заменить true и false
db.workers.find({}, {firstname: true, lastname: true, salary: true, _id: false})


// Пагинация 

// mysql - limit 
// mongo - limit, skip


// Вывести первого работника
db.workers.find().limit(1)

// Вывести всех работников пропуская первых двух
db.workers.find().skip(2)

// Вывести двух работников пропуская первого (2, 3)
db.workers.find().limit(2).skip(1)
db.workers.find().skip(1).limit(2)

// Найти сотрудников, которые зарабатывают больше 2000, вывести только первых двух.
db.workers.find({salary: {$gt: 2000}}).limit(2)

// slice работает с массивами
// $slice - limit
// $slice - limit + skip

// find({Условие}, {поле: {$slice: limit}})
// find({Условие}, {поле: {$slice: [skip, limit]}})

// Вывести только первый навык сотрудников
db.workers.find({}, {skills: {$slice: 1}})

// Вывести только третий навык сотрудников
// $slice: первые два пропускаем, выводим только один(третий)
db.workers.find({}, {skills: {$slice: [2, 1]}})

// Вывести первый навык у работника Boris
db.workers.find({firstname: 'Boris'}, {skills: {$slice: 1}})

// Вывести второй навык Марины
db.workers.find({firstname: 'Marina'}, {skills: {$slice: [1, 1]}})

// Сортировка

// mysql - order by
// mongo - sort

// .sort({column: 1(по возр.)/-1(по убыв.)})

// Вывести всех сотрудников и сортировать их по возрасту по убыванию
db.workers.find().sort({age: -1})

// Вывести самого молодого работника
db.workers.find().sort({age: 1}).limit(1)

// Вывести трех сотрудников, которые зарабатывают меньше всего
db.workers.find().sort({salary: 1}).limit(3)

// Вывести сотрудника с самой высокой зарплатой. Вывести только имя, фамилию и зарплату
db.workers.find({}, {firstname: 1, lastname: 1, salary: 1, _id: 0}).sort({salary: -1}).limit(1)


// Обновление данных

// Если нам нужно полностью заменить один документ другим, используем replaceOne.
db.collection_name.replaceOne(filter, update, [options]) 

//options - upsert: true/false(по умолч.)
// Если true: то mongodb будет обновлять документ, если он найден, и созвадавть новый, если такого докумнета нет.
// Если false: не будет созвадавть новый документ, если запрос на выборку не найдет ни одного документа

// Полностью заменить документ, где имя ՛Ivan՛ на
// firstname: ՛Den՛
// lastname: ՛Jameson՛,
// age: 35,
// position: 'HR'
// salary: 3000

db.workers.replaceOne({firstname: 'Ivan'}, 
    {firstname: 'Den', 
    lastname: 'Jameson', 
    age : 35, 
    position: 'HR', 
    salary: 3000}
)

    // acknowledged: true, // ошибок нет
    // insertedId: null, // нет новых документов
    // matchedCount: 1, // найден один документ по фильтру 
    // modifiedCount: 1, //изменен один документ
    // upsertedCount: 0 // нет новых документов

// Полностью заменить документ, где имя ՛Ivan՛ на
// firstname: ՛Tom՛
// lastname: ՛Thomson՛,
// age: 30,
// position: 'HR'
// salary: 4000
// если есть такой документ, если нет, создать новый

db.workers.replaceOne({firstname: 'Ivan'}, 
    {firstname: 'Tom', 
    lastname: 'Thomson', 
    age : 30, 
    position: 'HR', 
    salary: 4000},
    {upsert: true}
)

//   acknowledged: true, // нет ошибок 
//   insertedId: ObjectId('66b515633a7cee3d7558131f'), //новый документ с новым ИД
//   matchedCount: 0, // по фильтру документов нет
//   modifiedCount: 0, // изменений нет
//   upsertedCount: 1 // добавлен один документ


// Чтобы не обновлять весь документ, а только значение одного или нескольких свойств используем updateOne/updateMany. Если нужно обновить только один документ(первый по выборке) используем updateOne, если несколько документов(все по выборке), то используем updateMany

// db.workers.updateOne({filter}, {update})
// db.workers.updateMany({filter}, {update})

// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset - для удаления поля

// Изменить должность на 'Sales manager' для сотрудника с именем Den и фамилией Jameson
db.workers.updateOne({firstname: 'Den', lastname: 'Jameson'}, {$set: {position: 'Sales manager'}})

// Добавить свойство department со значением Sales для сотрудника с именем Den и фамилией Jameson
db.workers.updateOne({firstname: 'Den', lastname: 'Jameson'}, {$set: {department: 'Sales'}})

// Увеличить зарплату сотрудника с именем Boris на 2000.
db.workers.updateOne({firstname: 'Boris'}, {$inc: {salary: 2000}})

// Уменьшить зарплату сотрудника с именем Marina на 500
db.workers.updateOne({firstname: 'Marina'}, {$inc: {salary: -500}})

// Добавить новое поле commission со значением 0 для всех сотрудников.
db.workers.updateMany({}, {$set: {commission: 0}})

// Изменить значение commission на 10 для сотрудников с зарплатой выше 3000.
db.workers.updateMany({salary: {$gt: 3000}}, {$set: {commission: 10}})

// Удалить поле position для сотрудника с именем Olga
db.workers.updateOne({firstname: 'Olga'}, {$unset: {position: 1}})

// Удалить поля salary, skills для сотрудника Marina
db.workers.updateOne({firstname: 'Marina'}, {$unset: {salary: 1, skills: 1}})

// Удалить свойство salary у всех сотрудников
db.workers.updateMany({}, {$unset: {salary: 1}})

// Удалить поле commission у всех сотрудников, кроме Ivan
db.workers.updateMany({firstname: {$ne: 'Ivan'}}, {$unset: {commission: 1}})

// Обновление массивов

// $push - добавить значение в массив 

// Добавить новый навык сотруднику Boris со значением team working
db.workers.updateOne({firstname: 'Boris'}, {$push: {skills: 'team working'}})
db.workers.updateOne({firstname: 'Boris'}, {$push: {skills: 'team working'}}) //добавит еще раз

// $addToSet - - Отличие от push в том, что addToSet добавляет данные, если их еще нет в массиве(через push данные дублируются)

db.workers.updateOne({firstname: 'Boris'}, {$addToSet: {skills: 'team working'}})
db.workers.updateOne({firstname: 'Boris'}, {$addToSet: {skills: 'creativity'}})

// $pop - позволяет удалить один эл. из массива либо первый, либо последний
// если значение 1 то удалит последний эл., если -1, то первый

// Удалить последний навык у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pop: {skills: 1}})

// Удалить первый навык у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pop: {skills: -1}})

// $pull - удаляет каждое вхождение эл. в массив (можно удалить только одно значение)

// Удалить навык 'taking payments' у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pull: {skills: 'taking payments'}})

// $pullAll - удаляет несколько значений из массива

// Удалить навыки 'suggesting meals' и 'team working' у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pullAll: {skills: ['suggesting meals', 'team working']}})
