from bs4 import BeautifulSoup
import sys

def validate(path):
    with open(path) as html:
      valid_errors = [
          "TJ_SA_04",
          "TC_DF_15",
          ]
      table = BeautifulSoup(html, "html.parser").find("table")
      headers = [header.text.strip() for header in table.find_all("th")]
      results = [{headers[i]: cell for i, cell in enumerate(row.find_all("td"))} for row in table.find_all("tr")[1:]]
      invalid_rows = [row for row in results if row["Level"].text == "Error" and row["Rule id"].text not in valid_errors]
      if len(invalid_rows) > 0:
          print("\nFailed due to:")
          for row in invalid_rows:
              print("\tError " + row["Rule id"].text + " : " + row["Message"].text)
      sys.exit(len(invalid_rows))
#       return len(invalid_rows) == 0

if __name__ == "__main__":
    validate(sys.argv[1])