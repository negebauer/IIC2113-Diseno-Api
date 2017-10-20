# API-Documentation

Base url:

```
TODO
```

## Table Of Contents

- [Usage](#usage)
  - [Accounts And Sessions](#accounts-and-sessions)
  - [Experiences](#experiences)

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
