from robot.api.deco import library, keyword

@library
class WorkingClassHero():
    def __init__(self,natid,name,gender,salary,birthday,tax):
        self.natid = natid
        self.name = name
        self.gender = gender
        self.salary = salary
        self.birthday = birthday
        self.tax = tax

    @keyword
    def get_natid(self):
        """ Getter function for
        working class hero natid
        Arguments:
            None
        Returns:
            natid of working class hero
        """
        return self.natid

    @keyword
    def get_name(self):
        """ Getter function for
        working class hero name
        Arguments:
            None
        Returns:
            name of working class hero
        """
        return self.name

    @keyword
    def get_gender(self):
        """ Getter function for
        working class hero gender
        Arguments:
            None
        Returns:
            gender of working class hero
        """
        return self.gender
                
    @keyword
    def get_salary(self):
        """ Getter function for
        working class hero salary
        Arguments:
            None
        Returns:
            salary of working class hero
        """
        return self.salary

    @keyword
    def get_birthday(self):
        """ Getter function for
        working class hero birthday
        Arguments:
            None
        Returns:
            birthday of working class hero
        """
        return self.birthday

    @keyword
    def get_tax(self):
        """ Getter function for
        working class hero tax
        Arguments:
            None
        Returns:
            tax of working class hero
        """
        return self.tax

    @keyword
    def set_workingclasshero_data(self, natid, name, gender, salary, birthday, tax):
        """ Setter function for
        working class hero
        Arguments:
            Set the values for working class hero
        Returns:
            None
        """
        self.natid = natid
        self.name = name
        self.gender = gender
        self.salary = salary
        self.birthday = birthday
        self.tax = tax
