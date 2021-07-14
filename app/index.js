const express = require('express');
const app = express();

require('./bootstrap')(app);

app.get('/', (req, res) => {
    res.render('main.handlebars', {layout : false, userID : 369});
});

module.exports = () => {
    const port = process.env.APP_PORT;
    app.listen(port, () => {
        console.log(`app is running on port ${port}`);
    });
};