//import org.junit.Test;
//
//import static junit.framework.TestCase.assertTrue;

import org.testng.annotations.Test;

import static org.testng.AssertJUnit.assertTrue;

/**
 * @author sergii_vlasiuk@ukr.net.
 */
public class SubModule1Test {
  @Test(singleThreaded = true, suiteName = "suite1")
  public void shouldAlwaysBeInvoked() {
    assertTrue("Should never fail and will ensure that the SubModule1Test is possible to execute", true);
  }

  @Test
  public void method1() {
    System.out.println("This is method 1");
  }

  @Test(dependsOnMethods = { "method1" })
  public void method2() {
    System.out.println("This is method 2");
  }

}
