package JavaSimulation;
import java.util.UUID;

class Voter {

    String firstName;
    String lastName;
    String password;
    Constituencies constituency;
    String photo;
    String voterID;

    Voter(String firstName, String lastName, String password, Constituencies constituency, String photo){
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.constituency = constituency;
        this.photo = photo;
        voterID = UUID.randomUUID().toString().replace("-", "");
        voterID = voterID.substring(0,15);
    }

    public String getVoterID(){
        return voterID;
    }

    public String toString(){
        String s="";
        s += "Name: " + firstName + " " + lastName + "\nConstituency: " + constituency.toString() + "\nPhoto" + photo + "-------------------------";
        return s;
    }
}
