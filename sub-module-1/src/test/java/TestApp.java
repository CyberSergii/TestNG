/**
 * @author sergii_vlasiuk@ukr.net.
 */
import org.testng.annotations.Test;
@Test(groups = {"integration"/*,"deploy","db"*/})
public class TestApp {

  //Run if all methods from "deploy" and "db" groups are passed.
  @Test(dependsOnGroups={"deploy"/*,"db"*/})
  public void method1() {
    System.out.println("This is method 1");
    //throw new RuntimeException();
  }

  @Test
  public void anImportantMethod() {
    System.out.println("anImportantMethod.");
  }

  //Run if method1() is passed.
  @Test(dependsOnMethods = { "anImportantMethod", "method1" })
  public void method2() {
    System.out.println("This is method 2");
  }

}