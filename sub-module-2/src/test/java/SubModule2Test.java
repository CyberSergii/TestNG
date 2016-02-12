//import org.junit.Test;
//
//import static junit.framework.TestCase.assertTrue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.Test;

import static org.testng.AssertJUnit.assertTrue;

/**
 * @author sergii_vlasiuk@ukr.net.
 */
public class SubModule2Test {
  private final static Logger LOGGER = LoggerFactory.getLogger(SubModule2Test.class);
  @Test(groups = {"integration"})
  public void shouldAlwaysBeInvoked() {
    LOGGER.debug("Should never fail and will ensure that the SubModule2Test is possible to execute");
    assertTrue("Should never fail and will ensure that the SubModule2Test is possible to execute", true);
  }
}
