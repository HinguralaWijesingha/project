const express = require('express');

const app = express();

app.use(express.json());

app.use(express.urlencoded({ 
    extended: true 
    }))
const userData = [];
  port = 3000;
app.listen(port, () => {
  console.log(`Server is running on ${port}`);
});

//post API

app.post('/api/add_user', (req, res) => {

  console.log("Result", req.body);
  const pdata = {
    "id": userData.length + 1,
    "name": req.body.name,
    "phone": req.body.phone,
    "email": req.body.email,
  }

  userData.push(pdata);
  console.log("Final Result", pdata);

  res.status(200).send({
    statusCode: 200,
    Message: "User added successfully",
    user: pdata
  });
});