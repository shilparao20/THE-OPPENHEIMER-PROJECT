from robot.api.deco import library, keyword
import requests

@library
class RestAPIs():
    def __init__(self):
        pass

    @keyword
    def get_request(self, url):
        """ This is a common function to
        retrieve data any API using GET method

        Arguments:
            url: (string) input URL to execute
            
        Returns:
            response.text: (string) response body obtained after API execution
            response.status_code: (string) status code
        """

        my_headers = {"Content-Type": "application/json", "accept": "*/*"}
        response = requests.get(url, headers=my_headers)
        
        return(response.text, str(response.status_code))
                
    def post_request(self):
        pass