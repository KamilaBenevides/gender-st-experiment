var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var fs = require('fs')
var uuid = require('uuid');


app.use(express.static("webapp"));

app.get('/', function (req, res) {
    res.redirect('/');
});

// Parses the body for POST, PUT, DELETE, etc.
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.post('/save-response', function(req, res, next){

  //generates a random id for the participant's response
  var respId = uuid.v1()

  //data to be saved (participant's response)
<<<<<<< HEAD
  var row = [respId, req.body.startTime, req.body.endTime, req.body.testType, req.body.pretestPoints, req.body.activityPoints, req.body.posttestPoints, req.body.pre, req.body.post, req.body.flowPoints,req.body.flow,req.body.name, req.body.gender, req.body.age, req.body.ethnicity, req.body.city, req.body.civilState, req.body.universityEducation , req.body.institucion, req.body.educationLevel ,req.body.conclusion ,  req.body.email, req.body.whatsapp].join(";")+"\n"
=======
  var row = [respId, req.body.startTime, req.body.endTime, req.body.testType, req.body.pretestPoints, req.body.pretest2Points, req.body.activityPoints, req.body.posttestPoints, req.body.pre, req.body.pre2, req.body.post, req.body.flowPoints,req.body.flow, req.body.gender, req.body.age, req.body.ethnicity, req.body.sexualOrientation, req.body.civilState, req.body.city, req.body.universityEducation , req.body.institucion, req.body.educationLevel ,req.body.conclusion , req.body.email, req.body.whatsapp].join(";")+"\n"

>>>>>>> 5cb66d9ded358e6bdd58a20d30f270bcc00af088

  fs.stat('responses.csv', function (err, stat) {
      if (err == null) {
          //write the actual data and end with newline
          fs.appendFile('responses.csv', row, function (err) {
              if (err) throw err;
              console.log('The response was saved!');
          });
      }
      else {
          //write the headers and newline
          console.log('First answer, adding headers');
<<<<<<< HEAD
          var headers= ["responseId", "startTime","endTime","testType","motivationPre","activityPoints","motivationPost","motivationRawPre","motivationRawPost", "flowRawPoints", "flow", "name","gender","age", "ethnicity", "civilState", "city","universityEducation","institucion","educationLevel","conclusion", "email","whatsapp"].join(";") + "\n" + row
=======

        //var headers= ["responseId", "startTime","endTime","testType","dejectionPre","activityPoints","dejectionPost","dejectionRawPre","dejectionRawPost", "flowRawPoints", "flow", "gender","age", "ethnicity", "sexualOrientation", "civilState", "city", "email","whatsapp"].join(";") + "\n" + row
          var headers= ["responseId", "startTime","endTime","testType","pre", "pre2","activityPoints","dejectionPost","dejectionRawPre","dejectionRawPre2","dejectionRawPost", "flowRawPoints", "flow", "gender","age", "ethnicity", "sexualOrientation", "civilState", "city", "universityEducation","institucion","educationLevel","conclusion", "email","whatsapp"].join(";") + "\n" + row

>>>>>>> 5cb66d9ded358e6bdd58a20d30f270bcc00af088

          fs.writeFile('responses.csv', headers, function (err) {
              if (err) throw err;
              console.log('Response saved!');
          });
      }
  });

  res.end()

});

<<<<<<< HEAD
app.listen(8081, 'localhost');
=======
app.listen(8082, 'localhost');
>>>>>>> 5cb66d9ded358e6bdd58a20d30f270bcc00af088
console.log("This project is listening on port 8080");

