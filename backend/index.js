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

//POST API

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

//GET API
app.get('/api/get_users', (_req, res) => {

  if(userData.length > 0) {
    res.status(200).send({
      statusCode: 200,
      users: userData,
    });
  }else{
    res.status(404).send({
      statusCode: 404,
      users: [],
    });
  }
});

//UPDATE API
app.put("/api/update_user/:id", (req, res)=>{
  let id = req.params.id*1;
  let userTOBEUpdated = userData.find(p=>p.id === id);
  let index = userData.indexOf(userTOBEUpdated);

  userData[index] = req.body;

  res.status(200).send({
    statusCode: 200,
    Message: "User update successfully",
  });
})

//DELETE API
app.delete("/api/delete_user/:id", (req, res)=>{
  let id = req.params.id*1;
  let userTOBEUpdated = userData.find(p=>p.id === id);
  let index = userData.indexOf(userTOBEUpdated);

  userData.splice(index, 1);

  res.status(200).send({
    statusCode: 200,
    Message: "User deleted successfully",
  });

})