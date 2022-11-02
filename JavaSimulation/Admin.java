package JavaSimulation;

import java.io.*;
import java.util.*;

public class Admin {

    static HashMap<String, Constituencies> constituencies = new HashMap<String, Constituencies>();
    static HashMap<Voter, Constituencies> voters = new HashMap<Voter, Constituencies>();
    static HashMap<Candidate, Constituencies> candidates = new HashMap<Candidate, Constituencies>();

    public static void main(String args[]) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        int choice;
        String fName, lName, password, con;
        while (true) {
            System.out.println(
                "Enter 1 for adding Constituency\nEnter 2 for adding Voter\nEnter 3 for adding Candidate\nEnter 4 to viewing list of Constituencies\nEnter 5 to viewing list of Voter\nEnter 6 for viewing list of Candidates\nEnter 7 for Exiting the program"
            );
            choice = Integer.parseInt(in.readLine());
            switch(choice){
                case 1:
                    System.out.println("Enter the Constituency ID");
                    int id = Integer.parseInt(in.readLine());
                    System.out.println("Enter the constituency name");
                    String constituency = in.readLine();
                    Constituencies newConstituency = new Constituencies(id, constituency);
                    constituencies.put(constituency, newConstituency);
                break;
                case 2:
                    if(constituencies.size() == 0){
                        System.out.println("Please enter the constituencies first");
                        break;
                    }
                    System.out.println("Enter the First Name of the Voter");
                    fName = in.readLine();
                    System.out.println("Enter the Last Name of the Voter");
                    lName = in.readLine();
                    System.out.println("Enter the password of the Voter");
                    password = in.readLine();
                    System.out.println("Enter the constituency from the list below");
                    for(String s : constituencies.keySet()){
                        System.out.println(s);
                    }
                    con = in.readLine();
                    if(constituencies.containsKey(con)){
                        Constituencies c = constituencies.get(con);
                        Voter newVoter = new Voter(fName, lName, password, c, "photo url");
                        voters.put(newVoter, c);
                        System.out.println("The user ID is : " + newVoter.getVoterID());
                    }else{
                        System.out.println("Please enter correct constituency");
                        break;
                    }
                    
                break;
                case 3:
                    if(constituencies.size() == 0){
                        System.out.println("Please enter the constituencies first");
                        break;
                    }
                    System.out.println("Enter the First Name of the Candidate");
                    fName = in.readLine();
                    System.out.println("Enter the Last Name of the Candidate");
                    lName = in.readLine();
                    System.out.println("Enter the constituency from the list below");
                    for(String s : constituencies.keySet()){
                        System.out.println(s);
                    }
                    con = in.readLine();
                    if(constituencies.containsKey(con)){
                        Constituencies c = constituencies.get(con);
                        Candidate newCandidate = new Candidate(fName, lName, c, "photo url");
                        candidates.put(newCandidate, c);
                    }else{
                        System.out.println("Please enter correct constituency");
                        break;
                    }
                break;
                case 4:
                    for(Constituencies c : constituencies.values()){
                        System.out.println(c.toString());
                    }
                break;
                case 5:
                    for(Voter v : voters.keySet()){
                        System.out.println(v.toString());
                    }
                break;
                case 6:
                    for(Candidate c : candidates.keySet()){
                        System.out.println(c.toString());
                    }
                break;
                case 7:
                    System.exit(0);
                break;
                default:
                    System.out.println("Wrong input given");
                break;
            }
        }
    }

}
