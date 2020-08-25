from rest_framework.test import APITestCase
import json


class BoilerPlateTestCase(APITestCase):
    def setUp(self):
        user = {
            'email': 'test_user@mail.com',
            'password': 'testTEST123456789!',
        }
        self.register_user(user['email'], user['password'])
        token = self.login_user(user['email'], user['password'])
        self.token = token

    def register_user(self, email, password):
        data = {'email': email, 'password1': password, 'password2': password}
        response = self.client.post('/auth/registration/', data=data)
        self.assertEqual(response.status_code, 201)

    def login_user(self, email, password):
        data = {'email': email, 'password': password}
        response = self.client.post('/auth/login/', data=data)
        content = json.loads(response.content)
        return content['token']

    def test_index_page_unauthorized(self):
        ''' Test index page with unauthorized user'''
        response = self.client.get('/')
        self.assertEqual(response.status_code, 401)

    def test_index_page_authorized(self):
        ''' Test index page with authorized user '''
        response = self.client.get('/', HTTP_AUTHORIZATION=f'JWT {self.token}')
        self.assertEqual(response.status_code, 200)
