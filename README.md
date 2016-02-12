
# Short Instruction

    mvn clean test -Dgroups=integration,deploy
    mvn clean test -Dgroups=deploy

lessons for first steps

[TestingNG - home page](http://testng.org/doc/index.html)
<br>
[devcolibri.com](http://devcolibri.com/1528)
<br>
[habra-habr](https://habrahabr.ru/post/121234/)


## Missed module
__test-profiles-sub-module-3__ (Module only for optional testing) - does not includes to build by default.
<br> To include one to your build\testing, you need use next instruction:

     mvn test -P acceptance

