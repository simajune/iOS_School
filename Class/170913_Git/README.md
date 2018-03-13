# Git 사용법

### 1. Git과 GitHub의 이해

- Git
  - Git은 분산 버전 관리 시스템으로 파일 변경 내역을 계속 추적하도록 개발된 소프트웨어이다.
  - Git으로 프로젝트를 개발하는 사람은 모두 현재 상태의 파일뿐만 아니라 그 프로젝트의 전체 이력을 가지고 있게 된다.
- GitHub
  - GitHub은 Git의 외장 저장소를 공급하는 웹사이트를 말한다.
  - 이 외장 저장소를 다른 사람들과 공유할 수 있기 때문에 협업을 할 때 매우 용이하다.

** **

###2. 버전관리 시스템과 분산 버전관리 시스템 

- 버전 관리 시스템
  - 버전 관리 시스템: 프로젝트에 포함된 파일의 변경사항을 추적할 수 있도록 돕는 방법론이나 도구
    - 사용자가 변경한 모든 내용을 추적 관리 가능한 저장소(repository)를 통해 버전관리
    - 사용자는 변경된 내용을 저장소에 저장(commit)
    - 하나의 중앙 저장소가 있고 모든 사용자는 이 저장소에 변경사항을 전송
    - 중앙 저장소에 접근가능한 모든 사람들이 변경사항을 조회가능하고 최신버전을 복사해서 작업할 수 있다
- 분산 버전 관리 시스템
  - 분산 버전 관리 시스템: 각 사용자가 프로젝트의 전체 이력을 관리할 수 있는 자신만의 저장소를 가지고 있다.
    - 기존 버전 관리 시스템과 같이 중앙 저장소를 통해 협업 가능
    - 사용자는 변경된 내용을 개인 저장소에 저장(commit)
    - 개인 저장소에 있는 최신 내용을 개인 저장소로 가져와 최신버전을 유지가능(pulling)
    - 네트워크 연결이 안 되어있는 상황에서도 저장소에 저장 가능하고 네트워크 연결시 중앙 저장소와 동기화 실시
    - 개인 저장소와 중앙 저장소 모두 프로젝트 전체 이력을 가지고 있어 네트워크 연결이 안 되어있는 상황에서도 변경이력 조회 가능 

** **

### 3. Git의 특징

- 1. 빠른 속도와 성능

  - Git의 모든 동작은 local에서 실행되기 떄문에 매번 네트워크 연결을 할 필요가 없어 타 버전 관리 시스템에 비해 속도가 빠름

- 2. 분산 작업

  - 중앙 저장소를 통해 한 프로젝트를 여러명의 개발자가 동시에 작업을 분담하여 진행 가능

- 3. 데이터의 보장성

  - Git의 모든 파일은 암호화 시켜주며, 저장(commit)시 체크썸이란 검사를 통해 데이터가 유효한지 검사, commit을 할 때마다 username, 시간, 내용 등을 기록하여 히스토리 관리

- 4. Staging area

  - 작업한 내용을 바로 commit 시키지 않고 index영역에 올려둔 내용만 commit할 수 있다.

- 5. 브랜치(branch) 모델

** **

### 4. Git의 구조

- 1. Workspace

  - 현재 프로젝트의 작업이 이뤄지는 장소
  - Work tree/ Work Directory라고도 한다.

- 2. Index

  - WorkSpace에 있는 내용을 내부저장소에 저장하기 전에 올려두는 중간 단계 공간
  - Index공간을 통해서 수정된 파일 중 원하는 파일만 저장소에 저장 시킬 수 있다.

- 3. 내부 저장소

  - Git이 설치된 내부 컴퓨터

- 4. 외부 저장소

  - 외부에 저장하는 저장소, GitHub이란 서비스도 외부 저장소에 속한다.

** **

### 5. Git의 명령어

- 1. init : git의 초기화
- 2. clone : 외부저장소에서 프로젝트 내려받기
- 3. add : 변경된 내용을 index영역에 올려두는 명령어
- 4. commit : index영역에 있는 내용을 내부저장소에 저장
- 5. status : 현재 Git 상태 확인
- 6. branch : 가지치기
- 7. checkout : 작업 환경 이동(브랜치 간의 이동)
- 8. push : 외부저장소에 데이터 저장
- 9. pull : 외부 저장소에서 최신 변경사항 받아오기

** **

### 6. Git 실습

1. Git을 초기화할 폴더를 생성한다. (명령어 : **mkdir 폴더명**)

![Git_17091101](https://simajune.github.io/img/posting/Git_17091101.png)

2. 새로 만든 폴더로 들어가 git을 초기화(**명령어 : git init**)시킨다.그러면 해당 폴더에 git이 초기화 되었고 폴더 내 파일 확인(**명령어 : ls -a**)을 통해 보면 폴더에 .git이 생긴 것을 확인 할 수 있다.

![Git_17091102](https://simajune.github.io/img/posting/Git_17091103.png)

3. (**명령어 : vi test.txt**)를 통해 파일을 생성하고 문서를 작성하고 만들어 보자

![Git_17091104](https://simajune.github.io/img/posting/Git_17091104.png)

![Git_17091105](https://simajune.github.io/img/posting/Git_17091105.png)

![Git_17091106](https://simajune.github.io/img/posting/Git_17091106.png)

4. 이렇게 폴더 내에 test.txt 파일을 만들고 git의 상태(명령어 : git status)를 확인해보면 빨간색 글씨로 test.txt 파일이 생성되었다고 나타난다. 이 상태에서 git을 index영역에 저장(**명령어 : git add 파일이름**)을 하면 이 파일은 index 영역에 저장이 된다. (만약 폴더 내의 전체 파일을 add하려면 **git add .**을 하면 된다.)![Git_17091108](https://simajune.github.io/img/posting/Git_17091108.png)
5. indec영역에 저장을 한 후 다시 git의 상태를 확인해 보면 녹색으로 새로운 파일이 index영역에 추가된 것을 확인 할 수 있다.

![Git_17091109](https://simajune.github.io/img/posting/Git_17091109.png)

6. 이 test.txt 파일을 내부 저장소로 저장하기 위해서는 **명령어 : git commit**을 하게 되면 해당 index영역에 있던 변경 사항들이 내부저장소로 저장이 된다.

![Git_17091110](https://simajune.github.io/img/posting/Git_17091110.png)

7. 내부 저장소에 저장한 내역(history)는 **명령어 git reflog**를 통해 확인할 수 있다. 

![Git_17091111](https://simajune.github.io/img/posting/Git_17091111.png)

8. 브랜치 생성은 **명령어 git branch 브랜치이름**으로 생성할 수 있고, 해당 git영역에 어떠한 브랜치들이 존재하는지 확인 하기 위해서는 **명령어 git branch**로 확인이 가능하고 현재 어떠한 브랜치에 있는지 녹색으로 확인 가능하다. 그리고 브랜치간에 이동은 **명령어 git checkout 이동할 브랜치**를 하면 브랜치 이동이 가능하다.

![Git_17091112](https://simajune.github.io/img/posting/Git_17091112.png)

** **

<간편 안내서>

http://rogerdudler.github.io/git-guide/index.ko.html

<GUI로 branch만들어 보기>

http://learnbranch.urigit.com/

<Pro Git 번역>

http://git-scm.com/book/ko/v2

