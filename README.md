![image](https://github.com/user-attachments/assets/91375631-560c-49fe-b834-ab31a71e6108)##도어락에 대한 설명

Verilog로 제작한 도어락은 기본적으로 다른 도어락들과 마찬가지로 비밀번호 입력을 통해 열지, 닫을지 결정한다. 여기서 간단한 기능들을 추가하였다. 
우선 지문 인식 기능이 존재해 도어락의 작동 영향을 준다. 
기본적으로 지문이 다르다면 도어락에서 존재하는 기능들이 동작하지 않는다.
지문은 매 입력시, 버튼을 누를 때마다 계속 비교되어 도어락의 작동에 영향을 준다. 특히 비밀번호 8자리를 입력한 다음 마지막으로 버튼 하나를 더 입력해야 한다.
다음으로 비밀번호 앞뒤로 다른 숫자를 입력하여도 그 배열 안에 설정된 비밀번호와 같은 배열이 있다면 lock이 해제되는 기능을 추가하였다. 이는 주변에서 비밀번호 입력을 보고 있을 시에 비밀번호 유출을 방지한 기능이다.
다음으로 간단한 비밀번호 수정 기능을 추가 하였다. 수정 기능을 따로 수행하는 입력 버튼을 하나 만들어 개인정보를 입력한 뒤 일치하면 비밀번호를 수정 할 수 있는 기능을 추가하였다.
다음 기능은 보안을 위하여 4번이 넘게 틀리면 어떠한 입력도 받지 않는 상태를 추가하였다. 이는 외부인의 침입을 막기 위한 기능이다.
마지막으로 오랜 시간 입력이 들어오지 않을시 도어락이 초기 상태로 초기화되는 기능을 추가했다. 이는 오랫동안 입력이 없을 시에 전력소모 방지를 위한 기능이다
![image](https://github.com/user-attachments/assets/25a2aba6-b821-490d-97d1-211f4836eca0)

##CASE 1
 - 비밀번호를 12345678입력한 경우. 8입력 후 unlock되는 것을 볼 수 있다.
   ![image](https://github.com/user-attachments/assets/192173bd-4b2c-47c6-93d8-969a07f1abfe)
##CASE 2
 - 설정된 비밀번호는 12345678이고 앞뒤에 임의의 숫자 배열을 넣는 테스트 벤치이다. 비밀번호 앞자리에는 1을 3개 넣어줬고 비밀번호 뒷자리에는 1을 두 개 넣어주었다
![image](https://github.com/user-attachments/assets/9894bdc7-ad18-48c2-b93b-825f0812148b)
![image](https://github.com/user-attachments/assets/75300269-3838-4073-ab48-10607ab3b5b7)
입력은 1111234567811이다. display는 이 입력들을 차례로 받는 것을 보여주고 입력안에 비밀번호와 일치하는 배열이 있기에 button_over를 눌렀을 때 unlock이 되는 것을 확인 할 수 있었다

##CASE 3
 - 비밀번호 수정
먼저 비밀번호를 잊어버렸을 때 이용하는 missed_password를 눌러주고 개인정보인 981203을 차례로 눌러준다. 그다음 원하는 비밀번호를 입력 한 수에 그 비밀번호로 인하여 lock을 해제하는 테스트 벤치이다.
원하는 비밀번호는 98765432이다.
![image](https://github.com/user-attachments/assets/1f3c7b36-5b93-404f-a9bf-fd0ce7c604b1)
맨 아래의 missed_password가 올라간 후에 개인 정보가 입력되는 모습이다
![image](https://github.com/user-attachments/assets/61fa22f4-956a-4ed3-98aa-9c9f2c9c7a74)
개인정보 입력이 완료되면 display가 초기화 된 후 원하는 비밀번호를 입력받는 모습이다
![image](https://github.com/user-attachments/assets/7f29b6d6-19c2-4f83-970c-fe5d375ff8d1)
원하는 비밀번호가 입력되었을 때 다시 display가 초기화 되고 PASSWORD가 바뀐 것을 확인 할 수 있다
![image](https://github.com/user-attachments/assets/64d4b892-840a-4753-b4ee-475b26b90dba)
![image](https://github.com/user-attachments/assets/64633e6b-7720-404b-8de0-3c5dfa5ec18a)
수정된 비밀번호를 입력 하였을 때 unlock이 되는 모습을 볼 수 있다

##CASE 4
 - 입력이 일정시간 이상 없을 때 display 초기화
![image](https://github.com/user-attachments/assets/aefbda7a-e249-4dfd-add6-c865dff3000e)
9,8,7을 입력한 뒤에 어떠한 입력도 없자 일정 시간 이후에 display가 초기화 되는 것을 볼 
수 있다

##CASE 5
 - 4회 이상 오류가 났을 때 입력을 받지 않는 기능
설정된 비밀번호는 12345678이다. 먼저 9를 입력 후 button_over를 누르고 그다음이 또 9를 누르고 button_over를 눌러주고 그다음은 8을 누른 후 button_over를 누르고
그다음에 또 8을 누른 후 button_over를 눌러 총 4번 비밀번호가 일치 하지 않는 입력을 해주고 그 이후에 9,7,8,7을 입력 하는 테스트 벤치이다
![image](https://github.com/user-attachments/assets/6e6535b3-68d0-4831-9dd3-906041647824)
틀릴 때마다 warning_count가 올라가는 것을 확인 할 수 있다
![image](https://github.com/user-attachments/assets/49a82f4d-4f2d-4c3e-a21b-956a2889f75a)
 warning_count가 4가 된 순간 display가 어떠한 입력도 받지 않는 것을 확인 할 수 있다 고로 절대 열 수 없는 상태가 된다

##CASE 6
 - 지문이 틀렸을 때
우리가 설정한 지문 97이라는 수 대신 fingerprint에 다른 숫자와 함께 버튼을 눌렀을 때의 테스트 벤치이다
![image](https://github.com/user-attachments/assets/ebc09279-48b9-4bfe-95cf-5eb89b8ec1b9)
