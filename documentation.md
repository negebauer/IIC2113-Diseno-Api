# API-Documentation

Base url:

```
TODO
```

## Table Of Contents

- [Usage](#usage)
  - [Accounts And Sessions](#accounts-and-sessions)
  - [Experiences](#experiences)
  - [Methodologies](#methodologies)
  - [Selections](#selections)
  - [Implements](#implements)
  - [Plans](#plans)
    - [Create a plan](#create-a-plan)
    - [Update child models](#update-child-models)
    - [Delete child models](#delete-child-models)
    - [Get a plan](#get-a-plan)

## Usage

### Accounts And Sessions

#### Signup

- Route: `POST` `/signup`

- Headers:
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
    name: 'Oscar Rios',
    mail: 'orrios@uc.cl'
    password: '123456',
    password_confirmation: '123456'
  }
  ```

- Success Response:

  - Status: 201
  - Content:

    ```javascript
    { api_key: 'your-session-token' }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'error-message' }
    ```

---

#### Login

- Route: `POST` `/login`

- Headers:
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
    mail: 'orrios@uc.cl',
    password: '123456',
  }
  ```

- Success Response:

  - Status: 201
  - Content:

    ```javascript
    { api_key: 'your-session-token' }
    ```

- Error Response:

  - Code: 403
  - Content:

    ```javascript
    { message: 'Invalid credentials' }
    ```

---

#### Logout

- Route: `DELETE` `/logout`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Content:

    ```javascript
    { message: 'Logged out successfully' }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'Could not logout' }
    ```

---

### Experiences

#### List of experiences I am part of

- Route: `GET` `/experiences`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    [
      {
        id: 1,
        name: 'Mi primera experiencia',
        date: '2016-08-16T23:13:05.908Z',
        description: 'En esta experiencia...',
        users: [
          {
            id: 1,
            name: 'Oscar Rios',
            username: 'orrios',
            created_at: '2016-08-16T23:13:05.908Z'
          }, {
            id: 2,
            name: 'Nicolas Gebauer',
            phone_number: 'negebauer',
            created_at: '2016-09-16T23:13:15.908Z'
          }
        ]
      },
        ...
    ]
    ```

---

#### Show an experience where i am member
# TODO

---

#### Create Experience

- Route: `POST` `/experiences`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
    name: 'Mi segunda experiencia',
    description: 'En esta experiencia...',
    date: '2016-08-16T23:13:05.908Z',
  }
  ```

- Success Response:

  - Status: 201
  - Example Content (Assuming orrios created the experience):

    ```javascript
    {
        id: 2,
        name: 'Mi segunda experiencia',
        date: '2016-08-16T23:13:05.908Z',
        description: 'En esta experiencia...',
        users: [
          {
            id: 1,
            name: 'Oscar Rios',
            username: 'orrios',
            created_at: '2016-08-16T23:13:05.908Z'
          }
        ]
      }
    ```


- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'error-message' }
    ```

---


### Invite Users To An Experience

- Route: `POST` `/experience/:id/users`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
    user_mail: "fnmendez@uc.cl"
  }
  ```

- Success Response:

  - Status: 201
  - Example Content:

    ```javascript
    {
        id: 2,
        name: 'Mi segunda experiencia',
        date: '2016-08-16T23:13:05.908Z',
        description: 'En esta experiencia...',
        users: [
          {
            id: 1,
            name: 'Oscar Rios',
            username: 'orrios',
            created_at: '2016-08-16T23:13:05.908Z'
          },
          {
            id: 2,
            name: 'First User',
            username: 'firstuser',
            created_at: '2016-08-16T23:13:05.908Z'
          },
          {
            id: 3,
            name: 'Another User',
            username: 'anotheruser',
            created_at: '2016-08-16T23:13:05.908Z'
          }
        ]
      }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'error-message' }
    ```

---

### Methodologies
#### List of updated methodologies

- Route: `GET` `/methoods`

- Headers:
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    [
      {
        id: 1,
        name: "Cultura de aprendizaje colaborativo",
        url: "https://www.escuelaenmovimiento.cl/metodologias-innovadoras/cultura-de-aprendizaje-colaborativo"
    },
    {
        id: 2,
        name: "Ambientes de Aprendizaje Auto-organizado",
        url: "https://www.escuelaenmovimiento.cl/metodologias-innovadoras/ambientes-de-aprendizaje-auto-organizado"
    },
        ...
    ]
    ```

---
#### Get methodology

- Route: `GET` `/methoods/:id`

- Headers:
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    [
      name: "Methodology name",
      url: "https://www.escuelaenmovimiento.cl/metodologias-innovadoras/metodologia-especifica",
      id: 1
    ]
    ```
- Error Response:

  - Code: 404
  - Content:

    ```javascript
    { message: 'Method not found' }
    ```
      {
        id: 1,
        name: 'Mi primera experiencia',
        date: '2016-08-16T23:13:05.908Z',
        description: 'En esta experiencia...',
        users: [
          {
            id: 1,
            name: 'Oscar Rios',
            username: 'orrios',
            created_at: '2016-08-16T23:13:05.908Z'
          }, {
            id: 2,
            name: 'Nicolas Gebauer',
            phone_number: 'negebauer',
            created_at: '2016-09-16T23:13:15.908Z'
          }
        ]
      },
        ...
    ]
    ```
---
#### Delete selection

- Route: `DELETE` `experiences/:experience_id/selection/:id`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Content:

    ```javascript
    { message: 'Selection deleted successfully' }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'Could not delete Selection' }
    ```
---
### Selection
#### List of methodologies selected on an experience

- Route: `GET` `/experiences/:experience_id/methodologies`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    [
      {
        "id": 10,
        "name": "Aprendizaje basado en proyectos interdisciplinarios",
        "description": null,
        "video": null,
        "link": "https://www.escuelaenmovimiento.cl/metodologias-innovadoras/aprendizaje-basado-en-proyectos-interdisciplinarios",
        "created_at": "2017-11-09T14:56:11.665Z",
        "updated_at": "2017-11-09T14:56:16.807Z"
      },
      {
        "id": 11,
        "name": "Cultura de aprendizaje colaborativo",
        "description": null,
        "video": null,
        "link": "https://www.escuelaenmovimiento.cl/metodologias-innovadoras/cultura-de-aprendizaje-colaborativo",
        "created_at": "2017-11-09T14:56:16.669Z",
        "updated_at": "2017-11-09T14:56:16.758Z"
      }
    ]
    ```

---
#### List of selections of an experience

- Route: `GET` `/experiences/:experience_id/selections`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    [
      {
        "id": 1,
        "applicable": "Si",
        "usefulness": "Not so much",
        "relevance": "a lot",
        "feasibility": null,
        "experience_id": 2,
        "methood_id": 10,
        "created_at": "2017-11-09T20:57:25.304Z",
        "updated_at": "2017-11-09T20:57:25.304Z"
      },
      {
        "id": 15,
        "applicable": "No",
        "usefulness": "Very useful",
        "relevance": "Important for our experience",
        "feasibility": "feasibility of the selection",
        "experience_id": 2,
        "methood_id": 11,
        "created_at": "2017-11-09T21:48:13.953Z",
        "updated_at": "2017-11-09T21:48:13.953Z"
      }
    ]
    ```

---
#### Create new selection for an experience

- Route: `POST` `/experiences/:experience_id/selections`

- Headers:
  - Authorization: `Token token=your-session-token`

  - Example Body:

    ```javascript
    {
      applicable: "Not sure",
      usefulness: "indispensable",
      relevance: "Important for our experience",
      feasibility: "feasibility of the selection",
      experience_id: :experience_id,
      methood_id: 11,
    }
    ```

  - Success Response:

    - Status: 200
    - Example Content:

      ```javascript
      {
        id: 15,
        applicable: "Not sure",
        usefulness: "indispensable",
        relevance: "Important for our experience",
        feasibility: "feasibility of the selection",
        experience_id: 2,
        methood_id: 11,
        created_at: "2017-11-09T21:48:13.953Z",
        updated_at: "2017-11-09T21:48:13.953Z"
      }
      ```
---
#### Update selection for an experience

- Route: `PATCH` `/experiences/:experience_id/selections/:id`

- Headers:
  - Authorization: `Token token=your-session-token`

- Example Body:

  ```javascript
  {
    applicable: "Not sure",
    usefulness: "indispensable"
  }
  ```

- Success Response:

  - Status: 200
  - Example Content:

    ```javascript
    {
      id: 15,
      applicable: "Not sure",
      usefulness: "indispensable",
      relevance: "Important for our experience",
      feasibility: "feasibility of the selection",
      experience_id: 2,
      methood_id: 11,
      created_at: "2017-11-09T21:48:13.953Z",
      updated_at: "2017-11-09T21:48:13.953Z"
    }
    ```
---
#### Delete selection

- Route: `DELETE` `experiences/:experience_id/selection/:id`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Content:

    ```javascript
    { message: 'Selection deleted successfully' }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'Could not delete Selection' }
    ```
---
### Implement
#### Create a new implement and blog

- Route: `POST` `/implements`

- Headers:
  - Authorization: `Token token=your-session-token`
- Example Body:

    ```javascript
    {
      implement[plan_id]: 2,
      implement[blog_attributes[obs]]: 'This is an observation',
      implement[blog_attributes[obstacles]]: 'Descripcion of the obstacles',
      implement[blog_attributes[advances]]: 'Write down some advances during the week',
      implement[blog_attributes[change]]: 'What are your expectations?',
      implement[blog_attributes[ideas]]: 'Some ideas that you may have during the experience',
      implement[blog_attributes[day_before]]: '2017-10-16T23:13:05.908Z',
      implement[blog_attributes[day_after]]: '2017-10-18T23:13:05.908Z',
    }
    ```
- Success Response:

  - Status: 201
  - Example Content:

    ```javascript
    {
      "implement": {
        "id": 11,
        "plan_id": 2,
        "blog": {
          "id": 4,
          "day_before": "2017-10-16",
          "day_after": "2017-10-18",
          "change": "dsfasdf",
          "obs": "lalala",
          "advances": "adsffa",
          "obstacles": "fsadfsad",
          "ideas": "afdsaf",
          "url": "http://localhost:3000/implements/11/blogs/4"
        }
      }
    }
    ```
- Error Response:
  - Code: 406
  - Content:

    ```javascript
    { message: 'error-message' }
    ```

---
#### Update blog

- Route: `PATCH` `/implements/:implement_id/blog/:id`

- Headers:
  - Authorization: `Token token=your-session-token`

  - Example Body:
    - Any of the following attributes
      ```javascript
      {
        implement[blog_attributes[obs]]: 'text',
        implement[blog_attributes[obstacles]]: 'text',
        implement[blog_attributes[advances]]: 'text',
        implement[blog_attributes[change]]: 'text',
        implement[blog_attributes[ideas]]: 'text',
        implement[blog_attributes[day_before]]: 'date',
        implement[blog_attributes[day_after]]: 'date',
      }
      ```
  - Success Response:

    - Status: 201
    - Example Content:

      ```javascript
      {
        "implement": {
          "id": 11,
          "plan_id": 2,
          "blog": {
            "id": 4,
            "day_before": "2017-10-16",
            "day_after": "2017-10-18",
            "change": "dsfasdf",
            "obs": "lalala",
            "advances": "adsffa",
            "obstacles": "fsadfsad",
            "ideas": "afdsaf",
            "url": "http://localhost:3000/implements/11/blogs/4"
          }
        }
      }
      ```
  - Error Response:
    - Code: 406
    - Content:

      ```javascript
      { message: 'error-message' }
      ```
---
#### Get blog information

- Route: `POST` `/implement/:implement_id/blog/:id`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

  - Success Response:

    - Status: 200
    - Example Content:

      ```javascript
        {
          id: 4,
          implement_id: 11,
          day_before: "2017-10-16",
          change: "This need to change!",
          day_after: "2017-10-18",
          obs: "Observing",
          advances: "None",
          obstacles: "No obstacles",
          ideas: "Let me think",
          created_at: "2017-11-10T03:48:38.395Z",
          updated_at: "2017-11-10T03:48:38.395Z",
          implement_url: "http://localhost:3000/implements/11"
        }
      ```
  - Error Response:
    - Code: 404
    - Content:

      ```javascript
      { message: 'Blog not found' }
      ```
---
#### Delete implement with blog

- Route: `DELETE` `implements/:id`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Content:

    ```javascript
    { message: 'Implementation deleted successfully' }
    ```

- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'Implementation could not be deleted' }
    ```
---

### Plans

* Plan endpoint is build to also manage selection_plans, resources, goals and a
diffusion
* You can set an arbitrary amount of them **(except diffusion)**, and any can be
omitted
* To edit any of the models, just include its id (in any success response you'll
get them)
* To destroy any of the models, just include its id and `_destroy` special key
evaluating to true
* Success response is the same for each method so it is shown at the end of
this section in the GET method

Notes:
* It isn't possible to mix creation and updates
  * For example, to create a goal and update a resource
* Diffusion isn't destroyable and _at least_ a selection_plan _should_ exist

#### Create a Plan

Use this endpoint only the first time

- Route: `POST` `/experiences/:experience_id/plan`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
  	"plan": {
  		"selection_plans_attributes":
      [
  			{"reasons": "It is perfect", "selection_id": 1},
  			{"reasons": "May work", "selection_id": 2}
  		],
  		"goals_attributes":
      [
  			{"name": "Conquer the world", "how": "With software development", "when": "Now", "description": "To conquer the world is the best goal to achieve"},
  			{"name": "Something", "how": "somehow", "when": "tomorrow", "description": "some description"}
  		],
  		"resources_attributes":
      [
  			{"name": "Tablets for each student", "how": "somehow", "available": true},
  			{"name": "Microphone", "how": "somehow", "available": false}
  		],
  		"diffusion_attributes":
      {
  			"audience_before": "maybe this will be set this first time",
        "channel_before": "this too",
        "objective_before": "this too",
  			"audience_during": "this will be get edited",
  			"objective_during": "etc.",
        "channel_during": "",
        "channel_after": "",
        "audience_after": "",
        "objective_after": ""
  		}
  	}
  }
  ```

---

#### Update child models

- Route: `PATCH` `/experiences/:experience_id/plan`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
  	"plan": {
  		"selection_plans_attributes":
      [
  			{"id": 1, "reasons": "It isn't perfect at all, just great", "selection_id": 1}
  		],
  		"resources_attributes":
      [
  			{"id": 2, "name": "Microphone", "how": "somehow", "available": true}
  		],
  		"diffusion_attributes":
      {
        "id": 1,
  			"audience_during": "all the students of the school",
  			"objective_during": "teach"
  		}
  	}
  }
  ```

---

#### Delete child models

- Route: `PATCH` `/experiences/:experience_id/plan`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Example Body:

  ```javascript
  {
  	"plan": {
  		"selection_plans_attributes":
      [
  			{"id": 1, "_destroy": true},
  		],
  	}
  }
  ```

---

#### Get a plan

- Route: `GET` `/experiences/:experience_id/plan`

- Headers:
  - Authorization: `Token token=your-session-token`
  - Content-Type: `application/json`

- Success Response:

  - Status: 200
  - Example content:

    ```javascript

    ```


- Error Response:

  - Code: 406
  - Content:

    ```javascript
    { message: 'error-message' }
    ```

---
