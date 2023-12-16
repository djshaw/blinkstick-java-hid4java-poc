import org.hid4java.HidDevice;
import org.hid4java.HidManager;
import org.hid4java.HidServices;
import org.hid4java.HidServicesSpecification;
import org.hid4java.jna.HidApi;

public class Main {
  public static void main(String[] args) throws Exception {
    HidApi.init();

    HidServicesSpecification hidServicesSpecification =
        new HidServicesSpecification();
    hidServicesSpecification.setAutoStart(false);
    HidServices hidServices =
        HidManager.getHidServices(hidServicesSpecification);

    HidDevice blinkstick = null;
    for( HidDevice hidDevice : hidServices.getAttachedHidDevices() )
    {
      if( hidDevice.getVendorId() == 0x20a0 &&
          hidDevice.getProductId() == 0x41e5 )
      {
          blinkstick = hidDevice;
          break;
      }
    }

    if( blinkstick == null )
    {
        System.err.println( "Unable to find any blinkstick hid devices" );
    }
    else
    {
        System.out.println(
            "Found a BlinkStick! Turning on the first led, setting color to white" );
        boolean result = blinkstick.open();

        byte[] white = new byte[]{ (byte) 0xFF, (byte) 0xFF, (byte) 0xFF };
        blinkstick.sendFeatureReport( white, (byte) 1 );

        Thread.sleep( 1000 );
    }

    hidServices.shutdown();
  }
}

