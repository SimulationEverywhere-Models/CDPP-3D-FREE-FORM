package ThreeDplastic;
import java.io.*;

public class GetData {

  public GetData() {
  }
  public void decreaseonedimension(String sourcefile, String destinationfile) throws FileNotFoundException, IOException
    {
      FileInputStream istream = new FileInputStream(sourcefile);
      DataInputStream distream = new DataInputStream(istream);

      FileOutputStream ostream = new FileOutputStream(destinationfile, true);
      DataOutputStream dostream = new DataOutputStream(ostream);
      dostream.writeBytes( "reproduce the drawing file\n");
      String line = distream.readLine();
      while (line != null)
      {
        if (line.indexOf("1) = ") <0 & line.indexOf("2) = ") <0  )
          dostream.writeBytes(line+"\n");
        line = distream.readLine();
      }
      distream.close();

      dostream.close();
    }

  public static void main(String[] args) {
    GetData getData = new GetData();
    int i;
    try  {
      getData.decreaseonedimension("plasticorg.drw", "plasticnew.drw");
    }
    catch (FileNotFoundException e) {
      System.out.println(e);
    }
    catch (IOException e ) {
      System.out.println(e);
    }

  }

} 