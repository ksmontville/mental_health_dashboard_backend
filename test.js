const testArray = [
    {'task': 'hello', 'test': true},
    {'task': 'no', 'test': false},
    {'task': 'yes', 'test': true}
]

console.log(testArray)

const newArray = testArray.filter(item => item.test === true)

console.log(newArray)

