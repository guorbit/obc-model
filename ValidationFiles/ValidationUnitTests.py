import unittest
from Validate import validate

class TestHTMLParse(unittest.TestCase):
    def test_fail1(self):
        self.assertFalse(validate("testFiles/fail1.html"))
    def test_fail2(self):
        self.assertFalse(validate("testFiles/fail2.html"))
    def test_fail3(self):
        self.assertFalse(validate("testFiles/fail3.html"))
    def test_pass1(self):
        self.assertTrue(validate("testFiles/pass1.html"))

if __name__ == "__main__":
    unittest.main()