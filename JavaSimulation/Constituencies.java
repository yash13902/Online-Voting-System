package JavaSimulation;

class Constituencies{
    int id;
    String description;
    Constituencies(int id, String description){
        this.id = id;
        this.description = description;
    }

    public String toString(){
        String s="";
        s += id + " " + description;
        return s;
    }
}