import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{

  public type Note={
    title:Text;
    content:Text;
  };

  stable var notes:List.List<Note> = List.nil<Note>();

  public func createNote(titleText:Text, contentText: Text){

    let newNote: Note={
      title=titleText;
      content=contentText;
    };

    notes:=List.push(newNote, notes);
    Debug.print(debug_show(notes));

  };

  public query func readNotes():async [Note]{
    //convert list to array- toArray
     return List.toArray(notes);
  }; 

  public func removeNote(id:Nat){
    //take two elements- move ahead take out n elements
    //drop- remove the taken elements
    //push- prepend items
    let listFront=List.take(notes, id);
    let listBack=List.drop(notes, id+1);
    notes:=List.append(listFront, listBack);
    Debug.print("hicie");
  };

}


