const pool = require('../Data/config');

const router = app => {
    app.get('/', (request, response) => {
        response.send({
            message: 'Node.js and Express REST API'
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

	app.post('/user', (request, response) => {
	    pool.query('INSERT INTO user SET ?', request.body, (error, result) => {
	        if (error) throw error;

	        response.status(201).send(`User added with ID: ${result.insertId}`);
	    });
	});

	// Update an existing user
	app.put('/user/:id', (request, response) => {
	    const id = request.params.id;
	 
	    pool.query('UPDATE user SET ? WHERE id = ?', [request.body, id], (error, result) => {
	        if (error) throw error;
	 
	        response.send('User updated successfully.');
	    });
	});

	app.delete('/user/:id', (request, response) => {
	    const id = request.params.id;
	 
	    pool.query('DELETE FROM user WHERE id = ?', id, (error, result) => {
	        if (error) throw error;
	 
	        response.send('User deleted.');
	    });
	});
}

// Export the router
module.exports = router;