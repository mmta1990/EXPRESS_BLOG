const numbers = {
    1: "۱",
    2: "۲",
    3: "۳",
    4: "۴",
    5: "۵",
    6: "۶",
    7: "۷",
    8: "۸",
    9: "۹",
    0: "۰"
};

exports.toPersianNumbers = (input) => {
    return String(input).split('').map(number => numbers[number] ? numbers[number] : number).join('');
};