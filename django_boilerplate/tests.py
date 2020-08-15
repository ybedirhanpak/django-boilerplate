from rest_framework.test import APITestCase


class BoilerPlateTestCase(APITestCase):

    def test_index_page(self):
        ''' Test whether index page is working '''
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
