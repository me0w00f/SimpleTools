import requests
import base64
import time
apikey=""
with open("input.txt") as file:
      for item in file:
         str='domain.suffix="' +item.replace("\n", "")+ '"'
         print("[INFO] "+str)
         search=base64.urlsafe_b64encode(str.encode())
         url = "https://hunter.qianxin.com/openApi/search?api-key=" + apikey + "&search=" + search.decode() + "&page=1&page_size=10&is_web=1&status_code=200"
         print("[INFO] searching qianxing...") 
         time.sleep(5)
         req = requests.get(url)
         json_data = req.json()
         with open("result.txt", "a", encoding='utf-8') as f:
             try: 
                for arr in json_data['data']['arr']:
                     print(arr['url']+"                    "+arr['ip']+"                    "+arr['web_title']+"                    "+arr['company'], file=f)       
             except:
                print("[ERR!] No result!")
                pass                        
