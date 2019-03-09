const pool = require('../Data/config');

const router = (app , client) => {

	let redisMiddleware = (req, res, next) => {
      let key = "__expIress__" + req.originalUrl || req.url;
      client.get(key, function(err, reply){
        if(reply){
            res.send(reply);
            console.log("Response from Redis Cache");
        }else{
            res.sendResponse = res.send;
            res.send = (body) => {
                client.set(key,body);
                res.sendResponse(body);
            }
            next();
        }
      });
    };

    app.get('/', (request, response) => {
        response.send({
            message: 'HOME PAGE'
        });
    });

	app.get('/user', (request, response) => {
    pool.query('SELECT * FROM user', (error, result) => {
        if (error) response.send("error");
 
        response.send(result);
    });

    app.get('/user/:id', (request, response) => {
    	const id = request.params.id;
	    pool.query('SELECT * FROM user WHERE id = ?', id, (error, result) => {
	        if (error) throw error;
	 
	        response.send(result);
	    	});
		});
	});

	//Q1
	app.post('/user', (request, response) => {
	    pool.query('INSERT INTO user SET ?', request.body, (error, result) => {
	        if (error) throw error;

	        response.status(201).send(`User added with ID: ${result.insertId}`);
	    });
	});

	//Q5
	app.get('/ques/:ques_id',redisMiddleware, (request, response) => {
    	const ques_id = request.params.ques_id;

    	pool.query('SELECT description FROM question WHERE id = ?', ques_id , (error, result) => {
	       	if (error) throw error;
	        response.send(result);
	        console.log("Response from SQL Server");
    	});  
	});

	//Q2
	app.get('/ques/:exam_name', (request, response) => {
    	const exam_name = request.params.exam_name;
	    pool.query('SELECT * FROM question WHERE exams = ?', exam_name , (error, result) => {
	        if (error) throw error;
	 
	        response.send(result);
    	});
	});

	//Q3
	app.get('/ques/:ques_id/users', (request, response) => {
    	const ques_id = request.params.ques_id;
	    pool.query('SELECT user_id FROM user_question WHERE question_id = ?', ques_id , (error, result) => {
	        if (error) throw error;
	 
	        response.send(result);
    	});
	});

	//Q4
	app.get('/user/:user_id/ques', (request, response) => {
    	const user_id = request.params.user_id;
	    pool.query('SELECT question_id FROM user_question WHERE user_id = ?', user_id , (error, result) => {
	        if (error) throw error;
	 
	        response.send(result);
    	});
	});

}

// Export the router
module.exports = router;