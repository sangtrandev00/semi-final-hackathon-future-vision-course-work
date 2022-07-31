import Debug "mo:base/Debug";
import Hash "mo:base/Hash";
import Hashmap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";
import Trie "mo:base/Trie";

actor {
 //CRUD with Trie
   public type Person = {
    name : Text;
    age : Nat;
    address : Text;
    sex : Bool;
   };
   //application state
   stable var persons : Trie.Trie<Nat,Person> = Trie.empty();
   stable var next : Nat = 0;

   //create key
   private func key(x:Nat) : Trie.Key<Nat>  {
    return {
      key = x;hash = Hash.hash(x);
    };
   };

   //Write create function
   public func create_account(p : Person) : async Bool {
     next += 1;
     let id = next;
     Debug.print(debug_show(id));
     // put method
     let (newPersons, existing) = Trie.put(
      persons,
      key(id),
      Nat.equal,
      p);
      switch(existing) {
        //if there is no match
        case (null) {
          persons := newPersons;
        };
        // Match
        case(?v) {
          return false;
        };
      };
      return true;
    };

     //Write read function
     public func read_account(id : Nat) : async ?Person {

      let result = Trie.find(
        persons,key(id),Nat.equal
      );
      return result;
     };

     //Write update function
     public func update_account(id : Nat, person : Person) : async Bool {
        let result = Trie.find(
          persons,key(id),Nat.equal
        );
        switch(result) {
          //Not update
          case (null) {
            return false;
          };
          case (?v) {
            persons := Trie.replace(
              persons,key(id),Nat.equal,?person
            ).0;
          };  
        };
        return true;
     };
     // Write delete function
     public func delete_account(id : Nat) : async Bool {
        let result = Trie.find(
          persons,key(id),Nat.equal
        );
        switch(result) {
          //Not update
          case (null) {
            return false;
          };
          case (?v) {
            persons := Trie.replace(
              persons,key(id),Nat.equal,null
            ).0;
          };  
        };
        return true;
     };  
};
