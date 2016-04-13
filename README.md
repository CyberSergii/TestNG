
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
     mvn test -P acceptance -Dgroups=db,deploy

## Release
<br>
- configure scm

          <scm>
            <connection>scm:git:git@github.com:SergiiVlasiuk/TestNG.git</connection>
            <url>scm:git:git@github.com:SergiiVlasiuk/TestNG.git</url>
            <developerConnection>scm:git:git@github.com:SergiiVlasiuk/TestNG.git</developerConnection>
            <!--
            <tag>test-profiles-1.0.0</tag>
            -->
            <tag>HEAD</tag>
          </scm>

- customize release plugin

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>${maven-surefire-plugin.version}</version>
          <configuration>
            <!--<skipTests>true</skipTests>-->
            <excludedGroups>external</excludedGroups>
          </configuration>
        </plugin>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-release-plugin</artifactId>
          <version>2.5.3</version>
          <configuration>
            <!--he tag base directory in SVN, you must define it if you don't use the standard svn layout (trunk/tags/branches).
            For example, http://svn.apache.org/repos/asf/maven/plugins/tags. The URL is an SVN URL and does not include the SCM provider and protocol.
            User property is: tagBase.-->
            <!--<tagBase>svn://svn.zoo.com/zoo/tags</tagBase>-->
            <!--The branch base directory in SVN, you must define it if you don't use the standard svn layout (trunk/tags/branches).
            For example, http://svn.apache.org/repos/asf/maven/plugins/branches. The URL is an SVN URL and does not include the SCM provider and protocol.-->
            <!--<branchBase>svn://svn.zoo.com/zoo/branches</branchBase>-->
            <preparationGoals>clean install</preparationGoals>
            <goals>deploy</goals>
            <!--
                        <updateBranchVersions>true</updateBranchVersions>
                        <updateDependencies>true</updateDependencies>
                        <updateVersionsToSnapshot>true</updateVersionsToSnapshot>
                        <updateWorkingCopyVersions>true</updateWorkingCopyVersions>
            -->
            <autoVersionSubmodules>true</autoVersionSubmodules>
            <releaseProfiles>artifactory</releaseProfiles>
          </configuration>
        </plugin>

- configure 'nexus'

        <servers>
          <server>
             <username>userName</username>
            <password>password</password>
            <id>central</id>
          </server>
          <server>
            <username>userName</username>
            <password>password</password>
            <id>snapshots</id>
          </server>
        </servers>


        <profile>
          <repositories>
            <repository>
              <id>central</id>
              <name>libs-release</name>
              <url>http://nexus.t1.tenet:8081/nexus/content/repositories/releases</url>
            </repository>
            <repository>
              <snapshots />
              <id>snapshots</id>
              <name>libs-snapshot</name>
              <url>http://nexus.t1.tenet:8081/nexus/content/repositories/snapshots</url>
            </repository>
          </repositories>
        <!--
          <pluginRepositories>
            <pluginRepository>
              <snapshots>
                <enabled>false</enabled>
              </snapshots>
              <id>central</id>
              <name>plugins-release</name>
              <url>http://192.168.1.120:8088/artifactory/plugins-release</url>
            </pluginRepository>
            <pluginRepository>
              <snapshots />
              <id>snapshots</id>
              <name>plugins-snapshot</name>
              <url>http://192.168.1.120:8088/artifactory/plugins-snapshot</url>
            </pluginRepository>
          </pluginRepositories>
        -->
          <id>artifactory</id>
        </profile>

- mvn -B -Dtag=1.0.0-v.2 release:prepare
- mvn release:perform -DuserEditMode=true
- mvn release:clean
- mvn release:branch -DbranchName=my-branch -DupdateBranchVersions=true -DupdateWorkingCopyVersions=false

alternative 
- mvn -B -Dtag=fm-portal-1.0.0_v9 release:prepare -Darguments="-DskipTests"
- mvn -B -Dtag=fm-portal-1.0.0 release:prepare -Darguments="-DskipTests" -e -X

