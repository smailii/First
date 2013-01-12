import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class SeleniumTests {
    public WebDriver driver = new FirefoxDriver();
    public String[] arrayString = {"block", "bus", "class", "dev", "devices", "firmware", "fs", "kernel", "module", "power"};

  //  @Test
    public void testTitle() {
        driver.get("http://smail:8080/FileFolders/fileFolders");
        WebElement webElement = driver.findElement(new By.ByTagName("TITLE"));
        Assert.assertEquals("Web File Browser", webElement.getText());
        driver.close();
    }

   // @Test
    public void testSortByNameUp() {
        int i = 0;

        driver.get("http://smail:8080/FileFolders/fileFolders?path=/sys&sortByName=true");
        List<WebElement> webElements = driver.findElements(By.id("nameFolder"));
        for (WebElement webElement : webElements) {
            Assert.assertTrue(arrayString[i].equals(webElement.getText()));
            i++;
        }
        driver.close();
    }

   // @Test
    public void testSortByNameDown() {
        int i = arrayString.length - 1;

        driver.get("http://smail:8080/FileFolders/fileFolders?path=/sys&sortByName=false");
        List<WebElement> webElements = driver.findElements(By.id("nameFolder"));
        for (WebElement webElement : webElements) {
            Assert.assertTrue(arrayString[i].equals(webElement.getText()));
            i--;
        }
        driver.close();
    }

   // @Test
    public void testEmptyFolder() {
        driver.get("http://smail:8080/FileFolders/fileFolders?path=/selinux");
        List<WebElement> webElements = driver.findElements(By.id("nameFolder"));
        Assert.assertFalse(webElements.size() > 0);
        driver.close();
    }

   // @Test
    public void testExistImageDownSort() {
        driver.get("http://smail:8080/FileFolders/fileFolders?path=/sys&sortByDer=true");
        WebElement webElement = driver.findElement(By.id("imageDownSort"));
        Assert.assertTrue(webElement.isEnabled());
        driver.close();
    }

   // @Test
    public void testExistImageUpSort() {
        driver.get("http://smail:8080/FileFolders/fileFolders?path=/sys&sortByDer=false");
        WebElement webElement = driver.findElement(By.id("imageUpSort"));
        Assert.assertTrue(webElement.isEnabled());
        driver.close();
    }

   // @Test
    public void testNoExistFile() {
        driver.get("http://smail:8080/FileFolders/fileFolders?path=/boot/jh");
        WebElement webElement = driver.findElement(new By.ByTagName("h1"));
        Assert.assertEquals("Error path no exist", webElement.getText());
        driver.close();
    }


    @Test
    public void testDownloadFile() throws IOException {
        FirefoxProfile firefoxProfile = new FirefoxProfile();
        firefoxProfile.setPreference("browser.download.folderList", 1);
        firefoxProfile.setPreference("browser.download.manager.showWhenStarting", false);
        firefoxProfile.setPreference("browser.download.dir", "/tmp");
        firefoxProfile.setPreference("browser.helperApps.neverAsk.saveToDisk", "application/octet-stream");
        WebDriver driverF = new FirefoxDriver(firefoxProfile);
        driverF.get("http://smail:8080/FileFolders/fileFolders?path=/vmlinuz.old");
        Assert.assertEquals(FileUtils.checksumCRC32(new File("/vmlinuz.old")), FileUtils.checksumCRC32(new File("/tmp/vmlinuz.old")));
        driverF.close();
    }


}
