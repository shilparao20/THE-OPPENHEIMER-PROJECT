from robot.api.deco import library, keyword
import re
import json

@library
class PatternMatching():
    def __init__(self):
        #self.data = data
        #self.pattern = pattern
        pass

    @keyword
    def verify_natid_masking(self, input, pattern):
        """ Function to read the response obtained by GET API method
        and parse through to check if the natid is masked from 5th character onwards

        Arguments:
            input: (string) response body of API 
            pattern: (string) regular expression to match the string
            
        Returns:
            result:  
                Success - return None
                Failure - (list)  list of natid's which are not masked
        """

        result = None
        
        # using json.loads() convert dictionary string to dictionary   
        my_input = json.loads(input)

        for index in range(len(my_input)):
            if 'natid' in my_input[index].keys():
                natid_value = my_input[index]['natid']
                name_value = my_input[index]['name']
                result = re.findall(pattern, natid_value) 
                print(result)
                if result:
                    print("Masking successful for hero: "+name_value+" with natid: "+natid_value)
                else:
                    print("Masking unsuccessful for hero: "+name_value+" with natid: "+natid_value)
                    result.append(natid_value)

        return result