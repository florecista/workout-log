/**
 * @author Matthew <attentionmatt@gmail.com>
 */

const app = require('express')();
const mysql = require('mysql');

const bodyParser = require('body-parser');

app.use(bodyParser.json({
    limit: '8mb'
})); // support json encoded bodies

// environment variables
const PORT = process.env.PORT || 4000;
const HOST = process.env.HOST || '0.0.0.0';

// mysql credentials
const connection = mysql.createConnection({
  host: process.env.MYSQL_HOST || '172.17.0.2',
  user: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASSWORD || 'W0rk0ut!',
  database: process.env.MYSQL_DATABASE || 'workout'
});

connection.connect((err) => {
  if (err) {
    console.error('error connecting mysql: ', err);
  } else {
    console.log('mysql connection successful');
    app.listen(PORT, HOST, (err) => {
      if (err) {
        console.error('Error starting  server', err);
      } else {
        console.log('server listening at port ' + PORT);
      }
    });
  }
});

// home page
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'Hello world'
  });
});

// insert a workout into database
app.post('/add-workout', (req, res) => {
  const workout = req.body;
  const query = 'INSERT INTO workout values(?, CURDATE())';

  connection.query(query, [workout.id], (err, results, fields) => {
    if (err) {
      console.error(err);
      res.json({
        success: false,
        message: 'Error occured'
      });
    } else {
      res.json({
        success: true,
        message: 'Successfully added workout'
      });
    }
  });
});

// fetch all Primary Positions
app.get('/get-movements', (req, res) => {
  const query = 'SELECT * FROM ref_component_type WHERE parent_id IS NULL';
    connection.query(query, (err, results, fields) => {
      if (err) {
        console.error(err);
        res.json({
          success: false,
          message: 'Error occured'
        });
      } else {
        res.json({
          success: true,
          result: results
        });
      }
    });
});


// fetch Components
app.get('/get-components/:parent_id', (req, res) => {
  const query = 'SELECT * FROM ref_component_type WHERE parent_id = ?';
    connection.query(query, {"parent_id": req.params.parent_id},(err, results, fields) => {
      if (err) {
        console.error(err);
        res.json({
          success: false,
          message: 'Error occured'
        });
      } else {
        res.json({
          success: true,
          result: results
        });
      }
    });
});

// fetch all workouts
app.get('/get-workouts', (req, res) => {
  const query = 'SELECT * FROM workout';
    connection.query(query, (err, results, fields) => {
      if (err) {
        console.error(err);
        res.json({
          success: false,
          message: 'Error occured'
        });
      } else {
        res.json({
          success: true,
          result: results
        });
      }
    });
});
