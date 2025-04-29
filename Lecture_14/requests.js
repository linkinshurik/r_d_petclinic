// Знайдіть всіх клієнтів віком понад 30 років
db.clients.find({ age: { $gt: 30 } })
//  {
//     _id: ObjectId('6808bb16dbb5f29a3c437588'),
//     client_id: 3,
//     name: 'Сергій Іванов',
//     age: 42,
//     email: 'serhiy@example.com'
//  }
// {
//     _id: ObjectId('6808bb16dbb5f29a3c437588'),
//     client_id: 3,
//     name: 'Сергій Іванов',
//     age: 42,
//     email: 'serhiy@example.com'
//  }

// Перелічіть тренування із середньою складністю
db.workouts.find({ difficulty: "medium" })
// {
//     _id: ObjectId('6808bb36dbb5f29a3c43758c'),
//     workout_id: 2,
//     description: 'Силове тренування',
//     difficulty: 'medium'
// }

// Покажіть інформацію про членство клієнта з певним client_id
db.memberships.find({ client_id: 1 })
// {
//     _id: ObjectId('6808bb2fdbb5f29a3c437589'),
//     membership_id: 1,
//     client_id: 1,
//     start_date: '2024-01-01',
//     end_date: '2024-12-31',
//     type: 'Premium'
// }
