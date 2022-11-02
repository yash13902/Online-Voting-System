package JavaSimulation;

public class Candidate {

    String firstName;
    String lastName;
    Constituencies constituency;
    String photo;

    Candidate(String firstName, String lastName, Constituencies constituency, String photo){
        this.firstName = firstName;
        this.lastName = lastName;
        this.constituency = constituency;
        this.photo = photo;
    }

    public String toString(){
        String s="";
        s += "Name: " + firstName + " " + lastName + "\nConstituency: " + constituency.toString() + "\nPhoto" + photo + "-------------------------";
        return s;
    }

}

